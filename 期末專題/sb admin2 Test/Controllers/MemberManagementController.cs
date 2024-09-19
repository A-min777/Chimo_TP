using sb_admin2_Test.Models.EFmodels;
using sb_admin2_Test.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Services.Description;

namespace sb_admin2_Test.Controllers
{
	public class MemberManagementController : Controller
	{
		private MemberManagementService _memberManagementService;

		public MemberManagementController()
		{
			_memberManagementService = new MemberManagementService(new AppDbcontext());
		}
		public MemberManagementController(MemberManagementService memberService)
		{
			_memberManagementService = memberService;
		}


		// GET: MemberManagement/Search



		// GET: MemberManagement/Search
		[HttpGet]
		public ActionResult Search(string name)
		{
			var service = _memberManagementService;
			var result = service.SearchMember(name);

			if (string.IsNullOrWhiteSpace(name))
			{
				TempData["WarningMessage"] = "請輸入會員名稱。";
			}
			else if (result.MemberName == null)
			{
				TempData["WarningMessage"] = "找不到會員，請檢查輸入是否正確。";
			}

			return View(result);

		}
	}
}