using System;

namespace project.backsite.Auth
{
    public class ResItemAttribute : Attribute
    {
        public ResItemAttribute(string path)
        {
            Path = path;
        }

        public string Path { get; set; }
    }
}