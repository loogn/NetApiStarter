using System;
using CoreHelper.AppEvent;

namespace Microsoft.Extensions.DependencyInjection
{
    public static class AppEventExtensions
    {
        /// <summary>
        /// 注册应用程序域中所有有AppService特性的类
        /// </summary>
        /// <param name="services"></param>
        public static void AddAppEvents(this IServiceCollection services)
        {
            AppEventService appEventService = new AppEventService();
            appEventService.ScanEventHandler(services);
            services.AddSingleton(appEventService);
        }
    }
}