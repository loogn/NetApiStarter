﻿using Loogn.OrmLite;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.dao.Models
{
    /// <summary>
    /// 定时任务
    /// </summary>
    public class TimedTask
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
        /// cron表达式
        /// </summary>
        public string Cron { get; set; }
        /// <summary>
        /// 任务地址
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
        /// 执行次数
        /// </summary>
        public long ExecCount { get; set; }
        /// <summary>
        /// 最后执行时间
        /// </summary>
        public DateTime LastExecTime { get; set; }

        /// <summary>
        /// 最后执行的状态1成功，2失败，3超时
        /// </summary>
        public int LastStatus { get; set; }
        public string GetStatus()
        {

            if (LastStatus == 1)
            {
                return "成功";
            }
            else if (LastStatus == 2)
            {
                return "失败";
            }
            else if (LastStatus == 3)
            {
                return "超时";
            }
            else if (LastStatus == 0)
            {
                return "未执行";
            }
            else
            {
                return LastStatus.ToString();
            }
        }
        /// <summary>
        /// 是否启用
        /// </summary>
        public bool Enable { get; set; }
        /// <summary>
        /// 超时秒数
        /// </summary>
        public int TimeoutSeconds { get; set; }
        /// <summary>
        /// 添加时间
        /// </summary>
        public DateTime AddTime { get; set; }
        /// <summary>
        /// 修改时间
        /// </summary>
        public DateTime UpdateTime { get; set; }
        /// <summary>
        /// 成功标识
        /// </summary>
        public string SuccessFlag { get; set; }

        public override bool Equals(object obj)
        {
            if (!(obj is TimedTask)) return false;
            return Equals((TimedTask)obj);
        }
        public bool Equals(TimedTask timedTask)
        {
            return Id == timedTask.Id;
        }

        public override int GetHashCode()
        {
            return Id.GetHashCode();
        }
    }
}
