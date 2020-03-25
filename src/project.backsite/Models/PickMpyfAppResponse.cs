using System.Collections.Generic;

namespace project.backsite.Models
{
    public class PickMpyfAppResponse
    {
        public List<PickMpyfAppInfo> appList { get; set; }
    }

    public class PickMpyfAppInfo 
    {
        public string mpyfAppId { get; set; }
    }
}
