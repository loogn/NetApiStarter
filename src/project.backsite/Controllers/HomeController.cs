using Microsoft.AspNetCore.Mvc;

namespace project.backsite.Controllers
{
    public class HomeController : MvcController
    {
        public IActionResult Index()
        {
            
            return View();
        }
        public IActionResult welcome()
        {
            return View();
        }
    }
}
