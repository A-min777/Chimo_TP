using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
	internal interface ICourseRepository
	{
        int GetBuyerCountById(int id);
        int GetChapterCountById(int id);
        CourseContentDto GetCourseContentById(int id);
        CourseDto GetCourseDetailById(int id);
        string GetFirstVideoById(int id);
        List<CourseDto> GetOtherCoursesById(int id);
        List<CourseDto> GetRecommendedCourses();
	}
}
