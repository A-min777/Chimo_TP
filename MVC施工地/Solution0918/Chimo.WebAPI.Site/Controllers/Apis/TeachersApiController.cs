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
    [RoutePrefix("api/teacherProfile")]
    public class TeachersApiController : ApiController
    {

        private readonly TeacherService _service;

        public TeachersApiController()
        {
            _service = new TeacherService();
        }

        [HttpGet]
        [Route("{id}")]
        public IHttpActionResult GetTeacherProfile(int id)
        {
            var teacherProfile = _service.GetTeacherProfile(id);

            if (teacherProfile == null) return NotFound();

            return Ok(teacherProfile);
        }
    }
}
