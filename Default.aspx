<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WingtipToys._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <h1><%: Title %></h1>
        <h2>QualifiedTruckers.com can help you.</h2>
        <p class="lead">We're all about keeping your company in compliance with DOT regulations.</p>
        <p class="lead">We are a third party administrator of required DOT drug and alcohol testing programs.</p>
        <p class="lead">
            <asp:HyperLink ID="lnkAbout" NavigateUrl="~/About.aspx" runat="server">About</asp:HyperLink>&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
            <asp:HyperLink ID="lnkContact" NavigateUrl="~/Contact.aspx" runat="server">Contact Us</asp:HyperLink>
        </p>
</asp:Content>
