using System;

namespace CoreHelper.AppEvent
{
    /// <summary>
    /// 标记方法是appEvent的事件处理程序
    /// </summary>
    [AttributeUsage(AttributeTargets.Method, AllowMultiple = false, Inherited = false)]
    public class AppEventHandlerAttribute : Attribute
    {
        public AppEventHandlerAttribute(string eventKey)
        {
            EventKey = eventKey;
        }
        /// <summary>
        /// key
        /// </summary>
        public string EventKey { get; set; }
    }
}
