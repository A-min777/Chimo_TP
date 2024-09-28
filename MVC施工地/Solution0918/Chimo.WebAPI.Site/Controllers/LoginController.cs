using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;

namespace Chimo.WebAPI.Site.Controllers
{
    public class LoginController : Controller
    {
        // GET: Login
        public ActionResult Login()
        {
            return View();
        }

        public ActionResult Logout()
        {
            Session.Abandon();

            FormsAuthentication.SignOut();

            return RedirectToAction("Index");
        }

        public ActionResult Register()
        {
            return View();
        }

        public ActionResult RegisterDetail()
        {
            return View();
        }

        [HttpGet]
        public ActionResult RegisterDetail(int userId)
        {
            TempData["UserId"] = userId; // 設置 TempData
            return View(); // 返回視圖
        }

        public ActionResult ForgotPassword()
        {
            return View();
        }

        public ActionResult ResetPassword()
        {
            return View();
        }
    }
}