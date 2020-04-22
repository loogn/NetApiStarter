using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using project.backsite.Services;

namespace project.backsite.TaskCaller
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