using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
	public class CourseRepository : ICourseRepository
	{
		private readonly AppDbContext _db;

        public CourseRepository()
        {
            _db = new AppDbContext();
        }

        /// <summary>
        /// 取得課程購買人數
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        /// <exception cref="NotImplementedException"></exception>
        public int GetBuyerCountById(int CourseId)
        {
            int purchaseCount = _db.OrderItems
            .Where(oi => oi.CourseId == CourseId && oi.Status == 1)
            .Count();

            return purchaseCount;
        }

        /// <summary>
        /// 取得課程的總章節數
        /// </summary>
        /// <param name="CourseId"></param>
        /// <returns></returns>
        public int GetChapterCountById(int CourseId)
        {
            int totalChapterCount = _db.CourseChapters
             .AsNoTracking()
             .Join(
                 _db.CourseCatalogs.AsNoTracking(),
                 chapter => chapter.CatalogId,
                 catalog => catalog.Id,
                 (chapter, catalog) => new { chapter, catalog }
             )
             .Join(
                 _db.Courses.AsNoTracking(),
                 temp => temp.catalog.CourseId,
                 course => course.Id,
                 (temp, course) => new { temp.chapter, course }
             )
             .Where(x => x.course.Id == CourseId)
             .Count();

            return totalChapterCount;
        }

        /// <summary>
        /// 取得課程的所有目錄與章節
        /// </summary>
        /// <param name="CourseId"></param>
        /// <returns></returns>
        public CourseContentDto GetCourseContentById(int CourseId)
        {
            var courseContentQuery = _db.Courses
            .AsNoTracking()
            .Include(c => c.CourseCatalogs)
            .Include("CourseCatalogs.CourseChapters")
            .FirstOrDefault(c => c.Id == CourseId);

            var courseContent = WebApiApplication._mapper
                .Map<CourseContentDto>(courseContentQuery); // Course 轉 CourseContentDto

            return courseContent;
        }
        /// <summary>
        /// 取得課程詳細資訊
        /// </summary>
        /// <param name="CourseId"></param>
        /// <returns></returns>
        public CourseDto GetCourseDetailById(int CourseId)
        {
            var courseDetailQuery = _db.Courses
            .AsNoTracking() 
            .Include(c => c.Teacher) 
            .Include(c => c.CourseCategory) 
            .FirstOrDefault(c => c.Id == CourseId);

            var courseDetail = WebApiApplication._mapper
                .Map<CourseDto>(courseDetailQuery); // Course 轉 CourseDto

            return courseDetail;
        }

        /// <summary>
        /// 取得課程的第一支影片
        /// </summary>
        /// <param name="CourseId"></param>
        /// <returns></returns>
        public string GetFirstVideoById(int CourseId)
        {
            string firstVideo = (from c in _db.Courses
                                 where c.Id == CourseId
                                 select (from cc in _db.CourseCatalogs
                                         where cc.CourseId == c.Id
                                         orderby cc.DisplayOrder
                                         select (from ch in _db.CourseChapters
                                                 where ch.CatalogId == cc.Id
                                                 orderby ch.DisplayOrder
                                                 select ch.VideoURL)
                                         .FirstOrDefault())
                                 .FirstOrDefault())
                     .FirstOrDefault();

            return firstVideo;
        }

        /// <summary>
        /// 取得推薦課程
        /// </summary>
        /// <returns></returns>
        public List<CourseDto> GetRecommendedCourses()
		{
			var RecommendedCoursesQuery = (
				from c in _db.Courses.AsNoTracking().
				Include(c => c.Teacher)
				join oi in _db.OrderItems on c.Id equals oi.CourseId
				where oi.Status == 1
				group c by new { c.Id, c.Title } into g
				orderby g.Count() descending
				select g.FirstOrDefault()
				)
				.Take(6)
				.ToList();

			var RecommendedCourses = WebApiApplication._mapper
				.Map<List<CourseDto>>(RecommendedCoursesQuery); // Course 轉 CourseDto


			return RecommendedCourses;
		}
	}
}