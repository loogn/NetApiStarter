using System;
using System.Collections.Concurrent;
using System.Collections.Generic;
using System.Text;

namespace CoreHelper.Reflection
{
    public static class ObjectAccessorManager
    {
        static ConcurrentDictionary<Type, ObjectAccessor> Accessors = new ConcurrentDictionary<Type, ObjectAccessor>();

        public static ObjectAccessor GetAccessor(Type type, bool cache = true)
        {
            if (cache)
            {
                return Accessors.GetOrAdd(type, t => new ObjectAccessor(t));
            }
            else
            {
                return new ObjectAccessor(type);
            }
        }
    }
}
