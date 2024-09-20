using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
	public class TeacherDto
	{
		public int Id { get; set; }

		public string Name { get; set; }

		public string ProfileImage { get; set; }

		public string Intro { get; set; }

		public string Email { get; set; }
	}
}