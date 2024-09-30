using AutoMapper;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Tools
{
    public class Mappings : Profile
    {
        public Mappings()
        {
            CreateMap<Cours, CourseDto>().ReverseMap();

            CreateMap<RecommendedCourseVm, CourseDto>().ReverseMap();

			CreateMap<Teacher, TeacherDto>();

            CreateMap<CourseCategory, CourseCategoryDto>();

            CreateMap<Cours, CourseContentDto>();

            CreateMap<CourseCatalog, CourseCatalogDto>();

            CreateMap<CourseChapter, CourseChapterDto>();

            CreateMap<Teacher, TeacherDto>();

            CreateMap<AddCartItemDto, CartItem>();

        }
    }
}