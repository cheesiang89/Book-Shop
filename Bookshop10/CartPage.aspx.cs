using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Bookshop10;

public partial class CartPage : System.Web.UI.Page
{
    Bookshop b = new Bookshop();
    List<int> lID = new List<int>();
    List<int> lQty = new List<int>();
    List<bool> lCheck = new List<bool>();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Session["BookID"] = new List<int> { 10, 13, 14, 15 };


            if (Session["BookID"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                lID = (List<int>)Session["BookID"];
                if (Session["Checked"] == null)
                {
                    lCheck = new List<bool>();
                    for (int i = 0; i < lID.Count; i++)
                    {
                        lCheck.Add(false);
                    }
                    Session["Checked"] = lCheck;
                }
                else if (((List<bool>)Session["Checked"]).Count != lID.Count())
                {
                    lCheck = ((List<bool>)Session["Checked"]);
                    for (int i = 0; i < (lID.Count - lCheck.Count); i++)
                    {
                        lCheck.Add(false);
                    }
                    Session["Checked"] = lCheck;
                }
                for (int i = 0; i < lID.Count; i++)
                {
                    lQty.Add(1);
                }




                Session["Quantity"] = lQty;
                DataRefresh();
            }


        }
    }

    protected void DataRefresh()
    {
        GridView1.DataSource = b.Books.Where(x => lID.Contains(x.BookID)).ToList<Book>();
        GridView1.DataBind();
    }

    protected void OnRowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            decimal origPrice = Convert.ToDecimal((e.Row.FindControl("OriginalUnitPriceLabel") as Label).Text.Trim(new char[] { '$' }));
            decimal discount = Convert.ToDecimal((e.Row.FindControl("DiscountLabel") as Label).Text);

            decimal discountedPrice = origPrice * (1 - discount);
            lQty = (List<int>)Session["Quantity"];
            int qty = lQty[e.Row.RowIndex];
            (e.Row.FindControl("QuantityTextBox") as TextBox).Text = qty.ToString();
            (e.Row.FindControl("UnitPriceLabel") as Label).Text = string.Format("{0:C}", discountedPrice);

            lCheck = (List<bool>)Session["Checked"];
            bool check = lCheck[e.Row.RowIndex];
            (e.Row.FindControl("CheckBox") as CheckBox).Checked = check;
            //decimal subTotalPrice = (decimal)(discountedPrice * qty);
            //(e.Row.FindControl("SubTotalPrice") as Label).Text = string.Format("{0:C}", subTotalPrice);
            CalculateSubTotal(e.Row.FindControl("QuantityTextBox"), new EventArgs());
        }
    }

    protected void CalculateSubTotal(object sender, EventArgs e)
    {
        TextBox tb = (TextBox)sender;
        GridViewRow gvr = (GridViewRow)(tb.NamingContainer);
        int qty = Convert.ToInt32(tb.Text);
        lQty = (List<int>)Session["Quantity"];
        lQty[gvr.RowIndex] = qty;

        //decimal origPrice = Convert.ToDecimal((gvr.FindControl("OriginalUnitPriceLabel") as Label).Text.Trim(new char[] { '$' }));
        //decimal discount = Convert.ToDecimal((gvr.FindControl("DiscountLabel") as Label).Text.Trim(new char[] { '$' }));
        //decimal discountedPrice = origPrice * (1-discount);
        decimal discountedPrice = Convert.ToDecimal((gvr.FindControl("UnitPriceLabel") as Label).Text.Trim(new char[] { '$' }));
        decimal subTotalPrice = (decimal)(discountedPrice * qty);
        (gvr.FindControl("SubTotalPrice") as Label).Text = string.Format("{0:C}", qty * discountedPrice);
        CalculateTotal();
    }

    protected void Delete_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)(btn.NamingContainer);
        int idToBeRemoved = Convert.ToInt32(GridView1.DataKeys[gvr.RowIndex].Value);
        //var itemToBeRemoved = li.Single(r => r == idToBeRemoved);
        //li.Remove(itemToBeRemoved);
        lID = (List<int>)Session["BookID"];
        lQty = (List<int>)Session["Quantity"];
        lCheck = (List<bool>)Session["Checked"];
        lID.RemoveAt(gvr.RowIndex);
        lQty.RemoveAt(gvr.RowIndex);
        lCheck.RemoveAt(gvr.RowIndex);
        Session["BookID"] = lID;
        Session["Quantity"] = lQty;
        Session["Checked"] = lCheck;
        DataRefresh();
        CalculateTotal();
    }

    protected void Minus_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)(btn.NamingContainer);
        lQty = (List<int>)Session["Quantity"];
        if (lQty[gvr.RowIndex] > 1)
        {
            (gvr.FindControl("QuantityTextBox") as TextBox).Text = (lQty[gvr.RowIndex] - 1).ToString();
            lQty[gvr.RowIndex] = lQty[gvr.RowIndex] - 1;
            Session["Quantity"] = lQty;
            CalculateSubTotal(gvr.FindControl("QuantityTextBox"), e);
        }
        else
        {
            //Delete_Click(sender, e);
        }

        CalculateTotal();
    }

    protected void Plus_Click(object sender, EventArgs e)
    {
        Button btn = (Button)sender;
        GridViewRow gvr = (GridViewRow)(btn.NamingContainer);
        lQty = (List<int>)Session["Quantity"];
        (gvr.FindControl("QuantityTextBox") as TextBox).Text = (lQty[gvr.RowIndex] + 1).ToString();
        lQty[gvr.RowIndex] = lQty[gvr.RowIndex] + 1;
        Session["Quantity"] = lQty;
        CalculateSubTotal(gvr.FindControl("QuantityTextBox"), e);
        CalculateTotal();
    }

    protected void CheckBox_CheckedChanged(object sender, EventArgs e)
    {
        CheckBox ckb = (CheckBox)sender;
        GridViewRow gvr = (GridViewRow)(ckb.NamingContainer);
        lCheck = (List<bool>)Session["Checked"];
        bool check = (gvr.FindControl("CheckBox") as CheckBox).Checked;
        lCheck[gvr.RowIndex] = check;
        Session["Checked"] = lCheck;
        CalculateTotal();
    }

    protected void CalculateTotal()
    {
        decimal total = 0;
        foreach (GridViewRow r in GridView1.Rows)
        {
            if ((r.FindControl("CheckBox") as CheckBox).Checked == true)
            {
                total += Convert.ToDecimal((r.FindControl("SubTotalPrice") as Label).Text.Trim(new char[] { '$' }));
            }
        }
        TotalLabel.Text = String.Format("{0:C}", total);
    }

    protected void Back_Click(object sender, EventArgs e)
    {
        Response.Redirect("Default.aspx");
    }
}
