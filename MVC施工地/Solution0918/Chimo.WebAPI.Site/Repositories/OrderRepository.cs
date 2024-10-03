using Chimo.WebAPI.Site.Interfaces;
using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Chimo.WebAPI.Site.Repositories
{
    public class OrderRepository : IOrderRepository
    {
        private readonly AppDbContext _db;

        public OrderRepository()
        {
            _db = new AppDbContext();
        }

        public void CreateOrder(Order newOrder)
        {
            _db.Orders.Add(newOrder);
            _db.SaveChanges();
        }

        public void CreateOrderItem(OrderItem orderItem)
        {
            _db.OrderItems.Add(orderItem);
            _db.SaveChanges();
        }

		public List<Order> GetOrdersByMemberId(int memberId)
		{
			var orders = _db.Orders
                .AsNoTracking()
                .Where(o => o.MemberId == memberId && o.Status != -1)
                .ToList();

            return orders;
		}

		public void UpdateOrderItemStatus(OrderItem orderItem)
		{
			var existingOrderItem = _db.OrderItems
			   .FirstOrDefault(oi => oi.Id == orderItem.Id); // 找到現有訂單明細

			if (existingOrderItem != null)
			{
				existingOrderItem.Status = orderItem.Status; // 更新 Status
				_db.Entry(existingOrderItem).Property(x => x.Status).IsModified = true; // 設置 Status 為已修改                                                                      
			}

			_db.SaveChanges();
		}
	}
}