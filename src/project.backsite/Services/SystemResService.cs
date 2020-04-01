using CoreHelper;
using CoreHelper.Ioc;
using CoreHelper.Mapper;
using Loogn.OrmLite;
using Microsoft.AspNetCore.Http;
using project.backsite.Models;
using System.Collections.Generic;
using System.Linq;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class SystemResService
    {
        [Autowired] private SystemResDao systemResDao;
        [Autowired] private SystemUserDao systemUserDao;
        [Autowired] private SystemRole_ResDao systemRole_ResDao;
        [Autowired] private SystemUser_ResDao systemUser_ResDao;
        [Autowired] private IHttpContextAccessor httpContextAccessor;

        public SystemResService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public SystemRes SingleById(long id)
        {
            return systemResDao.SingleById(id);
        }

        //parent

        /// <summary>
        /// 获取父级列表
        /// </summary>
        /// <param name="id"></param>
        /// <param name="withSelf"></param>
        /// <returns></returns>
        public List<SystemRes> GetParentList(long id, bool withSelf)
        {
            var list = new List<SystemRes>();
            if (id == 0)
            {
                return list;
            }

            var self = systemResDao.SingleById(id);

            if (withSelf)
            {
                list.Add(self);
            }

            var cur = self;
            while (cur.ParentId != 0)
            {
                var par = systemResDao.SingleById(cur.ParentId);
                list.Add(par);
                cur = par;
            }

            list.Reverse();
            return list;
        }


        public List<SystemRes> ParentList()
        {
            return systemResDao.SelectWhere("ParentId", 0);
        }

        public List<TreeNode> SelectAllNodes()
        {
            var resList = systemResDao.SelectAll();
            var nodeList = GetNodes(resList, 0, 1);
            return nodeList;
        }

        private static List<TreeNode> GetNodes(List<SystemRes> list, long parentId, byte level)
        {
            var nodeList = new List<TreeNode>();
            foreach (var dept in list.Where(x => x.ParentId == parentId).OrderBy(x => x.OrderNum))
            {
                var node = new TreeNode
                {
                    id = dept.Id,
                    name = dept.Name,
                    level = level,
                    spread = level == 1,
                };
                if (list.Any(x => x.ParentId == node.id))
                {
                    var newLevel = (byte) (level + 1);
                    node.children = GetNodes(list, node.id, newLevel);
                }

                nodeList.Add(node);
            }

            return nodeList;
        }

        public ResultObject Edit(SystemRes m)
        {
            if (string.IsNullOrEmpty(m.Name))
            {
                return new ResultObject("名称不能为空");
            }

            if (m.Id > 0)
            {
                var flag = systemResDao.Update(m);
                return new ResultObject(flag);
            }
            else
            {
                var flag = systemResDao.Insert(m);
                return new ResultObject(flag);
            }
        }

        public List<SystemRes> GetEmployeeResource(long employeeId)
        {
            var list = httpContextAccessor.HttpContext.Items["User_Res"] as List<SystemRes>;
            if (list == null)
            {
                var resIds = systemUserDao.GetEmployeeResourceIds(employeeId);
                list = systemResDao.SelectByIds(resIds);
                httpContextAccessor.HttpContext.Items["User_Res"] = list;
            }

            return list;
        }

        public OrmLitePageResult<SystemRes> SelectList(string name, int pageIndex, int pageSize)
        {
            return systemResDao.SelectList(name, pageIndex, pageSize);
        }

        public List<SystemRes> SelectByParentId(long parentId)
        {
            return systemResDao.SelectWhere("ParentId", parentId, "OrderNum,Id");
        }

        public ResultObject DeleteRes(long resId)
        {
            var flag = systemResDao.DeleteById(resId);
            if (flag > 0)
            {
                systemUser_ResDao.DeleteByResId(resId);
                systemRole_ResDao.DeleteByResId(resId);
            }

            return new ResultObject(flag);
        }
    }
}