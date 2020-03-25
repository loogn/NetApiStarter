using System.Collections.Generic;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;

namespace project.backsite.Controllers
{
    public class SelectOptionsController : MvcController
    {
        private IActionResult Options(IEnumerable<SelectListItem> options)
        {
            string defText = Request.Query["defText"].ToString();
            string defValue = Request.Query["defValue"].ToString();
            if (string.IsNullOrEmpty(defText)) defText = "--请选择--";
            if (string.IsNullOrEmpty(defValue)) defValue = "";

            ViewBag.defText = defText;
            ViewBag.defValue = defValue;

            ViewBag.options = options;
            return PartialView("_SelectOptions");
        }
    }
}