using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using System;
using System.IO;
using System.Threading.Tasks;

namespace project.api.Filters
{
    public class LogRequestBodyMiddleware : IMiddleware
    {
        private ILogger<LogRequestBodyMiddleware> logger;
        public LogRequestBodyMiddleware(ILoggerFactory loggerFactory)
        {
            logger = loggerFactory.CreateLogger<LogRequestBodyMiddleware>();
        }

        public async Task InvokeAsync(HttpContext context, RequestDelegate next)
        {
            if (logger.IsEnabled(LogLevel.Debug) && context.Request.Method.Equals("POST", StringComparison.OrdinalIgnoreCase))
            {
                context.Request.EnableBuffering();
                StreamReader sr = new StreamReader(context.Request.Body);
                var body = await sr.ReadToEndAsync();
                logger.LogDebug(context.Request.Path.Value + Environment.NewLine + "--请求体--" + Environment.NewLine + body);
                context.Request.Body.Position = 0;
            }
            await next(context);
        }
    }

    public static class LogRequestBodyMiddlewareExtends
    {
        public static IApplicationBuilder UseLogRequestBody(this IApplicationBuilder app)
        {
            return app.UseMiddleware<LogRequestBodyMiddleware>();
        }
    }
}
