using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SystemUser_Res
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        /// <summary>
        /// 系统用户编号
        /// </summary>
        public long SystemUserId { get; set; }

        /// <summary>
        /// 系统资源编号
        /// </summary>
        public long SystemResId { get; set; }
        /// <summary>
        /// 操作
        /// </summary>
        public string Operations { get; set; }

    }
}
