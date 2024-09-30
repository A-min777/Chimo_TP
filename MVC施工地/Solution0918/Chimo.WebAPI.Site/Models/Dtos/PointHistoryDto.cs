using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class PointHistoryDto
    {
        public int Cash {  get; set; }
        
        public int Amount { get; set; }  

        public int Point {  get; set; }

        public int Type {  get; set; }

        public DateTime TransactionTime {  get; set; }
    }
}