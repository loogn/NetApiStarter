namespace project.dao.Models
{
    public partial class SystemUser
    {
        public string GetGender()
        {
            if (Gender == 1)
            {
                return "男";
            }
            else if (Gender == 2)
            {
                return "女";
            }
            else
            {
                return "未知";
            }
        }

        public string GetStatus()
        {
            if (Gender == 1)
            {
                return "正常";
            }
            else if (Gender == 2)
            {
                return "禁用";
            }
            else
            {
                return "未知";
            }
        }

    }
}
