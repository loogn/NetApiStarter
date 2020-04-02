using System;
using System.Collections.Generic;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SystemRes
    {
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }

        /// <summary>
        /// 资源名称
        /// </summary>
        public string Name { get; set; }

        /// <summary>
        /// 资源地址
        /// </summary>
        public string Url { get; set; }

        /// <summary>
        /// 连接目标
        /// </summary>
        public string Target { get; set; }

        /// <summary>
        /// 资源类型，1-菜单，2-权限
        /// </summary>
        public int Type { get; set; }

        /// <summary>
        /// 1启用，2禁用
        /// </summary>
        public int Status { get; set; }

        /// <summary>
        /// 排序号
        /// </summary>
        public int OrderNum { get; set; }

        /// <summary>
        /// 父级菜单编号
        /// </summary>
        public long ParentId { get; set; }

        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }

        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }

        /// <summary>
        /// 操作
        /// </summary>
        public string Operations { get; set; }
         
    }
}
