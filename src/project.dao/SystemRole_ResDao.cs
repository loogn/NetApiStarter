using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.dal
{
       [AppService]
    public class SystemRole_ResDao : CommonServiceBaseDao<SystemRole_Res>
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
