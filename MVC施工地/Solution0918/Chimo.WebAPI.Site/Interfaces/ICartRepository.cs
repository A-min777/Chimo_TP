using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Chimo.WebAPI.Site.Interfaces
{
    public interface ICartRepository
    {
        bool AddCartItem(AddCartItemDto dto);
        List<ShowCartItemDto> GetCartItemsByMemberId(int memberId);
        bool RemoveCartItem(int cartItemId);
    }
}
