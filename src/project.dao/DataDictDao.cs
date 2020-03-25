using System.Data.SqlClient;
using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class DataDictDao : BaseDao<DataDict>
    {
        public int GetMaxDictId(int dictType)
        {
            using (var db = Open())
            {
                var sql = "";
                if (db.GetType().Name.Contains("MySql"))
                {
                    sql = "select IFNULL(max(dictid),0) as maxDictId from DataDict where dictType =" + dictType;
                }
                else
                {
                    sql = "select ISNULL(max(dictid),0) as maxDictId from DataDict where dictType =" + dictType;
                }

                return db.Scalar<int>(sql, dictType);
            }
        }
    }
}