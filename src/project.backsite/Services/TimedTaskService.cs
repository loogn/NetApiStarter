using System;
using System.Collections.Generic;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.backsite.TaskCaller.Quartz;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class TimedTaskService
    {
        [Autowired] private TimedTaskDao _timedTaskDao;

        public TimedTaskService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }


        public ResultObject Edit(TimedTask m)
        {
            if (string.IsNullOrEmpty(m.Url))
            {
                return new ResultObject("url不能为空");
            }

            if (string.IsNullOrEmpty(m.Cron))
            {
                return new ResultObject("cron表达不能为空");
            }

            try
            {
                var exp = new CronExpression(m.Cron);
            }
            catch
            {
                return new ResultObject("cron表达式不正确");
            }

            if (m.Id > 0)
            {
                m.UpdateTime = DateTime.Now;
                var flag = _timedTaskDao.Update(m, "Name", "Cron", "Url", "Method", "PostData", "Enable", "UpdateTime",
                    "SuccessFlag", "TimeoutSeconds");
                return new ResultObject(flag);
            }
            else
            {
                m.LastExecTime = new DateTime(1900, 1, 1);
                var flag = _timedTaskDao.Insert(m);
                return new ResultObject(flag);
            }
        }

        public OrmLitePageResult<TimedTask> SearchList(string name, bool? enable, int pageIndex, int pageSize)
        {
            return _timedTaskDao.SearchList(name, enable, pageIndex, pageSize);
        }

        public TimedTask SingleById(long id)
        {
            return _timedTaskDao.SingleById(id);
        }

        public List<TimedTask> SelectByIds(List<long> ids)
        {
            return _timedTaskDao.SelectByIds(ids);
        }


        public ResultObject Delete(long id)
        {
            var flag = _timedTaskDao.DeleteById(id);
            return new ResultObject(flag);
        }
    }
}