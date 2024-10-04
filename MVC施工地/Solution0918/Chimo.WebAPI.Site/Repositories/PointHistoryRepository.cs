using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
	public class PointHistoryRepository : IPointHistoryRepository
	{
		private readonly AppDbContext _db;

		public PointHistoryRepository()
		{
			_db = new AppDbContext();
		}

		/// <summary>
		/// 新增一筆PointHistory
		/// </summary>
		/// <param name="newHistory"></param>
		public void CreatePointHistory(PointHistory newHistory)
		{
			_db.PointHistories.Add(newHistory);
			_db.SaveChanges();
		}
	}
}