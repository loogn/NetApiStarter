using System;
using System.Collections.Generic;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class DelayTaskDao:BaseDao<DelayTask>
    {
        public List<DelayTask> SelectReadyList(DateTime beginTime, DateTime endTime)
        {
            using (var db = Open())
            {
                var sql = string.Format("select Id, TriggerTime from DelayTask WHERE Enable=1 and TriggerTime >= '{0}' AND TriggerTime<'{1}'", beginTime.ToString("yyyy-MM-dd HH:mm:ss"), endTime.ToString("yyyy-MM-dd HH:mm:ss"));
                //Console.WriteLine(sql);
                return db.Select<DelayTask>(sql);
            }
        }

        public int RetryUpdate(DelayTask task)
        {
            using (var db = Open())
            {
                var flag = db.Update<DelayTask>(DictBuilder
                    .Assign("TriggerTime", task.TriggerTime)
                    .Assign("$ExecCount", "ExecCount+1"), "Id=" + task.Id, null);
                return flag;
            }
        }
    }
}