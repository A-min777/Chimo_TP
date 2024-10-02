using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
	public interface IPointHistoryRepository
	{
		void CreatePointHistory(PointHistory newHistory);
	}
}
