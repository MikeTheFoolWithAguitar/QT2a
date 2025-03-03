<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="WingtipToys.QT2aRSI.Dashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<table class="table table-striped table-hover">
    <tr>
        <td>
            <h3>Dashboard</h3>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="lnkEmployees" NavigateUrl="~/QT2aRSI/EmployeeInfo.aspx" runat="server">Employees</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="lnkRandomSelection" NavigateUrl="~/QT2aRSI/RandomSelection.aspx" runat="server">Random Selection</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="lnkUsers" NavigateUrl="~/QT2aRSI/Roles.aspx" runat="server">Users</asp:HyperLink>
        </td>
    </tr>
    <tr>
        <td>
            <asp:HyperLink ID="lnkTables" NavigateUrl="~/QT2aRSI/Tables.aspx" runat="server">Tables</asp:HyperLink>
        </td>
    </tr>
</table>
</asp:Content>
