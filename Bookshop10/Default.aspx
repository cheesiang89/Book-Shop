<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 427px;
        }
        .auto-style2 {
            width: 448px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <asp:Label ID="homePagelbl" runat="server" Text="Bookshop10 Home Page" 
                            ForeColor="black" Font-Size="X-Large" CSSclass="col text-center"></asp:Label>
     <table>
        <tr>
            <td><asp:TextBox ID="TextBox1" runat="server" AutoPostBack="False"></asp:TextBox></td>
            <td>
                   <asp:Button ID="Button1" runat="server" Text="Search Book" OnClick="Button1_Click"/>
                <br />
            </td>
        </tr>
         
    </table>
    <br />
<asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
    <HeaderTemplate>
    </HeaderTemplate>
    <ItemTemplate>
    <table border="1">
        <tr>
            <td style="width: 120px">
                Title
            </td>
        <td style="width: 300px">
            <asp:Label ID="Title" runat="server" Text='<%# Eval("Title") %>' />
        </td>
        </tr>
        <tr>
            <td >
                CategoryID
            </td>
        <td>
            <asp:Label ID="CategoryID" runat="server" Text='<%# Eval("CategoryID") %>' />
        </td>
         </tr>
        <tr>
            <td>
                ISBN
            </td>
       <td>
            <asp:Label ID="ISBN" runat="server" Text='<%# Eval("ISBN") %>' />
        </td>
        </tr>
        <tr>
            <td>
                Author
            </td>
       <td>
            <asp:Label ID="Author" runat="server" Text='<%# Eval("Author") %>' />
        </td>
        </tr>
        <tr>
            <td>
                Price
            </td>
       <td>
            <asp:Label ID="Price" runat="server" Text='<%# Eval("Price") %>' />
        </td>
        </tr>
        <tr>
           
       <td colspan="2">
           <asp:Button ID= "btnISBN" runat="server" Text='Select' CommandName="select" />
        </td>
        </tr>
    </table>
        <p></p>
    </ItemTemplate>
    <FooterTemplate>
    </FooterTemplate>
    </asp:Repeater>
   

</asp:Content>


