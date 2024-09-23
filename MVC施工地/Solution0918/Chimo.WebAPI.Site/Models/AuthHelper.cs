using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models
{
    public static class AuthHelper
    {
        public static bool IsLoggedIn(HttpRequestBase request) //判斷是否登入
        {
            var token = request.Cookies["jwtToken"]?.Value;
            return !string.IsNullOrEmpty(token);
        }

        // 儲存JWT到Cookie
        public static void SaveTokenToCookie(string token)
        {
            var cookie = new HttpCookie("jwtToken", token)
            {
                Path = "/",
                Secure = true,
                HttpOnly = true,
                SameSite = SameSiteMode.Strict
            };
            HttpContext.Current.Response.Cookies.Add(cookie);
        }

        // 從Cookie中取得JWT
        public static string GetTokenFromCookie()
        {
            var cookie = HttpContext.Current.Request.Cookies["jwtToken"];
            return cookie?.Value;
        }
    }
}