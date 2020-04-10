using System;
using CoreHelper.Ioc;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class ExecuteLogDao : BaseDao<ExecuteLog>
    {
        public long Insert(ExecuteLog m)
        {
            m.AddTime = DateTime.Now;
            Console.WriteLine(
                "TaskId:{0},Type:{1},Name:{2},Method:{3},Url:{4},Data:{5},Status:{6},Message:{7},Time:{8}",
                m.TaskId, m.TaskType == 1 ? "定时" : "延迟", m.TaskName, m.TaskMethod, m.TaskUrl, m.PostData, m.GetStatus(),
                m.Message, m.AddTime.ToString("yyyy-MM-dd HH:mm:ss"));
            if (m.Status != 1)
            {
                var flag= base.Insert(m);
                return flag;
            }
            else
            {
                return 0;
            }
        }
    }
}