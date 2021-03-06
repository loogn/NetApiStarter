﻿using System.Threading.Tasks;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.Extensions.Logging;

namespace project.api.Tools.Filters
{
    [AppService]
    public class MyExceptionFilterAttribute: ExceptionFilterAttribute
    {
        private ILogger<MyExceptionFilterAttribute> _logger;
        public MyExceptionFilterAttribute(ILogger<MyExceptionFilterAttribute> logger)
        {
            _logger = logger;
        }
        public override Task OnExceptionAsync(ExceptionContext context)
        {
            _logger.LogError(context.Exception, context.Exception.Message);
            return base.OnExceptionAsync(context);
        }
    }
}
