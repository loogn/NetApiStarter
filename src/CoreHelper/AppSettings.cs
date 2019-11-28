
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
        public string UploadUrl { get; set; }
    }

    public class JwtSection
    {
        public string SigningKey { get; set; }
        public string Issuer { get; set; }
        public string Audience { get; set; }
    }
}
