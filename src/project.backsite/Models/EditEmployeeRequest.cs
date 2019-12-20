using CoreHelper;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Text;

namespace project.backsite.Models
{
    public class EditEmployeeRequest
    {

        public long Id { get; set; }
        [Required(ErrorMessage = "用户名不能为空")]
        public string Username { get; set; }

        [Required(ErrorMessage = "密码不能为空")]
        public string Password { get; set; }

        [Required(ErrorMessage = "昵称不能为空")]
        public string Nickname { get; set; }

        public byte Gender { get; set; }


        public byte Status { get; set; }

    }
}
