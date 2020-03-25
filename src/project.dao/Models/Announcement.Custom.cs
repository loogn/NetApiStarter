using System;
using Loogn.OrmLite;

namespace project.dao.Models
{
    /// <summary>
    /// 
    /// </summary>
    public partial class Announcement
    {
        public string GetStatus()
        {
            return Status == 1 ? "显示" : "隐藏";
        }
    }
}