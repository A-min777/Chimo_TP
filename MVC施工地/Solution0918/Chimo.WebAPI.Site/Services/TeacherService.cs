using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
    public class TeacherService
    {
        private readonly ITeacherRepository _repo;

        public TeacherService()
        {
            _repo = new TeacherRepository();
        }


        internal List<CourseDto> GetCoursesByTeacherId(int id)
        {
            var courses = _repo.GetCoursesByTeacherId(id);

            // Course 轉 CourseDto
            return WebApiApplication._mapper.Map<List<CourseDto>>(courses);
        }

        internal int GetStudentCountByTeacherId(int id)
        {
            return _repo.GetStudentCountByTeacherId(id);
        }

        internal TeacherDto GetTeacherById(int id)
        {
           var teacher = _repo.GetTeacherById(id);

           // Teacher 轉 TeacherDto
           return WebApiApplication._mapper.Map<TeacherDto>(teacher);
        }

        internal TeacherProfileVm GetTeacherProfile(int id)
        {
            var teacher = GetTeacherById(id);
            if (teacher == null) return null;

            string prefix = "~/images/";

            if (teacher.ProfileImage != null && teacher.ProfileImage.Length > 0)
            {
                teacher.ProfileImage = prefix + teacher.ProfileImage;
            }

            List<CourseDto> courses = GetCoursesByTeacherId(id).FormatThumbnail(prefix);

            int CourseCount = courses.Count();

            int StudentCount = GetStudentCountByTeacherId(id);

            return new TeacherProfileVm
            {
                Teacher = teacher,
                Courses = courses,
                CourseCount = CourseCount,
                StudentCount = StudentCount
            };
        }
    }
}