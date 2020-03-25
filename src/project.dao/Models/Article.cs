using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class Article
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        /// <summary>
        /// 文章标题
        /// </summary>
        public string Title { get; set; }

        /// <summary>
        /// 封面图
        /// </summary>
        public string CoverImage { get; set; }

        /// <summary>
        /// 文章分类,DictType=2
        /// </summary>
        public int TypeId { get; set; }

        /// <summary>
        /// 虚拟阅读量
        /// </summary>
        public int VirtualRead { get; set; }

        /// <summary>
        /// 阅读量
        /// </summary>
        public int RealRead { get; set; }

        /// <summary>
        /// 1-显示，2-隐藏
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 排序号，越小越靠前
        /// </summary>
        public int OrderNum { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }

        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime UpdateTime { get; set; }

        /// <summary>
        /// 文章内容
        /// </summary>
        public string Body { get; set; }


    }
}
