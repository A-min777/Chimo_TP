using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class CategoryCourseVm
    {
        public int Id { get; set; }

        public string Title { get; set; }

        public string Description { get; set; }

        public int Price { get; set; }

        public string Thumbnail { get; set; }

        public TeacherDto Teacher { get; set; }

        public CourseCategoryDto CourseCategory { get; set; }
    }
}