using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.AspNetCore.Mvc.Filters;
using project.backsite.Auth;

namespace project.backsite.Filters
{
    [AttributeUsage(AttributeTargets.Class | AttributeTargets.Method, AllowMultiple = false, Inherited = true)]
    public class MyActionFilterAttribute : ActionFilterAttribute
    {
        [Autowired] private IAuthorizationService _authorizationService;

        public MyActionFilterAttribute(AutowiredService autowiredService)
        {
            ValidParams = true;
            autowiredService.Autowired(this);
        }

        /// <summary>
        /// 是否验证参数有效性
        /// </summary>
        public bool ValidParams { get; set; }

        public override void OnActionExecuting(ActionExecutingContext context)
        {
            //由于Filters是套娃模式，使用以下逻辑保证作用域的覆盖 Action > Controller > Global
            if (context.Filters.OfType<MyActionFilterAttribute>().Last() != this)
            {
                return;
            }

            //资源授权验证
            if (context.ActionDescriptor is ControllerActionDescriptor actionDescriptor)
            {
                var resItem = actionDescriptor.MethodInfo.GetCustomAttribute<ResItemAttribute>();
                if (resItem != null)
                {
                    var authorizationResult = _authorizationService.AuthorizeAsync(context.HttpContext.User,
                        resItem,
                        new OperationAuthorizationRequirement()
                        {
                            Name = resItem.Operation
                        }).Result;
                    if (!authorizationResult.Succeeded)
                    {
                        if (context.HttpContext.User.Identity.IsAuthenticated)
                        {
                            context.Result = new ForbidResult();
                        }
                        else
                        {
                            context.Result = new ChallengeResult();
                        }
                        return;
                    }
                }
            }

            //默认只有一个参数
            var firstParam = context.ActionArguments.FirstOrDefault().Value;
            if (firstParam != null && firstParam.GetType().IsClass)
            {
                //验证参数合法性
                if (ValidParams)
                {
                    var validationResults = new List<ValidationResult>();
                    var validationFlag = Validator.TryValidateObject(firstParam, new ValidationContext(firstParam),
                        validationResults, false);

                    if (!validationFlag)
                    {
                        var ro = new ResultObject(validationResults.First().ErrorMessage);
                        context.Result = new JsonResult(ro);
                        return;
                    }
                }
            }

            //var requestParams = firstParam as LoginedUserRequest;
            //if (requestParams != null)
            //{
            //    requestParams.SetPrincipal(context.HttpContext.User);
            //}

            base.OnActionExecuting(context);
        }
    }
}