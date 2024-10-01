using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Repositories;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Services
{
    public class CheckoutService
    {
        private readonly IOrderRepository _orderRepo;
        private readonly ICartRepository _cartRepo;
        private readonly MemberRepository _memberRepo;
        private readonly AppDbContext _db;

        public CheckoutService()
        {
            _orderRepo = new OrderRepository();
            _cartRepo = new CartRepository();
            _memberRepo = new MemberRepository();
            _db = new AppDbContext();
        }

        internal void ConfirmOrder(int memberId)
        {
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    // 調用 Repository 來獲取需要的資料
                    var memberDto = _memberRepo.GetMemberDtoById(memberId);
                    var cart = _cartRepo.GetCartByMemberId(memberId);
                    int totalAmount = cart.TotalAmount;

                    if (memberDto.Point < totalAmount)
                    {
                        throw new Exception("點數不足");
                    }

                    // 建立一筆新訂單
                    var newOrder = new Order
                    {
                        MemberId = memberId,
                        TotalAmount = totalAmount,
                        Status = 1,
                        CreatedDate = DateTime.Now,
                        UpdatedDate = DateTime.Now
                    };
                    _orderRepo.CreateOrder(newOrder);
                    //_db.SaveChanges();

                    //  建立訂單項目
                    foreach (var cartItem in cart.CartItems)
                    {
                        var orderItem = new OrderItem
                        {
                            OrderId = newOrder.Id,
                            CourseId = cartItem.CourseId,
                            Status = 1,
                            Price = cartItem.Price
                        };
                        _orderRepo.CreateOrderItem(orderItem);
                    }

                    // 更新原購物車狀態為已結帳
                    cart.Status = 1; 
                    _cartRepo.UpdateCartStatus(cart);

                    // 更新會員點數
                    var member = _memberRepo.FindById(memberId);

                    member.Point -= totalAmount;

                    _memberRepo.UpdateMemberPoint(member);

                    // 儲存所有更改
                    _db.SaveChanges();

                    // 提交交易
                    transaction.Commit();
                }
                catch (Exception)
                {
                    // 如果出現異常，回滾交易
                    transaction.Rollback();
                    throw;
                }
            }
        }
    }
}