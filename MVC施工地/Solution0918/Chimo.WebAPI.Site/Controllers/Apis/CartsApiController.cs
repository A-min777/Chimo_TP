using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.ViewModels;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    [RoutePrefix("api/carts")]
    public class CartsApiController : ApiController
    {
        private readonly CartService _service;

        public CartsApiController()
        {
            _service = new CartService();
        }

        [HttpGet]
        [Route("{memberId}")]
        public IHttpActionResult GetCartItems(int memberId)
        {
            var cartItems = _service.GetCartItems(memberId);
            if (cartItems == null || !cartItems.Any())
            {
                return Ok(new List<ShowCartItemDto>());
            }

            return Ok(new { cartItems });
        }

        [HttpPost]
        [Route("add")]
        public IHttpActionResult AddCartItem([FromBody] AddCartItemDto dto)
        {
            bool result = _service.AddCartItem(dto);

            if (!result) return BadRequest("加入購物車失敗");

            return Ok("成功加入購物車");
        }

        [HttpDelete]
        [Route("remove/{cartItemId}")]
        public IHttpActionResult RemoveCollection(int cartItemId)
        { 

            var result = _service.RemoveCartItem(cartItemId);

            if (!result) return BadRequest("移除購物車內容失敗");

            return Ok("成功移除購物車內容");
        }
    }
}
