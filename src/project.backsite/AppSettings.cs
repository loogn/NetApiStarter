
using Microsoft.AspNetCore.Hosting;
using System;
using System.Collections.Generic;
using System.Text;
using CoreHelper.Ioc;

namespace project.backsite
{
    /// <summary>
    /// 对应appsettings.json
    /// </summary>
    [AppSetting]
    public class AppSettings
    {
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
