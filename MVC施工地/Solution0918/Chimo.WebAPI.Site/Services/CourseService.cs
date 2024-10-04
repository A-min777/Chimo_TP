using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Tools;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;
using System.Web.Http.Results;

namespace Chimo.WebAPI.Site.Services
{
	public class CourseService
	{
		private readonly ICourseRepository _repo;

        public CourseService()
        {
            _repo = new CourseRepository();
        }

        /// <summary>
        /// 抓取首頁的熱門推薦課程
        /// </summary>
        /// <returns></returns>
        public List<RecommendedCourseVm> GetRecommendedCourses()
		{
			string prefix = "../images/"; // 存放課程圖片檔案的相對位置資料夾

			var courses = _repo.GetRecommendedCourses() // 將List裡的圖片檔名組成相對路徑
                    .FormatThumbnail(prefix);

			// CourseDTO 轉 RecommendedCourseViewModel
			var recommendedCourses = WebApiApplication._mapper
				.Map<List<RecommendedCourseVm>>(courses);

			return recommendedCourses;
		}

        /// <summary>
        /// 透過課程ID與章節ID抓取完整的Chapter 內容
        /// </summary>
        /// <param name="courseId"></param>
        /// <param name="chapterId"></param>
        /// <returns></returns>
        internal CourseChapterDto GetChapterById(int courseId, int chapterId)
        {
            string VideoPrefix = "~/video/";

            return _repo.GetChapterById(courseId, chapterId).FormatVideoRoute(VideoPrefix);
        }

        /// <summary>
        /// 抓取呈現購買前的課程頁面所需資料
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        internal ProductInfoVm GetCourseInfoById(int id)
        {
			string ImagePrefix = "~/images/";

            string VideoPrefix = "~/video/";

            CourseContentDto CourseContent = _repo.GetCourseContentById(id);

			CourseDto Course = _repo.GetCourseDetailById(id);

            Course.FormatThumbnail(ImagePrefix); // 重組圖片檔名為絕對路徑

			int BuyerCount = _repo.GetBuyerCountById(id);

			int ChapterCount = _repo.GetChapterCountById(id);

			string FirstVideo = _repo.GetFirstVideoById(id).FormatVideoRoute(VideoPrefix);

            return new ProductInfoVm
            {
                CourseContent = CourseContent,
                CourseDetail = Course,
                BuyerCount = BuyerCount,
				ChapterCount = ChapterCount,
				FirstVideo = FirstVideo
            };
        }

        /// <summary>
        /// 透過課程Id找到該課程的第一個章節id
        /// </summary>
        /// <param name="courseId"></param>
        /// <returns></returns>
        internal int GetFirstChapterId(int courseId)
        {
           return _repo.GetFirstChapterId(courseId);
        }

        /// <summary>
        /// 抓取呈現已購買後的課程頁面所需資料
        /// </summary>
        /// <param name="id"></param>
        /// <returns></returns>
        internal CourseInfoVm GetMyCourseInfoById(int id)
        {
            string prefix = "~/images/";

            CourseContentDto CourseContent = _repo.GetCourseContentById(id);

            CourseDto Course = _repo.GetCourseDetailById(id);

            Course.FormatThumbnail(prefix); // 重組圖片檔名為絕對路徑

            List<CourseDto> OtherCourses = _repo.GetOtherCoursesById(id)
                                       .FormatThumbnail(prefix);

            return new CourseInfoVm
            {
                CourseContent = CourseContent,
                CourseDetail = Course,
                OtherCourses= OtherCourses
            };
        }

        /// <summary>
        /// 抓取首頁會員的已購買課程
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        internal List<RecommendedCourseVm> GetPurchasedCourseById(int memberId)
        {
            if (!new MemberRepository().IsExistMember(memberId))
            {
                throw new ArgumentException("不存在此會員");
            }

            string prefix = "../images/";

            var courses = _repo.GetPurchasedCourseById(memberId).FormatThumbnail(prefix);

            // CourseDTO 轉 RecommendedCourseViewModel
            var MyCourses = WebApiApplication._mapper
                .Map<List<RecommendedCourseVm>>(courses);


            return MyCourses;
        }



        internal List<RecommendedCourseVm> SearchCourses(string searchTerm)
        {
            var result = _repo.SearchCoursesByTitleOrTeacher(searchTerm);

            // 檢查結果是否為空
            if (result == null )
            {
                throw new ArgumentException("搜尋不到相關課程或老師");
            }

            var SearchCourses = WebApiApplication._mapper
            // CourseDTO 轉 RecommendedCourseVm
                .Map<List<RecommendedCourseVm>>(result);

            return SearchCourses;
        }


        // 獲取所有課程及其分類
        public List<CategoryCourseVm> GetAllCourses()
        {
            var courses = _repo.GetAllCategories();

            // 檢查結果是否為空
            if (courses == null)
            {
                throw new ArgumentException("搜尋不到相關課程或老師");
            }
            var Categorycourses = WebApiApplication._mapper
            // CourseDTO 轉 CategoryCourseVm
               .Map<List<CategoryCourseVm>>(courses);


            return Categorycourses;
        }


        // 獲取特定課程及其分類
        public List<CategoryCourseVm> GetCoursesByCategory(int categoryId)
        {
            var courses = _repo.GetCoursesByCategory(categoryId);

            // 檢查結果是否為空
            if (courses == null)
            {
                throw new ArgumentException("搜尋不到相關課程或老師");
            }

            var Categorycourses = WebApiApplication._mapper
            // CourseDTO 轉 CategoryCourseVm
               .Map<List<CategoryCourseVm>>(courses);

            return Categorycourses;
        }
    }
}