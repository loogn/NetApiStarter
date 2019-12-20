using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.dal
{

    [AppService]
    public class SystemUserDao : CommonServiceBaseDao<SystemUser>
    {

        public SystemUser Login(string username, string password)
        {
            return SingleWhere(DictBuilder.Assign("username", username).Assign("password", password));
        }

        public bool ExistsUsername(string username)
        {

            var count = CountWhere(DictBuilder.Assign("username", username));
            return count > 0;

        }

        public OrmLitePageResult<SystemUser> SelectPage(string nickname, int pageIndex, int pageSize)
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("1=1");
            nickname = SqlInjection.Filter(nickname);
            if (!string.IsNullOrEmpty(nickname))
            {
                sb.AppendFormat(" and nickname like '%{0}%'", nickname);
            }

            return SelectPage(new OrmLitePageFactor
            {
                Conditions = sb.ToString(),
                PageIndex = pageIndex,
                PageSize = pageSize,
                OrderBy = "id desc",
            });

        }

        public List<SystemUser> SelectAllNormal()
        {
            return SelectWhere("status", 1);
        }

        public int ResetPassword(long id, string pwd)
        {
            return UpdateFieldById("password", pwd, id);
        }

        public int SetAvatar(long id, string avatar)
        {
            return UpdateFieldById("avatar", avatar, id);
        }

        public HashSet<long> GetEmployeeResourceIds(long systemUserId)
        {
            var sql = @"
 SELECT SystemResId FROM SystemUser_Res WHERE SystemUserId={0}
 UNION  
 SELECT SystemResId FROM SystemRole_Res WHERE SystemRoleId IN ( SELECT SystemRoleId FROM SystemUser_Role WHERE SystemUserId={0}) ";

            using (var db = Open())
            {
                return db.ColumnDistinctFmt<long>(sql, systemUserId);
            }
        }
    }
}
