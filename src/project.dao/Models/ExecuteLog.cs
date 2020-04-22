﻿using Loogn.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

 namespace project.dao.Models
{
    /// <summary>
    /// 执行日志
    /// </summary>
    public class ExecuteLog
    {
        /// <summary>
        /// 日志名称
        /// </summary>
        [OrmLiteField(IsPrimaryKey = true, InsertIgnore = true)]
        public long Id { get; set; }
        /// <summary>
        /// 任务编号
        /// </summary>
        public long TaskId { get; set; }
        /// <summary>
        /// 任务类型 1-定时任务，2-延迟任务
        /// </summary>
        public int TaskType { get; set; }
        /// <summary>
        /// 任务名称
        /// </summary>
        public string TaskName { get; set; }
        /// <summary>
        /// 任务地址
        /// </summary>
        public string TaskUrl { get; set; }
        /// <summary>
        /// 任务方式
        /// </summary>
        public string TaskMethod { get; set; }
        /// <summary>
        /// 投递数据
        /// </summary>
        public string PostData { get; set; }
        /// <summary>
        /// 1成功，2失败，3超时
        /// </summary>
        public int Status { get; set; }
        public string GetStatus()
        {
            if (Status == 1)
            {
                return "成功";
            }
            else if (Status == 2)
            {
                return "失败";
            }
            else if (Status == 3)
            {
                return "超时";
            }
            else
            {
                return Status.ToString();
            }
        }
        /// <summary>
        /// 信息
        /// </summary>
        public string Message { get; set; }
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }

    }
}
