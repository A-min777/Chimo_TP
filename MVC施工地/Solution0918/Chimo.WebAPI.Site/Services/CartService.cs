using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Repositories;
using Chimo.WebAPI.Site.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
    public class CartService
    {
        private readonly ICartRepository _repo;

        public CartService()
        {
            _repo = new CartRepository();
        }

        internal bool AddCartItem(AddCartItemDto dto)
        {
           return _repo.AddCartItem(dto);
        }


        internal List<ShowCartItemDto> GetCartItems(int memberId)
        {
            string prefix = "~/images/";

            return _repo.GetCartItemsByMemberId(memberId) // 將回傳的list裡的Course的圖片重組成路徑
                .Select(item => new ShowCartItemDto
                {
                    Id = item.Id,
                    Course = item.Course.FormatThumbnail(prefix)
                })
                .ToList();
        }

        internal bool RemoveCartItem(int cartItemId)
        {
            return _repo.RemoveCartItem(cartItemId);
        }
    }
}