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
    }
}