<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPageAdmin.master" AutoEventWireup="true" CodeFile="DefaultAdmin.aspx.cs" Inherits="DefaultAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <asp:textbox runat="server" ID="SearchBox" Width="281px" BorderColor="#00CC00" BorderStyle="Double" Height="30px"></asp:textbox>
    <asp:button runat="server" text="Search" ID="SearchBtn" OnClick="SearchBtn_Click" Height="36px" Width="75px" BackColor="#CCCCCC" BorderColor="#999999" />
    <br />
    <br/>
    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
        <HeaderTemplate>
        </HeaderTemplate>
        <ItemTemplate>
        <table border="1" style="width: 100%;">
            <tr>
                <td style="width: 120px">Title</td>
                <td style="width: 300px">
                    <asp:TextBox ID="Title" runat="server" Text='<%# Eval("Title") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                </td>
            </tr>
            <tr>
               <td style="width: 120px">Category</td>
                <td style="width: 300px">
                <asp:TextBox ID="CategoryID" runat="server" Text='<%# Eval("CategoryID") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                </td>
              </tr>
            <tr>
                <td style="width: 120px">ISBN</td>
                <td style="width: 300px">
                <asp:TextBox ID="ISBN" runat="server" Text='<%# Eval("ISBN") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                </td>
              </tr>
            <tr>
               <td style="width: 120px">Author</td>
               <td style="width: 300px">
               <asp:TextBox ID="Author" runat="server" Text='<%# Eval("Author") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                    </td>
                 </tr>
            <tr>
                <td style="width: 120px">Stock</td>
                <td style="width: 300px">
                <asp:TextBox ID="Stock" runat="server" Text='<%# Eval("Stock") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                   </td>
              </tr>
            <tr>
                <td style="width: 120px">Price</td>
                <td style="width: 300px">
                <asp:TextBox ID="Price" runat="server" Text='<%# Eval("Price") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                    </td>            
                 </tr>
            <tr>
                <td style="width: 120px">Discount Factor</td>
                <td style="width: 300px">
                <asp:TextBox ID="DiscFact" runat="server" Text='<%# Eval("DiscFact") %>' ReadOnly="True" BackColor="Silver" Width="400px"></asp:TextBox>
                </td>
                   </tr>
            <tr>
                <td style="width: 120px">
                    <asp:Button ID="edit" runat="server" Text="Edit" CommandName="edit" />
                    <asp:Button ID="update" runat="server" Text="update" CommandName="update" />
                </td>
                <td style="width: 300px">
                   <%-- <asp:Button ID="Delete" runat="server" Text="Delete" CommandName="delete" /></td>--%>
            </tr>
            
        </table>
            <br />
            </ItemTemplate>
    </asp:Repeater>
</asp:Content>

