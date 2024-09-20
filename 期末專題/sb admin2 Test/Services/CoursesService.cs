using sb_admin2_Test.Models.Dtos;
using sb_admin2_Test.Models.EFmodels;
using System;
using Dapper;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using static sb_admin2_Test.Models.ViewModels.CourseDetailVm;

namespace sb_admin2_Test.Services
{
	public class CoursesService
	{
		private AppDbContext _context;
		public CoursesService()
		{
			_context = new AppDbContext();
		}

		public CoursesService(AppDbContext context)
		{
			_context = context;
		}

		public List<Cours> GetAllCourses()
		{
			return _context.Courses.ToList();
		}

		public void UpdateCourseStatus(List<StatusUpdateDto> updates)
		{
			foreach (var update in updates)
			{
				var courses = _context.Courses.FirstOrDefault(m => m.Id == update.Id);
				if (courses != null)
				{
					courses.Status = update.Status;
					_context.Entry(courses).State = EntityState.Modified;
				}
			}
			_context.SaveChanges();
		}

		public CourseDetailViewModel GetCoureseDetail(int courseId)
		{
			using (var db = new SqlConnection(SqlDb.GetConnectionString("AppDbcontext")))
			{
				string sql = @"select c.Title AS CourseTitle,O.MemberId,m.Name,o.CreatedDate AS PurchaseDate
from Courses c
JOIN OrderItems OI ON c.Id=OI.CourseId
JOIN Orders O ON oi.OrderId = o.Id
JOIN Members M ON o.MemberId = m.Id
WHERE c.Id= @CourseId
";
			var courseDetail = db.Query<CourseDetailViewModel, BuyerDetailViewModel, CourseDetailViewModel>(
			sql,
			(course, buyer) =>
			{
			   // 將購買者資訊添加到 CourseDetailViewModel 的 Buyers 列表中
			   course.Buyers = course.Buyers ?? new List<BuyerDetailViewModel>();
			   if (buyer != null)
			   {
				   course.Buyers.Add(buyer);
			   }
			   return course;


			},
		   new { CourseId = courseId },
		   splitOn: "Name"
	   ).FirstOrDefault(); // 獲取單一結果
						   // 如果 courseDetail 為 null，僅返回標題
				if (courseDetail == null)
				{
					courseDetail = new CourseDetailViewModel
					{
						CourseTitle = db.QuerySingleOrDefault<string>(
							"SELECT Title FROM Courses WHERE Id = @CourseId",
							new { CourseId = courseId }
						)
					};
				}
				else if (!courseDetail.Buyers.Any())
				{
					// 如果沒有購買者，返回僅有標題的 ViewModel
					courseDetail.Buyers = new List<BuyerDetailViewModel>();
				}

				return courseDetail;
			}			}

		}

			}
		