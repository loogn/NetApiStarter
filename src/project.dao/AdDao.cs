using System;
using System.Collections.Generic;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class AdDao : BaseDao<Ad>
    {
        public List<Ad> SelectByType(long typeId)
        {
            using (var db = Open())
            {
                return db.SelectFmt<Ad>(
                    "SELECT * FROM Ad WHERE typeId={0} AND Status=1 AND BeginTime<='{1}' AND EndTime>='{1}'",
                    typeId, DateTime.Now.ToString("yyyy-MM-dd HH:mm"));
            }
        }
    }
}