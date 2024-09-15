using sb_admin2_Test.Models.Dtos;
using sb_admin2_Test.Models.EFmodels;
using sb_admin2_Test.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using static sb_admin2_Test.Services.MemberService;

namespace sb_admin2_Test.Controllers
{
	public class MemberController : Controller
	{
		private readonly MemberService _memberService;
		public MemberController()
		{
			_memberService = new MemberService(new AppDbcontext());
		}
		public MemberController(MemberService memberService)
		{
			_memberService = memberService;
		}

		public ActionResult GetAllMembers()
		{
			var members = _memberService.GetAllMembers(); // 從資料庫獲取所有會員資料
			return View(members); // 將資料傳遞給view
		}

		[HttpPost]
		public ActionResult UpdateMemberStatus(List<StatusUpdateDto> memberUpdates)
		{
			if (memberUpdates == null || !memberUpdates.Any())
			{
				return Json(new { success = false, message = "沒有任何資料可以更新。" });
			}

			try
			{ 
				_memberService.UpdateMemberStatus(memberUpdates);
				return Json(new { success = true, message = "會員狀態更新成功。" });

			}
			catch 
			{
				return Json(new { success = false, message = "更新時發生錯誤。" });

			}
		}


	}
}