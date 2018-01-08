<%@ Page Title="" Language="C#" MasterPageFile="~/master.Master" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        #Login1 {
            
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:Login ID="Login1" runat="server" OnLoginError="Login1_LoginError">
</asp:Login>
    <br />
    <asp:Label ID="Label1" runat="server" Text="Create New Account: "></asp:Label><asp:Button ID="Button1" runat="server" Text="Sign Up" OnClick="Button1_Click" />
</asp:Content>


