using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Utilities;
using System;
using System.IdentityModel.Tokens.Jwt;// 用於處理 JWT
using System.Security.Claims; // 用於聲明 (Claims)
using System.Text; // 用於編碼
using Microsoft.IdentityModel.Tokens; // 用於簽名和驗證
using System.Configuration; // 用於讀取 Web.config 中的設定
using System.Collections.Generic;
using System.Linq;
using System.Web;
using AutoMapper;
using Chimo.WebAPI.Site.Interfaces;

namespace Chimo.WebAPI.Site.Services
{
    public class MemberService
    {
        private MemberRepository _memberRepository;
        private readonly IMapper _mapper; 

        public MemberService()
        {
            _memberRepository = new MemberRepository();
        }
        public MemberService(MemberRepository memberRepository ,IMapper mapper)
        {
            _memberRepository = memberRepository;
            _mapper = mapper; 
        }

        /// <summary>
        /// 登入驗證
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public (bool IsSuccess, string Message, Member Member) VerifyMember(LoginDto dto)
        {
            var member = _memberRepository.Get(dto.Account);

            if (member == null)
            {
                return (false, "查無此帳號", null); // 查無此帳號
            }

            if (!HashUtility.VerifyPasswordHash(dto.Password, member.Password))
            {
                return (false, "密碼錯誤", null); // 密碼錯誤
            }

            if (member.Status == 0)
            {
                return (false, "帳號已被停用", null); // 帳號被停用
            }

            return (true, "驗證成功", member); // 返回會員對象
        }
        public Member GetMemberByAccount(string account)
        {
            // 根據帳號查詢會員資料，返回 Member 物件
            return _memberRepository.Get(account);
        }

        public ProfileDto GetMemberProfileById(int Id)
        {

            return _memberRepository.GetMemberProfile(Id);
        }

        public ProfileDto UpdateMemberProfile(ProfileDto updatedProfile)
        {
            var existingMember = _memberRepository.FindById(updatedProfile.Id);
            if (existingMember == null) return null; // 確保如果找不到會員，返回 null

            // 更新會員資料
            existingMember.Name = updatedProfile.Name;
            existingMember.Intro = updatedProfile.Intro;
            existingMember.Gender = updatedProfile.Gender;
            existingMember.Phone = updatedProfile.Phone;
            existingMember.UpdatedDate = DateTime.Now; // 設定為當前時間

            _memberRepository.Update(existingMember); // 使用 Repository 來更新資料

            return new ProfileDto
            {
                Id = existingMember.Id,
                Name = existingMember.Name,
                Intro = existingMember.Intro,
                Gender = existingMember.Gender,
                Phone = existingMember.Phone,
                UpdatedDate = existingMember.UpdatedDate,
            };
        }


        public List<CourseDto> GetMemberCoursesById(int Id)
        {

            // 調用 CourseRepository 的方法來獲取會員課程
            var courses = _memberRepository.GetMemberCourse(Id);

            // 如果找不到課程，返回 null
            if (courses == null) return null;

            return courses;
        }


        public List<CollectionsDto> GetMemberCollectionsById(int Id)
        {

            var collections = _memberRepository.GetMemberCollections(Id);

            if (collections == null) return null;

            return collections;
        }

        public List<OrderDto> GetMemberOrderById(int Id)
        {

            var order = _memberRepository.GetMemberOrder(Id);

            if (order == null) return null;

            return order;
        }
    }
}
