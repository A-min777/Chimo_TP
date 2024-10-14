using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class ProfileDto
    {

        public string Email { get; set; }
        public int Id { get; set; } 

        public string Name { get; set; }

        public string Intro { get; set; }

        public string Phone { get; set; }

        public int Gender { get; set; } 

        public DateTime UpdatedDate {  get; set; }

        public int Point { get; set; }

        public string ProfileImage { get; set; }

        
    }
}