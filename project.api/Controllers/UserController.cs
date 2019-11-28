using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using project.service;
using project.service.ApiModel;

namespace project.api.Controllers
{
    /// <summary>
    /// 用户相关服务
    /// </summary>
    public class UserController : ApiController
    {
        [Autowired] UserService userService;
        public UserController(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        /// <summary>
        /// 登录，获取jwt
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost, AllowAnonymous]
        public ResultObject<LoginResponse> Login([FromBody]LoginRequest request)
        {
            return userService.Login(request);
        }

        /// <summary>
        /// 打招呼
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        [HttpPost]
        public ResultObject<HelloResponse> Hello([FromBody]HelloRequest request)
        {
            return userService.Hello(request);
        }

    }
}