using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Models.Dtos
{
    public class CollectionsDto
    {
        public int Id { get; set; }  
        public string Title { get; set; }  
        public string Thumbnail { get; set; }  

        public int Price { get; set; }  

        public string TeacherName { get; set; }


    }
}