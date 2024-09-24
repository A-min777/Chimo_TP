using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class CourseCategoryDto
    {
        public int Id { get; set; }

        public string Name { get; set; }
        public int DisplayOrder { get; set; }
    }
}