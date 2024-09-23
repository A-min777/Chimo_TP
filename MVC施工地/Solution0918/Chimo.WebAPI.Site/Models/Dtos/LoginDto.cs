using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class LoginDto
    {
        public string Account { get; set; }
        public string Password { get; set; }

        public int Status { get; set; }

    }
}