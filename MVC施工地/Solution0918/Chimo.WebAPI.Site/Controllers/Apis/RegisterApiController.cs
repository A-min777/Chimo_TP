using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    public class RegisterApiController : ApiController
    {
        private readonly RegisterService _registerService;
        public RegisterApiController()
        {
            _registerService = new RegisterService();

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
        public IHttpActionResult UpdateMember(int userId, [FromBody] RegisterDto dto)
        {
            if (dto == null)
            {
                return BadRequest("無效的請求");
            }

            var result = _registerService.UpdateMember(userId, dto);

            if (result)
            {
                return Ok("更新成功");
            }
            return NotFound();
        }
    }
    }

