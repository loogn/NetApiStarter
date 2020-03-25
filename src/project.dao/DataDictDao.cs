using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.dao.Models;

namespace project.dao
{
    [AppService]
    public class DataDictDao:BaseDao<DataDict>
    {
        public int GetMaxDictId(int dictType)
        {

            var sql = "select IFNULL(max(dictid),0) as maxDictId from DataDict where dictType =" + dictType;

            using (var db = Open())
            {
                return db.Scalar<int>(sql, dictType);
            }
        }
    }
}