using Microsoft.AspNetCore.Razor.TagHelpers;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace project.backsite.TagHelpers
{
    public class BackTagHelper : TagHelper
    {
        public override void Process(TagHelperContext context, TagHelperOutput output)
        {
            output.TagName = "a";
            output.Attributes.SetAttribute("href", "javascript:history.back()");
            output.Attributes.SetAttribute("class", "mif-arrow-left");
            output.Attributes.SetAttribute("style", "font-size:32px;");

        }
    }
}
