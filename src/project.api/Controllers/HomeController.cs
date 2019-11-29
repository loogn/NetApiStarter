using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;

namespace project.api.Controllers
{
    public class HomeController : Controller
    {
        [Autowired]
        private ILogger<HomeController> _logger;

        public HomeController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
            //_logger = logger;
        }

        public IActionResult Index()
        {
            _logger.LogError("访问了index");
            ViewBag.Environment = AppSettings.Instance.Environment.EnvironmentName;
            return View();
        }
    }
}
