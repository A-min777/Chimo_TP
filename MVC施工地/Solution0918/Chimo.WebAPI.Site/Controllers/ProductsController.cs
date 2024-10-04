using Chimo.WebAPI.Site.Models;
﻿using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace Chimo.WebAPI.Site.Controllers
{
    public class ProductsController : Controller
    {
        private readonly CourseService _service;

        public ProductsController()
        {
            _service = new CourseService();
        }
        public ActionResult ViewProduct(int id)
        {
            var service= new MemberService();

            // 取得用戶 ID
            int userId = 0;
            var userIdStr = int.TryParse(service.GetUserIdFromToken(),out userId);
            
            if(userId == 0)
            {
                return RedirectToAction("ProductInfo", new { id });
            }
            
            // 檢查用戶是否已購買該商品
            bool hasPurchased = service.HasPurchasedProduct(userId, id);


            if (hasPurchased)
            {
                // 如果用戶已經購買過，重定向到商品詳細頁面
                // 取得該課程的第一個chapter
                int chapterId = _service.GetFirstChapterId(id);

                return RedirectToAction("Course", new { id, chapterId });
            }
            else
            {
                // 如果沒有購買過，重定向到購買頁面
                return RedirectToAction("ProductInfo", new { id });
            }
        }
        public ActionResult ProductInfo(int id)
		{
            ViewBag.ProductId = id;
            return View();
		}

		public ActionResult Course(int id, int chapterId)
        {
            var service = new MemberService();

            // 取得用戶 ID
            int userId = 0;
            var userIdStr = int.TryParse(service.GetUserIdFromToken(), out userId);

            if (userId == 0)
            {
                return RedirectToAction("ProductInfo", new { id });
            }

            // 檢查用戶是否已購買該商品
            bool hasPurchased = service.HasPurchasedProduct(userId, id);


            if (!hasPurchased)
            {
                return RedirectToAction("ProductInfo", new { id });
            }

            ViewBag.ProductId = id;
            ViewBag.ChapterId = chapterId;

            return View();
        }
    }
}