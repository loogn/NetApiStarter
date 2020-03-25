using CoreHelper.Ioc;
using Microsoft.AspNetCore.Mvc;
using project.backsite.Services;

namespace project.backsite.Controllers
{
    public class RegionController : Controller
    {
        [Autowired] private RegionService regionService;

        public RegionController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        // GET
        public IActionResult GetProvince()
        {
            var list = regionService.GetProvince();
            return Json(list);
        }

        public IActionResult GetCity(int provinceCode)
        {
            var list = regionService.GetCity(provinceCode);
            return Json(list);
        }

        public IActionResult GetCounty(int cityCode)
        {
            var list = regionService.GetCounty(cityCode);
            return Json(list);
        }
    }
}