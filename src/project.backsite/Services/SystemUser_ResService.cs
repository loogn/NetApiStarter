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
    public class SystemUser_ResService
    {
        [Autowired]
        SystemUser_ResDao systemUser_ResDao;
        public SystemUser_ResService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }
        
        public List<SystemUser_Res> SelectByUser(long userId)
        {
            return systemUser_ResDao.SelectWhere("SystemUserId", userId);
        }

        public ResultObject SaveRes(long employeeId, Dictionary<string, string> res)
        {
            systemUser_ResDao.DeleteWhere("SystemUserId",employeeId);
            var list = new List<SystemUser_Res>();
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
                    var item = new SystemUser_Res
                    {
                        SystemUserId = employeeId,
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
            var r = systemUser_ResDao.BatchInsert(list);
            return new ResultObject(r);
        }
        

    }
}
