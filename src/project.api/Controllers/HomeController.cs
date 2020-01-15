﻿using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using PagedList.Core;

namespace project.api.Controllers
{
    public class HomeController : Controller
    {
        [Autowired]
        private IWebHostEnvironment env;

        [Autowired] private UploadSection uploadConfig;
        [Autowired] private JwtSection jwt;
        [Autowired] private AppSettings _appSettings;
        public HomeController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
            //_logger = logger;
        }

        public IActionResult Index(int page = 1)
        {
            return Content(uploadConfig.RequestPath + jwt.SigningKey + _appSettings.Jwt.Issuer);

            var listdata = new List<int>();
            for (var i = 0; i < 100; i++)
            {
                listdata.Add(i);
            }
            var pageSize = 10;
            var pagedList = new StaticPagedList<int>(listdata.Skip(pageSize * (page - 1)).Take(pageSize), page, pageSize, listdata.Count);
            ViewBag.pagedList = pagedList;

            var claimList = HttpContext.User.Claims.Select(x => x.Type + ":" + x.Value).ToList();
            ViewBag.claimList = claimList;

            ViewBag.Environment = env.EnvironmentName;
            return View();
        }
    }
}
