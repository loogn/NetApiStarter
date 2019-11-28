using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;
using Microsoft.Extensions.DependencyInjection;

namespace CoreHelper.Ioc
{
    /// <summary>
    /// 从容器装配service
    /// </summary>
    [AppService]
    public class AutowiredService
    {
        IServiceProvider serviceProvider;

        public AutowiredService(IServiceProvider serviceProvider)
        {
            this.serviceProvider = serviceProvider;
        }

        Dictionary<Type, Action<object, IServiceProvider>> autowiredActions =
            new Dictionary<Type, Action<object, IServiceProvider>>();

        public void Autowired(object service)
        {
            Autowired(service, serviceProvider);
        }

        /// <summary>
        /// 装配属性和字段
        /// </summary>
        /// <param name="service"></param>
        /// <param name="serviceProvider"></param>
        public void Autowired(object service, IServiceProvider serviceProvider)
        {
            var serviceType = service.GetType();
            if (autowiredActions.TryGetValue(serviceType, out Action<object, IServiceProvider> act))
            {
                act(service, serviceProvider);
            }
            else
            {
                /*
             （obj,sp）=>{
                    ((TService)obj).aa=(TAAType)sp.GetService(aaFieldType);
                    ((TService)obj).bb=(TBBType)sp.GetService(aaFieldType);
                    ...
                }
             */
                //参数
                var objParam = Expression.Parameter(typeof(object), "obj");
                var spParam = Expression.Parameter(typeof(IServiceProvider), "sp");

                var obj = Expression.Convert(objParam, serviceType);
                var GetService =
                    typeof(AutowiredService).GetMethod("GetService", BindingFlags.Static | BindingFlags.NonPublic);
                List<Expression> setList = new List<Expression>();

                //字段赋值
                foreach (FieldInfo field in serviceType.GetFields(
                    BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic))
                {
                    var autowiredAttr = field.GetCustomAttribute<AutowiredAttribute>();
                    if (autowiredAttr != null)
                    {
                        var fieldExp = Expression.Field(obj, field);
                        var createService = Expression.Call(null, GetService, spParam,
                            Expression.Constant(field.FieldType), Expression.Constant(autowiredAttr));
                        var setExp = Expression.Assign(fieldExp, Expression.Convert(createService, field.FieldType));
                        setList.Add(setExp);
                    }
                }

                //属性赋值
                foreach (PropertyInfo property in serviceType.GetProperties(
                    BindingFlags.Instance | BindingFlags.Public | BindingFlags.NonPublic))
                {
                    var autowiredAttr = property.GetCustomAttribute<AutowiredAttribute>();
                    if (autowiredAttr != null)
                    {
                        var propExp = Expression.Property(obj, property);
                        var createService = Expression.Call(null, GetService, spParam,
                            Expression.Constant(property.PropertyType), Expression.Constant(autowiredAttr));

                        var setExp = Expression.Assign(propExp,
                            Expression.Convert(createService, property.PropertyType));
                        setList.Add(setExp);
                    }
                }

                var bodyExp = Expression.Block(setList);
                var setAction = Expression.Lambda<Action<object, IServiceProvider>>(bodyExp, objParam, spParam)
                    .Compile();
                autowiredActions[serviceType] = setAction;
                setAction(service, serviceProvider);
            }
        }


        private static object GetService(IServiceProvider serviceProvider, Type serviceType,
            AutowiredAttribute autowiredAttribute)
        {
            var list = serviceProvider.GetServices(serviceType).ToList();
            if (list.Count == 0)
            {
                return null;
            }
            else if (list.Count == 1 && string.IsNullOrEmpty(autowiredAttribute.Identifier))
            {
                return list[0];
            }
            else
            {
                if (string.IsNullOrEmpty(autowiredAttribute.Identifier))
                {
                    return list.Last();
                }
                else
                {
                    foreach (var service in list)
                    {
                        if (service.GetType().GetCustomAttributes<AppServiceAttribute>(false)
                            .Any(attr => attr.Identifier == autowiredAttribute.Identifier))
                        {
                            return service;
                        }
                    }
                }
            }

            return null;
        }
    }
}