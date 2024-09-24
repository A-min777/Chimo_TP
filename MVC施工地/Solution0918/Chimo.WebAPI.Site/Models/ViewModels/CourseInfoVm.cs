using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class CourseInfoVm
    {
        public CourseContentDto CourseContent { get; set; }

        public CourseDto CourseDetail { get; set; }

        public List<CourseDto> OtherCourses { get; set; }

    }
}