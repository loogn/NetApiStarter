using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class CountLimie
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        /// <summary>
        /// 唯一标识
        /// </summary>
        public string UniqueId { get; set; }

        /// <summary>
        /// 已有计数
        /// </summary>
        public int AlreadyCount { get; set; }

        /// <summary>
        /// 开始计数时间
        /// </summary>
        public DateTime BeginTime { get; set; }


    }
}
