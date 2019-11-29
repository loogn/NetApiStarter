using CoreHelper;
using Microsoft.AspNetCore.Http;
using project.service.ApiModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Text;
using System.Threading;

namespace project.service
{
    public class UploadService
    {
        private static object lockObj = new object();

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="formFile"></param>
        /// <returns></returns>
        public ResultObject<UploadFileResponse> Uploadfile(IFormFile formFile)
        {
            var appSetting = AppSettings.Instance;
            if (formFile == null && formFile.Length == 0)
            {
                return new ResultObject<UploadFileResponse>("文件不能为空");
            }
            if (formFile.Length > appSetting.Upload.LimitSize)
            {
                return new ResultObject<UploadFileResponse>("文件超过了最大限制");
            }
            var ext = Path.GetExtension(formFile.FileName).ToLower();
            if (!appSetting.Upload.AllowExts.Contains(ext))
            {
                return new ResultObject<UploadFileResponse>("文件类型不允许");
            }
            //上传逻辑
            var now = DateTime.Now;
            var yy = now.ToString("yyyy");
            var mm = now.ToString("MM");
            var dd = now.ToString("dd");
            var fileName = Guid.NewGuid().ToString("n") + ext;

            var folder = Path.Combine(appSetting.Upload.UploadPath, yy, mm, dd);
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

            var fileUrl = $"{appSetting.RootUrl}{appSetting.Upload.RequestPath}/{yy}{mm}/{dd}/{fileName}";
            var response = new UploadFileResponse { Url = fileUrl };
            return new ResultObject<UploadFileResponse>(response);
        }

        /// <summary>
        /// 分片上传
        /// </summary>
        /// <param name="formFile"></param>
        /// <param name="chunkNumber"></param>
        /// <param name="chunkSize"></param>
        /// <param name="totalSize"></param>
        /// <param name="identifier"></param>
        /// <param name="totalChunks"></param>
        /// <returns></returns>
        public ResultObject<UploadFileResponse> ChunkUploadfile(IFormFile formFile, int chunkNumber, int chunkSize, long totalSize,
            string identifier, int totalChunks)
        {
            var appSetting = AppSettings.Instance;
            #region 验证
            if (formFile == null && formFile.Length == 0)
            {
                return new ResultObject<UploadFileResponse>("文件不能为空");
            }
            if (formFile.Length > appSetting.Upload.LimitSize)
            {
                return new ResultObject<UploadFileResponse>("文件超过了最大限制");
            }
            var ext = Path.GetExtension(formFile.FileName).ToLower();
            if (!appSetting.Upload.AllowExts.Contains(ext))
            {
                return new ResultObject<UploadFileResponse>("文件类型不允许");
            }

            if (chunkNumber == 0 || chunkSize == 0 || totalSize == 0 || identifier.Length == 0 || totalChunks == 0)
            {
                return new ResultObject<UploadFileResponse>("参数错误0");
            }

            if (chunkNumber > totalChunks)
            {
                return new ResultObject<UploadFileResponse>("参数错误1");
            }

            if (totalSize > appSetting.Upload.TotalLimitSize)
            {
                return new ResultObject<UploadFileResponse>("参数错误2");
            }

            if (chunkNumber < totalChunks && formFile.Length != chunkSize)
            {
                return new ResultObject<UploadFileResponse>("参数错误3");
            }

        
            if (totalChunks == 1 && formFile.Length != totalSize)
            {
                return new ResultObject<UploadFileResponse>("参数错误4");
            }
            #endregion

            //写入逻辑
            var now = DateTime.Now;
            var yy = now.ToString("yyyy");
            var mm = now.ToString("MM");
            var dd = now.ToString("dd");

            var fileName = EncryptHelper.MD5Encrypt(identifier) + ext;
            var folder = Path.Combine(appSetting.Upload.UploadPath, yy, mm, dd);
            var filePath = Path.Combine(folder, fileName);

            //线程安全的创建文件
            if (!File.Exists(filePath))
            {
                lock (lockObj)
                {
                    if (!File.Exists(filePath))
                    {
                        if (!Directory.Exists(folder))
                        {
                            Directory.CreateDirectory(folder);
                        }
                        File.Create(filePath).Dispose();
                    }
                }
            }

            var data = new byte[formFile.Length];
            formFile.OpenReadStream().Read(data, 0, data.Length);

            UploadChunkWriter.Instance.Add(new UploadChunkItem
            {
                ChunkNumber = chunkNumber,
                ChunkSize = chunkSize,
                Data = data,
                FilePath = filePath
            });
            if (chunkNumber == totalChunks)
            {
                //等等写入完成
                int i = 0;
                while (true)
                {
                    if (i >= 20)
                    {
                        break;
                    }
                    if (new FileInfo(filePath).Length != totalSize)
                    {
                        Thread.Sleep(TimeSpan.FromMilliseconds(500));
                        i++;
                    }
                    else
                    {
                        break;
                    }
                }
                var fileUrl = $"{appSetting.RootUrl}{appSetting.Upload.RequestPath}/{yy}{mm}/{dd}/{fileName}";
                var response = new UploadFileResponse { Url = fileUrl };
                return new ResultObject<UploadFileResponse>(response);
            }
            else
            {
                return new ResultObject<UploadFileResponse>
                {
                    Success = false,
                    Msg = "uploading...",
                    Result = new UploadFileResponse { Url = "" }
                };
            }
        }
    }
}
