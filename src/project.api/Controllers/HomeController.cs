using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PagedList.Core;

namespace project.api.Controllers
{
    public class HomeController : MvcController
    {
        [Autowired]
        private ILogger<HomeController> _logger;

        public HomeController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
            //_logger = logger;
        }

        public IActionResult Index(int page=1)
        {

            var listdata = new List<int>();
            for (var i = 0; i < 100; i++) {
                listdata.Add(i);
            }
            var pageSize = 10;
            var pagedList = new StaticPagedList<int>(listdata.Skip(pageSize * (page - 1)).Take(pageSize), page, pageSize, listdata.Count);
            ViewBag.pagedList = pagedList;

            var claimList = HttpContext.User.Claims.Select(x => x.Type + ":" + x.Value).ToList();
            ViewBag.claimList = claimList;

            _logger.LogError("访问了index");
            ViewBag.Environment = AppSettings.Instance.Environment.EnvironmentName;
            return View();
        }
    }
}
