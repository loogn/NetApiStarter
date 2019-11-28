using System;
using System.Collections.Generic;
using System.Text;

namespace project.dao.DataModel
{
    public class User
    {
        public long Id { get; set; }
        public string Account { get; set; }
        public string Password { get; set; }
    }
}
