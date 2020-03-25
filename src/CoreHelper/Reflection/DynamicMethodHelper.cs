using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Reflection;

namespace CoreHelper.Reflection
{
    public static class DynamicMethodHelper
    {
        /// <summary>
        /// 实例化对象 用EMIT
        /// </summary>
        /// <typeparam name="T"></typeparam>
        /// <param name="constructor"></param>
        /// <returns></returns>
        public static Func<object> BuildConstructorInvoker(ConstructorInfo constructor)
        {
            return Expression.Lambda<Func<object>>(Expression.Convert(Expression.New(constructor), typeof(object))).Compile();
        }

        /// <summary>
        /// 获取类型构造函数的委托，如果类型没有默认构造，会抛出异常
        /// </summary>
        /// <param name="type"></param>
        /// <returns></returns>
        public static Func<object> BuildConstructorInvoker(Type type)
        {
            var constructor = type.GetConstructor(Type.EmptyTypes);
            if (constructor != null)
            {
                return BuildConstructorInvoker(constructor);
            }
            else
            {
                return () =>
                {
                    throw new Exception(type.FullName + " 类型没有无参构造");
                };
            }
        }

        /// <summary>
        /// 获取属性Get访问器委托
        /// </summary>
        /// <param name="methodInfo"></param>
        /// <returns></returns>
        public static Func<object, object> BuildGetterInvoker(MethodInfo methodInfo)
        {
            if (methodInfo == null) return (obj) => { return null; };
            var instanceParameter = Expression.Parameter(typeof(object), "instance");
            var instanceExpr = methodInfo.IsStatic ? null : Expression.Convert(instanceParameter, methodInfo.ReflectedType);
            var callExpr = Expression.Call(instanceExpr, methodInfo, null);
            UnaryExpression castCallExpr = Expression.Convert(callExpr, typeof(object));
            var fun = Expression.Lambda<Func<object, object>>(castCallExpr, instanceParameter).Compile();
            return fun;
        }

        /// <summary>
        ///  获取属性Set访问器委托
        /// </summary>
        /// <param name="methodInfo"></param>
        /// <returns></returns>
        public static Action<object, object> BuildSetterInvoker(MethodInfo methodInfo)
        {
            if (methodInfo == null) return (obj, value) => { };

            var instanceParameter = Expression.Parameter(typeof(object), "instance");
            var parametersParameter = Expression.Parameter(typeof(object), "value");
            var instanceExpr = methodInfo.IsStatic ? null : Expression.Convert(instanceParameter, methodInfo.ReflectedType);
            var paramInfo = methodInfo.GetParameters().First();
            var arrCase = Expression.Convert(parametersParameter, paramInfo.ParameterType);
            var callExpr = Expression.Call(instanceExpr, methodInfo, arrCase);
            var action = Expression.Lambda<Action<object, object>>(callExpr,
                instanceParameter, parametersParameter).Compile();
            return action;
        }

        /// <summary>
        /// 生成字段的get委托
        /// </summary>
        /// <param name="fieldInfo"></param>
        /// <returns></returns>
        public static Func<object, object> BuildFieldGetter(FieldInfo fieldInfo)
        {
            if (fieldInfo == null) return (obj) => { return null; };
            var instanceParameter = Expression.Parameter(typeof(object), "instance");
            var instanceExpr = fieldInfo.IsStatic ? null : Expression.Convert(instanceParameter, fieldInfo.ReflectedType);
            var fieldExp = Expression.Field(instanceExpr, fieldInfo);
            var castFieldExp = Expression.Convert(fieldExp, typeof(object));
            var fun = Expression.Lambda<Func<object, object>>(castFieldExp, instanceParameter).Compile();
            return fun;
        }

        /// <summary>
        /// 获取字段的set委托
        /// </summary>
        /// <param name="fieldInfo"></param>
        /// <returns></returns>
        public static Action<object, object> BuildFieldSetter(FieldInfo fieldInfo)
        {
            if (fieldInfo == null) return (obj, value) => { };

            var instanceParameter = Expression.Parameter(typeof(object), "instance");
            var parametersParameter = Expression.Parameter(typeof(object), "value");
            var instanceExpr = fieldInfo.IsStatic ? null : Expression.Convert(instanceParameter, fieldInfo.ReflectedType);
            var fieldExp = Expression.Field(instanceExpr, fieldInfo);
            var parameterExp = Expression.Convert(parametersParameter, fieldInfo.FieldType);
            var assigExpr = Expression.Assign(fieldExp, parameterExp);
            var action = Expression.Lambda<Action<object, object>>(assigExpr,
                instanceParameter, parametersParameter).Compile();
            return action;
        }

        public static Func<object, object[], object> GetExecuteDelegate(MethodInfo methodInfo)
        {
            // parameters to execute
            ParameterExpression instanceParameter =
                Expression.Parameter(typeof(object), "instance");
            ParameterExpression parametersParameter =
                Expression.Parameter(typeof(object[]), "parameters");

            // build parameter list
            List<Expression> parameterExpressions = new List<Expression>();
            ParameterInfo[] paramInfos = methodInfo.GetParameters();
            for (int i = 0; i < paramInfos.Length; i++)
            {
                // (Ti)parameters[i]
                BinaryExpression valueObj = Expression.ArrayIndex(
                    parametersParameter, Expression.Constant(i));
                UnaryExpression valueCast = Expression.Convert(
                    valueObj, paramInfos[i].ParameterType);

                parameterExpressions.Add(valueCast);
            }

            // non-instance for static method, or ((TInstance)instance)
            Expression instanceCast = methodInfo.IsStatic ? null :
                Expression.Convert(instanceParameter, methodInfo.ReflectedType);

            // static invoke or ((TInstance)instance).Method
            MethodCallExpression methodCall = Expression.Call(
                instanceCast, methodInfo, parameterExpressions);

            // ((TInstance)instance).Method((T0)parameters[0], (T1)parameters[1], ...)
            if (methodCall.Type == typeof(void))
            {
                Expression<Action<object, object[]>> lambda =
                    Expression.Lambda<Action<object, object[]>>(
                        methodCall, instanceParameter, parametersParameter);

                Action<object, object[]> execute = lambda.Compile();
                return (instance, parameters) =>
                {
                    execute(instance, parameters);
                    return null;
                };
            }
            else
            {
                UnaryExpression castMethodCall = Expression.Convert(
                    methodCall, typeof(object));
                Expression<Func<object, object[], object>> lambda =
                    Expression.Lambda<Func<object, object[], object>>(
                        castMethodCall, instanceParameter, parametersParameter);

                return lambda.Compile();
            }
        }
    }
}
