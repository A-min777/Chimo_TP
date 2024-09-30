using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using System.Web.Http.Results;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    public class RegisterApiController : ApiController
    {
        private readonly RegisterService _registerService;
        private readonly MemberService _memberService;
        public RegisterApiController()
        {
            _registerService = new RegisterService();
            _memberService = new MemberService();

        }
        [HttpPost]
        [Route("api/register")]
        public IHttpActionResult Register([FromBody] RegisterDto dto)
        {
            try
            {
                // 調用服務層的 CreateMember 方法
                var newMember = _registerService.CreateMember(dto);

                // 設置 TempData，以便在下一個請求中使用

                return Ok(new { userId = newMember.Id }); // 使用物件包裝 ID

            }

            catch (DbEntityValidationException ex)
            {
                var errors = ex.EntityValidationErrors.SelectMany(e => e.ValidationErrors)
                                .Select(e => e.ErrorMessage);
                return Content(HttpStatusCode.BadRequest, new { Message = "驗證錯誤", Errors = errors });
            }
            catch (Exception ex)
            {
                // 處理錯誤情況，例如重複電子郵件
                return BadRequest(ex.Message); // 返回 400 Bad Request
            }
        }



        [HttpPost]
        [Route("api/updateMember/{userId}")]
        public IHttpActionResult UpdateMember(int userId)
        {
            var httpRequest = HttpContext.Current.Request;

            // 檢查是否有檔案
            if (httpRequest.Files.Count > 0)
            {
                var file = httpRequest.Files[0];
                var avatar = _memberService.UpdateProfileImage(userId, file).ProfileImage;

                // 從請求中讀取其他參數
                string phone = httpRequest.Form["phone"];
                int gender = int.TryParse(httpRequest.Form["gender"], out int temp) ? temp : 0;
                string introduction = httpRequest.Form["introduction"];

                // 構建 RegisterDto
                var dto = new RegisterDto
                {
                    Phone = phone,
                    Gender = gender,
                    Intro = introduction 
                };

                var result = _registerService.UpdateMember(userId, dto, avatar);
                if (result)
                {
                    return Ok("更新成功");
                }
            }

            return Ok("沒有需要更新的資料");
        }

    }
}

