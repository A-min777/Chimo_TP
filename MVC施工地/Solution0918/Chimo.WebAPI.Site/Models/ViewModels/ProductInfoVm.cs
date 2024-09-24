using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class ProductInfoVm
    {
        public CourseContentDto CourseContent { get; set; }

        public CourseDto CourseDetail { get; set; }

        public int BuyerCount { get; set; }

        public int ChapterCount { get; set; }

        public string FirstVideo { get; set; }
    }
}