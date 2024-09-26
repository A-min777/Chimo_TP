using AutoMapper;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.UI.WebControls;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    public class LoginApiController : ApiController
    {   
        private readonly MemberService _memberService;


        public LoginApiController()
        {
            _memberService = new MemberService();

        }

        [HttpPost]
        [Route("api/login")]
        public IHttpActionResult Login([FromBody] LoginDto dto)
        {
            var (isSuccess, message, member) = _memberService.VerifyMember(dto);

            if (!isSuccess)
            {
                return BadRequest(message); // 簡單的錯誤訊息
            }

            // 驗證成功，生成 token
            var token = JwtUtility.GenerateToken(member);

            return Ok(new { token });
        }
    }
}
