using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
	public class RefundDto
	{
        public int MemberId { get; set; }

        public int CourseId { get; set; }
    }
}