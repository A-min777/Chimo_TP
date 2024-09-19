using sb_admin2_Test.Models.EFmodels;
using sb_admin2_Test.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace sb_admin2_Test.Services
{
	public class MemberManagementService
	{
		private AppDbContext _context;
		public MemberManagementService()
		{
			_context = new AppDbContext();
		}

		public MemberManagementService(AppDbContext context)
		{
			_context = context;
		}

		public Member GetMemberByName(string name)
		{
			return _context.Members
				.FirstOrDefault(m => m.Name.Equals(name, StringComparison.OrdinalIgnoreCase));
		}


		public MemberSearchVm SearchMember(string name)
		{
			var member = GetMemberByName(name);


			if (member == null)
			{
				return new MemberSearchVm
				{
					MemberName = null,
					CreatedDate = null,
					EnrolledCourses = Enumerable.Empty<Cours>(),
					PointsHistory = Enumerable.Empty<PointHistory>(),
					OrderHistory = Enumerable.Empty<Order>()
				};
			}

			var viewModel = new MemberSearchVm
			{
				MemberName = member.Name,
				CreatedDate = member.CreatedDate.ToString("yyyy-MM-dd"),
				EnrolledCourses = GetEnrolledCourses(member.Id),
				PointsHistory = GetPointsHistory(member.Id),
				OrderHistory = GetOrderHistory(member.Id)
			};

			return viewModel;
		}
	

		public IEnumerable<Cours> GetEnrolledCourses(int memberId)
		{
			// 直接查詢 OrderItem 資料表，找到該會員的所有課程 ID
			var courseIds = _context.OrderItems
				.Where(oi => oi.Status == 1 && _context.Orders.Any(o => o.Id == oi.OrderId && o.MemberId == memberId))
				.Select(oi => oi.CourseId)
				.Distinct()
				.ToList();

			// 根據課程 ID 獲取課程詳細資料
			var courses = _context.Courses
				.Where(c => courseIds.Contains(c.Id))
				.ToList();

			return courses;
		}
		public IEnumerable<PointHistory> GetPointsHistory(int memberId)
		{
			return _context.PointHistories
				.Where(p => p.MemberId == memberId)
				.ToList();
		}

		public IEnumerable<Order> GetOrderHistory(int memberId)
		{
			return _context.Orders
				.Where(o => o.MemberId == memberId)
				.ToList();
		}


	}
}