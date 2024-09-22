using sb_admin2_Test.Models.Dtos;
using sb_admin2_Test.Models.EFmodels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Web;

namespace sb_admin2_Test.Services
{
	public class MemberService
	{
		private  AppDbContext _context;
		public MemberService()
		{
			_context = new AppDbContext();
		}

		public MemberService(AppDbContext context)
		{
			_context = context;
		}

		public List<Member> GetAllMembers()
		{
			return _context.Members.ToList();
		}

		public void UpdateMemberStatus(List<StatusUpdateDto> updates)
		{
			foreach (var update in updates)
			{
				var member = _context.Members.FirstOrDefault(m => m.Id == update.Id);
				if (member != null)
				{
					member.Status = update.Status;
					_context.Entry(member).State = EntityState.Modified;
				}
			}
			_context.SaveChanges();
		}


	}
}