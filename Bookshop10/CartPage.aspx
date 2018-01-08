<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="CartPage.aspx.cs" Inherits="CartPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDataBound="OnRowDataBound" DataKeyNames="BookID" Width="100%" CellPadding="4" ItemStyle-HorizontalAlign="Center" HeaderStyle-HorizontalAlign="Left" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:TemplateField HeaderText="" HeaderStyle-Width="5%" ItemStyle-Height="220" >
                    <ItemTemplate>
                        <asp:CheckBox ID="CheckBox" runat="server" OnCheckedChanged="CheckBox_CheckedChanged" AutoPostBack="true" />
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="5%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Image" ShowHeader="false" HeaderStyle-Width="7%" ItemStyle-Height="220" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("ISBN","~/images/cover/{0}.jpg") %>' Width="120px" Height="120px" ImageAlign="Middle" />
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="7%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Title" ShowHeader="false" HeaderStyle-Width="20%" ItemStyle-Height="220">
                    <ItemTemplate>
                        <asp:Label ID="TitleLabel" runat="server" Text='<%# Bind("Title") %>' Font-Size="X-Large"> </asp:Label>
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="20%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="UnitPrice" HeaderStyle-Width="5%" ItemStyle-Height="220">
                    <ItemTemplate>
                        <asp:Label ID="OriginalUnitPriceLabel" runat="server" Text='<%# Bind("Price","{0:C}") %>' Font-Strikeout="True" ForeColor="#666699"></asp:Label>
                        <br />
                        <asp:Label ID="UnitPriceLabel" runat="server" Text="Label" ForeColor="#FF3300" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                        <asp:Label ID="DiscountLabel" runat="server" Text='<%# Bind("DiscFact") %>' Visible="false"></asp:Label>
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="5%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Quantity" HeaderStyle-Width="15%" ItemStyle-Height="220" HeaderStyle-HorizontalAlign="center">
                    <ItemTemplate>
                        <div align="center">
                            <asp:Button ID="Minus" runat="server" Text=" - " OnClick="Minus_Click" AutoPostBack="True" />
                            <asp:TextBox ID="QuantityTextBox" runat="server" OnTextChanged="CalculateSubTotal" AutoPostBack="True" Width="100"></asp:TextBox>
                            <asp:Button ID="Plus" runat="server" Text=" + " OnClick="Plus_Click" AutoPostBack="True" />
                        </div>
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="15%"></ItemStyle>
                </asp:TemplateField>


                <asp:TemplateField HeaderText="SubTotal" HeaderStyle-Width="5%" ItemStyle-Height="220" HeaderStyle-HorizontalAlign="left">
                    <ItemTemplate>
                        <asp:Label ID="SubTotalPrice" runat="server" Text="Calculating" Font-Size="X-Large" align="center"></asp:Label>
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="5%"></ItemStyle>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="" HeaderStyle-Width="5%" ItemStyle-Height="220" HeaderStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <asp:Button ID="DelteButton" runat="server" Text="Delete" OnClick="Delete_Click" Height="25px" Width="80px" align="right"/>
                    </ItemTemplate>

                    <ItemStyle Height="200px" Width="5%"></ItemStyle>
                </asp:TemplateField>


            </Columns>
            <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" Font-Size="X-Large" />
            <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
            <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#242121" />
        </asp:GridView>

        <table style="width: 100%;">
            <tr>
                <td width="80%"></td>
                <td width="20%" align="right">
                    <asp:Label ID="Total" runat="server" Text="Total Price: " Font-Bold="True" Font-Size="X-Large"></asp:Label>
                    <asp:Label ID="TotalLabel" runat="server" Text="$0.00" Font-Size="XX-Large" ForeColor="Red" Font-Bold="True"></asp:Label>
                </td>
            </tr>
            <tr>
                <td width="80%"></td>
                <td width="20%" align="right">
                    <asp:Button ID="PayButton" runat="server" Text="Pay" Height="25px" Width="80px" />
                    <asp:Button ID="Back" runat="server" Text="Back" OnClick="Back_Click" Height="25px" Width="80px" />
                </td>
            </tr>
        </table>
</asp:Content>

