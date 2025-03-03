<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="WingtipToys.QT2a.Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
        <div id="divReportsForm">
            <table class="table table-striped table-hover">
                <tr>
                    <td>
                        <h3>Reports</h3>
                    </td>
                </tr>
<%--                <tr>
                    <td>
                        <h4>The start and end dates are not working for R360. So this has been removed from the sql statement -> and D.RandomDate>="+txtStartDate.Text+" and D.RandomDate<="+txtEndDate.Text+ " 
                </br>That means if you don't put it back in, no dates are needed on this form.</h4>
                    </td>
                </tr>--%>
<%--                <tr>
                    <td>Start Date:<asp:TextBox ID="txtStartDate" runat="server"></asp:TextBox>
                        End Date:<asp:TextBox ID="txtEndDate" runat="server"></asp:TextBox>
                    </td>
                </tr>--%>
<%--                <tr>
                    <td>
                        <asp:CompareValidator ID="cpvStartDate" runat="server" ControlToValidate="txtStartDate" ErrorMessage=" Start Date Invalid - mm/dd/yyyy" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                        <asp:CompareValidator ID="cpvEndDate" runat="server" ControlToValidate="txtEndDate" ErrorMessage=" End Date Invalid - mm/dd/yyyy" Operator="DataTypeCheck" Type="Date"></asp:CompareValidator>
                    </td>
                </tr>--%>
                <tr>
                    <td>
                        <asp:Label ID="lblCompany" runat="server" Text="Company:"></asp:Label>
                    </td>
                    <tr>
                        <td>
                            <asp:DropDownList ID="ddlCompany" runat="server" AppendDataBoundItems="True" AutoPostBack="True" OnSelectedIndexChanged="ddlCompany_SelectedIndexChanged">
                                <asp:ListItem Value="">Select a Company</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnEmployeeList" runat="server" Text="Employee List" OnClick="btnEmployeeList_Click" CssClass="btn btn-default"/>
                        &nbsp&nbsp&nbsp&nbsp&nbsp              
                        <asp:Button ID="btnRandomList" runat="server" Text="Randomly Selected List R360" OnClick="btnRandomList_Click" CssClass="btn btn-default"/>
                        &nbsp&nbsp&nbsp&nbsp&nbsp              
                        <asp:Button ID="btnDriverQualificationFile" runat="server" Text="Driver Qualification File" OnClick="btnDriverQualificationFile_Click" CssClass="btn btn-default"/>
                        &nbsp&nbsp&nbsp&nbsp&nbsp              
                        <asp:Button ID="btnDriverDrugAndAlcoholTestingFile" runat="server" Text="Driver Drug and Alcohol Testing File" OnClick="btnDAATF_Click" CssClass="btn btn-default"/>
                    </td>
                </tr>
            </table>
            <asp:Label ID="lblEmployeeListNoEmployees" Visible="False" Text="Employee List: No Employees" runat="server"></asp:Label></br>
            <asp:Button ID="btnEmployeeListEmail" Visible="false" OnClick="btnEmployeeListEmail_Click" CssClass="btn btn-default" runat="server" Text="Send Email" />
            <asp:TextBox ID="txtUserNameEmployeeList" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Repeater ID="repeaterEmployeeList" runat="server">
                <HeaderTemplate>
                    <table id="tableEmployeeList" class="table table-striped table-hover" border="1">
                        <h3>Employee List</h3>
                        <tr>
                            <th>Employee Name</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href='<%: MyUtilities2.WebsiteUrl %>QT2a/ReportsDetail.aspx?EmployeeId=<%#DataBinder.Eval(Container.DataItem, "EmployeeID")%>'><%#DataBinder.Eval(Container.DataItem, "EmployeeName")%></a></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
            <asp:Label ID="lblRandomListNoEmployees" Visible="False" Text="Randomly Selected List R360: No Employees" runat="server"></asp:Label></br>
            <asp:Button ID="btnRandomListEmail" Visible="false" OnClick="btnRandomListEmail_Click" CssClass="btn btn-default" runat="server" Text="Send Email" />
            <asp:TextBox ID="txtUserNameRandomList" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Repeater ID="repeaterRandomList" runat="server">
                <HeaderTemplate>
                    <table id="tableRandomList" border="1" class="table table-striped table-hover">
                        <h3>Randomly Selected Employee List</h3>
                        <tr>
                            <th>Employee Name</th>
                            <th>Randomly Selected Date</th>
                            <th>Collection Date</th>
                            <th>CDL Driver</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href='<%: MyUtilities2.WebsiteUrl %>QT2a/ReportsDetail.aspx?EmployeeId=<%#DataBinder.Eval(Container.DataItem, "EmployeeID")%>'><%#DataBinder.Eval(Container.DataItem, "EmployeeName")%></a></td>
                        <td><%#DataBinder.Eval(Container.DataItem, "RandomDate")%></td>
                        <td><%#DataBinder.Eval(Container.DataItem, "CollectionDate")%></td>
                        <td><%#DataBinder.Eval(Container.DataItem, "CDLDriver")%></td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:Repeater>
            <asp:Label ID="lblDQFNoEmployees" Visible="False" Text="Driver Qualification File: No Employees" runat="server"></asp:Label></br>
            <asp:Button ID="btnEmailDQF" Visible="false" OnClick="btnEmailDQF_Click" CssClass="btn btn-default" runat="server" Text="Send Email" />
            <asp:TextBox ID="txtUserName" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Repeater ID="repeaterDQF" OnItemDataBound="repeaterDQF_ItemDataBound" runat="server">
                <HeaderTemplate>
                    <table id="tableDQF" border="1" class="table table-striped table-hover">
                        <h3>Driver Qualification File</h3>
                        <tr>
                            <th>Employee Name</th>
                            <th>Q200</th>
                            <th>Q300</th>
