using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Web;
using System.Web.Mvc;
using Microsoft.IdentityModel.Tokens;
using System.Configuration; // 引入這個命名空間

public class JwtAuthorizationAttribute : ActionFilterAttribute
{
    public override void OnActionExecuting(ActionExecutingContext filterContext)
    {
        var request = filterContext.HttpContext.Request;
        var jwtCookie = request.Cookies["jwtToken"];

        if (jwtCookie == null || string.IsNullOrEmpty(jwtCookie.Value))
        {
            filterContext.Result = new RedirectResult("~/login/Login");
            return;
        }
        var token = jwtCookie.Value;

        try
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = System.Text.Encoding.ASCII.GetBytes(ConfigurationManager.AppSettings["JwtKey"]); // 從Web.config讀取密鑰
            tokenHandler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false
            }, out SecurityToken validatedToken);
        }
        catch
        {
            filterContext.Result = new HttpUnauthorizedResult();
        }

        base.OnActionExecuting(filterContext);
    }
}
