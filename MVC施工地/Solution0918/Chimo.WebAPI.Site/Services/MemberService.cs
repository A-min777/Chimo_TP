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

namespace Chimo.WebAPI.Site.Services
{
    public class MemberService
    {
        private MemberRepository _memberRepository;


        public MemberService()
        {
            _memberRepository = new MemberRepository();
        }
        public MemberService(MemberRepository memberRepository)
        {
            _memberRepository = memberRepository;
        }

        /// <summary>
        /// 登入驗證
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public bool Verify(LoginDto dto)
        {
            // 從資料庫中獲取用戶資料
            var member = _memberRepository.Get(dto.Account);

            // 如果用戶不存在或密碼不匹配，則返回 false
            if (member.Email == null )
            {
                return false; // 錯誤的用戶名或密碼
            }
            else if(!HashUtility.VerifyPasswordHash(dto.Password, member.Password))
            {
                return false; // 錯誤的用戶名或密碼
            }

            //// 檢查 Status，如果是 0 則不能登入
            //if (member.Status == 0)
            //{
            //    return false; // 用戶狀態為禁用
            //}

            return true; // 驗證成功
        }
        public Member GetMemberByAccount(string account)
        {
            // 根據帳號查詢會員資料，返回 Member 物件
            return _memberRepository.Get(account);
        }
        public Member CreateMember(RegisterDto dto)
        {
            var existingMember = _memberRepository.GetMemberByEmail(dto.Email);
            if (existingMember != null)
            {
                throw new Exception("Email重複."); // 或者返回 null
            }

            string hashPassword = HashUtility.ToSHA256(dto.Password);

            var newMember = new Member
            {

                Name = dto.Name,
                Email = dto.Email,
                Password = hashPassword,
                Gender = 0,
                ProfileImage = dto.ProfileImage,
                Intro = dto.Intro,
                Phone = dto.Phone,
                CreatedDate = DateTime.Now,
                UpdatedDate = DateTime.Now,

            };

            _memberRepository.AddMember(newMember);

            return newMember;
        }

        public bool UpdateMember(int userId, RegisterDto dto)
        {
            var member = _memberRepository.FindById(userId);
            if (member == null) return false;

            member.Phone = dto.Phone ?? null ; // 預設值
            member.Gender = dto.Gender ?? 0; // 如果為 null，則設為 0
            member.Intro= dto.Intro ??  null; // 預設值

            _memberRepository.Update(member);
            return true;

        }
    }
}
