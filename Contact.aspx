<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WingtipToys.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h3><%: Title %></h3>
    <address>
        <asp:Label ID="lblCompanyName" runat="server" Text="SetInCodeBehind"></asp:Label></br>
        <asp:Label ID="lblCompanyAddress" runat="server" Text="SetInCodeBehind"></asp:Label></br>
        <asp:Label ID="lblCompanyCityStateZip" runat="server" Text="SetInCodeBehind"></asp:Label></br>
        <asp:Label ID="lblCompanyPhone" runat="server" Text="SetInCodeBehind"></asp:Label></br>
        <asp:Label ID="lblCompanyEmail" runat="server" Text="SetInCodeBehind"></asp:Label>
    </address>

    <address>
        <strong>Support: </strong><asp:HyperLink ID="lnkSupport" runat="server"></asp:HyperLink>
    </address>
</asp:Content>
