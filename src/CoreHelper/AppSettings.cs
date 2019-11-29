
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Text;

namespace CoreHelper
{
    /// <summary>
    /// 对应appsettings.json
    /// </summary>
    public class AppSettings
    {
        /// <summary>
        /// 注入的AppSettings
        /// </summary>
        public static AppSettings Instance { get; set; }

        public ConnectionStringsSection ConnectionStrings { get; set; }
        public UploadSection Upload { get; set; }

        public JwtSection Jwt { get; set; }
        /// <summary>
        /// 网站根目录
        /// </summary>
        public string RootUrl { get; set; }
        /// <summary>
        /// 运行环境
        /// </summary>
        public IWebHostEnvironment Environment { get; set; }

    }


    public class ConnectionStringsSection
    {
        public string DbConn { get; set; }
    }

    public class UploadSection
    {
        public string UploadPath { get; set; }

        public string RequestPath { get; set; }

        /// <summary>
        /// 单文件大小，分片大小限制，默认4M
        /// </summary>
        public long LimitSize { get; set; } = 4194304;

        /// <summary>
        /// 分片上传总大小，默认2G
        /// </summary>
        public long TotalLimitSize { get; set; } = 2147483648;

        /// <summary>
        /// 允许上传的后缀
        /// </summary>
        public HashSet<string> AllowExts { get; set; }

    }

    public class JwtSection
    {
        public string SigningKey { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
    }
}
