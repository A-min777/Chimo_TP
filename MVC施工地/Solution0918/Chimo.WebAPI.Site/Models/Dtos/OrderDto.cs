using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class OrderDto
    {
        public int Id { get; set; }
        public DateTime CreatedDate { get; set; }
       
        public int Status { get; set; }

        public int TotalAmount { get; set; }

        public List<OrderItemDto> OrderItems { get; set; }



    }
    public class OrderItemDto
    {
        public int Id { get; set; }
        public string CourseName { get; set; }
        public string Thumbnail { get; set; }
        public string TeacherName { get; set; }

        public int Price { get; set; }

        public int Status { get; set; }

    }
}