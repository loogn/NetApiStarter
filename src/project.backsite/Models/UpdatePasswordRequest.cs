using System.ComponentModel.DataAnnotations;

namespace project.backsite.Models
{
    public class UpdatePasswordRequest
    {
        [Required(ErrorMessage = "旧密码不能为空")]
        public string OldPassword { get; set; }

        [Required(ErrorMessage = "新密码不能为空")]
        public string NewPassword { get; set; }
        [Required(ErrorMessage = "确认密码不能为空")]
        [Compare( "NewPassword", ErrorMessage = "两次密码不正确")]
        public string RePassword { get; set; }

    }
}
