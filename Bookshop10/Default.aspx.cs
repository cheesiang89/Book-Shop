using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop10;

public partial class _Default : System.Web.UI.Page
{
    BusinessLogic b = new BusinessLogic();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            Repeater1.DataSource = b.GetBooks;
            Repeater1.DataBind();
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string title = TextBox1.Text;
        try
        {
            Repeater1.DataSource = b.GetSearchBook(title);
            Repeater1.DataBind();
        }
        catch (Exception exp)
        {
            Response.Write(exp.ToString());
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "select")
        {
            Label isbn = (e.Item.FindControl("ISBN") as Label);
            string ISBN = isbn.Text;

            using (Bookshop bs = new Bookshop())
            {
                Book bk = bs.Books.Where(x => x.ISBN == ISBN).ToList()[0];
                Session["ID"] = bk.BookID;
                Session["Title"] = bk.Title;
                Session["ISBN"] = bk.ISBN;
                Session["Author"] = bk.Author;
                Session["CategoryID"] = bk.CategoryID;
                Session["Price"] = bk.Price;
                Session["DiscountFactor"] = bk.DiscFact;


                var query = from x in bs.Books where x.ISBN == ISBN select new { x.Category.Name };
                Session["CategoryName"] = query.First().Name.ToString();


            }
            Response.Redirect("BookDetails.aspx");
        }
    }
}