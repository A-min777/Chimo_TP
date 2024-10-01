using Chimo.WebAPI.Site.Models.EFModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
    public interface IOrderRepository
    {
        void CreateOrder(Order newOrder);
        void CreateOrderItem(OrderItem orderItem);
    }
}
