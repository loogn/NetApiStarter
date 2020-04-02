using System;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Authorization.Infrastructure;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Routing;
using project.backsite.Services;

namespace project.backsite.Auth
{
    
    public class ResAuthorizationHandler : AuthorizationHandler<OperationAuthorizationRequirement, ResItemAttribute>
    {
        [Autowired] private SystemResService _systemResService;
        [Autowired] private IHttpContextAccessor _httpContextAccessor;

        public ResAuthorizationHandler(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
            OperationAuthorizationRequirement requirement,
            ResItemAttribute resource)
        {
            if (!context.User.Identity.IsAuthenticated)
                return Task.CompletedTask;

            var path = resource.Page;
            if (string.IsNullOrEmpty(path))
            {
                path = _httpContextAccessor.HttpContext.Request.Path;
            }

            var resList = _systemResService.GetEmployeeResource(context.User.GetUserId());
            var res = resList.FirstOrDefault(x =>
                x.Url.Equals(path, StringComparison.OrdinalIgnoreCase));
            if (res != null && res.HadOperations.Contains(resource.Operation))
            {
                context.Succeed(requirement);
            }

            return Task.CompletedTask;
        }
    }
}