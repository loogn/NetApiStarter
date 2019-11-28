using System;
using System.Collections.Generic;
using System.Text;

namespace CoreHelper.Ioc
{
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property)]
    public class AutowiredAttribute : Attribute
    {
        /// <summary>
        /// 服务唯一标识
        /// </summary>
        public string Identifier { get; set; }

        public AutowiredAttribute()
        {

        }
        public AutowiredAttribute(string identifier)
        {
            Identifier = identifier;
        }
    }
}
