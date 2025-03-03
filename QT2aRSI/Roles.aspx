<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Roles.aspx.cs" Inherits="WingtipToys.QT2aRSI.Roles" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Add User</h3>
    <div id="form1">
        <table class="table table-striped table-hover">
            <tr>
                <td>UserName
                    <asp:TextBox ID="txtUserName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUserName" runat="server" ControlToValidate="txtUserName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Company
                    <asp:DropDownList ID="ddlCompany" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID">
                        <asp:ListItem Value="">Select a Company</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="rfvCompany" runat="server" ControlToValidate="ddlCompany" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>Program
                    <asp:DropDownList ID="ddlProgram" AppendDataBoundItems="true" CssClass="form-control" runat="server" DataSourceID="sdsProgram" DataTextField="ProgName" DataValueField="ProgID">
                        <asp:ListItem Value="" >Select a Program</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>FirstName
                    <asp:TextBox ID="txtFName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvFName" runat="server" ControlToValidate="txtFName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>LastName
                    <asp:TextBox ID="txtLName" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvLName" runat="server" ControlToValidate="txtLName" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>LastUpdated
                    <asp:TextBox ID="txtLastUpdated" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:CompareValidator ID="cpvLastUpdated" runat="server" ControlToValidate="txtLastUpdated" ErrorMessage="mm/dd/yyyy" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    <asp:RequiredFieldValidator ID="rfvLastUpdated" runat="server" ControlToValidate="txtLastUpdated" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
                <td>UpdatedBy
                    <asp:TextBox ID="txtUpdatedBy" CssClass="form-control" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfvUpdatedBy" runat="server" ControlToValidate="txtUpdatedBy" ErrorMessage="Required"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Role
                    <asp:DropDownList ID="ddlRole" CssClass="form-control" runat="server">
                        <asp:ListItem>Select a Role</asp:ListItem>
                        <asp:ListItem>Client</asp:ListItem>
                        <asp:ListItem>RSI</asp:ListItem>
                    </asp:DropDownList></br>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="btnAddUserToRole" Text="Add User To Role" OnClick="btnAddUserToRole_Click" CssClass="btn btn-default" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnEditUser" Text="Future:EditUser" CssClass="btn btn-default" runat="server" />
                </td>
                <td>
                    <asp:Button ID="btnRemoveUserFromRole" Text="Future:RemoveUserFromRole" CssClass="btn btn-default" runat="server" />
                </td>
                <td>
                    <asp:HyperLink ID="linkReset" NavigateUrl="~/QT2aRSI/Roles.aspx" runat="server">Reset</asp:HyperLink>
                </td>
                <td>
                    <asp:HyperLink ID="linkHome" NavigateUrl="~/Default.aspx" runat="server">Cancel</asp:HyperLink>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="sdsCompany" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [CompID], [CompanyName] FROM [Companies] ORDER BY [CompanyName]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="sdsProgram" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [ProgID], [ProgName] FROM [Programs] ORDER BY [ProgName]"></asp:SqlDataSource>
        </div>
    <div id="divIdentity">
        <h5>User Solution</h5>
        <p>
            QT2a User Solution extending the template:</br>
        A user has to be both assigned to a Role and to a Company on the Roles page.</br>
        Then the user will be associated with a company. </br>
        The user would only be allowed to see data and reports only for that company assigned.</br>
        This will be implemented at the page level using the Identity role restricting the SQL statement</br>
        to the assigned company in the S table for the user.</br>
        The Role will restrict access to allowed folder using ASP.NET Identity Roles.</br>
        QT2a Current Implementation:</br>
        S table links a user and a company.</br>
        Primary key on UserName. That makes it one company per user.  </br>
        The S table is related/constrained to the Companies table using CompID.</br>
        Each Company can have many users. Each User is associated with one Company.</br>
        Future:</br>
        Extend the Identity User by adding a property "CompID" and other fields instead of using a seperate table.</br>
        Modify ~/Models/IdentityModels.cs and add the CompID property and other fields to ApplicationUser.</br>
        Follow the methodology described below:</br>
        http://blogs.msdn.com/b/webdev/archive/2013/10/16/customizing-profile-information-in-asp-net-identity-in-vs-2013-templates.aspx </br>
        </p>
        <h5>Identity</h5>
        <p>
            QT2a security will be implemented with ASP.NET Identity.</br>
           There are 2 roles: User and SuperUser.</br>
           There are 2 folders with the same names.</br>
           Role User will only be able to access pages in the User folder.</br>
           Role SuperUser will be able to access pages in both the User folder and the SuperUser folder.</br>
           Only Role SuperUser will be able to access pages in the SuperUser folder.</br>
           Both User and SuperUser folders have individual web.config files that control access using the 2 Identity roles. </br>
           ~/SuperUser/Roles.aspx page is used to assign users to a role. User has to first create a login. 
            Then a user who has been granted the SuperUser role can add that user to either the User or SuperUser role using
            the Roles.aspx page. Since the Roles.aspx page is in the SuperUser folder, only users with SuperUser role assigned can access it.
        </p>
    </div>
</asp:Content>
