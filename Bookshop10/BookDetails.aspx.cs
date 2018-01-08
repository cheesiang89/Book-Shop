using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop10;

public partial class BookDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtTitle.Text = (string)Session["Title"];
        txtAuthor.Text = (string)Session["Author"];
        txtISBN.Text = (string)Session["ISBN"];
        txtCategory.Text = (string)Session["CategoryName"];
        decimal price = (decimal)Session["Price"];
        lblOriginalPrice.Text = String.Format("SGD {0:N2}", price);
        decimal discount = (decimal)Session["DiscountFactor"] * 100;
        lblDiscount.Text = String.Format("-{0:N2}{1}", discount, "%");
        decimal sellPrice = (price *(1- (discount / 100)));
        lblPrice.Text = String.Format("SGD {0:N2}", sellPrice);
        string ISBN = (string)Session["ISBN"];
        imgBookCover.ImageUrl = "~/images/cover/" + ISBN + ".jpg";
    }

    protected void btnAddCart_Click(object sender, EventArgs e)
    {
        addToCart();
        Response.Redirect("Default.aspx");
    }

    protected void btnBuynow_Click(object sender, EventArgs e)
    {
        addToCart();
        Response.Redirect("CartPage.aspx");
    }

    protected void addToCart()
    {
        List<int> lID;
        if (Session["BookID"] == null)
        {
            lID = new List<int>();
        }
        else
        {
            lID = (List<int>)Session["BookID"];
        }

        lID.Add((int)Session["ID"]);
        Session["BookID"] = lID;
    }
}