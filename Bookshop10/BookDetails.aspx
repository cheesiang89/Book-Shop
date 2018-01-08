<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="BookDetails.aspx.cs" Inherits="BookDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
        height: 31px;
        width: 127px;
    }
        .auto-style9 {
            width: 127px;
        }
        #Button1 {
            margin:auto;
            display:inline-block;
        }
        #Table1 {
    border: 1px solid black;
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <table  id="Table1" style="width: 100%;" ;>
        <tr>
            <td class="auto-style3" rowspan="3">
                <asp:Image ID="imgBookCover" runat="server" Height="384px" Width="295px" />
            </td>
            <td class="auto-style5">
                <asp:TextBox ID="txtTitle" runat="server" BorderStyle="None" Font-Bold="True" Font-Size="X-Large" Height="110px" TextMode="MultiLine" Width="412px" ReadOnly="True" style="OVERFLOW:hidden">Book Title</asp:TextBox>
            </td>
            <td class="auto-style6">
                <asp:Label ID="lblPrice" runat="server" Text="Pricing" Font-Bold="True" Font-Size="X-Large" ForeColor="#FF0066"></asp:Label>&nbsp;
                <asp:Label ID="lblOriginalPrice" runat="server" Text="originalPrice" Font-Strikeout="True"></asp:Label>
                <br />
                <asp:Label ID="lblDiscount" runat="server" Font-Italic="True" Text="Discount" Font-Bold="True" ForeColor="#33CC33"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style4">
                <asp:Label ID="Label1" runat="server" Text="Book Details:" Font-Bold="True"></asp:Label>
                
                <br />
                
                <br />
                <table style="width:100%;">
                    <tr>
                        <td class="auto-style8">
                            <asp:Label ID="Label2" runat="server" Text="Author:"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtAuthor" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr>
                        <td class="auto-style8">
                            <asp:Label ID="Label3" runat="server" Text="Category:"></asp:Label>
                        </td>
                        <td class="auto-style7">
                            <asp:TextBox ID="txtCategory" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                        </td>
                       
                    </tr>
                    <tr>
                        <td class="auto-style9">
                            <asp:Label ID="Label4" runat="server" Text="ISBN:"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtISBN" runat="server" ReadOnly="True" BorderStyle="None"></asp:TextBox>
                        </td>
                      
                    </tr>
                </table>
                <br />
            </td>
            <td class="auto-style2">
                <asp:Image ID="Image6" runat="server" Height="48px" ImageUrl="~/images/freedelivery.png" Width="65px" />
&nbsp;<asp:Label ID="Label7" runat="server" Font-Bold="True" Text="Free delivery worldwide"></asp:Label>
                <br />
                <br />
                <asp:Button ID="btnAddCart" runat="server" BackColor="#FF0066" Font-Bold="True" ForeColor="White" Height="38px" Text="Add to Cart" Width="286px" OnClick="btnAddCart_Click" OnClientClick="alert('You have added this book into cart.')" />
                <br />
                <br />
                <asp:Button ID="btnBuynow" runat="server" BackColor="#FF0066" Font-Bold="True" ForeColor="White" Height="38px" Text="Check Out" Width="286px" OnClick="btnBuynow_Click" />
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td class="auto-style4">&nbsp;</td>
            <td class="auto-style2">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>


</asp:Content>

