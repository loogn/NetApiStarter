using CoreHelper.Ioc;
using CoreHelper.Reflection;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Concurrent;
using System.Diagnostics.CodeAnalysis;
using System.IO;
using System.Linq;
using System.Reflection;
using System.Threading.Tasks;

namespace CoreHelper.AppEvent
{
    /// <summary>
    /// 应用程序事件管理器
    /// </summary>
    public class AppEventService
    {
        private readonly ConcurrentDictionary<string, Func<object[], object>> _eventHandlerDict =
            new ConcurrentDictionary<string, Func<object[], object>>();

        private IServiceProvider _serviceProvider;


        /// <summary>
        /// 实例化AppEventService
        /// </summary>
        public AppEventService()
        {
        }

        public void SetServiceProvider(IServiceProvider serviceProvider)
        {
            _serviceProvider = serviceProvider;
        }

        /// <summary>
        /// 添加事件处理程序
        /// </summary>
        /// <param name="eventKey"></param>
        /// <param name="func"></param>
        public void AddHandler(string eventKey, Func<object[], object> func)
        {
            _eventHandlerDict.AddOrUpdate(eventKey, func, (key, oldFun) => { return oldFun += func; });
        }

        /// <summary>
        /// 触发事件
        /// </summary>
        /// <param name="eventKey"></param>
        /// <param name="ps"></param>
        /// <returns></returns>
        public Task Fire(string eventKey, params object[] ps)
        {
            return _eventHandlerDict.TryGetValue(eventKey, out var func)
                ? Task.Run(() => func(ps))
                : Task.CompletedTask;
        }

        /// <summary>
        /// 扫码程序集，注册事件处理程序
        /// </summary>
        /// <param name="assembly"></param>
        public void ScanEventHandler(Assembly assembly)
        {
            foreach (var type in assembly.GetTypes())
            {
                var methodInfos = type.GetMethods(BindingFlags.Static | BindingFlags.Instance | BindingFlags.Public |
                                                  BindingFlags.NonPublic ^ BindingFlags.GetProperty ^
                                                  BindingFlags.SetProperty);

                foreach (var methodInfo in methodInfos)
                {
                    var mehAttr = methodInfo.GetCustomAttribute<AppEventHandlerAttribute>();
                    if (mehAttr == null) continue;
                    var fun = DynamicMethodHelper.GetExecuteDelegate(methodInfo);

                    AddHandler(mehAttr.EventKey,
                        (args) => fun(methodInfo.IsStatic ? null : Activator.CreateInstance(type), args));
                }
            }
        }

        /// <summary>
        /// 扫描应用程序域中的程序集
        /// </summary>
        public void ScanEventHandler()
        {
            var files = Directory.GetFiles(AppContext.BaseDirectory, "*.dll");
            var assemblies = files.Select(x => Assembly.LoadFrom(x));
            foreach (var assembly in assemblies)
            {
                ScanEventHandler(assembly);
            }
        }

        /// <summary>
        /// 扫描容器中的服务，注册时间处理程序
        /// </summary>
        /// <param name="services"></param>
        public void ScanEventHandler(IServiceCollection services)
        {
            foreach (var service in services)
            {
                var methodInfos = service.ServiceType.GetMethods(
                    BindingFlags.Static | BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic ^
                    BindingFlags.GetProperty ^ BindingFlags.SetProperty);
                foreach (var methodInfo in methodInfos)
                {
                    var mehAttr = methodInfo.GetCustomAttribute<AppEventHandlerAttribute>();
                    if (mehAttr == null) continue;
                    var fun = DynamicMethodHelper.GetExecuteDelegate(methodInfo);

                    AddHandler(mehAttr.EventKey,
                        (args) => fun(methodInfo.IsStatic ? null : _serviceProvider.GetService(service.ServiceType),
                            args));
                }
            }
        }
    }
}