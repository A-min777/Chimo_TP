using Chimo.WebAPI.Site.Models.Dtos;
using Microsoft.Ajax.Utilities;
using System;
using System.CodeDom;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Tools
{
    public static class CourseDto_Ext
    {
        /// <summary>
        /// 擴充方法: 將存在資料庫裡的圖片檔名組成相對或絕對路徑 (包括課程預覽圖及老師icon)
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static CourseDto FormatThumbnail(this CourseDto dto, string prefix)
        {
            if(dto.Thumbnail!=null && dto.Thumbnail.Length>0) dto.Thumbnail = prefix + dto.Thumbnail;
			
            if (dto.Teacher.ProfileImage != null && dto.Teacher.ProfileImage.Length > 0) 
                dto.Teacher.ProfileImage = prefix + dto.Teacher.ProfileImage;

            return dto;
        }


		/// <summary>
		/// 擴充方法: 將一個CourseDto list裡的所有成員的圖片檔名組成相對或絕對路徑
		/// </summary>
		/// <param name="dto"></param>
		/// <param name="prefix"></param>
		/// <returns></returns>
		public static List<CourseDto> FormatThumbnail(this List<CourseDto> dtos, string prefix)
        {
            return dtos.Select(c => c.FormatThumbnail(prefix)).ToList();
        }
    }
}