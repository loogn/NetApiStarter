using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using project.service;
using project.service.ApiModel;

namespace project.api.Controllers
{
    /// <summary>
    /// 上传相关
    /// </summary>
    public class UploadController : ApiController
    {
        [Autowired] UploadService uploadService;
        public UploadController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        /// <summary>
        /// 上传文件
        /// </summary>
        /// <param name="formFile"></param>
        /// <returns></returns>
        [HttpPost]
        public ResultObject<UploadFileResponse> Uploadfile([FromForm]IFormFile formFile)
        {
            return uploadService.Uploadfile(formFile);
        }
        /// <summary>
        /// 分块上传
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ResultObject<UploadFileResponse> ChunkUploadfile([FromForm]IFormFile formFile, int chunkNumber, int chunkSize, long totalSize,
            string identifier, int totalChunks)
        {
            return uploadService.ChunkUploadfile(formFile, chunkNumber, chunkSize, totalSize, identifier, totalChunks);
        }

    }
}