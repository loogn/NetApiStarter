﻿using CoreHelper.Ioc;
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

        public IActionResult List(long parentId = 0)
        {
            var parent = systemResBusiness.SingleById(parentId);
            ViewBag.parent = parent;
            ViewBag.list = systemResBusiness.SelectByParentId(parentId);
            return View();
        }


        public IActionResult Edit(long id = 0, long parentId = 0)
        {
            var m = systemResBusiness.SingleById(id);
            if (m == null)
            {
                m = new SystemRes();
                m.Status = 1;
                m.Type = 1;
                ViewBag.parent = systemResBusiness.SingleById(parentId);
            }
            else
            {
                ViewBag.parent = systemResBusiness.SingleById(m.ParentId);
            }

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