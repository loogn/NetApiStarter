using System.ComponentModel.DataAnnotations;

namespace project.backsite.Models
{
    public class LoginRequest
    {
        [Required(ErrorMessage = "用户名不能为空")]
        public string Username { get; set; }
        [Required(ErrorMessage = "密码不能为空")]
        public string Password { get; set; }

    }
}
