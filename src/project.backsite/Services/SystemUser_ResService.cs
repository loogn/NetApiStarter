using CoreHelper;
using CoreHelper.Ioc;
using System.Collections.Generic;
using System.Linq;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class SystemUser_ResService
    {
        [Autowired]
        SystemUser_ResDao systemUser_ResDao;
        public SystemUser_ResService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<long> GetResourseIds(long employeeId)
        {
            return systemUser_ResDao.GetResourseIds(employeeId);
        }

        public ResultObject Save(long employeeId, List<long> resourceIds)
        {
            if (resourceIds == null) resourceIds = new List<long>();
            systemUser_ResDao.DeleteByEmployeeId(employeeId);
            var list = resourceIds.Select(x => new SystemUser_Res
            {
                SystemUserId = employeeId,
                SystemResId = x
            });
            var r = systemUser_ResDao.BatchInsert(list);
            return new ResultObject(r);
        }
    }
}
