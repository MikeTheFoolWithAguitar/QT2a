<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SQLCommandLine.aspx.cs" Inherits="WingtipToys.QT2aRSI.SQLCommandLine" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<h3>SQLCommandLine</h3>
    <asp:TextBox ID="txtSQLCommandLine"  Text="EnterSQLStatementHere" runat="server" TextMode="MultiLine" Rows="5" Columns="100"/></br>
	<%--<asp:Button ID="btnNonQuery"  runat="server" Text="Execute Non Query" OnClick="btnNonQuery_Click" />
	<asp:Button ID="btnQuery"  runat="server" Text="Execute Query" OnClick="btnQuery_Click" /></br>
    --%><asp:Button ID="btnSQLCommand"  runat="server" Text="Execute SQL Command" OnClick="btnSQLCommand_Click" /></br>
    <asp:Label ID="lblNonQuery" Visible="false" runat="server" Text="SetWhenClicked"></asp:Label>
    <asp:GridView ID="gvQueryResults" runat="server"></asp:GridView>
</asp:Content>
