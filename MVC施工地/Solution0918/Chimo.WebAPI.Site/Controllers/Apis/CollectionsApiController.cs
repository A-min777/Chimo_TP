using Chimo.WebAPI.Site.Models.Dtos;
using Chimo.WebAPI.Site.Models.EFModels;
using Chimo.WebAPI.Site.Services;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace Chimo.WebAPI.Site.Controllers.Apis
{
    [RoutePrefix("api/updateCollections")]
    
    public class CollectionsApiController : ApiController
    {
        private readonly CollectionService _service;

        public CollectionsApiController()
        {
            _service = new CollectionService();
        }

        [HttpPost]
        [Route("")]
        public IHttpActionResult AddCollection([FromBody] UpdateCollectionDto dto)
        {
            bool result = _service.AddCollection(dto);
            
            if (!result) return BadRequest("加入收藏失敗");

            return Ok("成功加入收藏");
        }

        [HttpDelete]
        [Route("{courseId}/{memberId}")]
        public IHttpActionResult RemoveCollection(int courseId, int memberId)
        {
            var dto = new UpdateCollectionDto
            {
                CourseId = courseId,
                MemberId = memberId
            };

            var result = _service.RemoveCollection(dto);
            
            if (!result) return BadRequest("取消收藏失敗");
            
            return Ok("成功取消收藏");
        }
    }
}
