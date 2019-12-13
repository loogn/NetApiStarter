using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Claims;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;

namespace project.api.Controllers
{

    public class AccountController : MvcController
    {
        [AllowAnonymous, HttpGet]
        public IActionResult Login()
        {
            return View();
        }

        [AllowAnonymous, HttpPost]
        public async Task<IActionResult> Login(string userName, string password, string ReturnUrl)
        {
            if (userName == "admin" && password == "123456")
            {
                var claims = new List<Claim>
                {
                    new Claim("userid","1"),
                    new Claim("name", userName),
                };
                var claimsIdentity = new ClaimsIdentity(claims, CookieAuthenticationDefaults.AuthenticationScheme);
                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));

                if (string.IsNullOrEmpty(ReturnUrl))
                {
                    return RedirectToAction("index", "home");
                }
                else
                {
                    return Redirect(ReturnUrl);
                }
            }

            return View();
        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync(CookieAuthenticationDefaults.AuthenticationScheme);
            return RedirectToAction("login");
        }
    }

}