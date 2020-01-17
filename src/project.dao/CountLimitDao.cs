using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.model;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.dal
{
    [AppService]
    public class CountLimitDao : CommonServiceBaseDao<CountLimit>
    {


        public CountLimit Single(string mpyfAppId, string uniqueId)
        {
            using (var db = Open())
            {
                return db.SingleWhere<CountLimit>(DictBuilder.Assign("mpyfAppId", mpyfAppId).Assign("UniqueId", uniqueId));
            }
        }

        public int IncCount(long id)
        {
            using (var db = Open())
            {
                return db.UpdateFieldById<CountLimit>("$AlreadyCount", "AlreadyCount+1", id);
            }
        }

        public int ResetOne(long id, DateTime beginTime)
        {
            using (var db = Open())
            {
                return db.UpdateById<CountLimit>(DictBuilder.Assign("AlreadyCount", 1).Assign("BeginTime", beginTime), id);
            }
        }

        
    }

}
