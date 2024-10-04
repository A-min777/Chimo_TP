using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using System.Web.Configuration;

namespace Chimo.WebAPI.Site.Repositories
{
    public class CartRepository : ICartRepository
    {
        private readonly AppDbContext _db;

        public CartRepository()
        {
            _db = new AppDbContext();
        }

        /// <summary>
        /// 新增一筆購物車紀錄
        /// </summary>
        /// <param name="dto"></param>
        /// <returns></returns>
        public bool AddCartItem(AddCartItemDto dto)
        {
            var cart = _db.Carts.FirstOrDefault(c => c.MemberId == dto.MemberId && c.Status == 0);
            if (cart == null) // 若目前不存在未結帳的購物車，建立一個新的購物車
            {
                cart = new Cart { 
                    MemberId = dto.MemberId,
                    CreatedDate = DateTime.Now,
                    UpdatedDate = DateTime.Now,
                    TotalAmount = 0,
                    Status = 0
                };
                _db.Carts.Add(cart);
            }

            var cartItem = WebApiApplication._mapper.Map<CartItem>(dto); // AddCartItem 轉 CartItem
            cartItem.CreatedDate = DateTime.Now;
            cartItem.CartId = cart.Id;

            _db.CartItems.Add(cartItem);

            return _db.SaveChanges() > 0;
        }

        public Cart GetCartByMemberId(int memberId)
        {
            var cart = _db.Carts.AsNoTracking()
                .Include(c => c.CartItems)
                .FirstOrDefault(c => c.MemberId == memberId && c.Status == 0);

            return cart;
        }


        /// <summary>
        /// 透過會員Id找出購物車內容
        /// </summary>
        /// <param name="memberId"></param>
        /// <returns></returns>
        public List<ShowCartItemDto> GetCartItemsByMemberId(int memberId)
        {
            var CartItemsQuery = _db.Members
                .AsNoTracking()
                .Where(m => m.Id == memberId)
                .Include(m => m.Carts.Select(ct => ct.CartItems.Select(ci => ci.Cours)))
                .Where(m => m.Carts.Any(ct => ct.Status == 0))
                .SelectMany(m => m.Carts
                    .Where(ct => ct.Status == 0)
                    .SelectMany(ct => ct.CartItems
                        .Where(ci => ci.Cours.Status == 1)
                        .Select(ci => new
                        {
                            Id = ci.Id,             
                            Course = ci.Cours
                        })
                    )
                )
                .ToList();

            var CartItems = CartItemsQuery.Select(ci => new ShowCartItemDto
            {
                Id = ci.Id,
                Course = WebApiApplication._mapper.Map<CourseDto>(ci.Course) // 使Course 轉 CourseDto
            }).ToList();

            return  CartItems;
        }

        /// <summary>
        /// 移除一筆購物車內容紀錄
        /// </summary>
        /// <param name="cartItemId"></param>
        /// <returns></returns>
        public bool RemoveCartItem(int cartItemId)
        {
            var cartItem = _db.CartItems.FirstOrDefault(ci => ci.Id == cartItemId);
            if (cartItem == null)
            {
                return false;
            }

            _db.CartItems.Remove(cartItem);
            return _db.SaveChanges() > 0;
        }

        /// <summary>
        /// 確認交易後將原購物車狀態設為已結帳
        /// </summary>
        /// <param name="cart"></param>
        public void UpdateCartStatus(Cart cart)
        {
            var existingCart = _db.Carts
                .FirstOrDefault(c => c.Id == cart.Id); // 找到現有的購物車

            if (existingCart != null)
            {
                existingCart.Status = cart.Status; // 更新 Status
                _db.Entry(existingCart).Property(x => x.Status).IsModified = true; // 設置 Status 為已修改
            }

            _db.SaveChanges();
        }
    }
}