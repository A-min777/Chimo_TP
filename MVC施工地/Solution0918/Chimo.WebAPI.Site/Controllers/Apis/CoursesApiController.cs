using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;



namespace Chimo.WebAPI.Site.Controllers.Apis
{
	public class CoursesApiController : ApiController
	{
		private readonly CourseService _service;

		public CoursesApiController()
		{
			_service = new CourseService();
		}
	

		[HttpGet]
		[Route("api/courses/recommended")]
		public IHttpActionResult GetRecommendedCourses()
		{
			try
			{
				var courseList = _service.GetRecommendedCourses();

				return Ok(courseList);
			}
			
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}

		[HttpGet]
		[Route("api/courses/purchased/{memberId}")]
		public IHttpActionResult GetPurchasedCourses(int memberId)
		{
            try
            {
                var purchasedCourses = _service.GetPurchasedCourseById(memberId);
                
                return Ok(purchasedCourses);
            }

            catch (Exception ex)
            {
                return InternalServerError(ex);
            }

        }

		[HttpGet]
		[Route("api/products/productinfo/{id}")]
        public IHttpActionResult GetCourseInfo(int id)
        {
            var productInfo = _service.GetCourseInfoById(id);
            if (productInfo == null)
            {
                return NotFound();
            }

			return Ok(productInfo);
        }


        [HttpGet]
        [Route("api/products/course/{courseId}/chapter/{chapterId?}")]
        public IHttpActionResult GetMyCourseInfo(int courseId, int? chapterId = null)
        {
            var courseInfo = _service.GetMyCourseInfoById(courseId);

            if (courseInfo == null)
            {
                return NotFound();
            }

            if (chapterId.HasValue)
            {
                var chapter = _service.GetChapterById(courseId, chapterId.Value);

                if (chapter == null)
                {
                    return NotFound();
                }
                return Ok(new { courseInfo, chapter });
            }
            
			return Ok(courseInfo);
        }



        [HttpGet]
        [Route("api/search/course/{searchValue}")]
        public IHttpActionResult SearchCourses (string searchValue)
        {
            if (string.IsNullOrWhiteSpace(searchValue))
            {
                return BadRequest("搜尋條件不得為空。");
            }
            try
            {
                var courses = _service.SearchCourses(searchValue);
                if (courses == null || courses.Count == 0)
                {
                    return NotFound(); 
                }

                return Ok(courses); 
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message); 
            }
        
        
        }


        [HttpGet]
        [Route("api/course/category/{categoryId}")]
        public IHttpActionResult GetCoursesByCategory(int categoryId)
        {
            // 根據 categoryId 取得課程邏輯
            try
            {
                if (categoryId == 0)
                {
                    var allCourses = _service.GetAllCourses();
                    return Ok(allCourses);
                }
                var coursesByCategory = _service.GetCoursesByCategory(categoryId);
                return Ok(coursesByCategory);
            }
            catch (ArgumentException ex)
            {
                return BadRequest(ex.Message);
            }
        }

    }
}
