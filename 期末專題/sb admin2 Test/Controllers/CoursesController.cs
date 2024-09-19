using sb_admin2_Test.Models.Dtos;
using sb_admin2_Test.Models.EFmodels;
using sb_admin2_Test.Models.ViewModels;
using sb_admin2_Test.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static sb_admin2_Test.Services.CoursesService;
using static sb_admin2_Test.Services.MemberService;

namespace sb_admin2_Test.Controllers
{
    public class CoursesController : Controller
    {
		private  CoursesService _coursesService;
		public CoursesController()
		{
			_coursesService = new CoursesService(new AppDbContext());
		}
		public CoursesController(CoursesService coursesService)
		{
			_coursesService = coursesService;
		}

		public ActionResult GetAllcourses()
		{
			var courses = _coursesService.GetAllCourses(); // 從資料庫獲取所有會員資料
			return View(courses); // 將資料傳遞給view
		}

		[HttpPost]
		public ActionResult UpdateCourseStatus(List<StatusUpdateDto> coursesUpdates)
		{
			if (coursesUpdates == null || !coursesUpdates.Any())
			{
				return Json(new { success = false, message = "沒有任何資料可以更新。" });
			}

			try
			{
				_coursesService.UpdateCourseStatus(coursesUpdates);
				return Json(new { success = true, message = "會員狀態更新成功。" });

			}
			catch
			{
				return Json(new { success = false, message = "更新時發生錯誤。" });

			}
		}


		public ActionResult ViewCoureseDetail (int id)
		{
			var detail = _coursesService.GetCoureseDetail(id);

			
			return View(detail);
		}






	}
}