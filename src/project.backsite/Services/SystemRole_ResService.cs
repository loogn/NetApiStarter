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
    public class SystemRole_ResService
    {
        [Autowired]
        SystemRole_ResDao systemRole_ResDao;
        public SystemRole_ResService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<long> GetResourseIds(long roleId)
        {
            return systemRole_ResDao.GetResourseIds(roleId);
        }

        public ResultObject Save(long roleId, List<long> resourceIds)
        {
            if (resourceIds == null) resourceIds = new List<long>();
            systemRole_ResDao.DeleteByRoleId(roleId);
            var list = resourceIds.Select(x => new SystemRole_Res
            {
                SystemRoleId = roleId,
                SystemResId = x,
            });
            var r = systemRole_ResDao.BatchInsert(list);
            return new ResultObject(r);
        }
    }
}
