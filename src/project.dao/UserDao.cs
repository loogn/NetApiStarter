using CoreHelper;
using CoreHelper.Ioc;
using project.dao.DataModel;
using System;

namespace project.dao
{

    [AppService]
    public class UserDao
    {

        public User GetUser(string account, string password)
        {
            // 从数据库中查询用户，可使用一下语句获取连接字符串
            // AppSettings.Instance.ConnectionStrings.DbConn; 
            if (account == "loogn" && password == "123456")
            {
                return new User { Id = 1, Account = "loogn" };
            }
            else
            {
                return null;
            }
        }

        public User SingleById(long id)
        {
            return new User { Id = 1, Account = "loogn" };
        }

    }
}
