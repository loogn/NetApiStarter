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
 
    public class ResOperationRequirement : IAuthorizationRequirement
    {
    }
    public class ResAuthorizationHandler : AuthorizationHandler<ResOperationRequirement>
    {
        [Autowired] private SystemResService _systemResService;
        [Autowired] private IHttpContextAccessor _httpContextAccessor;

        public ResAuthorizationHandler(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        protected override Task HandleRequirementAsync(AuthorizationHandlerContext context,
            ResOperationRequirement requirement)
        {
            if (context.Resource is RouteEndpoint endpoint && context.User.Identity.IsAuthenticated)
            {
                var path = endpoint.Metadata.GetMetadata<ResItemAttribute>()?.Path ??
                           _httpContextAccessor.HttpContext.Request.Path;
                var resList = _systemResService.GetEmployeeResource(context.User.GetUserId());
                if (resList.Any(x =>
                    x.Url.Equals(path, StringComparison.OrdinalIgnoreCase)))
                {
                    context.Succeed(requirement);
                }
            }

            return Task.CompletedTask;
        }
    }

    
}