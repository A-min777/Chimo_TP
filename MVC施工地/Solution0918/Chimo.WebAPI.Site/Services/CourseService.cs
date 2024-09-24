using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Tools;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Policy;
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
	public class CourseService
	{
		private readonly ICourseRepository _repo;

        public CourseService()
        {
            _repo = new CourseRepository();
        }

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

        internal ProductInfoVm GetCourseInfoById(int id)
        {
			string prefix = "~/images/";

            CourseContentDto CourseContent = _repo.GetCourseContentById(id);

			CourseDto Course = _repo.GetCourseDetailById(id);

            Course.FormatThumbnail(prefix); // 重組圖片檔名為絕對路徑

			int BuyerCount = _repo.GetBuyerCountById(id);

			int ChapterCount = _repo.GetChapterCountById(id);

			string FirstVideo = _repo.GetFirstVideoById(id);

            return new ProductInfoVm
            {
                CourseContent = CourseContent,
                CourseDetail = Course,
                BuyerCount = BuyerCount,
				ChapterCount = ChapterCount,
				FirstVideo = FirstVideo
            };
        }

        internal CourseInfoVm GetMyCourseInfoById(int id)
        {
            string prefix = "~/images/";

            CourseContentDto CourseContent = _repo.GetCourseContentById(id);

            CourseDto Course = _repo.GetCourseDetailById(id);

            Course.Thumbnail = prefix + Course.Thumbnail; // 重組圖片檔名為絕對路徑

            List<CourseDto> OtherCourses = _repo.GetOtherCoursesById(id)
                                       .FormatThumbnail(prefix);

            return new CourseInfoVm
            {
                CourseContent = CourseContent,
                CourseDetail = Course,
                OtherCourses= OtherCourses
            };
        }
    }
}