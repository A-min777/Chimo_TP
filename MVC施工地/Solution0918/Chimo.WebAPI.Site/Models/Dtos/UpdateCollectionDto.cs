using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class UpdateCollectionDto
    {
        [Required]
        public int MemberId { get; set; }

        [Required]
        public int CourseId { get; set; }

    }
}