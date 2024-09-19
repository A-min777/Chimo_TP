using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class LoginVm
    {
        
        [Required(ErrorMessage ="{0}必填")]
        public string Account {  get; set; }

        [Required(ErrorMessage ="{0}必填")]
        public string Password { get; set; }

    }
}