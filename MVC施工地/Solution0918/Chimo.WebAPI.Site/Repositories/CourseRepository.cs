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