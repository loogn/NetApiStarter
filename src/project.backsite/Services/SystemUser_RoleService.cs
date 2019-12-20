using CoreHelper;
using CoreHelper.Ioc;
using project.dal;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace project.backsite.Services
{
    [AppService]
    public class SystemUser_RoleService
    {
        [Autowired]
        SystemUser_RoleDao systemUser_RoleDao;
        public SystemUser_RoleService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<long> GetEmployeeIds(long roleId)
        {
            return systemUser_RoleDao.GetEmployeeIds(roleId);
        }

        public List<long> GetRoleIds(long employeeId)
        {
            return systemUser_RoleDao.GetRoleIds(employeeId);
        }

        public ResultObject SaveRoles(long employeeId, List<long> roleIds)
        {
            systemUser_RoleDao.DeleteByUserId(employeeId);
            var list = roleIds.Select(x => new SystemUser_Role
            {
                SystemRoleId = x,
                SystemUserId = employeeId
            });
            var r = systemUser_RoleDao.BatchInsert(list);
            return new ResultObject(r);
        }

        /// <summary>
        /// 员工列表可能分页，所以使用Save方法行不通
        /// </summary>
        /// <param name="roleId"></param>
        /// <param name="addEmployeeIds"></param>
        /// <param name="removeEmployeeIds"></param>
        /// <returns></returns>
        public ResultObject Trim(long roleId, List<long> addEmployeeIds, List<long> removeEmployeeIds)
        {
            var nowSet = new HashSet<long>(GetEmployeeIds(roleId));
            if (addEmployeeIds != null)
                addEmployeeIds.ForEach(x => nowSet.Add(x));
            if (removeEmployeeIds != null)
                removeEmployeeIds.ForEach(x => nowSet.Remove(x));

            systemUser_RoleDao.DeleteByRoleId(roleId);
            var list = nowSet.Select(x => new SystemUser_Role
            {
                SystemRoleId = roleId,
                SystemUserId = x
            });
            var r = systemUser_RoleDao.BatchInsert(list);
            return new ResultObject(r);

        }

    }
}
