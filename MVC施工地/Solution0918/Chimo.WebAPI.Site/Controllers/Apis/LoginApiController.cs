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
            // 認證用戶
            if (!_memberService.Verify(dto))
            {
                return Unauthorized(); // 錯誤的用戶名或密碼
            }

            var member = _memberService.GetMemberByAccount(dto.Account);


            // 生成 JWT token
            var token = JwtUtility.GenerateToken(member); // 假設帳號就是用戶名
            return Ok(new { Token = token });
        }
    }
}
