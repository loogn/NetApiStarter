using System;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace project.backsite.Auth
{
    public static class AuthExtendMethods
    {
        public static IServiceCollection AddAuth(this IServiceCollection services, bool enableAuthorization = false)
        {
            //认证
            services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
                .AddCookie(cookieOptions =>
                {
                    cookieOptions.LoginPath = new PathString("/account/login");
                    cookieOptions.LogoutPath = new PathString("/account/logout");
                    cookieOptions.SlidingExpiration = true;
                    cookieOptions.ExpireTimeSpan = TimeSpan.FromHours(1);
                });
            //授权
            if (enableAuthorization)
            {
                services.AddSingleton<IAuthorizationHandler, ResAuthorizationHandler>();
                services.AddAuthorization(options =>
                {
                    options.AddPolicy("res", policy => { policy.Requirements.Add(new ResOperationRequirement()); });
                });
            }

            return services;
        }
    }
}