using System;
using System.Net;
using System.Net.Http;
using System.Security.Claims;
using System.Text;
using System.Threading;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Controllers;
using System.Web.Http.Filters;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;

public class JwtAuthorizationAttribute : AuthorizeAttribute
{
    public override async Task OnAuthorizationAsync(HttpActionContext actionContext, CancellationToken cancellationToken)
    {
        var token = actionContext.Request.Headers.Authorization?.Parameter;

        if (string.IsNullOrEmpty(token))
        {
            actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
            return;
        }

        try
        {
            var key = Encoding.ASCII.GetBytes(System.Configuration.ConfigurationManager.AppSettings["JwtKey"]);
            var tokenHandler = new JwtSecurityTokenHandler();

            tokenHandler.ValidateToken(token, new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(key),
                ValidateIssuer = false,
                ValidateAudience = false,
                ClockSkew = TimeSpan.Zero // 不允許時間差
            }, out SecurityToken validatedToken);

            // 取得用戶資訊
            var jwtToken = (JwtSecurityToken)validatedToken;
            var usernameClaim = jwtToken.Claims.First(claim => claim.Type == ClaimTypes.Name);
            Thread.CurrentPrincipal = new ClaimsPrincipal(new ClaimsIdentity(new[] { usernameClaim }));

        }
        catch
        {
            actionContext.Response = actionContext.Request.CreateResponse(HttpStatusCode.Unauthorized);
        }

        await base.OnAuthorizationAsync(actionContext, cancellationToken);
    }
}
