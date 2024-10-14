using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.ViewModels
{
    public class PointHistoryVm
    {
        public int Cash { get; set; }

        public int Amount { get; set; }

        public int Point { get; set; }

        public int Type { get; set; }

        public DateTime TransactionTime { get; set; }
    }
}