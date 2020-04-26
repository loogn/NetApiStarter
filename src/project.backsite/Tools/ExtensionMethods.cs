using System.Security.Claims;
using Loogn.OrmLite;
using PagedList.Core;

namespace project.backsite
{
    public static class ExtensionMethodss
    {
        public static StaticPagedList<TModel> ToStaticPagedList<TModel>(this OrmLitePageResult<TModel> pr)
        {
            return new StaticPagedList<TModel>(pr.List, pr.PageIndex, pr.PageSize, (int) pr.TotalCount);
        }

        public static long GetUserId(this ClaimsPrincipal user)
        {
            return long.Parse(user?.FindFirst("userid")?.Value ?? "0");
        }

        public static string GetNickname(this ClaimsPrincipal user)
        {
            return user?.FindFirstValue("nickname") ?? "管理员";
        }
    }
}