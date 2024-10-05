using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Configuration;

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
		public int GetBuyerCountById(int CourseId)
        {
            int purchaseCount = _db.OrderItems
            .Where(oi => oi.CourseId == CourseId && oi.Status == 1)
            .Count();

            return purchaseCount;
        }

        /// <summary>
        ///  根據課程及章節Id抓取章節資訊
        /// </summary>
        /// <param name="courseId"></param>
        /// <param name="chapterId"></param>
        /// <returns></returns>
        public CourseChapterDto GetChapterById(int courseId, int chapterId)
        {
            var chapterQuery = _db.CourseChapters
                .AsNoTracking() 
                .Include(cp => cp.CourseCatalog) 
                .Include(cp => cp.CourseCatalog.Cours) 
                .Where(cp => cp.CourseCatalog.CourseId == courseId && cp.Id == chapterId)
                .FirstOrDefault();

            var chapter = WebApiApplication._mapper
               .Map<CourseChapterDto>(chapterQuery); // Chapter 轉 ChapterDto
            
            return chapter;
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

        public int GetFirstChapterId(int CourseId)
        {
            int firstChapterId = (from c in _db.Courses
                                 where c.Id == CourseId
                                 select (from cc in _db.CourseCatalogs
                                         where cc.CourseId == c.Id
                                         orderby cc.DisplayOrder
                                         select (from ch in _db.CourseChapters
                                                 where ch.CatalogId == cc.Id
                                                 orderby ch.DisplayOrder
                                                 select ch.Id)
                                         .FirstOrDefault())
                                 .FirstOrDefault())
                     .FirstOrDefault();

            return firstChapterId;
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
        /// 取得某個課程的老師開的其他課程
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        public List<CourseDto> GetOtherCoursesById(int id)
        {
            var OtherCoursesQuery = _db.Courses
                .AsNoTracking()
                .Include(c => c.Teacher)
                .Where(c => c.TeacherId == _db.Courses
                    .Where(c2 => c2.Id == id)
                    .Select(c2 => c2.TeacherId)
                    .FirstOrDefault() && c.Id != id && c.Status == 1)
                .ToList();

            var OtherCourses = WebApiApplication._mapper
                .Map<List<CourseDto>>(OtherCoursesQuery);

            return OtherCourses;
        }

        /// <summary>
        /// 根據會員Id抓取該會員所購買的課程
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public List<CourseDto> GetPurchasedCourseById(int memberId)
        {
            var purchasedCoursesQuery = _db.Courses
             .AsNoTracking() 
             .Include(c => c.Teacher) 
             .Include(c => c.OrderItems.Select(oi => oi.Order)) 
             .Include(c => c.OrderItems.Select(oi => oi.Order.Member)) 
             .Where(c => c.OrderItems.Any(oi => oi.Status == 1 && oi.Order.Member.Id == memberId))
             .ToList();

            // Course 轉 CourseDto
            var purchasedCourses = WebApiApplication._mapper.Map<List<CourseDto>>(purchasedCoursesQuery);

            return purchasedCourses;
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

        public List<CourseDto> SearchCoursesByTitleOrTeacher(string searchTerm)
        {
            var coursesQuery = (
        from c in _db.Courses.AsNoTracking()
        .Include(c => c.Teacher) // 載入教師資料
        where (c.Title.Contains(searchTerm) || c.Teacher.Name.Contains(searchTerm)) // 根據標題或教師姓名搜尋
              && c.Status == 1 // 確保課程狀態為1
        select new CourseDto
        {
            Id = c.Id,
            CategoryId = c.CategoryId,
            TeacherId = c.TeacherId,
            Title = c.Title,
            Description = c.Description,
            Price = c.Price,
            Thumbnail = c.Thumbnail,
            Status = c.Status,
            Teacher = new TeacherDto
            {
                Id = c.Teacher.Id,
                Name = c.Teacher.Name,
            },
        }
    ).ToList();

            return coursesQuery;
        }


        // 查詢所有課程
        public List<CourseDto> GetAllCourses()
        {
            var courses =  _db.Courses
         .Include(c => c.CourseCategory) // 包含 CourseCategory 資訊
         .OrderBy(c => c.CourseCategory.DisplayOrder)
         .ToList(); // 返回所有課程資料

            var AllCategoryCourses = WebApiApplication._mapper
               .Map<List<CourseDto>>(courses); // Course 轉 CourseDto

            return AllCategoryCourses;
        }

        // 根據分類ID查詢課程
        public List<CourseDto> GetCoursesByCategory(int categoryId)
        {
            // 資料庫操作邏輯
            var courses =  _db.Courses
            .Include(c => c.CourseCategory) // 包含課程分類
            .Include(c => c.Teacher) // 如果需要，您可以包含教師資料
            .Where(c => c.CategoryId == categoryId) // 根據分類ID過濾課程
            .ToList(); 

            var CategoryCourses = WebApiApplication._mapper
                .Map<List<CourseDto>>(courses); // Course 轉 CourseDto

            return CategoryCourses;
        }

        /// <summary>
        /// 找出所有課程分類
        /// </summary>
        /// <returns></returns>
        public List<CourseCategory> GetAllCategories()
        {
            return _db.CourseCategories
                .AsNoTracking()
                .OrderBy(c => c.DisplayOrder)
                .ToList();
        }
    }
}