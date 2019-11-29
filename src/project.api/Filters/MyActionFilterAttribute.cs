
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;
using project.service;
using project.service.ApiModel;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Threading.Tasks;

namespace project.api.Filters
{
    [AppService]
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class MyActionFilterAttribute : ActionFilterAttribute
    {
        /// <summary>
        /// 是否验证参数有效性
        /// </summary>
        public bool ValidParams { get; set; } = true;

        public override void OnActionExecuting(ActionExecutingContext context)
        {

            //由于Filters是套娃模式，使用以下逻辑保证作用域的覆盖 Action > Controller > Global
            if (context.Filters.OfType<MyActionFilterAttribute>().Last() != this)
            {
                return;
            }

            //默认只有一个参数
            var firstParam = context.ActionArguments.FirstOrDefault().Value;
            if (firstParam != null && firstParam.GetType().IsClass)
            {
                //验证参数合法性
                if (ValidParams)
                {
                    var validationResults = new List<ValidationResult>();
                    var validationFlag = Validator.TryValidateObject(firstParam, new ValidationContext(firstParam), validationResults, false);

                    if (!validationFlag)
                    {
                        var ro = new ResultObject(validationResults.First().ErrorMessage);
                        context.Result = new JsonResult(ro);
                        return;
                    }
                }
            }

            var requestParams = firstParam as LoginedRequest;
            if (requestParams != null)
            {
                //设置jwt用户
                requestParams.SetPrincipal(context.HttpContext.User);
                var userid = requestParams.GetClaimValue("userid");
                //如果有必要，可以每次都获取数据库中的用户
                if (!string.IsNullOrEmpty(userid))
                {
                    var user = ((UserService)context.HttpContext.RequestServices.GetService(typeof(UserService))).SingleById(long.Parse(userid));
                    requestParams.SetUser(user);
                }
            }

            base.OnActionExecuting(context);
        }
    }
}
