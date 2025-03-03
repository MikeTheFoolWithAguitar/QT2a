<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="RandomSelection.aspx.cs" Inherits="WingtipToys.QT2aRSI.RandomSelection" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
       <div id=divRandomSelection>
            <table class="table table-striped table-hover">
                <tr><td><h4>Random Selection - True Random Selection Pool *</h4>
                <tr>
                    <td>Program
                        <asp:DropDownList ID="ddlProgram" runat="server" AppendDataBoundItems="True" AutoPostBack="true" OnSelectedIndexChanged="ddlProgram_SelectedIndexChanged"></asp:DropDownList>
                    </td>
                </tr>
                    <tr>
                        <td>
                            <asp:Button ID="btnRandomSelection" runat="server" Text="RandomSelection" OnClick="btnRandomSelection_Click" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                            &nbsp
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label id="lblRandomlySelectedEmployee" Visible="False" runat="server"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label id="lblRandomlySelectedEmployeeID" Visible="False" runat="server"/>
                            <asp:Label id="lblRandomlySelectedEmployeeFName" Visible="False" runat="server"/>
                            <asp:Label id="lblRandomlySelectedEmployeeMInitial" Visible="False" runat="server"/>
                            <asp:Label id="lblRandomlySelectedEmployeeLName" Visible="False" runat="server"/>
                        </td>
                    </tr>
                    <tr><td>&nbsp</td></tr>
                    <tr><td><asp:Label id="lblAddRandomSelectionRecord" Visible="False" runat="server"/></td></tr>
                    <tr><td><asp:Button ID="btnAddRandomSelectionRecord" Visible="False" runat="server" Text="AddRandomSelectionRecord" OnClick="btnAddRandomSelectionRecord_Click" /></td></tr>
                    <tr><td>&nbsp</td></tr>
                    <tr><td><h5>* True Random Selection Pool - All current employees from all companies in the selected program are included in the random selection pool.</br>
                                * For Consortium 6 - Quarterly Testing DOT and Non DOT - Additional criteria is that only CDL drivers are included in the random selection pool.</h5>
            </table>
        </div>
</asp:Content>
