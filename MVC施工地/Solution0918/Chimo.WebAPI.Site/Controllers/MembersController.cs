using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chimo.WebAPI.Site.Controllers
{
    public class MembersController : Controller
    {
        // GET: Members
        public ActionResult EditInfo()
        {
            return View();
        }

        public ActionResult MyCourses()
        {
            return View();
        }

        public ActionResult MyCollections()
        {
            return View();
        }

        public ActionResult MyOrders()
        {
            return View();
        }

        public ActionResult TopUp()
        {
            return View();
        }

        public ActionResult MyCart()
        {
            return View();
        }
    }
}