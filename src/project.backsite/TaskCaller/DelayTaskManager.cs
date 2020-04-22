using System;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using project.backsite.Services;
using project.dao;
using project.dao.Models;

namespace project.backsite.TaskCaller
{
    public class DelayTaskManager
    {
        int _loadIntervalCount = 5;
        int _loadIntervalSeconds = 5;
        TimeWheel _tw;

        [Autowired] private ILogger<DelayTaskManager> _logger;
        [Autowired] private ExecuteLogDao _executeLogDao;
        [Autowired] private DelayTaskDao _delayTaskDao;
        [Autowired] private IHttpClientFactory _httpClientFactory;

        public DelayTaskManager(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
            _tw = new TimeWheel();
        }

        public void LoadTask(DateTime dateTime)
        {
            if (_loadIntervalSeconds > 0)
            {
                if (_loadIntervalCount >= _loadIntervalSeconds)
                {
                    _loadIntervalCount = 0;
                }

                if (_loadIntervalCount == 0)
                {
                    //加载任务
                    var list = _delayTaskDao.SelectReadyList(dateTime, dateTime.AddMinutes(1));
                    _logger.LogDebug("加载DelayTask条数:" + list.Count);
                    foreach (var item in list)
                    {
                        _tw.Add(item.Id, item.TriggerTime);
                    }
                }

                _loadIntervalCount++;
            }
        }

        public void TriggerTask(DateTime dateTime)
        {
            //触发
            var delayTaskIds = _tw.WalkStep();
            _logger.LogDebug("触发DelayTask条数:" + delayTaskIds.Count);
            if (delayTaskIds.Count > 0)
            {
                var taskList = _delayTaskDao.SelectByIds(delayTaskIds);
                if (taskList.Count > 0)
                {
                    taskList.AsParallel().ForAll(Run);
                }
            }
        }

        private void Run(DelayTask task)
        {
            var hc = _httpClientFactory.CreateClient();
            hc.Timeout = task.TimeoutSeconds == 0
                ? TimeSpan.FromSeconds(15)
                : TimeSpan.FromSeconds(task.TimeoutSeconds);

            Task<HttpResponseMessage> requestTask;
            if (task.Method.Equals("GET", StringComparison.OrdinalIgnoreCase))
            {
                requestTask = hc.GetAsync(task.Url);
            }
            else
            {
                StringContent stringContent = new StringContent(task.PostData, Encoding.UTF8);
                requestTask = hc.PostAsync(task.Url, stringContent);
            }

            requestTask.ContinueWith(reqTask =>
            {
                var log = new ExecuteLog()
                {
                    PostData = task.PostData,
                    TaskId = task.Id,
                    TaskName = task.Name,
                    TaskUrl = task.Url,
                    TaskType = 2,
                    TaskMethod = task.Method,
                };

                if (reqTask.IsFaulted)
                {
                    log.Status = 2;
                    log.Message = reqTask.Exception.GetBaseException().StackTrace;
                    _executeLogDao.Insert(log);
                    _logger.LogError(reqTask.Exception.InnerExceptions.FirstOrDefault(),
                        "执行DelayTask异常，id:{0},name:{1},url:{2}", task.Id, task.Name, task.Url);
                    ReJoin(task);
                }
                else if (reqTask.IsCanceled)
                {
                    log.Status = 3;
                    log.Message = "timeout";
                    _executeLogDao.Insert(log);
                    ReJoin(task);
                }
                else
                {
                    reqTask.Result.Content.ReadAsStringAsync().ContinueWith(readTask =>
                    {
                        if (readTask.Result == task.SuccessFlag)
                        {
                            //删除数据
                            _delayTaskDao.DeleteById(task.Id);
                            log.Status = 1;
                            log.Message = "success";
                            _executeLogDao.Insert(log);
                        }
                        else
                        {
                            log.Status = 2;
                            log.Message = readTask.Result;

                            _logger.LogError("执行DelayTask出错，id:{0},name:{1},url:{2},msg:{3}", task.Id, task.Name,
                                task.Url, readTask.Result);
                            _executeLogDao.Insert(log);
                            ReJoin(task);
                        }
                    });
                }
            });
        }

        private void ReJoin(DelayTask task)
        {
            var flag = false;
            //不重试
            if (task.MaxRetryCount < 0)
            {
                flag = false;
            }
            else if (task.ExecCount >= task.MaxRetryCount && task.MaxRetryCount > 0)
            {
                flag = false;
            }
            else
            {
                task.TriggerTime = DateTime.Now.AddSeconds(task.RetrySeconds);
                _delayTaskDao.RetryUpdate(task);
                flag = true;
            }

            if (flag)
            {
                _tw.Add(task.Id, task.RetrySeconds);
            }
            else
            {
                //如果不重试，是否要删除
                _delayTaskDao.DeleteById(task.Id);
            }
        }
    }
}