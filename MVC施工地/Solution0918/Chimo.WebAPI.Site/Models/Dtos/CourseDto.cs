using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
	public class CourseDto
	{
		public int Id { get; set; }

		public int CategoryId { get; set; }

		public int TeacherId { get; set; }

		public string Title { get; set; }

		public string Description { get; set; }

		public int Price { get; set; }

		public string Thumbnail { get; set; }

		public int Status { get; set; }

		public DateTime CreatedDate { get; set; }

		public DateTime UpdatedDate { get; set; }

		public TeacherDto Teacher { get; set; }

		public CourseCategoryDto CourseCategory { get; set; }
	}
}