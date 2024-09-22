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
            if (member == null || !HashUtility.VerifyPasswordHash(dto.Password, member.Password))
            {
                return false; // 錯誤的用戶名或密碼
            }

            // 檢查 Status，如果是 0 則不能登入
            if (member.Status == 0)
            {
                return false; // 用戶狀態為禁用
            }

            return true; // 驗證成功
        }
    }
}