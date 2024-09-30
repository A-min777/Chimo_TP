using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Utilities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions; 
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
    public class RegisterService
    {
        private MemberRepository _memberRepository;


        public RegisterService()
        {
            _memberRepository = new MemberRepository();
        }
        public RegisterService(MemberRepository memberRepository)
        {
            _memberRepository = memberRepository;
        }




        public Member CreateMember(RegisterDto dto)
        {
            var existingMember = _memberRepository.Get(dto.Email);
            if (existingMember != null)
            {
                throw new Exception("Email重複."); // 或者返回 null
            }
            if (!IsValidEmail(dto.Email))
            {
                throw new Exception("Email格式錯誤.");
            }
            if (string.IsNullOrWhiteSpace(dto.Password))
            {
                throw new Exception("密碼不可為空.");
            }

            string hashPassword = HashUtility.ToSHA256(dto.Password);

            var newMember = new Member
            {

                Name = dto.Name,
                Email = dto.Email,
                Password = hashPassword,
                Gender = 0,
                ProfileImage = "profilePic2.PNG",
                Intro = dto.Intro,
                Phone = dto.Phone,
                CreatedDate = DateTime.Now,
                UpdatedDate = DateTime.Now,

            };

            _memberRepository.AddMember(newMember);
            return newMember;
        }

        private bool IsValidEmail(string email)
        {
            var emailRegex = new Regex(@"^[^@\s]+@[^@\s]+\.[^@\s]+$");
            return emailRegex.IsMatch(email);
        }

        public bool UpdateMember(int userId, RegisterDto dto,string avatar)
        {
            var member = _memberRepository.FindById(userId);
            if (member == null) return false;

            member.Phone = dto.Phone ?? null; // 預設值
            member.Gender = dto.Gender; // 如果為 null，則設為 0
            member.Intro = dto.Intro ?? null; // 預設值

            member.ProfileImage = avatar;

            _memberRepository.Update(member);
            return true;

        }
    }
}