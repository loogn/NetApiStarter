using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;

namespace project.backsite.Controllers
{
    public class HomeController : MvcController
    {
        public IActionResult Index()
        {
            
            return View();
        }
        public IActionResult welcome()
        {
            return View();
        }
    }
}
