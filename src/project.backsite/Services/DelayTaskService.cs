using System;
using CoreHelper;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class DelayTaskService
    {
        [Autowired] private DelayTaskDao _delayTaskDao;

        public DelayTaskService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public ResultObject Edit(DelayTask m)
        {
            if (string.IsNullOrEmpty(m.Url))
            {
                return new ResultObject("url不能为空");
            }

            if (m.Id > 0)
            {
                var flag = _delayTaskDao.Update(m, "Name", "Url", "Method", "PostData", "Enable",
                    "TriggerTime", "MaxRetryCount", "RetrySeconds", "SuccessFlag", "TimeoutSeconds");
                return new ResultObject(flag);
            }
            else
            {
                if (m.TriggerTime <= DateTime.Now)
                {
                    return new ResultObject("触发时间不正确");
                }

                var flag = _delayTaskDao.Insert(m);
                return new ResultObject(flag);
            }
        }

        public OrmLitePageResult<DelayTask> SearchList(string name, int pageIndex, int pageSize)
        {
            var condition = "1=1";
            name = SqlInjection.Filter(name);
            if (!string.IsNullOrEmpty(name))
            {
                condition += " and Name like '" + name + "'";
            }

            return _delayTaskDao.SelectPage(new OrmLitePageFactor
            {
                PageIndex = pageIndex,
                PageSize = pageSize,
                OrderBy = "id desc",
                Conditions = condition,
            });
        }

        public DelayTask SingleById(long id)
        {
            return _delayTaskDao.SingleById(id);
        }

        public ResultObject Delete(long id)
        {
            var flag = _delayTaskDao.DeleteById(id);
            return new ResultObject(flag);
        }
    }
}