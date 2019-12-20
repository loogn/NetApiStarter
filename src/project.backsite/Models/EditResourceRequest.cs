using CoreHelper;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace project.backsite.Models
{
    public class EditResourceRequest
    {
        public long Id { get; set; }

        /// <summary>
        /// 资源名称
        /// </summary>
        [Required(ErrorMessage = "资源名称不能为空")]
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
        public byte Type { get; set; }


        /// <summary>
        /// 1启用，2禁用
        /// </summary>
        public byte Status { get; set; }
        /// <summary>
        /// 排序号
        /// </summary>
        public int OrderNum { get; set; }
        /// <summary>
        /// 父编号
        /// </summary>
        public long ParentId { get; set; }
        /// <summary>
        /// 备注
        /// </summary>
        public string Remark { get; set; }
        /// <summary>
        /// 图标
        /// </summary>
        public string Icon { get; set; }
    }
}
