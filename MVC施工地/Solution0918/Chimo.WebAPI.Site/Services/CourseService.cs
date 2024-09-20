using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Repositories;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
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

			var courses = _repo.GetRecommendedCourses().Select(c =>
			{
				c.Thumbnail =  prefix + c.Thumbnail; // 將圖片檔名組成相對路徑
				return c;
			})
			.ToList();

			// CourseDTO 轉 RecommendedCourseViewModel
			var recommendedCourses = WebApiApplication._mapper
				.Map<List<RecommendedCourseVm>>(courses);

			return recommendedCourses;
		}
	}
}