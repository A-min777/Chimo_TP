	using sb_admin2_Test.Models.EFmodels;
	using System;
	using System.Collections.Generic;
	using System.Linq;
	using System.Web;

	namespace sb_admin2_Test.Models.ViewModels
	{
		public class MemberSearchVm
		{
			public string MemberName { get; set; }
			
			public string CreatedDate { get; set; }

			public IEnumerable<Cours> EnrolledCourses { get; set; }
			public IEnumerable<PointHistory> PointsHistory { get; set; }
			public IEnumerable<Order> OrderHistory { get; set; }
	}
	}