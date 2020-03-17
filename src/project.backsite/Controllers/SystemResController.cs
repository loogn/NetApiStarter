using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Models;
using project.backsite.Services;
using project.dao.Models;

namespace project.backsite.Controllers
{
    public class SystemResController : MvcController
    {
        [Autowired] private SystemResService systemResBusiness;

        public SystemResController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public IActionResult List(string name, int page = 1)
        {
            var pageSize = 10;
            var plist = systemResBusiness.SelectList(name, page, pageSize);
            ViewBag.plist = plist.ToStaticPagedList();
            return View();
        }


        public IActionResult Edit(long id = 0)
        {
            var m = systemResBusiness.SingleById(id);
            if (m == null)
            {
                m = new SystemRes();
                m.Status = 1;
                m.Type = 1;
            }

            var plist = systemResBusiness.ParentList();
            ViewBag.plist = plist;
            ViewBag.m = m;
            return View();
        }

        public IActionResult DoEdit(EditResourceRequest m)
        {
            var ro = systemResBusiness.Edit(m);
            return Json(ro);
        }

        public IActionResult treeNodes()
        {
            var list = systemResBusiness.SelectAllNodes();
            return Json(list);
        }

        public IActionResult Del(long id)
        {
            var ro = systemResBusiness.DeleteRes(id);
            return Json(ro);
        }
    }
}