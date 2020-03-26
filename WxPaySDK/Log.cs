using System;
using System.IO;
using System.Net;

namespace WxPaySDK
{
    internal class Log
    {
        public static int LogLevel = 1;

        /**
         * 向日志写入调试信息
         * @param className 类名
         * @param content 写入内容
         */
        public static void Debug(string className, string content)
        {
            if (LogLevel >= 3)
            {
                WriteLog("DEBUG", className, content);
            }
        }

        /**
        * 向日志写入运行时信息
        * @param className 类名
        * @param content 写入内容
        */
        public static void Info(string className, string content)
        {
            if (LogLevel >= 2)
            {
                WriteLog("INFO", className, content);
            }
        }

        /**
        * 向日志写入出错信息
        * @param className 类名
        * @param content 写入内容
        */
        public static void Error(string className, string content)
        {
            if (LogLevel >= 1)
            {
                WriteLog("ERROR", className, content);
            }
        }

        /**
        * 实际的写日志操作
        * @param type 日志记录类型
        * @param className 类名
        * @param content 写入内容
        */
        protected static void WriteLog(string type, string className, string content)
        {
            string time = DateTime.Now.ToString("yyyy-MM-dd HH:mm:ss.fff"); //获取当前系统时间
            //日志内容
            string write_content = time + " " + type + " " + className + ": " + content;
            //需要用户自定义日志实现形式
            Console.WriteLine(write_content);
            //写入文件
            var path = Path.GetFullPath($"./WxPayLog_{DateTime.Now.ToString("yyyy-MM-dd")}.log");
            File.AppendAllText(path, write_content);
        }
    }
}