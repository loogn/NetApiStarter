using Microsoft.Extensions.DependencyInjection;

namespace project.backsite.BgServices.TaskCaller
{
    public static class TaskCallerServiceCollectionExtensions
    {
        public static IServiceCollection AddTaskCaller(this IServiceCollection services)
        {
            //httpfactory
            services.AddHttpClient();

            //任务管理服务
            services.AddSingleton<DelayTaskManager>();
            services.AddSingleton<TimedTaskManager>();

            //托管服务
            services.AddHostedService<TaskCallerHostedService>();

            return services;
        }
    }
}