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

<<<<<<< HEAD
			CreateMap<Teacher, TeacherDto>();

            CreateMap<CourseCategory, CourseCategoryDto>();

            CreateMap<Cours, CourseContentDto>();

            CreateMap<CourseCatalog, CourseCatalogDto>();

            CreateMap<CourseChapter, CourseChapterDto>();
=======
            CreateMap<Teacher, TeacherDto>();

            CreateMap<LoginDto, Member>()
                        .ForMember(dest => dest.Id, opt => opt.Ignore())
                        .ForMember(dest => dest.Name, opt => opt.Ignore())
                        .ForMember(dest => dest.Point, opt => opt.Ignore())
                        .ForMember(dest => dest.ProfileImage, opt => opt.Ignore())
                        .ForMember(dest => dest.Intro, opt => opt.Ignore())
                        .ForMember(dest => dest.Address, opt => opt.Ignore())
                        .ForMember(dest => dest.Gender, opt => opt.Ignore())
                        .ForMember(dest => dest.Phone, opt => opt.Ignore())
                        .ForMember(dest => dest.CreatedDate, opt => opt.Ignore())
                        .ForMember(dest => dest.UpdatedDate, opt => opt.Ignore())
                        .ReverseMap();
>>>>>>> 6875fa1ee569021011ed12963b9ee9fa31b0afee
        }
    }
}