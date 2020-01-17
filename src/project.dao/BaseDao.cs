using CoreHelper.Ioc;
using Loogn.OrmLite;
using Loogn.OrmLite.MySql;
using MySql.Data.MySqlClient;
using project.model;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Text;

namespace project.dal
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
    public class CommonServiceBaseDao<TEntity> : AbstractDao<TEntity>
    {
        
        protected override IDbConnection Open()
        {
            return new MySqlConnection(ConnectionStringsSection.Instance.Db1);
        }
    }

    //other base class
}