<%--                            <th>Q335</th>--%>
                            <th>Q400</th>
                            <th>Q500</th>
                            <th>Q600</th>
<%--                            <th>Q610</th>
                            <th>Q700</th>--%>
                            <th>Q800</th>
                            <th>Q900</th>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href='<%: MyUtilities2.WebsiteUrl %>QT2a/ReportsDetail.aspx?EmployeeId=<%#DataBinder.Eval(Container.DataItem, "EmployeeID")%>'><%#DataBinder.Eval(Container.DataItem, "EmployeeName")%></a></td>
                        <%-- THESE TECHNIQUES WORK AND SHOULD BE KEPT AS REFERENCE.
     ONE IS A NESTED REPEATER.
     THE OTHER IS A NESTED DETAILSVIEW.
     THE MATCHING CODE IS ALSO COMMENTED OUT IN THE CODE BEHIND.
                              <td>
                          <asp:Repeater id="repeaterQ200" runat="server">
                                  <HeaderTemplate></HeaderTemplate>
                                  <ItemTemplate>
                                      <%# ((Eval("Status").ToString() == "R")||(Eval("Status").ToString() == "CR")||(Eval("Status").ToString() == "PR"))?"<img src='Images/greenlight.gif'>"  : ((Eval("Status").ToString() == "E")||(Eval("Status").ToString() == "G")) ? "<img src='Images/yellowlight.gif'>" : "<img src='Images/redlight.gif'>" %>                             
                                      <a href='Doc.aspx?txtDocId=<%#DataBinder.Eval(Container.DataItem, "DocID")%>'><img src='Images/doc01.gif'></a>
                                      </ItemTemplate>
                                  <FooterTemplate>
                                      <asp:Image id="imageQ200redlight" Visible="False" ImageUrl="~/Images/redlight.gif" runat="server" />
                                  </FooterTemplate>
                              </asp:Repeater>
                          </td>
                          <td>Q300 Details View<asp:DetailsView ID="dtvQ300" runat="server" Height="50px" Width="125px"></asp:DetailsView></td>--%>
                        <td>
                            <asp:Image ID="imageQ200" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ200" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageQ300" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ300" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
<%--                        <td>
                            <asp:Image ID="imageQ335" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ335" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>--%>
                        <td>
                            <asp:Image ID="imageQ400" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ400" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageQ500" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ500" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageQ600" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ600" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
<%--                        <td>
                            <asp:Image ID="imageQ610" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ610" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageQ700" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ700" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>--%>
                        <td>
                            <asp:Image ID="imageQ800" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ800" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageQ900" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkQ900" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    <h6>Each DocType can have their own criteria, currently select top 1 by DocID descending so it will list the latest document created of that type.</h6>
                </FooterTemplate>
            </asp:Repeater>
            <asp:Label ID="lblDAATFNoEmployees" Visible="False" Text="Driver Drug And Alchohol Testing File: No Employees" runat="server"></asp:Label></br>
            <asp:Button ID="btnDAATFEmail" Visible="false" OnClick="btnDAATFEmail_Click" CssClass="btn btn-default" runat="server" Text="Send Email" />
            <asp:TextBox ID="txtUserNameDAATF" Visible="false" CssClass="form-control" runat="server"></asp:TextBox>
            <asp:Repeater ID="repeaterDAATF" OnItemDataBound="repeaterDAATF_ItemDataBound" runat="server">
                <HeaderTemplate>
                    <table id="tableDAATF" border="1" class="table table-striped table-hover">
                        <h3>Driver Drug And Alcohol Testing File</h3>
                        <tr>
                            <th>Employee Name</th>
                            <th>I210</th>
                            <th>I315</th>
                            <th>I400</th>
<%--                            <th>I500</th>--%>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                    <tr>
                        <td><a href='<%: MyUtilities2.WebsiteUrl %>QT2a/ReportsDetail.aspx?EmployeeId=<%#DataBinder.Eval(Container.DataItem, "EmployeeID")%>'><%#DataBinder.Eval(Container.DataItem, "EmployeeName")%></a></td>
                        <td>
                            <asp:Image ID="imageI210" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkI210" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageI315" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkI315" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
                        <td>
                            <asp:Image ID="imageI400" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkI400" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>
<%--                        <td>
                            <asp:Image ID="imageI500" ImageUrl="~/Images/redlight.gif" runat="server" />
                            <asp:HyperLink Target="_blank" ID="linkI500" ImageUrl="~/Images/doc01.gif" runat="server" />
                        </td>--%>
                    </tr>
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                    <h6>It will list the latest document created of that type.</h6>
                </FooterTemplate>
            </asp:Repeater>
        </div>
    </asp:Content>
