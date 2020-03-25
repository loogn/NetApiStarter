using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class SystemRes
    {
        public string GetStatus()
        {
            return Status switch
            {
                1 => "启用",
                2 => "禁用",
                _ => Type.ToString()
            };
        }

        public new string GetType()
        {
            return Type switch
            {
                1 => "显示",
                2 => "隐藏",
                _ => Type.ToString()
            };
        }
    }
}