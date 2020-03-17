using System.Collections.Generic;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
       [AppService]
    public class SystemRole_ResDao : BaseDao<SystemRole_Res>
    {


        public List<long> GetResourseIds(long roleId)
        {
            using (var db = Open())
            {
                return db.Column<long>("select SystemResId from SystemRole_Res where SystemRoleId=" + roleId);
            }
        }

        public long DeleteByRoleId(long roleId)
        {
            return DeleteWhere("SystemRoleId", roleId);
        }

        public int DeleteByResId(long systemResId)
        {
            return DeleteWhere("SystemResId", systemResId);
        }

    }
}
