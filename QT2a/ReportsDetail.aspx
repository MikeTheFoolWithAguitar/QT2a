<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ReportsDetail.aspx.cs" Inherits="WingtipToys.QT2a.ReportsDetail" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="sdsQueryString" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [LName], [FName], [MInitial], [Title], [CDLdriver], [CMVdriver], [LicSt], [LicenseNo], [LicenseClass], [Sex], [BirthDate], [AirBrakeRestr], [Notes], [Address1], [City1], [State1], [ZipCode1], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [LastUpdated], [UpdatedBy] FROM [Employees] WHERE ([EmployeeID] = @EmployeeID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="EmployeeID" Name="EmployeeID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:DetailsView ID="dtvEmployee" Visible="false" HeaderText="Individual" CssClass="table table-striped table-hover" runat="server" AutoGenerateRows="False" DataSourceID="sdsQueryString">
        <Fields>
            <asp:BoundField DataField="LName" HeaderText="LastName" SortExpression="LName"></asp:BoundField>
            <asp:BoundField DataField="FName" HeaderText="FirstName" SortExpression="FName"></asp:BoundField>
            <asp:BoundField DataField="MInitial" HeaderText="MInitial" SortExpression="MInitial"></asp:BoundField>
            <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title"></asp:BoundField>
            <asp:CheckBoxField DataField="CDLdriver" HeaderText="CDLdriver" SortExpression="CDLdriver"></asp:CheckBoxField>
            <asp:CheckBoxField DataField="CMVdriver" HeaderText="CMVdriver" SortExpression="CMVdriver"></asp:CheckBoxField>
            <asp:BoundField DataField="LicSt" HeaderText="LicSt" SortExpression="LicSt"></asp:BoundField>
            <asp:BoundField DataField="LicenseNo" HeaderText="LicenseNo" SortExpression="LicenseNo"></asp:BoundField>
            <asp:BoundField DataField="LicenseClass" HeaderText="LicenseClass" SortExpression="LicenseClass"></asp:BoundField>
            <asp:CheckBoxField DataField="Sex" HeaderText="Sex" SortExpression="Sex"></asp:CheckBoxField>
            <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate"></asp:BoundField>
            <asp:CheckBoxField DataField="AirBrakeRestr" HeaderText="AirBrakeRestr" SortExpression="AirBrakeRestr"></asp:CheckBoxField>
            <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes"></asp:BoundField>
            <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1"></asp:BoundField>
            <asp:BoundField DataField="City1" HeaderText="City1" SortExpression="City1"></asp:BoundField>
            <asp:BoundField DataField="State1" HeaderText="State1" SortExpression="State1"></asp:BoundField>
            <asp:BoundField DataField="ZipCode1" HeaderText="ZipCode1" SortExpression="ZipCode1"></asp:BoundField>
            <asp:BoundField DataField="PhoneNo1" HeaderText="PhoneNo1" SortExpression="PhoneNo1"></asp:BoundField>
            <asp:BoundField DataField="PhoneNo2" HeaderText="PhoneNo2" SortExpression="PhoneNo2"></asp:BoundField>
            <asp:BoundField DataField="PhoneNo3" HeaderText="PhoneNo3" SortExpression="PhoneNo3"></asp:BoundField>
            <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax"></asp:BoundField>
            <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail"></asp:BoundField>
            <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated"></asp:BoundField>
            <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy"></asp:BoundField>
        </Fields>
    </asp:DetailsView>
    <asp:SqlDataSource ID="sdsDocument" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="select  ds.description as CurrentStatus, dt.description as Document, d.ExpirationDate, d.DateCreated, d.FileName, d.Notes, d.DateReviewed, d.Location, d.DocFormat, d.Reviewer, d.Completed, d.DocOrder, d.LastUpdated, d.UpdatedBy from documents d inner join docstatus ds ON d.status=ds.status inner join doctypes dt ON d.DocTypeID=dt.DocTypeID WHERE (d.DocID = @DocID)">
        <SelectParameters>
            <asp:QueryStringParameter QueryStringField="DocID" Name="DocID" Type="Int32"></asp:QueryStringParameter>
        </SelectParameters>    
    </asp:SqlDataSource>
    <asp:DetailsView ID="dtvDocument" HeaderText="Document" Visible="false" CssClass="table table-striped table-hover" runat="server" DataSourceID="sdsDocument"></asp:DetailsView>
</asp:Content>
