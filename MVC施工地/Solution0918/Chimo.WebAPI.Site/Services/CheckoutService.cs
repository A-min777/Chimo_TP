using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.Dtos;
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
		private readonly IPointHistoryRepository _historyRepo;
		private readonly MemberRepository _memberRepo;
        private readonly AppDbContext _db;

        public CheckoutService()
        {
            _orderRepo = new OrderRepository();
            _cartRepo = new CartRepository();
            _historyRepo = new PointHistoryRepository();
            _memberRepo = new MemberRepository();
            _db = new AppDbContext();
        }

		internal void BuyDirectly(BuyDirectlyDto dto)
		{
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
					var memberDto = _memberRepo.GetMemberDtoById(dto.MemberId);

                    if(memberDto.Point < dto.Price)
                    {
						throw new Exception("點數不足");
					}

					// 建立一筆新訂單
					var newOrder = new Order
					{
						MemberId = dto.MemberId,
						TotalAmount = dto.Price,
						Status = 1,
						CreatedDate = DateTime.Now,
						UpdatedDate = DateTime.Now
					};
					_orderRepo.CreateOrder(newOrder);

                    // 建立訂單項目
					var orderItem = new OrderItem
					{
						OrderId = newOrder.Id,
						CourseId = dto.CourseId,
						Status = 1,
						Price = dto.Price
					};
					_orderRepo.CreateOrderItem(orderItem);

                    // 更新會員點數
                    var member = _memberRepo.FindById(dto.MemberId);
                    member.Point -= dto.Price;
					_memberRepo.UpdateMemberPoint(member);


					// 新增一筆點數變動紀錄
					var newHistory = new PointHistory
					{
						MemberId = dto.MemberId,
						Cash = 0,
						Amount = -dto.Price,
						Point = member.Point,
						GetPointType = -1,
						GetPointDate = DateTime.Now,
						OrderId = newOrder.Id
					};
					_historyRepo.CreatePointHistory(newHistory);

                    // 處理快速購買後的購物車內容
                    HandleCart(dto);

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

        /// <summary>
        /// 若快速購買的課程有存在於會員的原購物車裡，將其移除
        /// </summary>
        /// <param name="dto"></param>
		private void HandleCart(BuyDirectlyDto dto)
		{
			var cart = _cartRepo.GetCartByMemberId(dto.MemberId);
            if (cart == null) return;

			// 判斷快速購買的課程是否存在於購物車裡
			var cartItem = cart.CartItems
                .FirstOrDefault(item => item.CourseId == dto.CourseId);

			if (cartItem != null)
			{
				// 如果有，從購物車中移除該 CartItem
				_cartRepo.RemoveCartItem(cartItem.Id);
			}
		}

		/// <summary>
		/// 處理來自購物車的結帳
		/// </summary>
		/// <param name="memberId"></param>
		internal void ConfirmOrder(int memberId)
        {
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
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

                    // 新增一筆點數變動紀錄
                    var newHistory = new PointHistory
                    {
                        MemberId = memberId,
                        Cash = 0,
                        Amount = -totalAmount,
                        Point = member.Point,
                        GetPointType = -1,
                        GetPointDate = DateTime.Now,
                        OrderId = newOrder.Id
                    };
                    _historyRepo.CreatePointHistory(newHistory);

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

        /// <summary>
        /// 處理退款
        /// </summary>
        /// <param name="dto"></param>
		internal void HandleRefund(RefundDto dto)
		{
            using (var transaction = _db.Database.BeginTransaction())
            {
                try
                {
                    var orders = _orderRepo.GetOrdersByMemberId(dto.MemberId);
                    if (orders == null) return;

                    // 找出要退貨課程的訂單
                    OrderItem orderItem = orders
                    .SelectMany(o => o.OrderItems)
                    .FirstOrDefault(oi => oi.CourseId == dto.CourseId && oi.Status == 1);

                    if (orderItem == null) return;

                    // 將對應orderItem的狀態設為退款
                    orderItem.Status = 0;
                    _orderRepo.UpdateOrderItemStatus(orderItem);

					// 更新會員點數
					var member = _memberRepo.FindById(dto.MemberId);
					member.Point += orderItem.Price;
					_memberRepo.UpdateMemberPoint(member);

					// 新增一筆點數變動紀錄
					var newHistory = new PointHistory
					{
						MemberId = dto.MemberId,
						Cash = 0,
						Amount = orderItem.Price,
						Point = member.Point,
						GetPointType = 0,
						GetPointDate = DateTime.Now,
						OrderId = orderItem.OrderId
					};
					_historyRepo.CreatePointHistory(newHistory);

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