using System.Configuration;
using Loogn.OrmLite;

namespace project.dao.Models
{
    public partial class DataDict
    {
        [OrmLiteField(Ignore = true)]
        public int igLevel { get; set; }
    }

    public class DataDictType
    {
        public static int 广告类型 = 1;

        public static int 文章类型 = 2;
        
    }
}