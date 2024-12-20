﻿using Chimo.WebAPI.Site.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chimo.WebAPI.Site.Controllers
{
    public class HomeController : Controller
    {
        public ActionResult Index()
        {
            ViewBag.Title = "Home Page";

            return View();
        }

        public ActionResult Category()
        {
            return View();
        }

        public ActionResult SearchResult()
        {
            return View();
        }

        public ActionResult Categories(int id)
        {
            ViewBag.categoryId = id;
            return View();
        }
    }
}
