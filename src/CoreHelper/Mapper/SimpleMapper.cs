using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Collections.Concurrent;
using CoreHelper.Reflection;
using System.Collections;

namespace CoreHelper.Mapper
{

    /// <summary>
    /// 简单对象映射类，根据公开相同属性或字段名称复制
    /// </summary>
    public static class SimpleMapper
    {

        /// <summary>
        /// 映射对象，可以是嵌套类，数组，IList<>，IDictionary<,>
        /// </summary>
        /// <typeparam name="TOutType">目标类型</typeparam>
        /// <param name="input">输入对象</param>
        /// <returns></returns>
        public static TOutType Map<TOutType>(object input)
        {
            var targetType = typeof(TOutType);
            return (TOutType)Map(targetType, input);
        }

        /// <summary>
        /// 映射对象，可以是嵌套类，数组，IList<>，IDictionary<,>
        /// </summary>
        /// <param name="targetType">目标类型</param>
        /// <param name="input">输入对象</param>
        /// <returns></returns>
        public static object Map(Type targetType, object input)
        {
            if (input == null) return default;
            var inputType = input.GetType();
            if (targetType.IsPrimitive || targetType == typeof(decimal))
            {
                return Convert.ChangeType(input, targetType);
            }
            if (targetType == typeof(string))
            {
                return input.ToString();
            }
            if (targetType == typeof(DateTime))
            {
                if (inputType == typeof(DateTime))
                {
                    return input;
                }
                if (inputType == typeof(string))
                {
                    return DateTime.Parse(input.ToString());
                }
                return default;
            }
            if (targetType.IsArray)
            {
                var inputarr = (IList)input;
                var eleType = targetType.GetElementType();
                var arr = Array.CreateInstance(eleType, inputarr.Count);
                for (int i = 0; i < inputarr.Count; i++)
                {
                    arr.SetValue(Map(eleType, inputarr[i]), i);
                }
                return arr;
            }

            if (typeof(IList).IsAssignableFrom(targetType))
            {
                var inputarr = (IList)input;
                var eleType = targetType.GetGenericArguments()[0];
                var type = typeof(List<>);
                var t = type.MakeGenericType(eleType);
                var list = (IList)ObjectAccessorManager.GetAccessor(t).NewObject();

                for (int i = 0; i < inputarr.Count; i++)
                {
                    list.Add(Map(eleType, inputarr[i]));
                }
                return list;
            }
            if (typeof(IDictionary).IsAssignableFrom(targetType))
            {
                var dict = (IDictionary)input;
                var gTypes = targetType.GetGenericArguments();
                var keyType = gTypes[0];
                var valType = gTypes[1];
                var type = typeof(Dictionary<,>);
                var t = type.MakeGenericType(keyType, valType);
                var map = (IDictionary)ObjectAccessorManager.GetAccessor(t).NewObject();

                foreach (var key in dict.Keys)
                {
                    map.Add(Map(keyType, key), Map(valType, dict[key]));
                }
                return map;
            }

            if (targetType.IsClass)
            {
                var inputAccessor = ObjectAccessorManager.GetAccessor(input.GetType());
                var outputAccessor = ObjectAccessorManager.GetAccessor(targetType);

                var outputObject = outputAccessor.NewObject();
                foreach (var getInput in inputAccessor.PropertyOrFields)
                {
                    if (getInput.Value.Member.GetCustomAttributes(typeof(MapperIgnore), false).Length > 0)
                    {
                        continue;
                    }
                    if (outputAccessor.PropertyOrFields.TryGetValue(getInput.Key, out ObjectPropertyOrField mem))
                    {
                        if (mem.Member.GetCustomAttributes(typeof(MapperIgnore), false).Length > 0)
                        {
                            continue;
                        }
                        mem.Settor(outputObject, Map(mem.Type, getInput.Value.Gettor(input)));
                    }
                }
                return outputObject;
            }

            return default;
        }

    }
}
