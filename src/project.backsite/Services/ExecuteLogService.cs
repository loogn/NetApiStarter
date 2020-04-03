using System.Text;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class ExecuteLogService
    {
        [Autowired] private ExecuteLogDao _executeLogDao;

        public ExecuteLogService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }


        public OrmLitePageResult<ExecuteLog> SearchList(long taskId, int taskType, int status, int pageIndex,
            int pageSize)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("1=1");
            if (taskId > 0)
            {
                sb.AppendFormat(" and TaskId={0}", taskId);
            }

            if (taskType > 0)
            {
                sb.AppendFormat(" and TaskType={0}", taskType);
            }

            if (status > 0)
            {
                sb.AppendFormat(" and Status={0}", status);
            }

            return _executeLogDao.SelectPage(new OrmLitePageFactor
            {
                Conditions = sb.ToString(),
                OrderBy = "id desc",
                PageIndex = pageIndex,
                PageSize = pageSize,
            });
        }
    }
}