﻿using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Http;
using project.backsite;
using project.backsite.Models;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading;

namespace project.service
{
    [AppService]
    public class UploadService
    {
        private static object lockObj = new object();

        [Autowired] private AppSettings _appSettings;
        
        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="formFile"></param>
        /// <returns></returns>
        public ResultObject<UploadFileResult> Uploadfile(IFormFile formFile)
        {
            
            if (formFile == null || formFile.Length == 0)
            {
                return new ResultObject<UploadFileResult>("文件不能为空");
            }
            if (formFile.Length > _appSettings.Upload.LimitSize)
            {
                return new ResultObject<UploadFileResult>("文件超过了最大限制");
            }
            var ext = Path.GetExtension(formFile.FileName).ToLower();
            if (!_appSettings.Upload.AllowExts.Contains(ext))
            {
                return new ResultObject<UploadFileResult>("文件类型不允许");
            }
            //上传逻辑
            var now = DateTime.Now;
            var yy = now.ToString("yyyy");
            var mm = now.ToString("MM");
            var dd = now.ToString("dd");
            var fileName = Guid.NewGuid().ToString("n") + ext;

            var folder = Path.Combine(_appSettings.Upload.UploadPath, yy, mm, dd);
            if (!Directory.Exists(folder))
            {
                Directory.CreateDirectory(folder);
            }
            var filePath = Path.Combine(folder, fileName);
            using (var fileStream = new FileStream(filePath, FileMode.Create, FileAccess.Write))
            {
                formFile.CopyTo(fileStream);
                fileStream.Flush(true);
            }

            var fileUrl = $"{_appSettings.RootUrl}{_appSettings.Upload.RequestPath}/{yy}/{mm}/{dd}/{fileName}";
            var response = new UploadFileResult { FileUrl = _appSettings.RootUrl + fileUrl };
            return new ResultObject<UploadFileResult>(response);
        }

    }
}