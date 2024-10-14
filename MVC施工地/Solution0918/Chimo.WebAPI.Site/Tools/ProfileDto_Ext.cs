using Chimo.WebAPI.Site.Models.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Tools
{
    public static class ProfileDto_Ext
    {
        public static ProfileDto FormatImage(this ProfileDto dto, string prefix)
        {
            if (dto.ProfileImage != null && dto.ProfileImage.Length > 0) dto.ProfileImage = prefix + dto.ProfileImage;

               return dto;
        }
    }
}