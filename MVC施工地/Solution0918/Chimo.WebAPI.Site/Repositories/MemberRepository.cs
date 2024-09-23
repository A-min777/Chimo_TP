using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using Chimo.WebAPI.Site.Utilities;
using System.Data.Entity;

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

        public Member Get(string account)
        {
            var member = _db.Members.AsNoTracking().FirstOrDefault(m => m.Email == account);
            if (member == null) return null;

            return new Member
            {
                Id = member.Id,
                Name = member.Name,
                Point = member.Point,
                ProfileImage = member.ProfileImage,
                Intro = member.Intro,
                Email = member.Email,
                Gender = member.Gender,
                Phone = member.Phone,
                Password = member.Password,
                Status = member.Status,
                Address = member.Address,
                CreatedDate = member.CreatedDate,
                UpdatedDate = member.UpdatedDate,

            };
        }

        public Member GetMemberByEmail(string email)
        {
            return _db.Members.FirstOrDefault(m => m.Email == email);
        }

        public void AddMember(Member member)
        {
            _db.Members.Add(member);
            _db.SaveChanges();
        }

        public Member FindById(int userId)
        {
            return _db.Members.Find(userId);
        }

        public void Update(Member member)
        {

            member.UpdatedDate = DateTime.Now;
            _db.SaveChanges();
        }
    }
    }
