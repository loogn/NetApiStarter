using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SystemRole_Res
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        public long SystemRoleId { get; set; }

        public long SystemResId { get; set; }

        /// <summary>
        /// 操作
        /// </summary>
        public string Operations { get; set; }
    }
}
