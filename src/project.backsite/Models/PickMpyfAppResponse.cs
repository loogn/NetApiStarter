using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

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
