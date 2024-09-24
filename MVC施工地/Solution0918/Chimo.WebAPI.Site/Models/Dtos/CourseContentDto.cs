using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class CourseContentDto
    {
        public int Id { get; set; }
        public string Title { get; set; }

        public List<CourseCatalogDto> CourseCatalogs { get; set; }
    }
}