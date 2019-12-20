using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.Mvc.Routing;
using PagedList.Core.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.backsite
{
    public class MyPagerTagHelper : PagerTagHelper
    {
        static readonly PagedListRenderOptions defaultOptions = new PagedListRenderOptions
        {
            LinkToFirstPageFormat = "首页",
            LinkToLastPageFormat = "尾页",
            LinkToPreviousPageFormat = "上一页",
            LinkToNextPageFormat = "下一页",
            MaximumPageNumbersToDisplay = 5,
            Display = PagedListDisplayMode.IfNeeded,
            UlElementClasses = new string[] { "pagination", "no-gap", "primary" },
            LiElementClasses = new string[] { "page-item" },

        };

        public MyPagerTagHelper(IUrlHelperFactory urlHelperFactory, IActionContextAccessor actionContextAccesor) : base(urlHelperFactory)
        {
            this.AspController = actionContextAccesor.ActionContext.RouteData.Values["controller"].ToString();
            this.AspAction = actionContextAccesor.ActionContext.RouteData.Values["action"].ToString();
            this.Options = defaultOptions;

            foreach (var item in actionContextAccesor.ActionContext.HttpContext.Request.Query)
            {
                if (item.Key != "page")
                {
                    this.RouteValues.Add(item.Key, String.Join(',', item.Value));
                }
            }
        }
    }
}
