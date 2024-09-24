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
		[Route("api/courses/purchased")]
		public IHttpActionResult GetPurchasedCourses()
		{
			

			return Ok();
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
    }
}
