using Loogn.OrmLite;
using PagedList.Core;
using System;
using System.Collections.Generic;
using System.Security.Claims;
using System.Text;

namespace project.backsite
{
    public static class ExtensionMethodss
    {
        public static StaticPagedList<TModel> ToStaticPagedList<TModel>(this OrmLitePageResult<TModel> pr)
        {
            return new StaticPagedList<TModel>(pr.List, pr.PageIndex, pr.PageSize, (int)pr.TotalCount);
        }

        public static long GetUserId(this ClaimsPrincipal claimsPrincipal)
        {
            var str = claimsPrincipal.FindFirstValue("userid");
            if (string.IsNullOrEmpty(str))
            {
                return 0;
            }
            else
            {
                return long.Parse(str);
            }
        }
    }
}
