using System;
namespace CoreHelper.Mapper
{
    [AttributeUsage(AttributeTargets.Field | AttributeTargets.Property)]
    public class MapperIgnore : Attribute
    {
    }
}
