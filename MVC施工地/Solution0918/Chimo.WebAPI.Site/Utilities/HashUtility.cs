using System;
using System.Collections.Generic;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;

namespace Chimo.WebAPI.Site.Utilities
{
    public static class HashUtility
    {
        public static string GetSalt()
        {
            return System.Configuration.ConfigurationManager.AppSettings["Salt"];

        }
        public static string ToSHA256(string plainText, string salt = null)
        {
            salt = salt ?? GetSalt(); //若salt是null就取得GetSalt的值

            using (var mySHA256 = SHA256.Create())
            {
                var bytes = System.Text.Encoding.UTF8.GetBytes(plainText + salt); //把密碼加上salt,轉成byte[]

                var hash = mySHA256.ComputeHash(bytes);

                var sb = new StringBuilder(); //存放加密後的字串

                foreach (var b in hash)
                {
                    sb.Append(b.ToString("X2")); //把byte轉成16進位字串,字母是大許
                }
                return sb.ToString(); //回傳加密後的字串
            }
        }
       
        public static bool VerifyPasswordHash(string password, string encryptPassword)
        {
            // 使用 ToSHA256 來計算輸入密碼的雜湊並與存儲的雜湊進行比較
            string HashPassword = ToSHA256(password);
            return HashPassword.Equals(encryptPassword, StringComparison.OrdinalIgnoreCase);
        }
    }
}
