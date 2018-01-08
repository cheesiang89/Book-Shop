using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace Bookshop10
{
    public class Global : System.Web.HttpApplication
    {
        protected void Application_Start(object sender, EventArgs e)
        {
        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["Title"] = "";
            Session["ISBN"] = "";
            Session["Author"] = "";
            Session["CategoryID"] = "";
            Session["Price"] = "";
            Session["DiscountFactor"] = "";
            Session["CategoryName"] = "";
            Session["BookID"] = new List<int>();
            Session["Checked"] = new List<bool>();
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {


        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}