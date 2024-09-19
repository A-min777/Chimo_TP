using Chimo.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    public class LoginApiController : ApiController
    {
        [HttpPost]
        [Route("login")]
        public HttpResponseMessage Login(LoginVm vm)
        {
            //todo
        }

    }
}
