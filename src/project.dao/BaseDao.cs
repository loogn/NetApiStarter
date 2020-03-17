using System.Data;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using Loogn.OrmLite.MySql;
using MySql.Data.MySqlClient;

namespace project.dao
{
    /// <summary>
    /// 链接配置
    /// </summary>
    [AppSetting("ConnectionStrings")]
    public class ConnectionStringsSection
    {
        public static ConnectionStringsSection Instance;
        static ConnectionStringsSection()
        {
            OrmLite.RegisterProvider(MySqlCommandDialectProvider.Instance);
        }
        
        public string Db1 { get; set; }
    }

    [AppService]
    public class BaseDao<TEntity> : AbstractDao<TEntity>
    {
        
        protected override IDbConnection Open()
        {
            return new MySqlConnection(ConnectionStringsSection.Instance.Db1);
        }
    }

    //other base class
}