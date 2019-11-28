using CoreHelper;
using CoreHelper.Ioc;
using project.dao;
using project.dao.DataModel;
using project.service.ApiModel;
using System;
using System.Collections.Generic;

namespace project.service
{
    [AppService]
    public class UserService
    {
        [Autowired] UserDao userDao;

        public UserService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        public User SingleById(long userId)
        {
            return userDao.SingleById(userId);
        }

        /// <summary>
        /// 登录，获取jwt
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public ResultObject<LoginResponse> Login(LoginRequest request)
        {
            var user = userDao.GetUser(request.Account, request.Password);
            if (user == null)
            {
                return new ResultObject<LoginResponse>("用户名或密码错误");
            }
            var dict = new Dictionary<string, string>();
            dict.Add("userid", user.Id.ToString());
            var jwt = JwtHelper.WriteToken(dict, DateTime.Now.AddDays(7));

            var response = new LoginResponse { Jwt = jwt };

            return new ResultObject<LoginResponse>(response);
        }

        /// <summary>
        /// 打招呼
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public ResultObject<HelloResponse> Hello(HelloRequest request)
        {
            var msg = $"Hello {request.ToUser}, I'm {request.GetUser().Account}.";
            var response = new HelloResponse() { Msg = msg };

            return new ResultObject<HelloResponse>(response);
        }
    }
}
