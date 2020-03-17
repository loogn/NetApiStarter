﻿using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Reflection;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;

namespace CoreHelper.Ioc
{
    public static class AppServiceExtensions
    {
        /// <summary>
        /// 注册应用程序域中所有有AppService特性的类
        /// </summary>
        /// <param name="services"></param>
        public static void AddAppServices(this IServiceCollection services, IConfiguration configuration = null)
        {
            //AddServices(services, AppDomain.CurrentDomain.GetAssemblies()); GetAssemblies只能获取已加载的程序集，可能不全
            var files = Directory.GetFiles(AppContext.BaseDirectory, "*.dll");
            var assemblies = files.Select(x => Assembly.LoadFrom(x));
            AddAppServices(services, configuration, assemblies);
        }
        
        public static void AddAppServices(this IServiceCollection services, IConfiguration configuration,
            IEnumerable<Assembly> assemblies)
        {
            foreach (var assembly in assemblies)
            {
                foreach (var type in assembly.GetTypes())
                {
                    var optionAttribute = type.GetCustomAttribute<AppSettingAttribute>();
                    if (optionAttribute != null)
                    {
                        if (configuration == null)
                        {
                            throw new ArgumentNullException(nameof(configuration),"当使用AppOptionAttribute时，configuration不能为null");
                        }
                        var option = Activator.CreateInstance(type);

                        if (string.IsNullOrEmpty(optionAttribute.SectionKey))
                        {
                            configuration.Bind(option);
                        }
                        else
                        {
                            configuration.Bind(optionAttribute.SectionKey, option);
                        }

                        services.AddSingleton(type, option);
                    }
                    else
                    {
                        foreach (var serviceAttribute in type.GetCustomAttributes<AppServiceAttribute>())
                        {
                            if (serviceAttribute != null)
                            {
                                var serviceType = serviceAttribute.ServiceType;

                                //类型检查,如果 type 不是 serviceType 的实现或子类或本身
                                //运行时 type 将无法解析为 serviceType 的实例
                                if (serviceType != null && !serviceType.IsAssignableFrom(type))
                                {
                                    serviceType = null;
                                }

                                if (serviceType == null && serviceAttribute.InterfaceServiceType)
                                {
                                    serviceType = type.GetInterfaces().FirstOrDefault();
                                }

                                if (serviceType == null && serviceAttribute.BaseServiceType &&
                                    type.BaseType != typeof(object))
                                {
                                    serviceType = type.BaseType;
                                }

                                if (serviceType == null)
                                {
                                    serviceType = type;
                                }

                                switch (serviceAttribute.Lifetime)
                                {
                                    case ServiceLifetime.Singleton:
                                        services.AddSingleton(serviceType, type);
                                        break;
                                    case ServiceLifetime.Scoped:
                                        services.AddScoped(serviceType, type);
                                        break;
                                    case ServiceLifetime.Transient:
                                        services.AddTransient(serviceType, type);
                                        break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}