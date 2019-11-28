using System;
using System.Collections.Generic;
using System.Text;

namespace CoreHelper
{
    public static class DateTimeHelper
    {
        #region 时间戳

        static DateTime m_startTime = TimeZoneInfo.ConvertTimeFromUtc(new DateTime(1970, 1, 1), TimeZoneInfo.Local);


        public static long ToJavaScriptTimestamp(DateTime dt)
        {
            var timestamp = (long) (dt - m_startTime).TotalMilliseconds;
            return timestamp;
        }

        public static DateTime FromJavaScriptTimestamp(long jsTimestamp)
        {
            return m_startTime.AddMilliseconds(jsTimestamp);
        }

        public static long ToUnixTimestamp(DateTime dt)
        {
            var timestamp = (long) (dt - m_startTime).TotalSeconds;
            return timestamp;
        }

        public static DateTime FromUnixTimestamp(long linuxTimestamp)
        {
            return m_startTime.AddSeconds(linuxTimestamp);
        }

        #endregion


        public static readonly DateTime DefaultDBTime = new DateTime(1900, 1, 1);

        public static string GetString(this DateTime? dt, string format = "yyyy-MM-dd HH:mm", string defaultValue = "")
        {
            return dt.HasValue ? dt.Value.ToString(format) : defaultValue;
        }

        public static string GetString(this DateTime dt, string format = "yyyy-MM-dd HH:mm")
        {
            return dt.ToString(format);
        }

        public static string GetString(this TimeSpan ts, string format = @"hh\:mm")
        {
            return ts.ToString(format);
        }

        public static string GetString(this TimeSpan? ts, string format = @"hh\:mm", string defaultValue = "")
        {
            return ts.HasValue ? ts.Value.ToString(format) : defaultValue;
        }

        public static string GetShortString(this DateTime dt)
        {
            return dt.GetString("yyyy-MM-dd");
        }

        public static string GetShortString(this DateTime? dt, string defaultValue = "")
        {
            return dt.GetString("yyyy-MM-dd", defaultValue);
        }

        public static DateTime? ParseDateTime(this string strDate)
        {
            if (string.IsNullOrEmpty(strDate)) return null;
            DateTime dt;
            if (DateTime.TryParse(strDate, out dt))
            {
                return dt;
            }
            else
            {
                return null;
            }
        }

        /// <summary>
        /// 获取一周的第一天
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static DateTime FirstDateOfWeek(DateTime date)
        {
            if (date.DayOfWeek == 0)
            {
                return date.AddDays(-6);
            }
            else if (date.DayOfWeek > DayOfWeek.Monday)
            {
                return date.AddDays(1 - (int) date.DayOfWeek);
            }
            else
            {
                return date;
            }
        }

        /// <summary>
        /// 获取一周的第一天
        /// </summary>
        /// <returns></returns>
        public static DateTime FirstDateOfWeek()
        {
            DateTime date = DateTime.Now;
            return FirstDateOfWeek(date);
        }

        /// <summary>
        /// 获取一月的第一天
        /// </summary>
        /// <param name="date"></param>
        /// <returns></returns>
        public static DateTime FirstDateOfMonth(DateTime date)
        {
            return new DateTime(date.Year, date.Month, 1);
        }

        /// <summary>
        /// 获取一月的第一天
        /// </summary>
        /// <returns></returns>
        public static DateTime FirstDateOfMonth()
        {
            var now = DateTime.Now;
            return FirstDateOfMonth(now);
        }
    }
}