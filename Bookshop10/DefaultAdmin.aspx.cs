using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop10;

public partial class DefaultAdmin : System.Web.UI.Page
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

    protected void SearchBtn_Click(object sender, EventArgs e)
    {
        string Title = SearchBox.Text;
        try
        {
            Repeater1.DataSource = b.GetSearchBook(Title);
            Repeater1.DataBind();
        }
        catch (Exception exp)
        {
            Response.Write(exp.ToString());
        }
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "edit")
        {
            TextBox Stock = (e.Item.FindControl("Stock") as TextBox);
            Stock.ReadOnly = false;
            Stock.BackColor = System.Drawing.Color.White;

            TextBox Price = (e.Item.FindControl("Price") as TextBox);
            Price.ReadOnly = false;
            Price.BackColor = System.Drawing.Color.White;

            TextBox DiscFact = (e.Item.FindControl("DiscFact") as TextBox);
            DiscFact.ReadOnly = false;
            DiscFact.BackColor = System.Drawing.Color.White;

            Button update = (e.Item.FindControl("update") as Button);
            update.Visible = true;

            Button edit = (e.Item.FindControl("edit") as Button);
            edit.Visible = false;

        }
        if (e.CommandName == "update")
        {
            TextBox Stock = (e.Item.FindControl("Stock") as TextBox);
            TextBox Price = (e.Item.FindControl("Price") as TextBox);
            TextBox DiscFact = (e.Item.FindControl("DiscFact") as TextBox);
            //if (Convert.ToInt32(Stock.Text) > 0 && Convert.ToDecimal(Price.Text) > 0 && Convert.ToDecimal(DiscFact.Text) < 1 && Convert.ToDecimal(DiscFact.Text) > 0)
            //{
            using (Bookshop context = new Bookshop())
            {
                TextBox ISBN = (e.Item.FindControl("ISBN") as TextBox);

                Book b = context.Books.Where(x => x.ISBN == ISBN.Text).First<Book>();


                b.Stock = Convert.ToInt32(Stock.Text);


                b.Price = Convert.ToDecimal(Price.Text);


                b.DiscFact = Convert.ToDecimal(DiscFact.Text);

                context.SaveChanges();

                //Response.Redirect("~/DefaultAdmin.aspx");

                Stock.ReadOnly = true;
                Stock.BackColor = System.Drawing.Color.Silver;

                Price.ReadOnly = true;
                Price.BackColor = System.Drawing.Color.Silver;

                DiscFact.ReadOnly = true;
                DiscFact.BackColor = System.Drawing.Color.Silver;

                Button update = (e.Item.FindControl("update") as Button);
                update.Visible = false;

                Button edit = (e.Item.FindControl("edit") as Button);
                edit.Visible = true;
            }
            //}
            //else
            //{
            //    Response.Redirect("~/DefaultAdmin.aspx");
            //}

        }
    }


}