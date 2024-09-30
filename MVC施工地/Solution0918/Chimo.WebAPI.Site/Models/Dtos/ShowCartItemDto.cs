using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class ShowCartItemDto
    {
        public int Id { get; set; }

        public CourseDto Course { get; set; }
    }
}