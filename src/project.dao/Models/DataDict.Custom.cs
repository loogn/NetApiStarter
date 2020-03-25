using Loogn.OrmLite;

namespace project.dao.Models
{
    public partial class DataDict
    {
        [OrmLiteField(Ignore = true)]
        public int igLevel { get; set; }
    }
}