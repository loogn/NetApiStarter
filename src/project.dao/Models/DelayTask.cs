﻿using Loogn.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.dao.Models
{
    /// <summary>
    /// 延迟任务
    /// </summary>
    public class DelayTask
    {
        /// <summary>
        /// 任务编号
        /// </summary>
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }
        /// <summary>
        /// 任务名称
        /// </summary>
        public string Name { get; set; }
        /// <summary>
        /// 请求地址
        /// </summary>
        public string Url { get; set; }

        /// <summary>
        /// POST / GET
        /// </summary>
        public string Method { get; set; }
        /// <summary>
        /// POST数据
        /// </summary>
        public string PostData { get; set; }
        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Enable { get; set; }
        /// <summary>
        /// 触发时间
        /// </summary>
        public DateTime TriggerTime { get; set; }

        /// <summary>
        /// 最大重试次数，0无限，-1不重试
        /// </summary>
        public int MaxRetryCount { get; set; }
        /// <summary>
        /// 不成功时，重试间隔秒数
        /// </summary>
        public int RetrySeconds { get; set; }
        /// <summary>
        /// 执行次数
        /// </summary>
        public long ExecCount { get; set; }

        /// <summary>
        /// 超时秒数
        /// </summary>
        public int TimeoutSeconds { get; set; }
        /// <summary>
        /// 成功标识
        /// </summary>
        public string SuccessFlag { get; set; }

        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }
    }
}
