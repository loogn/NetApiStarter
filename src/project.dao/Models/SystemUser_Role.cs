using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SystemUser_Role
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        public long SystemUserId { get; set; }

        public long SystemRoleId { get; set; }


    }
}
