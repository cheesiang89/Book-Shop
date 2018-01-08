using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Response.Redirect("http://localhost/Bookshop10/NewAccount.aspx");
    }

    protected void Login1_LoginError(object sender, EventArgs e)
    {
        Login1.FailureText = "Your login attempt was not successful. Please try again.";
    }
}