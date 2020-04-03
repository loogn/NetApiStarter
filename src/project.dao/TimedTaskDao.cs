using System.Collections.Generic;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class TimedTaskDao : BaseDao<TimedTask>
    {
        public OrmLitePageResult<TimedTask> SearchList(string name, bool? enable, int pageIndex, int pageSize)
        {
            var condition = "1=1";
            name = SqlInjection.Filter(name);
            if (!string.IsNullOrEmpty(name))
            {
                condition += " and Name like '%" + name + "%'";
            }

            if (enable != null)
            {
                condition += " and Enable=" + (enable.Value ? "1" : "0");
            }

            using (var db = Open())
            {
                return db.SelectPage<TimedTask>(new OrmLitePageFactor
                {
                    PageIndex = pageIndex,
                    PageSize = pageSize,
                    OrderBy = "id desc",
                    Conditions = condition,
                });
            }
        }

        public Dictionary<string, List<long>> SelectReadyList()
        {
            using (var db = Open())
            {
                var sql = "SELECT Cron,Id FROM TimedTask WHERE Enable=1";
                return db.Lookup<string, long>(sql);
            }
        }

        public int ExecuteOne(TimedTask task)
        {
            using (var db = Open())
            {
                return db.UpdateById<TimedTask>(
                    DictBuilder.Assign("LastExecTime", task.LastExecTime)
                        .Assign("LastStatus", task.LastStatus)
                        .Assign("$ExecCount", "ExecCount+1"), task.Id);
            }
        }
    }
}