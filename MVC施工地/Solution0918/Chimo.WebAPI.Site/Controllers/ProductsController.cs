using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chimo.WebAPI.Site.Controllers
{
    public class ProductsController : Controller
    {
        // GET: Products
        public ActionResult ProductInfo()
        {
            return View();
        }

        public ActionResult Course()
        {
            return View();
        }
    }
}