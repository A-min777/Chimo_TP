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
		public ActionResult ViewProduct()
		{
			// 假設用戶 ID 是通過某種方式獲取的 (例如從 Session 或 JWT Token)
			// todo int userId = 

			// 檢查用戶是否已購買該商品
			// todo bool hasPurchased = _purchaseService.HasUserPurchasedProduct(userId, productId);
			
			bool hasPurchased = true;

			if (hasPurchased)
			{
				// 如果用戶已經購買過，重定向到商品詳細頁面
				return RedirectToAction("Course");
			}
			else
			{
				// 如果沒有購買過，重定向到購買頁面
				return RedirectToAction("ProductInfo");
			}
		}
		public ActionResult ProductInfo(int id)
		{
            ViewBag.ProductId = id;
            return View();
		}

		public ActionResult Course()
        {
            return View();
        }
    }
}