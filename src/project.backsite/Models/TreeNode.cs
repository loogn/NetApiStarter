using System.Collections.Generic;

namespace project.backsite.Models
{
    /// <summary>
    /// layui的treeNode
    /// </summary>
    public class TreeNode
    {

        /// <summary>
        /// 节点名称
        /// </summary>
        public string name { get; set; }

        /// <summary>
        /// 是否展开
        /// </summary>
        public bool spread { get; set; }
        
        public string Operations { get; set; }

        public List<TreeNode> children { get; set; }

        /// <summary>
        /// 编号 - 自定义属性
        /// </summary>
        public long id { get; set; }

        /// <summary>
        /// 级别 - 自定义属性
        /// </summary>
        public byte level { get; set; }
    }
}
