using System.Data;
using System.Data.SqlClient;
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
            //OrmLite.RegisterProvider(MySqlCommandDialectProvider.Instance);
            OrmLite.RegisterProvider(SqlServerCommandDialectProvider.Instance);
        }

        public string Db1 { get; set; }
        public string Db2 { get; set; }
    }

    [AppService]
    public class BaseDao<TEntity> : AbstractDao<TEntity>
    {
        protected override IDbConnection Open()
        {
            return new SqlConnection(ConnectionStringsSection.Instance.Db2);
            //return new MySqlConnection(ConnectionStringsSection.Instance.Db1);
        }
    }

    //other base class
}