using Microsoft.Extensions.DependencyInjection;
using Microsoft.OpenApi.Any;
using Microsoft.OpenApi.Models;
using Swashbuckle.AspNetCore.SwaggerGen;
using System;
using System.Collections.Generic;
using System.IO;

namespace project.api
{
    public static class SwaggerServiceExtensions
    {
        public static IServiceCollection AddSwagger(this IServiceCollection services)
        {
            //https://github.com/domaindrivendev/Swashbuckle.AspNetCore#change-the-path-for-swagger-json-endpoints
            services.AddSwaggerGen(c =>
            {
                
                c.SwaggerDoc("v1", new OpenApiInfo
                {
                    Title = "My Api",
                    Version = "v1"
                });
                
                //Authorization的设置
                c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                {
                    In = ParameterLocation.Header,
                    Description = "请输入验证的jwt。示例：Bearer {jwt}",
                    Name = "Authorization",
                    Type = SecuritySchemeType.ApiKey,
                    Scheme = "Bearer",
                    BearerFormat = "JWT",
                });

                c.AddSecurityRequirement(new OpenApiSecurityRequirement
                {
                    {
                        new OpenApiSecurityScheme
                        {
                            Reference = new OpenApiReference
                            {
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            }
                        },
                        new List<string>()
                    }
                });
              

                c.IgnoreObsoleteActions();
                c.IgnoreObsoleteProperties();


                //c.DocumentFilter<SwaggerDocumentFilter>();

                //自定义类型映射
                c.MapType<byte>(() => new OpenApiSchema { Type = "byte", Example = new OpenApiByte(0) });
                c.MapType<long>(() => new OpenApiSchema { Type = "long", Example = new OpenApiLong(0L) });
                c.MapType<int>(() => new OpenApiSchema { Type = "integer", Example = new OpenApiInteger(0) });
                c.MapType<DateTime>(() => new OpenApiSchema { Type = "DateTime", Example = new OpenApiDateTime(DateTimeOffset.Now) });

                //xml注释
                foreach (var file in Directory.GetFiles(AppContext.BaseDirectory, "*.xml"))
                {
                    c.IncludeXmlComments(file);
                }


            });
            services.AddSwaggerGenNewtonsoftSupport();
            return services;
        }

        /// <summary>
        /// Swagger控制器描述文字
        /// </summary>
        class SwaggerDocumentFilter : IDocumentFilter
        {
            public void Apply(OpenApiDocument swaggerDoc, DocumentFilterContext context)
            {
                swaggerDoc.Tags = new List<OpenApiTag>
                {
                    new OpenApiTag{ Name="User", Description="用户相关"},
                    new OpenApiTag{ Name="Common", Description="公共功能"},
                };
            }
        }
    }
}
