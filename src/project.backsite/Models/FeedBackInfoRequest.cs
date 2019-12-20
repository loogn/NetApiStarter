using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.backsite.Models
{
    public class FeedBackInfoRequest
    {
        public long id { get; set; }
    }

    public class FeedBackInfoResponse 
    {
        public long Id { get; set; }
        /// <summary>
        /// 用户编号
        /// </summary>
        public long UserId { get; set; }
        /// <summary>
        /// 反馈内容
        /// </summary>
        public string Content { get; set; }
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }
        /// <summary>
        /// 联系方式
        /// </summary>
        public string Phone { get; set; }
        /// <summary>
        /// 图片
        /// </summary>
        public string[] ImageList { get; set; }
    }
}
