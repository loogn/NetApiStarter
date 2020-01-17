using CoreHelper;
using CoreHelper.Ioc;
using Microsoft.IdentityModel.Tokens;
using project.api.Models;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;

namespace project.api.Services
{
    [AppService]
    public class UserService
    {
        [Autowired]
        private AppSettings _appSettings;
        public UserService(AutowiredService autowiredService)
        {
            autowiredService.Autowired(this);
        }

        /// <summary>
        /// 登录，获取jwt
        /// </summary>
        /// <param name="request"></param>
        /// <returns></returns>
        public ResultObject<LoginResponse> Login(LoginRequest request)
        {
            //var user = userDao.GetUser(request.Account, request.Password);
            //if (user == null)
            //{
            //    return new ResultObject<LoginResponse>("用户名或密码错误");
            //}
            var dict = new Dictionary<string, string>();
            dict.Add("userid", "0");

            var key = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(_appSettings.Jwt.SigningKey));
            var creds = new SigningCredentials(key, SecurityAlgorithms.HmacSha256);

            var token = new JwtSecurityToken(
                issuer: _appSettings.Jwt.Issuer,
                audience: _appSettings.Jwt.Audience,
                claims: dict.Select(x => new Claim(x.Key, x.Value)),
                expires: DateTime.Now.AddDays(7),
                signingCredentials: creds);
            var jwt = new JwtSecurityTokenHandler().WriteToken(token);


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
            var msg = $"Hello {request.ToUser}, I'm {request.GetClaimValue("userid")}.";
            var response = new HelloResponse() { Msg = msg };

            return new ResultObject<HelloResponse>(response);
        }
    }
}
