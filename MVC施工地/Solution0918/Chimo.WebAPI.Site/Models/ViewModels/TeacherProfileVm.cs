using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class TeacherProfileVm
    {
        public TeacherDto Teacher { get; set; }

        public List<CourseDto> Courses { get; set; }

        public int CourseCount { get; set; }

        public int StudentCount { get; set; }
    }
}