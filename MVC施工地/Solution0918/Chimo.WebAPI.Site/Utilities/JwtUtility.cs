using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using System.Text;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Repositories;
using Microsoft.IdentityModel.Tokens;

public class JwtUtility
{
    public static string GenerateToken(Member member )
    {

        var key = Encoding.ASCII.GetBytes(System.Configuration.ConfigurationManager.AppSettings["JwtKey"]);
        var tokenHandler = new JwtSecurityTokenHandler();
        // 建立 claims，包含所需的會員資料
        var claims = new[]
        {
            new Claim(ClaimTypes.Name, member.Name),
            new Claim("Id", member.Id.ToString()),
            new Claim(ClaimTypes.Email, member.Email),
            new Claim("Intro", member.Intro ?? string.Empty),
            new Claim("Address", member.Address ?? string.Empty),
            new Claim("Gender", member.Gender.ToString() ?? string.Empty),
            new Claim("Status", member.Status.ToString() ?? string.Empty),
            new Claim("Phone", member.Phone ?? string.Empty),
            new Claim("CreatedDate", member.CreatedDate.ToString("o")), // ISO 8601 格式
            new Claim("UpdatedDate", member.UpdatedDate.ToString("o"))
        };

        var tokenDescriptor = new SecurityTokenDescriptor
        {
            Subject = new ClaimsIdentity(claims),
            Expires = DateTime.UtcNow.AddMinutes(30),
            Issuer = System.Configuration.ConfigurationManager.AppSettings["JwtIssuer"],
            SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
        };

        var token = tokenHandler.CreateToken(tokenDescriptor);
        return tokenHandler.WriteToken(token);
    }


    public static Member DecodeToken(string token)
    {
        var handler = new JwtSecurityTokenHandler();
        var jwtToken = handler.ReadToken(token) as JwtSecurityToken;

        if (jwtToken == null)
        {
            return null;
        }

        var member = new Member
        {
            Id = int.Parse(jwtToken.Claims.FirstOrDefault(c => c.Type == "Id")?.Value),
            Name = jwtToken.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Name)?.Value,
            Email = jwtToken.Claims.FirstOrDefault(c => c.Type == ClaimTypes.Email)?.Value,
            Intro = jwtToken.Claims.FirstOrDefault(c => c.Type == "Intro")?.Value,
            Address = jwtToken.Claims.FirstOrDefault(c => c.Type == "Address")?.Value,
            Gender = int.Parse(jwtToken.Claims.FirstOrDefault(c => c.Type == "Gender")?.Value),
            Status = int.Parse(jwtToken.Claims.FirstOrDefault(c => c.Type == "Status")?.Value),
            Phone = jwtToken.Claims.FirstOrDefault(c => c.Type == "Phone")?.Value,
            CreatedDate = DateTime.Parse(jwtToken.Claims.FirstOrDefault(c => c.Type == "CreatedDate")?.Value),
            UpdatedDate = DateTime.Parse(jwtToken.Claims.FirstOrDefault(c => c.Type == "UpdatedDate")?.Value),
        };

        return member;
    }

}