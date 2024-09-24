using Chimo.WebAPI.Site.Models.Dtos;
using Microsoft.Ajax.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Tools
{
    public static class CourseDto_Ext
    {
        /// <summary>
        /// 擴充方法: 將存在資料庫裡的圖片檔名組成相對或絕對路徑
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static CourseDto FormatThumbnail(this CourseDto dto, string prefix)
        {
            dto.Thumbnail = prefix + dto.Thumbnail;

            return dto;
        }

        /// <summary>
        /// 擴充方法: 將一個CourseDto list裡的所有成員的圖片檔名組成相對或絕對路徑
        /// </summary>
        /// <param name="dto"></param>
        /// <param name="prefix"></param>
        /// <returns></returns>
        public static List<CourseDto> FormatThumbnail(this List<CourseDto> dto, string prefix)
        {
            return dto.Select(c => c.FormatThumbnail(prefix)).ToList();
        }
    }
}