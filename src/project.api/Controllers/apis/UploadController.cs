﻿using System.Linq;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.api.Models;
using project.api.Services;


namespace project.api.Controllers.apis
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
        /// <returns></returns>
        [HttpPost]
        public ResultObject<UploadFileResponse> Uploadfile()
        {
            return uploadService.Uploadfile(Request.Form.Files.FirstOrDefault());
        }
        /// <summary>
        /// 分块上传
        /// </summary>
        /// <returns></returns>
        [HttpPost]
        public ResultObject<UploadFileResponse> ChunkUploadfile(int chunkNumber, int chunkSize, long totalSize,
            string identifier, int totalChunks)
        {
            return uploadService.ChunkUploadfile(Request.Form.Files.FirstOrDefault(), chunkNumber, chunkSize, totalSize, identifier, totalChunks);
        }

        /// <summary>
        /// 检测分块是否存在
        /// </summary>
        /// <param name="chunkNumber"></param>
        /// <param name="identifier"></param>
        /// <returns></returns>
        [HttpGet]
        public string ChunkUploadfile(int chunkNumber, string identifier)
        {
            return uploadService.CheckChunkfile(identifier, chunkNumber);
        }
    }
}