using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.dal
{
    [AppService]
    public class SystemUser_ResDao : CommonServiceBaseDao<SystemUser_Res>
    {

        public List<long> GetResourseIds(long systemUserId)
        {
            using (var db = Open())
            {
                return db.Column<long>("select SystemResId from SystemUser_Res where SystemUserId=" + systemUserId);
            }
        }
        public int DeleteByEmployeeId(long systemUserId)
        {
            return DeleteWhere("SystemUserId", systemUserId);
        }

        public int DeleteByResId(long systemResId)
        {
            return DeleteWhere("SystemResId", systemResId);
        }
    }
}
