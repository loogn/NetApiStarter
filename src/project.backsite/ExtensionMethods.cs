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

        public static long GetUserId(this ClaimsPrincipal user)
        {
         return long.Parse(user?.FindFirst("userid")?.Value ?? "0");
        }
    }
}
