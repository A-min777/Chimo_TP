using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Threading.Tasks;
using System.Web;
using System.Web.Http;

using System.Web.UI.WebControls;


namespace Chimo.WebAPI.Site.Controllers.Apis
{
    [JwtAuthorization]
    public class MembersApiController : ApiController
    {
        private readonly MemberService _memberService;


        public MembersApiController()
        {
            _memberService = new MemberService();

        }

        [HttpGet]
        [Route("api/profile/{id}")]
        public IHttpActionResult GetMemberProfile(int id)
        {
            try
            {
                var memberProfile = _memberService.GetMemberProfileById(id);
                if (memberProfile == null)
                {
                    return NotFound(); // 如果會員不存在，返回 404
                }
                return Ok(memberProfile); // 返回 200 和會員資料
            }
            catch (Exception ex)
            {
                return InternalServerError(ex); // 返回 500 錯誤訊息
            }
        }


        [HttpPut]
        [Route("api/profile/{id}")]
        public IHttpActionResult UpdateMemberProfile(int id, [FromBody] ProfileDto updatedProfile)
        {
            try
            {
                // 檢查傳入的資料是否有效
                if (!ModelState.IsValid)
                {
                    // 記錄錯誤訊息
                    foreach (var error in ModelState.Values.SelectMany(v => v.Errors))
                    {
                        Console.WriteLine(error.ErrorMessage);
                    }
                    return BadRequest(ModelState);
                }

                // 檢查資料是否存在
                if (updatedProfile == null || updatedProfile.Id != id)
                {
                    return BadRequest("Profile data is invalid.");
                }

                var result = _memberService.UpdateMemberProfile(updatedProfile);
                if (result == null)
                {
                    return NotFound(); // 如果會員不存在，返回 404
                }

                return Ok(result); // 返回 200 和更新後的會員資料
            }
            catch (Exception ex)
            {
                return InternalServerError(ex); // 返回 500 錯誤訊息
            }
        }


        [HttpGet]
        [Route("api/courses/{id:int}")]
        public IHttpActionResult GetMemberCourses(int id)
        {
            try
            {
                var memberCourses = _memberService.GetMemberCoursesById(id);
                if (memberCourses == null)
                {
                    return NotFound(); // 如果會員不存在，返回 404
                }
                return Ok(memberCourses); // 返回 200 和會員資料
            }
            catch (Exception ex)
            {
                return InternalServerError(ex); // 返回 500 錯誤訊息
            }
        }



        [HttpGet]
        [Route("api/collections/{id}")]
        public IHttpActionResult GetMemberCollections(int id)
        {
            try
            {
                var memberFavorite = _memberService.GetMemberCollectionsById(id);
                if (memberFavorite == null)
                {
                    return NotFound(); // 如果會員不存在，返回 404
                }
                return Ok(memberFavorite); // 返回 200 和會員資料
            }
            catch (Exception ex)
            {
                return InternalServerError(ex); // 返回 500 錯誤訊息
            }
        }


        [HttpGet]
        [Route("api/order/{id}")]
        public IHttpActionResult GetMemberOrder(int id)
        {
            try
            {
                var memberOrder = _memberService.GetMemberOrderById(id);
                if (memberOrder == null)
                {
                    return NotFound(); // 如果會員不存在，返回 404
                }
                return Ok(memberOrder); // 返回 200 和會員資料
            }
            catch (Exception ex)
            {
                return InternalServerError(ex); // 返回 500 錯誤訊息
            }
        }

        [HttpPost]
        [Route("api/updatePassword/{Id}")]
        public IHttpActionResult UpdatePassword(int Id, [FromBody] ResetPasswordDto dto)
        {
            try
            {
                var result = _memberService.UpdatePassword(Id, dto);
                if (result)
                {
                    return Ok("密碼更新成功");
                }
            }
            catch (ArgumentException ex)
            {
                // 捕捉服務層的錯誤，返回相應的錯誤訊息
                return BadRequest(ex.Message);
            }

            return BadRequest("密碼更新失敗");
        }

        [HttpPost]
        [Route("api/uploadProfileImage/{memberId}")]
        public IHttpActionResult UploadProfileImage(int memberId)
        {
            var httpRequest = HttpContext.Current.Request;
            if (httpRequest.Files.Count > 0)
            {
                var file = httpRequest.Files[0];

                try
                {
                    var result = _memberService.UpdateProfileImage(memberId, file);
                    // 回傳 Token 和新的 ProfileImage 路徑
                    return Ok(new
                    {
                        token = result.Token,
                        profileImage = result.ProfileImage
                    });
                }
                catch (ArgumentException ex)
                {
                    return BadRequest(ex.Message); // 返回錯誤訊息
                }
            }
            return BadRequest("未上傳檔案。");
        }


        [HttpPost]
        [Route("api/TopUp/{memberId}")]
        public IHttpActionResult TopUp(int memberId, [FromBody] PointHistoryDto dto)
        {
            try
            {
                // 呼叫 TopUp Service 處理儲值邏輯，並取得儲值結果與新 token
                var result = _memberService.TopUp(memberId, dto);

                if (!result.isSuccess)
                {
                    return BadRequest("儲值失敗。");
                }

                // 成功的情況下，回傳新的 token
                return Ok(new
                {
                    message = "儲值成功",
                    TotalPoint = dto.Point,
                    token = result.token
                });
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message); // 返回錯誤訊息
            }
          
        }


		[HttpGet]
		[Route("api/getMemberPoint/{memberId}")]
		public IHttpActionResult GetMemberPoint(int memberId)
		{
			try
			{
				int memberPoint = _memberService.GetMemberPoint(memberId);
				
				return Ok(new { memberPoint}); 
			}
			catch (Exception ex)
			{
				return InternalServerError(ex); 
			}
		}


	}
}




