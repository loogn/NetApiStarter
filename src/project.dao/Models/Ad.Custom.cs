namespace project.dao.Models
{
    public partial class Ad
    {
        public string GetStatus()
        {
            return Status == 1 ? "正常" : "禁用";
        }
    }
}