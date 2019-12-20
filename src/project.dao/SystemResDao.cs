using CoreHelper.Ioc;
using Loogn.OrmLite;
using project.model.entity;
using System;
using System.Collections.Generic;
using System.Text;

namespace project.dal
{
    [AppService]
    public class SystemResDao : CommonServiceBaseDao<SystemRes>
    {


        public OrmLitePageResult<SystemRes> SelectList(string name, int pageIndex, int pageSize)
        {
            name = SqlInjection.Filter(name);
            var condition = "";
            if (!string.IsNullOrEmpty(name))
            {
                condition = " Name LIKE '%" + name + "%'";
            }

            return SelectPage(new OrmLitePageFactor
            {
                Conditions = condition,
                OrderBy = "ID asc",
                PageIndex = pageIndex,
                PageSize = pageSize,
            });
        }

    }
}
