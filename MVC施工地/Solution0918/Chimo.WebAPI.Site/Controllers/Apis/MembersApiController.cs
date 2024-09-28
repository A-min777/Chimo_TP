using Chimo.WebAPI.Site.Models.Dtos;
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


    }
}
