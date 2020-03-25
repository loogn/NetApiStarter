using System;
using System.Collections.Generic;

namespace project.backsite.Models
{
    public class FeedBackListRequest
    {
        public string MpyfAppId { get; set; }

        public int PageIndex { get; set; }

        public int PageSize { get; set; }
    }

    public class FeedBackListResponse 
    {
        public List<FeedBackListInfo> FeedBackList { get; set; }
        public long TotalCount { get; set; }

        public long PageCount { get; set; }
    }

    public class FeedBackListInfo 
    {
        public long Id { get; set; }
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
    }
}
