using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace project.api.Models
{
    /// <summary>
    /// 打招呼请求
    /// </summary>
    public class HelloRequest : LoginedRequest
    {
        /// <summary>
        /// 给谁打招呼
        /// </summary>
        [Required]
        public string ToUser { get; set; }
    }
    public class HelloResponse
    {
        /// <summary>
        /// 打招呼的消息
        /// </summary>
        public string Msg { get; set; }
    }
}
