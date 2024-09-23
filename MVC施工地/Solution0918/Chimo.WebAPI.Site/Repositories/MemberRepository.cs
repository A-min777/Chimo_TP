using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
    public class MemberRepository
    {
        private AppDbContext _db;

        public MemberRepository()
        {
            _db = new AppDbContext();  // 預設使用一個新的 AppDbContext
        }

        public MemberRepository(AppDbContext db)
        {
            _db = db;  // 使用外部傳入的 AppDbContext
        }

        public LoginDto Get(string account) 
        {
            var member = _db.Members.AsNoTracking().FirstOrDefault(m => m.Email == account);
            if (member == null) return null;

            return new LoginDto
            {
                Account = member.Email,
                Password = member.Password,
                Status = member.Status,
            };
        }
    }
}