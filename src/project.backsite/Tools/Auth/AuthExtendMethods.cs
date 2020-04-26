using System;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.DependencyInjection;

namespace project.backsite.Tools.Auth
{
    public static class AuthExtendMethods
    {
        public static IServiceCollection AddAuth(this IServiceCollection services)
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
            //资源授权，对应MyActionFilter中的逻辑
            services.AddSingleton<IAuthorizationHandler, ResAuthorizationHandler>();
            return services;
        }
    }
}