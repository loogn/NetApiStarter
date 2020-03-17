using System.Collections.Generic;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class SystemUser_ResDao : BaseDao<SystemUser_Res>
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
