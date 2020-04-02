using System.Collections.Generic;
using System.Linq;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;
using project.dao.Models;

namespace project.backsite.Controllers
{
    public class SystemRoleController : MvcController
    {
        [Autowired] SystemRoleService systemRoleBusiness;
        [Autowired] SystemRole_ResService systemRole_ResBusiness;
        [Autowired] SystemUser_RoleService systemUser_RoleBusincess;
        [Autowired] private SystemResService _systemResService;

        public SystemRoleController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        // GET: Role
        public IActionResult List(string name)
        {
            var list = systemRoleBusiness.SelectAll(name);
            ViewBag.list = list;
            return View();
        }

        public IActionResult Edit(int id = 0)
        {
            var m = systemRoleBusiness.SingleById(id);
            if (m == null)
            {
                m = new SystemRole();
            }

            ViewBag.m = m;
            return View();
        }

        public IActionResult DoEdit(SystemRole m)
        {
            var ro = systemRoleBusiness.Edit(m);
            return Json(ro);
        }
        
        public IActionResult EditResource(int roleId)
        {
            var resList = _systemResService.SelectAll();
            var resRole = systemRole_ResBusiness.SelectByRole(roleId);
            foreach (var res in resList)
            {
                var operations = resRole.SingleOrDefault(x => x.SystemResId == res.Id)?.Operations ?? string.Empty;
                res.HadOperations = new HashSet<string>(StringHelper.Split(operations, ',', '，'));
            }

            ViewBag.resList = resList;
            return View();
        }

        public IActionResult SaveRes(int roleId)
        {
            Dictionary<string, string> res = new Dictionary<string, string>();
            foreach (var key in Request.Form.Keys)
            {
                if (key.StartsWith("res_"))
                {
                    res.Add(key, Request.Form[key].ToString());
                }
            }

            var ro = systemRole_ResBusiness.SaveRes(roleId, res);
            return Json(ro);
        }
        
        public IActionResult EditEmployee([FromServices] SystemUserService systemUserBusiness, int roleId,
            string nickname, int page = 1)
        {
            int pageSize = 10;
            var plist = systemUserBusiness.SelectPage(nickname, page, pageSize);
            ViewBag.pList = plist.ToStaticPagedList();


            var empIds = systemUser_RoleBusincess.GetEmployeeIds(roleId);
            ViewBag.empIdSet = new HashSet<long>(empIds);
            return View();
        }

        public IActionResult TrimEmployeeIds(long roleId, List<long> addEmployeeIds, List<long> removeEmployeeIds)
        {
            var ro = systemUser_RoleBusincess.Trim(roleId, addEmployeeIds, removeEmployeeIds);
            return Json(ro);
        }

        public IActionResult Del(long id)
        {
            var ro = systemRoleBusiness.DeleteRole(id);
            return Json(ro);
        }
    }
}