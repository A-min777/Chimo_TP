using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class RegisterDto
    {
        public string Name { get; set; }

        public string Email { get; set; }

        public string Password { get; set; }

        public string ProfileImage { get; set; }

        public string Intro {  get; set; }

        public string Phone { get; set; }

        public int? Gender { get; set; }
    }
}