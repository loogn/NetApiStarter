using System.ComponentModel.DataAnnotations;

namespace project.api.Models
{
    public class LoginRequest
    {
        /// <summary>
        /// 账户
        /// </summary>
        [Required]
        public string Account { get; set; }
        /// <summary>
        /// 密码
        /// </summary>
        [Required]
        public string Password { get; set; }
    }
    public class LoginResponse
    {
        /// <summary>
        /// json web token
        /// </summary>
        public string Jwt { get; set; }
    }
}
