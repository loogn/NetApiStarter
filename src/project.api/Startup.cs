using System.IO;
using System.Text;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc.Infrastructure;
using Microsoft.AspNetCore.StaticFiles;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.FileProviders;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using project.api.Filters;
using project.api.Services;
using project.dao;
using Swashbuckle.AspNetCore.SwaggerUI;

namespace project.api
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
            var jwtSection = Configuration.GetSection("Jwt");

            services.AddAuthentication(options => { options.RequireAuthenticatedSignIn = false; })
                .AddJwtBearer(JwtBearerDefaults.AuthenticationScheme, options =>
                {
                    options.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = true,
                        ValidateAudience = true,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        ValidAudience = jwtSection["Audience"],
                        ValidIssuer = jwtSection["Issuer"],
                        IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSection["SigningKey"]))
                    };
                });


            services.AddCors(options =>
            {
                options.AddPolicy("any", builder =>
                {
                    builder.SetIsOriginAllowed(_=>true)
                        .AllowCredentials()
                        .AllowAnyMethod()
                        .AllowAnyHeader();
                });
            });


            services.AddAppServices(Configuration);

            services.AddControllersWithViews(options =>
            {
                options.Filters.Add<MyActionFilterAttribute>();
                options.Filters.Add<MyExceptionFilterAttribute>();
            }).AddNewtonsoftJson();
            services.AddSwagger();

            services.Configure<AppSettings>(Configuration);
            //services.AddHttpContextAccessor();
            services.AddSingleton<IActionContextAccessor, ActionContextAccessor>();

            services.AddSingleton<LogRequestBodyMiddleware>();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env, AppSettings settings,ConnectionStringsSection conn)
        {
            UploadChunkWriter.Instance.Start();
            ConnectionStringsSection.Instance = conn;

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
                app.UseSwagger();
                app.UseSwaggerUI(options =>
                {
                    options.SwaggerEndpoint("/swagger/v1/swagger.json", "My API V1");
                    options.DocExpansion(DocExpansion.None);
                });
            }
            else
            {
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                //app.UseHsts();
            }
            //app.UseHttpsRedirection();

            app.UseStaticFiles();


            var fileExtProvider = new FileExtensionContentTypeProvider();
            //fileExtProvider.Mappings[".htm3"] = "text/html";
            var uploadFullPath = Path.GetFullPath(settings.Upload.UploadPath);
            app.UseStaticFiles(new StaticFileOptions
            {
                FileProvider = new PhysicalFileProvider(uploadFullPath),
                RequestPath = settings.Upload.RequestPath,
                ContentTypeProvider = fileExtProvider
            });

            app.UseRouting();

            app.UseCors("any");
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseLogRequestBody();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller=Home}/{action=Index}/{id?}");
            });
        }
    }
}