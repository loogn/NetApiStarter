using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using project.backsite.TaskCaller.Quartz;
using project.dao;
using project.dao.Models;

namespace project.backsite.TaskCaller
{
    public class TimedTaskManager
    {
        int _loadIntervalCount = 5;
        int _loadIntervalSeconds = 5;
        Dictionary<CronExpression, List<long>> taskDict;
        
        
        [Autowired] private TimedTaskDao _timedTaskDao;
        [Autowired] private ExecuteLogDao _executeLogDao;
        [Autowired]IHttpClientFactory _httpClientFactory;
        [Autowired] ILogger<TimedTaskManager> _logger;

        public TimedTaskManager(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
            taskDict = new Dictionary<CronExpression, List<long>>();
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
                    var taskGroup = _timedTaskDao.SelectReadyList();
                    _logger.LogDebug("加载TimedTask条数:" + taskGroup.Count);
                    lock (this)
                    {
                        taskDict.Clear();
                        foreach (var item in taskGroup)
                        {
                            taskDict.Add(new CronExpression(item.Key), item.Value);
                        }
                    }
                }
                _loadIntervalCount++;
            }
        }

        public void TriggerTask(DateTime dateTime)
        {
            List<long> taskIds = new List<long>();
            lock (this)
            {
                foreach (var task in taskDict)
                {
                    if (task.Key.IsSatisfiedBy(dateTime.ToUniversalTime()))
                    {
                        taskIds.AddRange(task.Value);
                    }
                }
            }
            _logger.LogDebug("触发TimedTask条数:" + taskIds.Count);
            if (taskIds.Count > 0)
            {
                var taskList = _timedTaskDao.SelectByIds(taskIds);
                if (taskList.Count > 0)
                {
                    taskList.AsParallel().ForAll(Run);
                }
            }
        }

        private void Run(TimedTask task)
        {
            var hc = _httpClientFactory.CreateClient();
            hc.Timeout = task.TimeoutSeconds == 0 ? TimeSpan.FromSeconds(15) : TimeSpan.FromSeconds(task.TimeoutSeconds);
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
            task.LastExecTime = DateTime.Now;

            requestTask.ContinueWith(reqTask =>
            {
                var log = new ExecuteLog()
                {
                    PostData = task.PostData,
                    TaskId = task.Id,
                    TaskName = task.Name,
                    TaskUrl = task.Url,
                    TaskType = 1,
                    TaskMethod = task.Method
                };
                if (reqTask.IsFaulted)
                {
                    log.Status = 2;
                    log.Message = reqTask.Exception.GetBaseException().StackTrace;
                    _executeLogDao.Insert(log);
                    _logger.LogError(reqTask.Exception.InnerExceptions.FirstOrDefault(), "执行TimedTask异常，id:{0},name:{1},url:{2}", task.Id, task.Name, task.Url);
                    task.LastStatus = 2;
                    _timedTaskDao.ExecuteOne(task);
                }
                else if (reqTask.IsCanceled)
                {
                    log.Status = 3;
                    log.Message = "timeout";
                    _executeLogDao.Insert(log);
                    task.LastStatus = 3;
                    _timedTaskDao.ExecuteOne(task);
                }
                else
                {
                    reqTask.Result.Content.ReadAsStringAsync().ContinueWith(readTask =>
                    {
                        if (readTask.Result == task.SuccessFlag)
                        {
                            log.Status = 1;
                            log.Message = "success";
                            _executeLogDao.Insert(log);
                            task.LastStatus = 1;
                            _timedTaskDao.ExecuteOne(task);
                        }
                        else
                        {
                            log.Status = 2;
                            log.Message = readTask.Result;
                            _executeLogDao.Insert(log);
                            
                            _logger.LogError("执行TimedTask出错，id:{0},name:{1},url:{2},msg:{3}", task.Id, task.Name, task.Url, readTask.Result);
                            task.LastStatus = 2;
                            _timedTaskDao.ExecuteOne(task);
                        }
                    });
                }
            });
        }
    }
}
