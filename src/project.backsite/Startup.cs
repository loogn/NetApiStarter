using System;
using System.IO;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using project.backsite.Auth;
using project.backsite.Filters;
using project.dao;

namespace project.backsite
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews(options =>
            {
                options.Filters.Add<MyActionFilterAttribute>();
                options.Filters.Add<MyExceptionFilterAttribute>();
            });

            //添加认证和授权
            services.AddAuth();

            services.AddAppServices(Configuration);
            services.AddHttpClient();

            services.AddHttpContextAccessor();
            services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env,
            AppSettings settings, ConnectionStringsSection conn)
        {
            ConnectionStringsSection.Instance = conn;
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Home/Error");
            }

            app.UseStaticFiles();

            //上传路径
            var uploadFullPath = Path.GetFullPath(settings.Upload.UploadPath);
            app.UseStaticFiles(new StaticFileOptions
            {
                FileProvider = new PhysicalFileProvider(uploadFullPath),
                RequestPath = settings.Upload.RequestPath,
            });

            app.UseCookiePolicy();

            app.UseRouting();
            app.UseAuthentication(); //认证
            app.UseAuthorization(); //授权

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}");
            });
        }
    }
}