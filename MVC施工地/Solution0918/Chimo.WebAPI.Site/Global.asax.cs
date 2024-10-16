using AutoMapper;
using Chimo.WebAPI.Site.Tools;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace Chimo.WebAPI.Site
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        public static IMapper _mapper;
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);

            // �]�mMappings
            var config = new MapperConfiguration(cfg =>
            {
                cfg.AddProfile<Mappings>();
            });

            _mapper = config.CreateMapper();
        }
        protected void Application_Error()
        {
            Exception exception = Server.GetLastError();
            Response.Clear();
            Response.StatusCode = 404; // ��^ 404 ���~
            Response.TrySkipIisCustomErrors = true;
            Server.ClearError();
        }

    }
}
