using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
    public class TeacherRepository : ITeacherRepository
    {
        private readonly AppDbContext _db;

        public TeacherRepository()
        {
            _db = new AppDbContext();
        }


        public List<Cours> GetCoursesByTeacherId(int id)
        {
            return _db.Courses.AsNoTracking()
                .Where(c => c.TeacherId == id && c.Status == 1).ToList();
        }

        /// <summary>
        /// 根據教師Id計算共有多少會員買過教師的課程
        /// </summary>
        /// <param name="teacherId"></param>
        /// <returns></returns>
        public int GetStudentCountByTeacherId(int teacherId)
        {
            var MemberCount = _db.OrderItems
            .AsNoTracking()
            .Where(oi => oi.Status == 1) 
            .Include(oi => oi.Order) 
            .Include(oi => oi.Cours) 
            .Include(oi => oi.Cours.Teacher) 
            .Where(oi => oi.Cours.Status == 1 && oi.Cours.Teacher.Id == teacherId) 
            .Select(oi => oi.Order.MemberId) 
            .Distinct() // 確保 MemberId 唯一
            .Count();

            return MemberCount;
        }

        /// <summary>
        /// 透過教師Id找到教師物件
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public Teacher GetTeacherById(int id)
        {
            return _db.Teachers.AsNoTracking().FirstOrDefault(t => t.Id == id);
        }
    }
}