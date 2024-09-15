using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sb_admin2_Test.Models.ViewModels
{
	public class CourseDetailVm
	{
		public class CourseDetailViewModel
		{
			public string CourseTitle { get; set; }
			public List<BuyerDetailViewModel> Buyers { get; set; }
		}

		public class BuyerDetailViewModel
		{
			public string Name { get; set; }
			public DateTime PurchaseDate { get; set; }
		}
	}
}