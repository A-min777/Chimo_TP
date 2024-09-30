﻿using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.InteropServices.ComTypes;
using System.Web;
using Chimo.WebAPI.Site.Utilities;
using System.Data.Entity;
using AutoMapper;
using System.Threading.Tasks;
using System.Web.Configuration;

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

        public void AddMember(Member member)
        {
            _db.Members.Add(member);
            _db.SaveChanges();
        }

        public Member FindById(int userId)
        {
            return _db.Members.Find(userId);
        }

        public Member Update(Member member)
        {
            // 確保會員資料在資料庫中存在
            var existingMember = _db.Members.Find(member.Id);
            if (existingMember == null) return null;

            // 更新會員資料
            existingMember.Name = member.Name;
            existingMember.Intro = member.Intro;
            existingMember.Gender = member.Gender;
            existingMember.Phone = member.Phone;
            existingMember.UpdatedDate = DateTime.Now; // 設定為當前時間

            // 儲存更改
            _db.SaveChanges();

            return existingMember; // 返回更新後的會員資料
        }


        public ProfileDto GetMemberProfile(int memberId)
        {
            var memberProfile = _db.Members.AsNoTracking().FirstOrDefault(m => m.Id == memberId);
            if (memberProfile == null) return null; // 確保如果找不到會員，返回 null

            return new ProfileDto
            {
                Email = memberProfile.Email,
                Id = memberProfile.Id,
                Name = memberProfile.Name,
                Intro = memberProfile.Intro,
                Gender = memberProfile.Gender,
                Phone = memberProfile.Phone,
                UpdatedDate = memberProfile.UpdatedDate,
            };
        }

        public List<CourseDto> GetMemberCourse(int memberId)
        {
            var memberCourse = _db.Members.AsNoTracking().FirstOrDefault(m => m.Id == memberId);
            if (memberCourse == null) return null; // 確保如果找不到會員，返回 null

            // 獲取該會員的所有課程資料
            var courses = (from o in _db.Orders
                           join oi in _db.OrderItems on o.Id equals oi.OrderId
                           join c in _db.Courses on oi.CourseId equals c.Id
                           where o.MemberId == memberId && oi.Status == 1
                           select new CourseDto
                           {
                               Title = c.Title,
                               Thumbnail = c.Thumbnail,
                               Price = c.Price,
                               Teacher = new TeacherDto // 使用 Teacher 屬性來填充教師資訊
                               {
                                   Id = c.TeacherId,
                                   Name = c.Teacher.Name // 確保這裡能正確訪問到教師名稱
                               },
                               CreatedDate = o.CreatedDate
                           }).ToList();

            return courses; // 返回 List<Cours>
        }


        public List<CollectionsDto> GetMemberCollections(int memberId)
        {
            var memberCollections = _db.Members.AsNoTracking().FirstOrDefault(m => m.Id == memberId);
            if (memberCollections == null) return null; // 確保如果找不到會員，返回 null


            var CollectionsCourses = (from mc in _db.MemberCollections
                                      join m in _db.Members on mc.MemberId equals m.Id
                                      join c in _db.Courses on mc.CourseId equals c.Id
                                      join t in _db.Teachers on c.TeacherId equals t.Id
                                      where m.Id == memberId && c.Status == 1
                                      select new CollectionsDto
                                      {
                                          Id = memberId,
                                          Price = c.Price,
                                          TeacherName = c.Teacher.Name,
                                          Thumbnail = c.Thumbnail,
                                          Title = c.Title,
                                      }).ToList();

            return CollectionsCourses;

        }

        public List<OrderDto> GetMemberOrder(int memberId)
        {
            var memberOrder = _db.Members.AsNoTracking().FirstOrDefault(m => m.Id == memberId);
            if (memberOrder == null) return null; // 確保如果找不到會員，返回 null
            var orders = _db.Orders
                   .Where(o => o.MemberId == memberId)
                   .Select(o => new OrderDto
                   {
                       Id = o.Id,
                       CreatedDate = o.CreatedDate,
                       TotalAmount = o.TotalAmount,
                       Status = o.Status,
                       OrderItems = o.OrderItems
                       .Select(oi => new OrderItemDto
                       {
                           Id = oi.Id,
                           CourseName = oi.Cours.Title, // 課程名稱
                           Thumbnail = oi.Cours.Thumbnail, // 課程封面
                           TeacherName = oi.Cours.Teacher.Name, // 教師名稱
                           Price = oi.Cours.Price, // 課程價格
                           Status = oi.Status // 課程持有狀態
                       }).ToList()
                   }).ToList();

            return orders; // 返回 List<OrderDto>
        }

        /// <summary>
        /// 根據使用者Id跟課程Id判斷使用者是否已購買該課程
        /// </summary>
        /// <param name="userId"></param>
        /// <param name="courseId"></param>
        /// <returns></returns>
        internal bool HasPurchased(int userId, int courseId)
        {
            var purchasedCourse = _db.Orders
            .AsNoTracking()
            .Include(o => o.OrderItems.Select(oi => oi.Cours))
            .Where(o => o.MemberId == userId)
            .SelectMany(o => o.OrderItems)
            .Where(oi => oi.CourseId == courseId)
            .Select(oi => oi.Cours)
            .FirstOrDefault();

            return purchasedCourse != null;
        }

        public void UpdateProfileImage(int memberId, string imagePath)
        {
            var member = _db.Members.Find(memberId);

            if (member != null)
            {
                member.ProfileImage = imagePath;
                _db.SaveChanges();
            }


        }

    }
}


