using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq.Expressions;
using System.Reflection;

namespace CoreHelper.Reflection
{
  

    /// <summary>
    /// ObjectAccessor
    /// </summary>
    public class ObjectAccessor
    {
        public RuntimeTypeHandle TypeHandle { get; }

        public Type GetObjectType()
        {
            return Type.GetTypeFromHandle(TypeHandle);
        }

        public Func<object> NewObject { get; }
        public Dictionary<string, ObjectPropertyOrField> PropertyOrFields { get; set; }

        public ObjectAccessor(Type type)
        {
            TypeHandle = type.TypeHandle;

            //new
            var newExp = Expression.Convert(Expression.New(type), typeof(object));
            NewObject = Expression.Lambda<Func<object>>(newExp).Compile();

            if (typeof(IDictionary).IsAssignableFrom(type))
                return;
            if (typeof(IList).IsAssignableFrom(type))
                return;


            PropertyOrFields = new Dictionary<string, ObjectPropertyOrField>(StringComparer.OrdinalIgnoreCase);

            var fields = type.GetFields(BindingFlags.Instance | BindingFlags.Public);
            foreach (var field in fields)
            {
                ObjectPropertyOrField member = new ObjectPropertyOrField();
                member.Type = field.FieldType;
                member.Name = field.Name;
                member.Member = field;
                PropertyOrFields[field.Name] = member;

                var objParam = Expression.Parameter(typeof(object), "obj");
                var valParam = Expression.Parameter(typeof(object), "val");

                var obj = Expression.Convert(objParam, field.DeclaringType);

                var val = Expression.Convert(valParam, field.FieldType);

                var fieldExp = Expression.Field(obj, field);

                var setBody = Expression.Assign(fieldExp, val);

                var setAction = Expression.Lambda<Action<object, object>>(setBody, objParam, valParam).Compile();
                member.Settor = setAction;

                var getBody = Expression.Convert(fieldExp, typeof(object));
                var getFunc = Expression.Lambda<Func<object, object>>(getBody, objParam).Compile();
                member.Gettor = getFunc;

            }

            var props = type.GetProperties(BindingFlags.Instance | BindingFlags.Public);

            foreach (var prop in props)
            {
                ObjectPropertyOrField member = new ObjectPropertyOrField();
                member.Type = prop.PropertyType;
                member.Name = prop.Name;
                member.Member = prop;
                PropertyOrFields[prop.Name] = member;


                var objParam = Expression.Parameter(typeof(object), "obj");
                var valParam = Expression.Parameter(typeof(object), "val");

                var obj = Expression.Convert(objParam, prop.DeclaringType);

                var val = Expression.Convert(valParam, prop.PropertyType);

                var propExp = Expression.Property(obj, prop);

                var body = Expression.Assign(propExp, val);

                var setAction = Expression.Lambda<Action<object, object>>(body, objParam, valParam).Compile();
                member.Settor = setAction;

                var getBody = Expression.Convert(propExp, typeof(object));
                var getFunc = Expression.Lambda<Func<object, object>>(getBody, objParam).Compile();
                member.Gettor = getFunc;
            }
        }
    }

    public class ObjectPropertyOrField
    {
        public string Name { get; set; }
        public Type Type { get; set; }
        public MemberInfo Member;
        public Action<object, object> Settor { get; set; }
        public Func<object, object> Gettor { get; set; }
    }
}
