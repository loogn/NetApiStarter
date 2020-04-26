using System;

namespace project.backsite.Tools.Auth
{
    public class ResItemAttribute : Attribute
    {
        public ResItemAttribute(string operation="查看", string page = null)
        {
            Operation = operation;
            Page = page;
        }

        /// <summary>
        /// 页面逻辑
        /// </summary>
        public string Page { get; set; }

        /// <summary>
        /// 操作
        /// </summary>
        public string Operation { get; set; }
    }
}