using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    [RoutePrefix("api/checkout")]
    public class CheckoutsApiController : ApiController
    {
        private readonly CheckoutService _service;

        public CheckoutsApiController()
        {
            _service = new CheckoutService();
        }

        [HttpPost]
        [Route("confirm")]
        public IHttpActionResult ConfirmPayment([FromBody] ConfirmPaymentDto paymentDto)
        {
            try
            {
                _service.ConfirmOrder(paymentDto.MemberId);
                return Ok(new { success = true });
            }
            catch (Exception ex)
            {
                return InternalServerError(ex);
            }
        }

		[HttpPost]
		[Route("buyDirectly")]
		public IHttpActionResult BuyDirectly([FromBody] BuyDirectlyDto dto)
		{
			try
			{
				_service.BuyDirectly(dto);
				return Ok(new { success = true });
			}
			catch (Exception ex)
			{
				return InternalServerError(ex);
			}
		}
	}
}
