using System.Collections.Generic;
using System.Linq;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Models;
using project.backsite.Services;
using project.dao.Models;

namespace project.backsite.Controllers
{
    public class SystemUserController : MvcController
    {
        [Autowired] SystemUserService systemUserBusiness;
        [Autowired] SystemUser_ResService systemUser_ResBusiness;
        [Autowired] private SystemUser_RoleService _systemUserRoleBusincess;
        [Autowired] private SystemRoleService _systemRoleBusiness;
        [Autowired] private SystemResService _systemResService;

        public SystemUserController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public IActionResult List(string nickname, int page = 1)
        {
            var pageSize = 10;
            var prList = systemUserBusiness.SelectPage(nickname, page, pageSize);
            ViewBag.plist = prList.ToStaticPagedList();
            return View();
        }

        public IActionResult Edit(int id = 0)
        {
            var m = systemUserBusiness.SingleById(id);
            if (m == null)
            {
                m = new SystemUser();
            }
            else
            {
                m.Password = "123456";
            }

            ViewBag.m = m;
            return View();
        }

        public IActionResult DoEdit(EditEmployeeRequest request)
        {
            var ro = systemUserBusiness.Edit(request);
            return Json(ro);
        }

        public IActionResult ResetPassword(long employeeId, string password)
        {
            var ro = systemUserBusiness.ResetPassword(employeeId, password);
            return Json(ro);
        }

        public IActionResult EditResource(int employeeId)
        {
            var resList = _systemResService.SelectAll();
            var resRole = systemUser_ResBusiness.SelectByUser(employeeId);
            foreach (var res in resList)
            {
                var operations = resRole.SingleOrDefault(x => x.SystemResId == res.Id)?.Operations ?? string.Empty;
                res.HadOperations = new HashSet<string>(StringHelper.Split(operations, ',', '，'));
            }

            ViewBag.resList = resList;
            return View();
        }

        public IActionResult SaveRes(int employeeId)
        {
            Dictionary<string, string> res = new Dictionary<string, string>();
            foreach (var key in Request.Form.Keys)
            {
                if (key.StartsWith("res_"))
                {
                    res.Add(key, Request.Form[key].ToString());
                }
            }

            var ro = systemUser_ResBusiness.SaveRes(employeeId, res);
            return Json(ro);
        }
       
        public IActionResult Del(long id)
        {
            var ro = systemUserBusiness.Delete(id);
            return Json(ro);
        }

        public IActionResult SaveRoles(long employeeId, List<long> roleIds)
        {
            var ro = _systemUserRoleBusincess.SaveRoles(employeeId, roleIds);
            return Json(ro);
        }

        public IActionResult EditRole(long employeeId)
        {
            ViewBag.employeeId = employeeId;
            var roleIds = _systemUserRoleBusincess.GetRoleIds(employeeId);
            ViewBag.roleIds = roleIds;
            var roleList = _systemRoleBusiness.SelectAll("");
            ViewBag.roleList = roleList;
            return View();
        }
    }
}