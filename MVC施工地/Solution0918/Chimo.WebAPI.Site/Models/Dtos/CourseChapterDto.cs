using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class CourseChapterDto
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public int DisplayOrder { get; set; }

        public string Description { get; set; }

        public string VideoURL { get; set; }

        public int VideoLength { get; set; }
    }
}