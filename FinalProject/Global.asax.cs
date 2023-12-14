using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;

namespace FinalProject
{
    public class Global : HttpApplication
    {
        void Application_Start(object sender, EventArgs e)
        {
            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
            Application["counter"] = 0;
        }

        void Session_Start(Object sender, EventArgs e)
        {
            if (Session["userName"] == null)
            {
                Session["userName"] = "אורח";
                Session["firstName"] = "אורח";
                Session["admin"] = "no";
            }
        }

        void Session_End(Object sender, EventArgs e)
        {
            Session["userName"] = "אורח";
            Session["firstName"] = "אורח";
            Session["admin"] = "no";
        }
    }
}