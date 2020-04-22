using System;
using CoreHelper;
using CoreHelper.Ioc;
using System.Collections.Generic;
using System.Linq;
using project.dao;
using project.dao.Models;

namespace project.backsite.Services
{
    [AppService]
    public class SystemRole_ResService
    {
        [Autowired] SystemRole_ResDao systemRole_ResDao;

        public SystemRole_ResService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public List<SystemRole_Res> SelectByRole(long roleId)
        {
            return systemRole_ResDao.SelectWhere("SystemRoleId", roleId);
        }

        public ResultObject SaveRes(long roleId, Dictionary<string, string> res)
        {
            systemRole_ResDao.DeleteWhere("SystemRoleId", roleId);
            var list = new List<SystemRole_Res>();
            HashSet<long> ids = new HashSet<long>();
            foreach (var kv in res)
            {
                //res_6-7  = 列表,添加,删除
                var keys = StringHelper.Split<long>(kv.Key.Replace("res_", ""), long.Parse, '-').ToArray();
                for (int i = 0; i < keys.Length; i++)
                {
                    var resid = keys[i];
                    if (ids.Contains(resid)) continue;
                    ids.Add(resid);
                    var item = new SystemRole_Res
                    {
                        SystemRoleId = roleId,
                        SystemResId = keys[i],
                        Operations = string.Empty
                    };
                    //最后一个
                    if (i == keys.Length - 1)
                    {
                        item.Operations = kv.Value;
                    }

                    list.Add(item);
                }
            }

            var r = systemRole_ResDao.BatchInsert(list);
            return new ResultObject(r);
        }
    }
}