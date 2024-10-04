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
        CourseChapterDto GetChapterById(int courseId, int chapterId);
        int GetChapterCountById(int id);
        CourseContentDto GetCourseContentById(int id);
        CourseDto GetCourseDetailById(int id);
        int GetFirstChapterId(int courseId);
        string GetFirstVideoById(int id);
        List<CourseDto> GetOtherCoursesById(int id);
        List<CourseDto> GetPurchasedCourseById(int memberId);
        List<CourseDto> GetRecommendedCourses();
        List<CourseDto> SearchCoursesByTitleOrTeacher(string searchTerm);
    }
}
