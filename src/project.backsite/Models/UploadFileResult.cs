namespace project.backsite.Models
{
    /// <summary>
    /// 上传结果
    /// </summary>
    public class UploadFileResult
    {
        /// <summary>
        /// 文件虚拟地址
        /// </summary>
        public string FileUrl { get; set; }
        /// <summary>
        /// 网址根目录
        /// </summary>
        public string WebRoot { get; set; }

        /// <summary>
        /// 上传时原文件名
        /// </summary>
        public string FileName { get; set; }
    }
    
}
