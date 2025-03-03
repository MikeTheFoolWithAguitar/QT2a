<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="EmployeeInfo.aspx.cs" Inherits="WingtipToys.QT2aRSI.EmployeeInfo" MaintainScrollPositionOnPostback="true" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div id="divEmployeeInfo">
            <h2>Employee Information</h2>
            <asp:DropDownList ID="ddlEmployee" AutoPostBack="true"  OnSelectedIndexChanged="ddlEmployee_SelectedIndexChanged" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" runat="server" AppendDataBoundItems="true" >
                 <asp:ListItem Value="">Select an Employee</asp:ListItem>
            </asp:DropDownList>
            <p>
                <asp:Button ID="btnEmployees" Visible="false" CssClass="btn btn-default" runat="server" Text="Employee Info" OnClick="btnEmployees_Click" />
                <asp:Button ID="btnDocuments" Visible="false" CssClass="btn btn-default" runat="server" Text="Documents" OnClick="btnDocuments_Click" />
                <asp:Button ID="btnDrugTestResults" Visible="false" CssClass="btn btn-default" runat="server" Text="DrugTestResults" OnClick="btnDrugTestResults_Click" />
                <asp:Button ID="btnPreviousEmployers" Visible="false" CssClass="btn btn-default" runat="server" Text="CurrentAndPreviousEmployers" OnClick="btnPreviousEmployers_Click" />
                <div id="divEmployee">
                <asp:Label ID="lblEmployees" Visible="false" runat="server" Text="Employee Information"></asp:Label>
                <asp:SqlDataSource ID="sdsForDdlCompanyInEmployeeDtv" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [CompID], [CompanyName] FROM [Companies] ORDER BY [CompanyName]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsEmployee" OnSelecting="sdsEmployee_Selecting" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND [LName] = @original_LName AND [FName] = @original_FName AND (([MInitial] = @original_MInitial) OR ([MInitial] IS NULL AND @original_MInitial IS NULL)) AND [SSNo] = @original_SSNo AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([CDLdriver] = @original_CDLdriver) OR ([CDLdriver] IS NULL AND @original_CDLdriver IS NULL)) AND (([CMVdriver] = @original_CMVdriver) OR ([CMVdriver] IS NULL AND @original_CMVdriver IS NULL)) AND (([LicSt] = @original_LicSt) OR ([LicSt] IS NULL AND @original_LicSt IS NULL)) AND (([LicenseNo] = @original_LicenseNo) OR ([LicenseNo] IS NULL AND @original_LicenseNo IS NULL)) AND (([LicenseClass] = @original_LicenseClass) OR ([LicenseClass] IS NULL AND @original_LicenseClass IS NULL)) AND (([Sex] = @original_Sex) OR ([Sex] IS NULL AND @original_Sex IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AirBrakeRestr] = @original_AirBrakeRestr) OR ([AirBrakeRestr] IS NULL AND @original_AirBrakeRestr IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [Employees] ([CompID], [LName], [FName], [MInitial], [SSNo], [Title], [CDLdriver], [CMVdriver], [LicSt], [LicenseNo], [LicenseClass], [Sex], [BirthDate], [AirBrakeRestr], [Notes], [Address1], [City1], [State1], [ZipCode1], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [LastUpdated], [UpdatedBy]) VALUES (@CompID, @LName, @FName, @MInitial, @SSNo, @Title, @CDLdriver, @CMVdriver, @LicSt, @LicenseNo, @LicenseClass, @Sex, @BirthDate, @AirBrakeRestr, @Notes, @Address1, @City1, @State1, @ZipCode1, @PhoneNo1, @PhoneNo2, @PhoneNo3, @Fax, @EMail, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Employees] where EmployeeID=@EmployeeID ORDER BY [LName], [FName]" UpdateCommand="UPDATE [Employees] SET [CompID] = @CompID, [LName] = @LName, [FName] = @FName, [MInitial] = @MInitial, [SSNo] = @SSNo, [Title] = @Title, [CDLdriver] = @CDLdriver, [CMVdriver] = @CMVdriver, [LicSt] = @LicSt, [LicenseNo] = @LicenseNo, [LicenseClass] = @LicenseClass, [Sex] = @Sex, [BirthDate] = @BirthDate, [AirBrakeRestr] = @AirBrakeRestr, [Notes] = @Notes, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [PhoneNo1] = @PhoneNo1, [PhoneNo2] = @PhoneNo2, [PhoneNo3] = @PhoneNo3, [Fax] = @Fax, [EMail] = @EMail, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [EmployeeID] = @original_EmployeeID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND [LName] = @original_LName AND [FName] = @original_FName AND (([MInitial] = @original_MInitial) OR ([MInitial] IS NULL AND @original_MInitial IS NULL)) AND [SSNo] = @original_SSNo AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([CDLdriver] = @original_CDLdriver) OR ([CDLdriver] IS NULL AND @original_CDLdriver IS NULL)) AND (([CMVdriver] = @original_CMVdriver) OR ([CMVdriver] IS NULL AND @original_CMVdriver IS NULL)) AND (([LicSt] = @original_LicSt) OR ([LicSt] IS NULL AND @original_LicSt IS NULL)) AND (([LicenseNo] = @original_LicenseNo) OR ([LicenseNo] IS NULL AND @original_LicenseNo IS NULL)) AND (([LicenseClass] = @original_LicenseClass) OR ([LicenseClass] IS NULL AND @original_LicenseClass IS NULL)) AND (([Sex] = @original_Sex) OR ([Sex] IS NULL AND @original_Sex IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AirBrakeRestr] = @original_AirBrakeRestr) OR ([AirBrakeRestr] IS NULL AND @original_AirBrakeRestr IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <SelectParameters>
                       <asp:ControlParameter ControlID="ddlEmployee" ConvertEmptyStringToNull="true" Name="EmployeeID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_LName" Type="String" />
                        <asp:Parameter Name="original_FName" Type="String" />
                        <asp:Parameter Name="original_MInitial" Type="String" />
                        <asp:Parameter Name="original_SSNo" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_CDLdriver" Type="Boolean" />
                        <asp:Parameter Name="original_CMVdriver" Type="Boolean" />
                        <asp:Parameter Name="original_LicSt" Type="String" />
                        <asp:Parameter Name="original_LicenseNo" Type="String" />
                        <asp:Parameter Name="original_LicenseClass" Type="String" />
                        <asp:Parameter Name="original_Sex" Type="Boolean" />
                        <asp:Parameter Name="original_BirthDate" Type="DateTime" />
                        <asp:Parameter Name="original_AirBrakeRestr" Type="Boolean" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompID" Type="Int32" />
                        <asp:Parameter Name="LName" Type="String" />
                        <asp:Parameter Name="FName" Type="String" />
                        <asp:Parameter Name="MInitial" Type="String" />
                        <asp:Parameter Name="SSNo" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CDLdriver" Type="Boolean" />
                        <asp:Parameter Name="CMVdriver" Type="Boolean" />
                        <asp:Parameter Name="LicSt" Type="String" />
                        <asp:Parameter Name="LicenseNo" Type="String" />
                        <asp:Parameter Name="LicenseClass" Type="String" />
                        <asp:Parameter Name="Sex" Type="Boolean" />
                        <asp:Parameter Name="BirthDate" Type="DateTime" />
                        <asp:Parameter Name="AirBrakeRestr" Type="Boolean" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CompID" Type="Int32" />
                        <asp:Parameter Name="LName" Type="String" />
                        <asp:Parameter Name="FName" Type="String" />
                        <asp:Parameter Name="MInitial" Type="String" />
                        <asp:Parameter Name="SSNo" Type="String" />
                        <asp:Parameter Name="Title" Type="String" />
                        <asp:Parameter Name="CDLdriver" Type="Boolean" />
                        <asp:Parameter Name="CMVdriver" Type="Boolean" />
                        <asp:Parameter Name="LicSt" Type="String" />
                        <asp:Parameter Name="LicenseNo" Type="String" />
                        <asp:Parameter Name="LicenseClass" Type="String" />
                        <asp:Parameter Name="Sex" Type="Boolean" />
                        <asp:Parameter Name="BirthDate" Type="DateTime" />
                        <asp:Parameter Name="AirBrakeRestr" Type="Boolean" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_LName" Type="String" />
                        <asp:Parameter Name="original_FName" Type="String" />
                        <asp:Parameter Name="original_MInitial" Type="String" />
                        <asp:Parameter Name="original_SSNo" Type="String" />
                        <asp:Parameter Name="original_Title" Type="String" />
                        <asp:Parameter Name="original_CDLdriver" Type="Boolean" />
                        <asp:Parameter Name="original_CMVdriver" Type="Boolean" />
                        <asp:Parameter Name="original_LicSt" Type="String" />
                        <asp:Parameter Name="original_LicenseNo" Type="String" />
                        <asp:Parameter Name="original_LicenseClass" Type="String" />
                        <asp:Parameter Name="original_Sex" Type="Boolean" />
                        <asp:Parameter Name="original_BirthDate" Type="DateTime" />
                        <asp:Parameter Name="original_AirBrakeRestr" Type="Boolean" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:DetailsView ID="dtvEmployees" Visible="false" OnItemCreated="dtvEmployee_ItemCreated" CssClass="table table-striped table-hover" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="EmployeeID" DataSourceID="sdsEmployee" EnableModelValidation="True">
                    <Fields>
                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                        <%--<asp:BoundField DataField="CompID" HeaderText="CompID" SortExpression="CompID" />
                        --%>
                        <asp:TemplateField HeaderText="Company">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInEmployeeDtv" DataSourceID="sdsForDdlCompanyInEmployeeDtv"
                                    DataTextField="CompanyName" DataValueField="CompID" Enabled="false"
                                    SelectedValue='<%# Bind("CompID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInEmployeeDtv" DataSourceID="sdsForDdlCompanyInEmployeeDtv"
                                    DataTextField="CompanyName" DataValueField="CompID"
                                    SelectedValue='<%# Bind("CompID") %>' runat="server" AppendDataBoundItems="true" >
                                    <asp:ListItem Value="">Select a Company</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="rfvCompany" ControlToValidate="ddlCompanyInEmployeeDtv" ErrorMessage="Required" runat="server"></asp:RequiredFieldValidator>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInEmployeeDtv" DataSourceID="sdsForDdlCompanyInEmployeeDtv"
                                    DataTextField="CompanyName" DataValueField="CompID"
                                    SelectedValue='<%# Bind("CompID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="LName" HeaderText="LName" SortExpression="LName" />
                        <asp:BoundField DataField="FName" HeaderText="FName" SortExpression="FName" />
                        <asp:BoundField DataField="MInitial" HeaderText="MInitial" SortExpression="MInitial" />
                        <asp:BoundField DataField="SSNo" HeaderText="SSNo" SortExpression="SSNo" />
                        <asp:BoundField DataField="Title" HeaderText="Title" SortExpression="Title" />
                        <asp:CheckBoxField DataField="CDLdriver" HeaderText="CDLdriver" SortExpression="CDLdriver" />
                        <asp:CheckBoxField DataField="CMVdriver" HeaderText="CMVdriver" SortExpression="CMVdriver" />
                        <asp:BoundField DataField="LicSt" HeaderText="LicSt" SortExpression="LicSt" />
                        <asp:BoundField DataField="LicenseNo" HeaderText="LicenseNo" SortExpression="LicenseNo" />
                        <asp:BoundField DataField="LicenseClass" HeaderText="LicenseClass" SortExpression="LicenseClass" />
                        <asp:CheckBoxField DataField="Sex" HeaderText="Sex" SortExpression="Sex" />
                        <asp:BoundField DataField="BirthDate" HeaderText="BirthDate" SortExpression="BirthDate" />
                        <asp:CheckBoxField DataField="AirBrakeRestr" HeaderText="AirBrakeRestr" SortExpression="AirBrakeRestr" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                        <asp:BoundField DataField="Address1" HeaderText="Address1" SortExpression="Address1" />
                        <asp:BoundField DataField="City1" HeaderText="City1" SortExpression="City1" />
                        <asp:BoundField DataField="State1" HeaderText="State1" SortExpression="State1" />
                        <asp:BoundField DataField="ZipCode1" HeaderText="ZipCode1" SortExpression="ZipCode1" />
                        <asp:BoundField DataField="PhoneNo1" HeaderText="PhoneNo1" SortExpression="PhoneNo1" />
                        <asp:BoundField DataField="PhoneNo2" HeaderText="PhoneNo2" SortExpression="PhoneNo2" />
                        <asp:BoundField DataField="PhoneNo3" HeaderText="PhoneNo3" SortExpression="PhoneNo3" />
                        <asp:BoundField DataField="Fax" HeaderText="Fax" SortExpression="Fax" />
                        <asp:BoundField DataField="EMail" HeaderText="EMail" SortExpression="EMail" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
            <div id="divDocuments">
                <asp:Label ID="lblDocuments" Visible="false" runat="server" Text="Documents"></asp:Label>
                <asp:SqlDataSource ID="sdsDocuments" OnSelecting="sdsEmployee_Selecting" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [Documents] WHERE [DocID] = @original_DocID AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([CompanyID] = @original_CompanyID) OR ([CompanyID] IS NULL AND @original_CompanyID IS NULL)) AND [DocTypeID] = @original_DocTypeID AND (([ExpirationDate] = @original_ExpirationDate) OR ([ExpirationDate] IS NULL AND @original_ExpirationDate IS NULL)) AND (([DateCreated] = @original_DateCreated) OR ([DateCreated] IS NULL AND @original_DateCreated IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([DateReviewed] = @original_DateReviewed) OR ([DateReviewed] IS NULL AND @original_DateReviewed IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND [Status] = @original_Status AND (([DocFormat] = @original_DocFormat) OR ([DocFormat] IS NULL AND @original_DocFormat IS NULL)) AND (([Reviewer] = @original_Reviewer) OR ([Reviewer] IS NULL AND @original_Reviewer IS NULL)) AND (([Completed] = @original_Completed) OR ([Completed] IS NULL AND @original_Completed IS NULL)) AND (([DocOrder] = @original_DocOrder) OR ([DocOrder] IS NULL AND @original_DocOrder IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [Documents] ([EmployeeID], [CompanyID], [DocTypeID], [ExpirationDate], [DateCreated], [FileName], [Notes], [DateReviewed], [Location], [Status], [DocFormat], [Reviewer], [Completed], [DocOrder], [LastUpdated], [UpdatedBy]) VALUES (@EmployeeID, @CompanyID, @DocTypeID, @ExpirationDate, @DateCreated, @FileName, @Notes, @DateReviewed, @Location, @Status, @DocFormat, @Reviewer, @Completed, @DocOrder, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Documents] where EmployeeID = @EmployeeID ORDER BY [DocID] desc" UpdateCommand="UPDATE [Documents] SET [EmployeeID] = @EmployeeID, [CompanyID] = @CompanyID, [DocTypeID] = @DocTypeID, [ExpirationDate] = @ExpirationDate, [DateCreated] = @DateCreated, [FileName] = @FileName, [Notes] = @Notes, [DateReviewed] = @DateReviewed, [Location] = @Location, [Status] = @Status, [DocFormat] = @DocFormat, [Reviewer] = @Reviewer, [Completed] = @Completed, [DocOrder] = @DocOrder, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [DocID] = @original_DocID AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([CompanyID] = @original_CompanyID) OR ([CompanyID] IS NULL AND @original_CompanyID IS NULL)) AND [DocTypeID] = @original_DocTypeID AND (([ExpirationDate] = @original_ExpirationDate) OR ([ExpirationDate] IS NULL AND @original_ExpirationDate IS NULL)) AND (([DateCreated] = @original_DateCreated) OR ([DateCreated] IS NULL AND @original_DateCreated IS NULL)) AND (([FileName] = @original_FileName) OR ([FileName] IS NULL AND @original_FileName IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([DateReviewed] = @original_DateReviewed) OR ([DateReviewed] IS NULL AND @original_DateReviewed IS NULL)) AND (([Location] = @original_Location) OR ([Location] IS NULL AND @original_Location IS NULL)) AND [Status] = @original_Status AND (([DocFormat] = @original_DocFormat) OR ([DocFormat] IS NULL AND @original_DocFormat IS NULL)) AND (([Reviewer] = @original_Reviewer) OR ([Reviewer] IS NULL AND @original_Reviewer IS NULL)) AND (([Completed] = @original_Completed) OR ([Completed] IS NULL AND @original_Completed IS NULL)) AND (([DocOrder] = @original_DocOrder) OR ([DocOrder] IS NULL AND @original_DocOrder IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <SelectParameters>
                       <asp:ControlParameter ControlID="ddlEmployee" ConvertEmptyStringToNull="true" Name="EmployeeID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_CompanyID" Type="Int32" />
                        <asp:Parameter Name="original_DocTypeID" Type="Int32" />
                        <asp:Parameter Name="original_ExpirationDate" Type="DateTime" />
                        <asp:Parameter Name="original_DateCreated" Type="DateTime" />
                        <asp:Parameter Name="original_FileName" Type="String" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_DateReviewed" Type="DateTime" />
                        <asp:Parameter Name="original_Location" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_DocFormat" Type="String" />
                        <asp:Parameter Name="original_Reviewer" Type="String" />
                        <asp:Parameter Name="original_Completed" Type="Boolean" />
                        <asp:Parameter Name="original_DocOrder" Type="Int32" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="CompanyID" Type="Int32" />
                        <asp:Parameter Name="DocTypeID" Type="Int32" />
                        <asp:Parameter Name="ExpirationDate" Type="DateTime" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="FileName" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="DateReviewed" Type="DateTime" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="DocFormat" Type="String" />
                        <asp:Parameter Name="Reviewer" Type="String" />
                        <asp:Parameter Name="Completed" Type="Boolean" />
                        <asp:Parameter Name="DocOrder" Type="Int32" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="CompanyID" Type="Int32" />
                        <asp:Parameter Name="DocTypeID" Type="Int32" />
                        <asp:Parameter Name="ExpirationDate" Type="DateTime" />
                        <asp:Parameter Name="DateCreated" Type="DateTime" />
                        <asp:Parameter Name="FileName" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="DateReviewed" Type="DateTime" />
                        <asp:Parameter Name="Location" Type="String" />
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="DocFormat" Type="String" />
                        <asp:Parameter Name="Reviewer" Type="String" />
                        <asp:Parameter Name="Completed" Type="Boolean" />
                        <asp:Parameter Name="DocOrder" Type="Int32" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_DocID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_CompanyID" Type="Int32" />
                        <asp:Parameter Name="original_DocTypeID" Type="Int32" />
                        <asp:Parameter Name="original_ExpirationDate" Type="DateTime" />
                        <asp:Parameter Name="original_DateCreated" Type="DateTime" />
                        <asp:Parameter Name="original_FileName" Type="String" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_DateReviewed" Type="DateTime" />
                        <asp:Parameter Name="original_Location" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_DocFormat" Type="String" />
                        <asp:Parameter Name="original_Reviewer" Type="String" />
                        <asp:Parameter Name="original_Completed" Type="Boolean" />
                        <asp:Parameter Name="original_DocOrder" Type="Int32" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsForddlDocumentInDocumentDtv" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [DocTypeID], [DocumentType]+' '+[Description] as DocTypeAndDescription FROM [DocTypes] ORDER BY DocTypeAndDescription"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsForddlStatusInDocumentDtv" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [Status], [Description] FROM [DocStatus]"></asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsForddlEmployeeInDocument" runat="server" ConnectionString='<%$ ConnectionStrings:QT2a %>' SelectCommand="SELECT [EmployeeID], [LName]+', '+[FName] as EmployeeName FROM [Employees] ORDER BY [LName], [FName]"></asp:SqlDataSource>
                <asp:GridView ID="gvDocuments" Visible="false" OnRowDataBound="gvRowDataBound" CssClass="table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DocID" DataSourceID="sdsDocuments" EnableModelValidation="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="DocID" HeaderText="DocID" InsertVisible="False" ReadOnly="True" SortExpression="DocID" />
                        <%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDocumentGv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDocumentGv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" />--%>
                        <asp:TemplateField HeaderText="Company">
		                    <ItemTemplate>
			                    <asp:DropDownList id="ddlCompanyInDocumentGv" datasourceid="sdsCompany" datatextfield="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompanyID") %>' Enabled="false" runat="server"/>
		                    </ItemTemplate>   
		                    <EditItemTemplate>
			                    <asp:DropDownList id="ddlCompanyInDocumentGv" datasourceid="sdsCompany" datatextfield="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompanyID") %>' Enabled="false" runat="server"/>
                            </EditItemTemplate>
	                    </asp:TemplateField>
                        <%--  <asp:BoundField DataField="DocTypeID" HeaderText="DocTypeID" SortExpression="DocTypeID" />--%>
                        <asp:TemplateField HeaderText="Document">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlDocumentInDocumentGv" DataSourceID="sdsForddlDocumentInDocumentDtv"
                                    DataTextField="DocTypeAndDescription" DataValueField="DocTypeID"
                                    SelectedValue='<%# Bind("DocTypeID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDocumentInDocumentGv" DataSourceID="sdsForddlDocumentInDocumentDtv"
                                    DataTextField="DocTypeAndDescription" DataValueField="DocTypeID"
                                    SelectedValue='<%# Bind("DocTypeID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />
                        <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                        <asp:BoundField DataField="DateReviewed" HeaderText="DateReviewed" SortExpression="DateReviewed" />
                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                        <%--                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />--%>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatusInDocumentGv" DataSourceID="sdsForddlStatusInDocumentDtv"
                                    DataTextField="Description" DataValueField="Status"
                                    SelectedValue='<%# Bind("Status") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatusInDocumentGv" DataSourceID="sdsForddlStatusInDocumentDtv"
                                    DataTextField="Description" DataValueField="Status"
                                    SelectedValue='<%# Bind("Status") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocFormat" HeaderText="DocFormat" SortExpression="DocFormat" />
                        <asp:BoundField DataField="Reviewer" HeaderText="Reviewer" SortExpression="Reviewer" />
                        <asp:CheckBoxField DataField="Completed" HeaderText="Completed" SortExpression="Completed" />
                        <asp:BoundField DataField="DocOrder" HeaderText="DocOrder" SortExpression="DocOrder" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                    </Columns>
                </asp:GridView>
                <asp:DetailsView ID="dtvDocuments" Visible="false" OnItemCreated="dtvDocuments_ItemCreated" CssClass="table table-striped table-hover" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="DocID" DataSourceID="sdsDocuments" EnableModelValidation="True">
                    <Fields>
                        <asp:BoundField DataField="DocID" HeaderText="DocID" InsertVisible="False" ReadOnly="True" SortExpression="DocID" />
                        <%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDocumentDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDocumentDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' runat="server" AppendDataBoundItems="true" >                                                                        
                                    <asp:ListItem Value="">Select a Employee</asp:ListItem>
                                 </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDocumentDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:BoundField DataField="CompanyID" HeaderText="CompanyID" SortExpression="CompanyID" />--%>
                        <asp:TemplateField HeaderText="Company">
		                    <ItemTemplate>
			                    <asp:DropDownList id="ddlCompanyInDocumentDtv" datasourceid="sdsCompany" datatextfield="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompanyID") %>' Enabled="false" runat="server"/>
		                    </ItemTemplate>   
		                    <InsertItemTemplate>
			                    <asp:DropDownList id="ddlCompanyInDocumentDtv" datasourceid="sdsCompany" datatextfield="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompanyID") %>' runat="server" AppendDataBoundItems="true">
                                    <asp:ListItem Value="">Select a Company</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>   
		                    <EditItemTemplate>
			                    <asp:DropDownList id="ddlCompanyInDocumentDtv" datasourceid="sdsCompany" datatextfield="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompanyID") %>' Enabled="false" runat="server"/>
                            </EditItemTemplate>
	                    </asp:TemplateField>
                        <%--<asp:BoundField DataField="DocTypeID" HeaderText="DocTypeID" SortExpression="DocTypeID" />--%>
                        <asp:TemplateField HeaderText="Document">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlDocumentInDocumentDtv" DataSourceID="sdsForddlDocumentInDocumentDtv"
                                    DataTextField="DocTypeAndDescription" DataValueField="DocTypeID"
                                    SelectedValue='<%# Bind("DocTypeID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlDocumentInDocumentDtv" DataSourceID="sdsForddlDocumentInDocumentDtv"
                                    DataTextField="DocTypeAndDescription" DataValueField="DocTypeID"
                                    SelectedValue='<%# Bind("DocTypeID") %>' runat="server" AppendDataBoundItems="true" >
                                <asp:ListItem Value="">Select a Document Type</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDocumentInDocumentDtv" DataSourceID="sdsForddlDocumentInDocumentDtv"
                                    DataTextField="DocTypeAndDescription" DataValueField="DocTypeID"
                                    SelectedValue='<%# Bind("DocTypeID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="ExpirationDate" HeaderText="ExpirationDate" SortExpression="ExpirationDate" />
                        <asp:BoundField DataField="DateCreated" HeaderText="DateCreated" SortExpression="DateCreated" />
                        <asp:BoundField DataField="FileName" HeaderText="FileName" SortExpression="FileName" />
                        <asp:BoundField DataField="Notes" HeaderText="Notes" SortExpression="Notes" />
                        <asp:BoundField DataField="DateReviewed" HeaderText="DateReviewed" SortExpression="DateReviewed" />
                        <asp:BoundField DataField="Location" HeaderText="Location" SortExpression="Location" />
                        <%--                        <asp:BoundField DataField="Status" HeaderText="Status" SortExpression="Status" />--%>
                        <asp:TemplateField HeaderText="Status">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlStatusInDocumentDtv" DataSourceID="sdsForddlStatusInDocumentDtv"
                                    DataTextField="Description" DataValueField="Status"
                                    SelectedValue='<%# Bind("Status") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlStatusInDocumentDtv" DataSourceID="sdsForddlStatusInDocumentDtv"
                                    DataTextField="Description" DataValueField="Status"
                                    SelectedValue='<%# Bind("Status") %>' runat="server" AppendDataBoundItems="true" >
                                <asp:ListItem Value="">Select a Status</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlStatusInDocumentDtv" DataSourceID="sdsForddlStatusInDocumentDtv"
                                    DataTextField="Description" DataValueField="Status"
                                    SelectedValue='<%# Bind("Status") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="DocFormat" HeaderText="DocFormat" SortExpression="DocFormat" />
                        <asp:BoundField DataField="Reviewer" HeaderText="Reviewer" SortExpression="Reviewer" />
                        <asp:CheckBoxField DataField="Completed" HeaderText="Completed" SortExpression="Completed" />
                        <asp:BoundField DataField="DocOrder" HeaderText="DocOrder" SortExpression="DocOrder" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
            <div id="divDrugTestResults">
                <asp:Label ID="lblDrugTestResults" Visible="false" runat="server" Text="DrugTestResults"></asp:Label>
                <asp:SqlDataSource ID="sdsDrugTestResults" OnSelecting="sdsEmployee_Selecting" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [DrugTestResults] WHERE [DrugTestID] = @original_DrugTestID AND (([LabID] = @original_LabID) OR ([LabID] IS NULL AND @original_LabID IS NULL)) AND (([MROID] = @original_MROID) OR ([MROID] IS NULL AND @original_MROID IS NULL)) AND (([CollectionSiteID] = @original_CollectionSiteID) OR ([CollectionSiteID] IS NULL AND @original_CollectionSiteID IS NULL)) AND [EmployeeID] = @original_EmployeeID AND (([RandomDate] = @original_RandomDate) OR ([RandomDate] IS NULL AND @original_RandomDate IS NULL)) AND (([BlindSample] = @original_BlindSample) OR ([BlindSample] IS NULL AND @original_BlindSample IS NULL)) AND (([EmpInformed] = @original_EmpInformed) OR ([EmpInformed] IS NULL AND @original_EmpInformed IS NULL)) AND (([CollectionDate] = @original_CollectionDate) OR ([CollectionDate] IS NULL AND @original_CollectionDate IS NULL)) AND (([TestTime] = @original_TestTime) OR ([TestTime] IS NULL AND @original_TestTime IS NULL)) AND (([MROResults] = @original_MROResults) OR ([MROResults] IS NULL AND @original_MROResults IS NULL)) AND (([Refusal] = @original_Refusal) OR ([Refusal] IS NULL AND @original_Refusal IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL)) AND (([Disposition] = @original_Disposition) OR ([Disposition] IS NULL AND @original_Disposition IS NULL)) AND (([DrugTestTypeID] = @original_DrugTestTypeID) OR ([DrugTestTypeID] IS NULL AND @original_DrugTestTypeID IS NULL)) AND (([SpecimanIDNo] = @original_SpecimanIDNo) OR ([SpecimanIDNo] IS NULL AND @original_SpecimanIDNo IS NULL)) AND (([Rejected] = @original_Rejected) OR ([Rejected] IS NULL AND @original_Rejected IS NULL)) AND (([PositiveDrugType1] = @original_PositiveDrugType1) OR ([PositiveDrugType1] IS NULL AND @original_PositiveDrugType1 IS NULL)) AND (([PositiveDrugType2] = @original_PositiveDrugType2) OR ([PositiveDrugType2] IS NULL AND @original_PositiveDrugType2 IS NULL)) AND (([Billed] = @original_Billed) OR ([Billed] IS NULL AND @original_Billed IS NULL)) AND (([CompId] = @original_CompId) OR ([CompId] IS NULL AND @original_CompId IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [DrugTestResults] ([LabID], [MROID], [CollectionSiteID], [EmployeeID], [RandomDate], [BlindSample], [EmpInformed], [CollectionDate], [TestTime], [MROResults], [Refusal], [Comments], [Disposition], [DrugTestTypeID], [SpecimanIDNo], [Rejected], [PositiveDrugType1], [PositiveDrugType2], [Billed], [CompId], [LastUpdated], [UpdatedBy]) VALUES (@LabID, @MROID, @CollectionSiteID, @EmployeeID, @RandomDate, @BlindSample, @EmpInformed, @CollectionDate, @TestTime, @MROResults, @Refusal, @Comments, @Disposition, @DrugTestTypeID, @SpecimanIDNo, @Rejected, @PositiveDrugType1, @PositiveDrugType2, @Billed, @CompId, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DrugTestResults] where EmployeeID=@EmployeeID ORDER BY [DrugTestID] desc" UpdateCommand="UPDATE [DrugTestResults] SET [LabID] = @LabID, [MROID] = @MROID, [CollectionSiteID] = @CollectionSiteID, [EmployeeID] = @EmployeeID, [RandomDate] = @RandomDate, [BlindSample] = @BlindSample, [EmpInformed] = @EmpInformed, [CollectionDate] = @CollectionDate, [TestTime] = @TestTime, [MROResults] = @MROResults, [Refusal] = @Refusal, [Comments] = @Comments, [Disposition] = @Disposition, [DrugTestTypeID] = @DrugTestTypeID, [SpecimanIDNo] = @SpecimanIDNo, [Rejected] = @Rejected, [PositiveDrugType1] = @PositiveDrugType1, [PositiveDrugType2] = @PositiveDrugType2, [Billed] = @Billed, [CompId] = @CompId, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [DrugTestID] = @original_DrugTestID AND (([LabID] = @original_LabID) OR ([LabID] IS NULL AND @original_LabID IS NULL)) AND (([MROID] = @original_MROID) OR ([MROID] IS NULL AND @original_MROID IS NULL)) AND (([CollectionSiteID] = @original_CollectionSiteID) OR ([CollectionSiteID] IS NULL AND @original_CollectionSiteID IS NULL)) AND [EmployeeID] = @original_EmployeeID AND (([RandomDate] = @original_RandomDate) OR ([RandomDate] IS NULL AND @original_RandomDate IS NULL)) AND (([BlindSample] = @original_BlindSample) OR ([BlindSample] IS NULL AND @original_BlindSample IS NULL)) AND (([EmpInformed] = @original_EmpInformed) OR ([EmpInformed] IS NULL AND @original_EmpInformed IS NULL)) AND (([CollectionDate] = @original_CollectionDate) OR ([CollectionDate] IS NULL AND @original_CollectionDate IS NULL)) AND (([TestTime] = @original_TestTime) OR ([TestTime] IS NULL AND @original_TestTime IS NULL)) AND (([MROResults] = @original_MROResults) OR ([MROResults] IS NULL AND @original_MROResults IS NULL)) AND (([Refusal] = @original_Refusal) OR ([Refusal] IS NULL AND @original_Refusal IS NULL)) AND (([Comments] = @original_Comments) OR ([Comments] IS NULL AND @original_Comments IS NULL)) AND (([Disposition] = @original_Disposition) OR ([Disposition] IS NULL AND @original_Disposition IS NULL)) AND (([DrugTestTypeID] = @original_DrugTestTypeID) OR ([DrugTestTypeID] IS NULL AND @original_DrugTestTypeID IS NULL)) AND (([SpecimanIDNo] = @original_SpecimanIDNo) OR ([SpecimanIDNo] IS NULL AND @original_SpecimanIDNo IS NULL)) AND (([Rejected] = @original_Rejected) OR ([Rejected] IS NULL AND @original_Rejected IS NULL)) AND (([PositiveDrugType1] = @original_PositiveDrugType1) OR ([PositiveDrugType1] IS NULL AND @original_PositiveDrugType1 IS NULL)) AND (([PositiveDrugType2] = @original_PositiveDrugType2) OR ([PositiveDrugType2] IS NULL AND @original_PositiveDrugType2 IS NULL)) AND (([Billed] = @original_Billed) OR ([Billed] IS NULL AND @original_Billed IS NULL)) AND (([CompId] = @original_CompId) OR ([CompId] IS NULL AND @original_CompId IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <SelectParameters>
                       <asp:ControlParameter ControlID="ddlEmployee" ConvertEmptyStringToNull="true" Name="EmployeeID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_DrugTestID" Type="Int32" />
                        <asp:Parameter Name="original_LabID" Type="Int32" />
                        <asp:Parameter Name="original_MROID" Type="Int32" />
                        <asp:Parameter Name="original_CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_RandomDate" Type="DateTime" />
                        <asp:Parameter Name="original_BlindSample" Type="Boolean" />
                        <asp:Parameter Name="original_EmpInformed" Type="DateTime" />
                        <asp:Parameter Name="original_CollectionDate" Type="DateTime" />
                        <asp:Parameter Name="original_TestTime" Type="DateTime" />
                        <asp:Parameter Name="original_MROResults" Type="Boolean" />
                        <asp:Parameter Name="original_Refusal" Type="Boolean" />
                        <asp:Parameter Name="original_Comments" Type="String" />
                        <asp:Parameter Name="original_Disposition" Type="String" />
                        <asp:Parameter Name="original_DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="original_SpecimanIDNo" Type="Int32" />
                        <asp:Parameter Name="original_Rejected" Type="Boolean" />
                        <asp:Parameter Name="original_PositiveDrugType1" Type="Int32" />
                        <asp:Parameter Name="original_PositiveDrugType2" Type="Int32" />
                        <asp:Parameter Name="original_Billed" Type="Int32" />
                        <asp:Parameter Name="original_CompId" Type="Int32" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LabID" Type="Int32" />
                        <asp:Parameter Name="MROID" Type="Int32" />
                        <asp:Parameter Name="CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="RandomDate" Type="DateTime" />
                        <asp:Parameter Name="BlindSample" Type="Boolean" />
                        <asp:Parameter Name="EmpInformed" Type="DateTime" />
                        <asp:Parameter Name="CollectionDate" Type="DateTime" />
                        <asp:Parameter Name="TestTime" Type="DateTime" />
                        <asp:Parameter Name="MROResults" Type="Boolean" />
                        <asp:Parameter Name="Refusal" Type="Boolean" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Disposition" Type="String" />
                        <asp:Parameter Name="DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="SpecimanIDNo" Type="Int32" />
                        <asp:Parameter Name="Rejected" Type="Boolean" />
                        <asp:Parameter Name="PositiveDrugType1" Type="Int32" />
                        <asp:Parameter Name="PositiveDrugType2" Type="Int32" />
                        <asp:Parameter Name="Billed" Type="Int32" />
                        <asp:Parameter Name="CompId" Type="Int32" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LabID" Type="Int32" />
                        <asp:Parameter Name="MROID" Type="Int32" />
                        <asp:Parameter Name="CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="RandomDate" Type="DateTime" />
                        <asp:Parameter Name="BlindSample" Type="Boolean" />
                        <asp:Parameter Name="EmpInformed" Type="DateTime" />
                        <asp:Parameter Name="CollectionDate" Type="DateTime" />
                        <asp:Parameter Name="TestTime" Type="DateTime" />
                        <asp:Parameter Name="MROResults" Type="Boolean" />
                        <asp:Parameter Name="Refusal" Type="Boolean" />
                        <asp:Parameter Name="Comments" Type="String" />
                        <asp:Parameter Name="Disposition" Type="String" />
                        <asp:Parameter Name="DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="SpecimanIDNo" Type="Int32" />
                        <asp:Parameter Name="Rejected" Type="Boolean" />
                        <asp:Parameter Name="PositiveDrugType1" Type="Int32" />
                        <asp:Parameter Name="PositiveDrugType2" Type="Int32" />
                        <asp:Parameter Name="Billed" Type="Int32" />
                        <asp:Parameter Name="CompId" Type="Int32" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_DrugTestID" Type="Int32" />
                        <asp:Parameter Name="original_LabID" Type="Int32" />
                        <asp:Parameter Name="original_MROID" Type="Int32" />
                        <asp:Parameter Name="original_CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_RandomDate" Type="DateTime" />
                        <asp:Parameter Name="original_BlindSample" Type="Boolean" />
                        <asp:Parameter Name="original_EmpInformed" Type="DateTime" />
                        <asp:Parameter Name="original_CollectionDate" Type="DateTime" />
                        <asp:Parameter Name="original_TestTime" Type="DateTime" />
                        <asp:Parameter Name="original_MROResults" Type="Boolean" />
                        <asp:Parameter Name="original_Refusal" Type="Boolean" />
                        <asp:Parameter Name="original_Comments" Type="String" />
                        <asp:Parameter Name="original_Disposition" Type="String" />
                        <asp:Parameter Name="original_DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="original_SpecimanIDNo" Type="Int32" />
                        <asp:Parameter Name="original_Rejected" Type="Boolean" />
                        <asp:Parameter Name="original_PositiveDrugType1" Type="Int32" />
                        <asp:Parameter Name="original_PositiveDrugType2" Type="Int32" />
                        <asp:Parameter Name="original_Billed" Type="Int32" />
                        <asp:Parameter Name="original_CompId" Type="Int32" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvDrugTestResults" Visible="false" OnRowDataBound="gvRowDataBound" CssClass="table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="DrugTestID" DataSourceID="sdsDrugTestResults" EnableModelValidation="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="DrugTestID" HeaderText="DrugTestID" InsertVisible="False" ReadOnly="True" SortExpression="DrugTestID" />
<%--                        <asp:BoundField DataField="LabID" HeaderText="LabID" SortExpression="LabID" />
                        <asp:BoundField DataField="MROID" HeaderText="MROID" SortExpression="MROID" />
                        <asp:BoundField DataField="CollectionSiteID" HeaderText="CollectionSiteID" SortExpression="CollectionSiteID" />--%>
                        <asp:TemplateField HeaderText="Laboratory">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlLaboratoryInDrugTestResultGv" DataSourceID="sdsLabs" DataTextField="LabName" DataValueField="LabID" SelectedValue='<%# Bind("LabID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLaboratoryInDrugTestResultGv" DataSourceID="sdsLabs" DataTextField="LabName" DataValueField="LabID" SelectedValue='<%# Bind("LabID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MedicalReviewOfficer">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlMROInDrugTestResultGv" DataSourceID="sdsMRO" DataTextField="LastName" DataValueField="MROID" SelectedValue='<%# Bind("MROID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlMROInDrugTestResultGv" DataSourceID="sdsMRO" DataTextField="LastName" DataValueField="MROID" SelectedValue='<%# Bind("MROID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CollectionSite">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCollectionSiteInDrugTestResultGv" DataSourceID="sdsCollectionSites" DataTextField="CollName" DataValueField="CollectionSiteID" SelectedValue='<%# Bind("CollectionSiteID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCollectionSiteInDrugTestResultGv" DataSourceID="sdsCollectionSites" DataTextField="CollName" DataValueField="CollectionSiteID" SelectedValue='<%# Bind("CollectionSiteID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
<%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDrugTestResultGv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDrugTestResultGv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RandomDate" HeaderText="RandomDate" SortExpression="RandomDate" />
                        <asp:CheckBoxField DataField="BlindSample" HeaderText="BlindSample" SortExpression="BlindSample" />
                        <asp:BoundField DataField="EmpInformed" HeaderText="EmpInformed" SortExpression="EmpInformed" />
                        <asp:BoundField DataField="CollectionDate" HeaderText="CollectionDate" SortExpression="CollectionDate" />
                        <asp:BoundField DataField="TestTime" HeaderText="TestTime" SortExpression="TestTime" />
                        <asp:CheckBoxField DataField="MROResults" HeaderText="MROResults" SortExpression="MROResults" />
                        <asp:CheckBoxField DataField="Refusal" HeaderText="Refusal" SortExpression="Refusal" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                        <asp:BoundField DataField="Disposition" HeaderText="Disposition" SortExpression="Disposition" />
<%--                        <asp:BoundField DataField="DrugTestTypeID" HeaderText="DrugTestTypeID" SortExpression="DrugTestTypeID" />--%>
                        <asp:TemplateField HeaderText="DrugTestType">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlDrugTestTypeIDInDrugTestResultGv" DataSourceID="sdsDrugTestType" DataTextField="Description" DataValueField="DrugTestTypeID" SelectedValue='<%# Bind("DrugTestTypeID") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDrugTestTypeIDInDrugTestResultGv" DataSourceID="sdsDrugTestType" DataTextField="Description" DataValueField="DrugTestTypeID" SelectedValue='<%# Bind("DrugTestTypeID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="SpecimanIDNo" HeaderText="SpecimanIDNo" SortExpression="SpecimanIDNo" />
                        <asp:CheckBoxField DataField="Rejected" HeaderText="Rejected" SortExpression="Rejected" />
<%--                        <asp:BoundField DataField="PositiveDrugType1" HeaderText="PositiveDrugType1" SortExpression="PositiveDrugType1" />
                        <asp:BoundField DataField="PositiveDrugType2" HeaderText="PositiveDrugType2" SortExpression="PositiveDrugType2" />--%>
                        <asp:TemplateField HeaderText="PositiveDrugType1">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType1InDrugTestResultGv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType1") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType1InDrugTestResultGv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType1") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="PositiveDrugType2">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType2InDrugTestResultGv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType2") %>' runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType2InDrugTestResultGv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType2") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
                        <asp:BoundField DataField="Billed" HeaderText="Billed" SortExpression="Billed" />
                        <asp:BoundField DataField="CompId" HeaderText="CompId" SortExpression="CompId" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                    </Columns>
                </asp:GridView>
                <asp:DetailsView ID="dtvDrugTestResults" Visible="false"  OnItemCreated="dtvDrugTestResults_ItemCreated" CssClass="table table-striped table-hover" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="DrugTestID" DataSourceID="sdsDrugTestResults" EnableModelValidation="True">
                    <Fields>
                        <asp:BoundField DataField="DrugTestID" HeaderText="DrugTestID" InsertVisible="False" ReadOnly="True" SortExpression="DrugTestID" />
<%--                        <asp:BoundField DataField="LabID" HeaderText="LabID" SortExpression="LabID" />
                        <asp:BoundField DataField="MROID" HeaderText="MROID" SortExpression="MROID" />
                        <asp:BoundField DataField="CollectionSiteID" HeaderText="CollectionSiteID" SortExpression="CollectionSiteID" />--%>
<%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Laboratory">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlLaboratoryInDrugTestResultDtv" DataSourceID="sdsLabs" DataTextField="LabName" DataValueField="LabID" SelectedValue='<%# Bind("LabID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlLaboratoryInDrugTestResultDtv" DataSourceID="sdsLabs" DataTextField="LabName" DataValueField="LabID" SelectedValue='<%# Bind("LabID") %>' runat="server" AppendDataBoundItems="true" >
                                <asp:ListItem Value="">Select a Laboratory</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlLaboratoryInDrugTestResultDtv" DataSourceID="sdsLabs" DataTextField="LabName" DataValueField="LabID" SelectedValue='<%# Bind("LabID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MedicalReviewOfficer">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlMROInDrugTestResultDtv" DataSourceID="sdsMRO" DataTextField="LastName" DataValueField="MROID" SelectedValue='<%# Bind("MROID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlMROInDrugTestResultDtv" DataSourceID="sdsMRO" DataTextField="LastName" DataValueField="MROID" SelectedValue='<%# Bind("MROID") %>' runat="server" AppendDataBoundItems="true" >
                                <asp:ListItem Value="">Select a Medical Review Officer</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlMROInDrugTestResultDtv" DataSourceID="sdsMRO" DataTextField="LastName" DataValueField="MROID" SelectedValue='<%# Bind("MROID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="CollectionSite">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCollectionSiteInDrugTestResultDtv" DataSourceID="sdsCollectionSites" DataTextField="CollName" DataValueField="CollectionSiteID" SelectedValue='<%# Bind("CollectionSiteID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCollectionSiteInDrugTestResultDtv" DataSourceID="sdsCollectionSites" DataTextField="CollName" DataValueField="CollectionSiteID" SelectedValue='<%# Bind("CollectionSiteID") %>' runat="server" AppendDataBoundItems="true" >
                                    <asp:ListItem Value="">Select a Collection Site</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCollectionSiteInDrugTestResultDtv" DataSourceID="sdsCollectionSites" DataTextField="CollName" DataValueField="CollectionSiteID" SelectedValue='<%# Bind("CollectionSiteID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDrugTestResultDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInDrugTestResultDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Employee</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeDrugTestResultDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="false" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="RandomDate" HeaderText="RandomDate" SortExpression="RandomDate" />
                        <asp:CheckBoxField DataField="BlindSample" HeaderText="BlindSample" SortExpression="BlindSample" />
                        <asp:BoundField DataField="EmpInformed" HeaderText="EmpInformed" SortExpression="EmpInformed" />
                        <asp:BoundField DataField="CollectionDate" HeaderText="CollectionDate" SortExpression="CollectionDate" />
                        <asp:BoundField DataField="TestTime" HeaderText="TestTime" SortExpression="TestTime" />
                        <asp:CheckBoxField DataField="MROResults" HeaderText="MROResults" SortExpression="MROResults" />
                        <asp:CheckBoxField DataField="Refusal" HeaderText="Refusal" SortExpression="Refusal" />
                        <asp:BoundField DataField="Comments" HeaderText="Comments" SortExpression="Comments" />
                        <asp:BoundField DataField="Disposition" HeaderText="Disposition" SortExpression="Disposition" />
                        <%--<asp:BoundField DataField="DrugTestTypeID" HeaderText="DrugTestTypeID" SortExpression="DrugTestTypeID" />--%>
                        <asp:TemplateField HeaderText="DrugTestType">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlDrugTestTypeIDInDrugTestResultDtv" DataSourceID="sdsDrugTestType" DataTextField="Description" DataValueField="DrugTestTypeID" SelectedValue='<%# Bind("DrugTestTypeID") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlDrugTestTypeIDInDrugTestResultDtv" DataSourceID="sdsDrugTestType" DataTextField="Description" DataValueField="DrugTestTypeID" SelectedValue='<%# Bind("DrugTestTypeID") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Drug Test Type</asp:ListItem>
                                </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlDrugTestTypeIDInDrugTestResultDtv" DataSourceID="sdsDrugTestType" DataTextField="Description" DataValueField="DrugTestTypeID" SelectedValue='<%# Bind("DrugTestTypeID") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                        
                        <asp:BoundField DataField="SpecimanIDNo" HeaderText="SpecimanIDNo" SortExpression="SpecimanIDNo" />
                        <asp:CheckBoxField DataField="Rejected" HeaderText="Rejected" SortExpression="Rejected" />
 <%--                       <asp:BoundField DataField="PositiveDrugType1" HeaderText="PositiveDrugType1" SortExpression="PositiveDrugType1" />
                        <asp:BoundField DataField="PositiveDrugType2" HeaderText="PositiveDrugType2" SortExpression="PositiveDrugType2" />--%>
                        <asp:TemplateField HeaderText="PositiveDrugType1">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType1InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType1") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType1InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType1") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Drug Type</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType1InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType1") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                        
                        <asp:TemplateField HeaderText="PositiveDrugType2">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType2InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType2") %>' runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType2InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType2") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Drug Type</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlPositiveDrugType2InDrugTestResultDtv" DataSourceID="sdsDrugType" DataTextField="Description" DataValueField="DrugTypeID" SelectedValue='<%# Bind("PositiveDrugType2") %>' runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
                        <asp:BoundField DataField="Billed" HeaderText="Billed" SortExpression="Billed" />
                        <asp:BoundField DataField="CompId" HeaderText="CompId" SortExpression="CompId" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
                <div id="divPreviousEmployers">
                <asp:Label ID="lblPreviousEmployers" Visible="false" runat="server" Text="CurrentAndPreviousEmployers"></asp:Label>
                <asp:SqlDataSource ID="sdsPreviousEmployers" OnSelecting="sdsEmployee_Selecting" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [PrevEmployers] WHERE [PrevEmpID] = @original_PrevEmpID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([TerminationDate] = @original_TerminationDate) OR ([TerminationDate] IS NULL AND @original_TerminationDate IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [PrevEmployers] ([CompID], [EmployeeID], [HireDate], [TerminationDate], [LastUpdated], [UpdatedBy]) VALUES (@CompID, @EmployeeID, @HireDate, @TerminationDate, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [PrevEmployers] where EmployeeID=@EmployeeID ORDER BY [PrevEmpID] desc" UpdateCommand="UPDATE [PrevEmployers] SET [CompID] = @CompID, [EmployeeID] = @EmployeeID, [HireDate] = @HireDate, [TerminationDate] = @TerminationDate, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [PrevEmpID] = @original_PrevEmpID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND (([EmployeeID] = @original_EmployeeID) OR ([EmployeeID] IS NULL AND @original_EmployeeID IS NULL)) AND (([HireDate] = @original_HireDate) OR ([HireDate] IS NULL AND @original_HireDate IS NULL)) AND (([TerminationDate] = @original_TerminationDate) OR ([TerminationDate] IS NULL AND @original_TerminationDate IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <SelectParameters>
                       <asp:ControlParameter ControlID="ddlEmployee" ConvertEmptyStringToNull="true" Name="EmployeeID" PropertyName="SelectedValue" />
                    </SelectParameters>
                    <DeleteParameters>
                        <asp:Parameter Name="original_PrevEmpID" Type="Int32" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_HireDate" Type="DateTime" />
                        <asp:Parameter Name="original_TerminationDate" Type="DateTime" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompID" Type="Int32" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="TerminationDate" Type="DateTime" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CompID" Type="Int32" />
                        <asp:Parameter Name="EmployeeID" Type="Int32" />
                        <asp:Parameter Name="HireDate" Type="DateTime" />
                        <asp:Parameter Name="TerminationDate" Type="DateTime" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_PrevEmpID" Type="Int32" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_EmployeeID" Type="Int32" />
                        <asp:Parameter Name="original_HireDate" Type="DateTime" />
                        <asp:Parameter Name="original_TerminationDate" Type="DateTime" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="gvPreviousEmployers" Visible="false" OnRowDataBound="gvRowDataBound" CssClass="table table-striped table-hover" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="PrevEmpID" DataSourceID="sdsPreviousEmployers" EnableModelValidation="True">
                    <Columns>
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowSelectButton="True" />
                        <asp:BoundField DataField="PrevEmpID" HeaderText="PrevEmpID" InsertVisible="False" ReadOnly="True" SortExpression="PrevEmpID" />
<%--                        <asp:BoundField DataField="CompID" HeaderText="CompID" SortExpression="CompID" />--%>
                        <asp:TemplateField HeaderText="CompanyName">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInPrevEmployerGv" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompID") %>' Enabled="False" runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInPrevEmployerGv" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompID") %>' Enabled="False" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
<%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInPrevEmployerDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="False" runat="server" />
                            </ItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInPrevEmployerDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="False" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
                        <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate" />
                        <asp:BoundField DataField="TerminationDate" HeaderText="TerminationDate" SortExpression="TerminationDate" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                    </Columns>
                </asp:GridView>
                <asp:DetailsView ID="dtvPreviousEmployers" Visible="false" OnItemCreated="dtvPreviousEmployers_ItemCreated" CssClass="table table-striped table-hover" runat="server" Height="50px" Width="125px" AllowPaging="True" AutoGenerateRows="False" DataKeyNames="PrevEmpID" DataSourceID="sdsPreviousEmployers" EnableModelValidation="True">
                    <Fields>
                        <asp:BoundField DataField="PrevEmpID" HeaderText="PrevEmpID" InsertVisible="False" ReadOnly="True" SortExpression="PrevEmpID" />
<%--                        <asp:BoundField DataField="CompID" HeaderText="CompID" SortExpression="CompID" />--%>
                        <asp:TemplateField HeaderText="CompanyName">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInPrevEmployerDtv" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompID") %>' Enabled="False" runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInPrevEmployerDtv" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompID") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Company</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlCompanyInPrevEmployerDtv" DataSourceID="sdsCompany" DataTextField="CompanyName" DataValueField="CompID" SelectedValue='<%# Bind("CompID") %>' Enabled="False" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
<%--                        <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" SortExpression="EmployeeID" />--%>
                        <asp:TemplateField HeaderText="Employee">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInPrevEmployerDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="False" runat="server" />
                            </ItemTemplate>
                            <InsertItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInPrevEmployerDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' runat="server" AppendDataBoundItems="true" >
                                     <asp:ListItem Value="">Select a Employee</asp:ListItem>
                                    </asp:DropDownList>
                            </InsertItemTemplate>
                            <EditItemTemplate>
                                <asp:DropDownList ID="ddlEmployeeInPrevEmployerDtv" DataSourceID="sdsForddlEmployeeInDocument" DataTextField="EmployeeName" DataValueField="EmployeeID" SelectedValue='<%# Bind("EmployeeID") %>' Enabled="False" runat="server" />
                            </EditItemTemplate>
                        </asp:TemplateField>                         
                        <asp:BoundField DataField="HireDate" HeaderText="HireDate" SortExpression="HireDate" />
                        <asp:BoundField DataField="TerminationDate" HeaderText="TerminationDate" SortExpression="TerminationDate" />
                        <asp:BoundField DataField="LastUpdated" HeaderText="LastUpdated" SortExpression="LastUpdated" />
                        <asp:BoundField DataField="UpdatedBy" HeaderText="UpdatedBy" SortExpression="UpdatedBy" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" />
                    </Fields>
                </asp:DetailsView>
            </div>
                <asp:SqlDataSource ID="sdsCompany" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [Companies] WHERE [CompID] = @original_CompID AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([NonDOTRandoms] = @original_NonDOTRandoms) OR ([NonDOTRandoms] IS NULL AND @original_NonDOTRandoms IS NULL)) AND [ProgID] = @original_ProgID AND (([SICCode] = @original_SICCode) OR ([SICCode] IS NULL AND @original_SICCode IS NULL)) AND (([InsPolicyNo] = @original_InsPolicyNo) OR ([InsPolicyNo] IS NULL AND @original_InsPolicyNo IS NULL)) AND (([UCReportingNo] = @original_UCReportingNo) OR ([UCReportingNo] IS NULL AND @original_UCReportingNo IS NULL)) AND (([LicReviewPerson] = @original_LicReviewPerson) OR ([LicReviewPerson] IS NULL AND @original_LicReviewPerson IS NULL)) AND (([LicReviewTitle] = @original_LicReviewTitle) OR ([LicReviewTitle] IS NULL AND @original_LicReviewTitle IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([OwnerOperator] = @original_OwnerOperator) OR ([OwnerOperator] IS NULL AND @original_OwnerOperator IS NULL)) AND (([PASI210] = @original_PASI210) OR ([PASI210] IS NULL AND @original_PASI210 IS NULL)) AND (([PASQ320] = @original_PASQ320) OR ([PASQ320] IS NULL AND @original_PASQ320 IS NULL)) AND (([PASQ400] = @original_PASQ400) OR ([PASQ400] IS NULL AND @original_PASQ400 IS NULL)) AND (([PASScanning] = @original_PASScanning) OR ([PASScanning] IS NULL AND @original_PASScanning IS NULL)) AND (([Misc] = @original_Misc) OR ([Misc] IS NULL AND @original_Misc IS NULL)) AND (([Address1Note] = @original_Address1Note) OR ([Address1Note] IS NULL AND @original_Address1Note IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([Address2Note] = @original_Address2Note) OR ([Address2Note] IS NULL AND @original_Address2Note IS NULL)) AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND (([City2] = @original_City2) OR ([City2] IS NULL AND @original_City2 IS NULL)) AND (([State2] = @original_State2) OR ([State2] IS NULL AND @original_State2 IS NULL)) AND (([ZipCode2] = @original_ZipCode2) OR ([ZipCode2] IS NULL AND @original_ZipCode2 IS NULL)) AND (([Contact1FName] = @original_Contact1FName) OR ([Contact1FName] IS NULL AND @original_Contact1FName IS NULL)) AND (([Contact1LName] = @original_Contact1LName) OR ([Contact1LName] IS NULL AND @original_Contact1LName IS NULL)) AND (([Contact1Title] = @original_Contact1Title) OR ([Contact1Title] IS NULL AND @original_Contact1Title IS NULL)) AND (([Contact1PhoneNo1] = @original_Contact1PhoneNo1) OR ([Contact1PhoneNo1] IS NULL AND @original_Contact1PhoneNo1 IS NULL)) AND (([Contact1PhoneNo2] = @original_Contact1PhoneNo2) OR ([Contact1PhoneNo2] IS NULL AND @original_Contact1PhoneNo2 IS NULL)) AND (([Contact1PhoneNo3] = @original_Contact1PhoneNo3) OR ([Contact1PhoneNo3] IS NULL AND @original_Contact1PhoneNo3 IS NULL)) AND (([Contact1Fax] = @original_Contact1Fax) OR ([Contact1Fax] IS NULL AND @original_Contact1Fax IS NULL)) AND (([Contact1EMail] = @original_Contact1EMail) OR ([Contact1EMail] IS NULL AND @original_Contact1EMail IS NULL)) AND (([Contact2FName] = @original_Contact2FName) OR ([Contact2FName] IS NULL AND @original_Contact2FName IS NULL)) AND (([Contact2LName] = @original_Contact2LName) OR ([Contact2LName] IS NULL AND @original_Contact2LName IS NULL)) AND (([Contact2Title] = @original_Contact2Title) OR ([Contact2Title] IS NULL AND @original_Contact2Title IS NULL)) AND (([Contact2PhoneNo1] = @original_Contact2PhoneNo1) OR ([Contact2PhoneNo1] IS NULL AND @original_Contact2PhoneNo1 IS NULL)) AND (([Contact2PhoneNo2] = @original_Contact2PhoneNo2) OR ([Contact2PhoneNo2] IS NULL AND @original_Contact2PhoneNo2 IS NULL)) AND (([Contact2PhoneNo3] = @original_Contact2PhoneNo3) OR ([Contact2PhoneNo3] IS NULL AND @original_Contact2PhoneNo3 IS NULL)) AND (([Contact2Fax] = @original_Contact2Fax) OR ([Contact2Fax] IS NULL AND @original_Contact2Fax IS NULL)) AND (([Contact2EMail] = @original_Contact2EMail) OR ([Contact2EMail] IS NULL AND @original_Contact2EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [Companies] ([CompanyName], [NonDOTRandoms], [ProgID], [SICCode], [InsPolicyNo], [UCReportingNo], [LicReviewPerson], [LicReviewTitle], [Notes], [OwnerOperator], [PASI210], [PASQ320], [PASQ400], [PASScanning], [Misc], [Address1Note], [Address1], [City1], [State1], [ZipCode1], [Address2Note], [Address2], [City2], [State2], [ZipCode2], [Contact1FName], [Contact1LName], [Contact1Title], [Contact1PhoneNo1], [Contact1PhoneNo2], [Contact1PhoneNo3], [Contact1Fax], [Contact1EMail], [Contact2FName], [Contact2LName], [Contact2Title], [Contact2PhoneNo1], [Contact2PhoneNo2], [Contact2PhoneNo3], [Contact2Fax], [Contact2EMail], [LastUpdated], [UpdatedBy]) VALUES (@CompanyName, @NonDOTRandoms, @ProgID, @SICCode, @InsPolicyNo, @UCReportingNo, @LicReviewPerson, @LicReviewTitle, @Notes, @OwnerOperator, @PASI210, @PASQ320, @PASQ400, @PASScanning, @Misc, @Address1Note, @Address1, @City1, @State1, @ZipCode1, @Address2Note, @Address2, @City2, @State2, @ZipCode2, @Contact1FName, @Contact1LName, @Contact1Title, @Contact1PhoneNo1, @Contact1PhoneNo2, @Contact1PhoneNo3, @Contact1Fax, @Contact1EMail, @Contact2FName, @Contact2LName, @Contact2Title, @Contact2PhoneNo1, @Contact2PhoneNo2, @Contact2PhoneNo3, @Contact2Fax, @Contact2EMail, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Companies] ORDER BY [CompanyName]" UpdateCommand="UPDATE [Companies] SET [CompanyName] = @CompanyName, [NonDOTRandoms] = @NonDOTRandoms, [ProgID] = @ProgID, [SICCode] = @SICCode, [InsPolicyNo] = @InsPolicyNo, [UCReportingNo] = @UCReportingNo, [LicReviewPerson] = @LicReviewPerson, [LicReviewTitle] = @LicReviewTitle, [Notes] = @Notes, [OwnerOperator] = @OwnerOperator, [PASI210] = @PASI210, [PASQ320] = @PASQ320, [PASQ400] = @PASQ400, [PASScanning] = @PASScanning, [Misc] = @Misc, [Address1Note] = @Address1Note, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [Address2Note] = @Address2Note, [Address2] = @Address2, [City2] = @City2, [State2] = @State2, [ZipCode2] = @ZipCode2, [Contact1FName] = @Contact1FName, [Contact1LName] = @Contact1LName, [Contact1Title] = @Contact1Title, [Contact1PhoneNo1] = @Contact1PhoneNo1, [Contact1PhoneNo2] = @Contact1PhoneNo2, [Contact1PhoneNo3] = @Contact1PhoneNo3, [Contact1Fax] = @Contact1Fax, [Contact1EMail] = @Contact1EMail, [Contact2FName] = @Contact2FName, [Contact2LName] = @Contact2LName, [Contact2Title] = @Contact2Title, [Contact2PhoneNo1] = @Contact2PhoneNo1, [Contact2PhoneNo2] = @Contact2PhoneNo2, [Contact2PhoneNo3] = @Contact2PhoneNo3, [Contact2Fax] = @Contact2Fax, [Contact2EMail] = @Contact2EMail, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [CompID] = @original_CompID AND (([CompanyName] = @original_CompanyName) OR ([CompanyName] IS NULL AND @original_CompanyName IS NULL)) AND (([NonDOTRandoms] = @original_NonDOTRandoms) OR ([NonDOTRandoms] IS NULL AND @original_NonDOTRandoms IS NULL)) AND [ProgID] = @original_ProgID AND (([SICCode] = @original_SICCode) OR ([SICCode] IS NULL AND @original_SICCode IS NULL)) AND (([InsPolicyNo] = @original_InsPolicyNo) OR ([InsPolicyNo] IS NULL AND @original_InsPolicyNo IS NULL)) AND (([UCReportingNo] = @original_UCReportingNo) OR ([UCReportingNo] IS NULL AND @original_UCReportingNo IS NULL)) AND (([LicReviewPerson] = @original_LicReviewPerson) OR ([LicReviewPerson] IS NULL AND @original_LicReviewPerson IS NULL)) AND (([LicReviewTitle] = @original_LicReviewTitle) OR ([LicReviewTitle] IS NULL AND @original_LicReviewTitle IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([OwnerOperator] = @original_OwnerOperator) OR ([OwnerOperator] IS NULL AND @original_OwnerOperator IS NULL)) AND (([PASI210] = @original_PASI210) OR ([PASI210] IS NULL AND @original_PASI210 IS NULL)) AND (([PASQ320] = @original_PASQ320) OR ([PASQ320] IS NULL AND @original_PASQ320 IS NULL)) AND (([PASQ400] = @original_PASQ400) OR ([PASQ400] IS NULL AND @original_PASQ400 IS NULL)) AND (([PASScanning] = @original_PASScanning) OR ([PASScanning] IS NULL AND @original_PASScanning IS NULL)) AND (([Misc] = @original_Misc) OR ([Misc] IS NULL AND @original_Misc IS NULL)) AND (([Address1Note] = @original_Address1Note) OR ([Address1Note] IS NULL AND @original_Address1Note IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([Address2Note] = @original_Address2Note) OR ([Address2Note] IS NULL AND @original_Address2Note IS NULL)) AND (([Address2] = @original_Address2) OR ([Address2] IS NULL AND @original_Address2 IS NULL)) AND (([City2] = @original_City2) OR ([City2] IS NULL AND @original_City2 IS NULL)) AND (([State2] = @original_State2) OR ([State2] IS NULL AND @original_State2 IS NULL)) AND (([ZipCode2] = @original_ZipCode2) OR ([ZipCode2] IS NULL AND @original_ZipCode2 IS NULL)) AND (([Contact1FName] = @original_Contact1FName) OR ([Contact1FName] IS NULL AND @original_Contact1FName IS NULL)) AND (([Contact1LName] = @original_Contact1LName) OR ([Contact1LName] IS NULL AND @original_Contact1LName IS NULL)) AND (([Contact1Title] = @original_Contact1Title) OR ([Contact1Title] IS NULL AND @original_Contact1Title IS NULL)) AND (([Contact1PhoneNo1] = @original_Contact1PhoneNo1) OR ([Contact1PhoneNo1] IS NULL AND @original_Contact1PhoneNo1 IS NULL)) AND (([Contact1PhoneNo2] = @original_Contact1PhoneNo2) OR ([Contact1PhoneNo2] IS NULL AND @original_Contact1PhoneNo2 IS NULL)) AND (([Contact1PhoneNo3] = @original_Contact1PhoneNo3) OR ([Contact1PhoneNo3] IS NULL AND @original_Contact1PhoneNo3 IS NULL)) AND (([Contact1Fax] = @original_Contact1Fax) OR ([Contact1Fax] IS NULL AND @original_Contact1Fax IS NULL)) AND (([Contact1EMail] = @original_Contact1EMail) OR ([Contact1EMail] IS NULL AND @original_Contact1EMail IS NULL)) AND (([Contact2FName] = @original_Contact2FName) OR ([Contact2FName] IS NULL AND @original_Contact2FName IS NULL)) AND (([Contact2LName] = @original_Contact2LName) OR ([Contact2LName] IS NULL AND @original_Contact2LName IS NULL)) AND (([Contact2Title] = @original_Contact2Title) OR ([Contact2Title] IS NULL AND @original_Contact2Title IS NULL)) AND (([Contact2PhoneNo1] = @original_Contact2PhoneNo1) OR ([Contact2PhoneNo1] IS NULL AND @original_Contact2PhoneNo1 IS NULL)) AND (([Contact2PhoneNo2] = @original_Contact2PhoneNo2) OR ([Contact2PhoneNo2] IS NULL AND @original_Contact2PhoneNo2 IS NULL)) AND (([Contact2PhoneNo3] = @original_Contact2PhoneNo3) OR ([Contact2PhoneNo3] IS NULL AND @original_Contact2PhoneNo3 IS NULL)) AND (([Contact2Fax] = @original_Contact2Fax) OR ([Contact2Fax] IS NULL AND @original_Contact2Fax IS NULL)) AND (([Contact2EMail] = @original_Contact2EMail) OR ([Contact2EMail] IS NULL AND @original_Contact2EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_CompanyName" Type="String" />
                        <asp:Parameter Name="original_NonDOTRandoms" Type="Boolean" />
                        <asp:Parameter Name="original_ProgID" Type="Int32" />
                        <asp:Parameter Name="original_SICCode" Type="String" />
                        <asp:Parameter Name="original_InsPolicyNo" Type="String" />
                        <asp:Parameter Name="original_UCReportingNo" Type="String" />
                        <asp:Parameter Name="original_LicReviewPerson" Type="String" />
                        <asp:Parameter Name="original_LicReviewTitle" Type="String" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_OwnerOperator" Type="Boolean" />
                        <asp:Parameter Name="original_PASI210" Type="Boolean" />
                        <asp:Parameter Name="original_PASQ320" Type="Boolean" />
                        <asp:Parameter Name="original_PASQ400" Type="Boolean" />
                        <asp:Parameter Name="original_PASScanning" Type="Boolean" />
                        <asp:Parameter Name="original_Misc" Type="Boolean" />
                        <asp:Parameter Name="original_Address1Note" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_Address2Note" Type="String" />
                        <asp:Parameter Name="original_Address2" Type="String" />
                        <asp:Parameter Name="original_City2" Type="String" />
                        <asp:Parameter Name="original_State2" Type="String" />
                        <asp:Parameter Name="original_ZipCode2" Type="String" />
                        <asp:Parameter Name="original_Contact1FName" Type="String" />
                        <asp:Parameter Name="original_Contact1LName" Type="String" />
                        <asp:Parameter Name="original_Contact1Title" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Contact1Fax" Type="String" />
                        <asp:Parameter Name="original_Contact1EMail" Type="String" />
                        <asp:Parameter Name="original_Contact2FName" Type="String" />
                        <asp:Parameter Name="original_Contact2LName" Type="String" />
                        <asp:Parameter Name="original_Contact2Title" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Contact2Fax" Type="String" />
                        <asp:Parameter Name="original_Contact2EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="NonDOTRandoms" Type="Boolean" />
                        <asp:Parameter Name="ProgID" Type="Int32" />
                        <asp:Parameter Name="SICCode" Type="String" />
                        <asp:Parameter Name="InsPolicyNo" Type="String" />
                        <asp:Parameter Name="UCReportingNo" Type="String" />
                        <asp:Parameter Name="LicReviewPerson" Type="String" />
                        <asp:Parameter Name="LicReviewTitle" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="OwnerOperator" Type="Boolean" />
                        <asp:Parameter Name="PASI210" Type="Boolean" />
                        <asp:Parameter Name="PASQ320" Type="Boolean" />
                        <asp:Parameter Name="PASQ400" Type="Boolean" />
                        <asp:Parameter Name="PASScanning" Type="Boolean" />
                        <asp:Parameter Name="Misc" Type="Boolean" />
                        <asp:Parameter Name="Address1Note" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="Address2Note" Type="String" />
                        <asp:Parameter Name="Address2" Type="String" />
                        <asp:Parameter Name="City2" Type="String" />
                        <asp:Parameter Name="State2" Type="String" />
                        <asp:Parameter Name="ZipCode2" Type="String" />
                        <asp:Parameter Name="Contact1FName" Type="String" />
                        <asp:Parameter Name="Contact1LName" Type="String" />
                        <asp:Parameter Name="Contact1Title" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo1" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo2" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo3" Type="String" />
                        <asp:Parameter Name="Contact1Fax" Type="String" />
                        <asp:Parameter Name="Contact1EMail" Type="String" />
                        <asp:Parameter Name="Contact2FName" Type="String" />
                        <asp:Parameter Name="Contact2LName" Type="String" />
                        <asp:Parameter Name="Contact2Title" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo1" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo2" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo3" Type="String" />
                        <asp:Parameter Name="Contact2Fax" Type="String" />
                        <asp:Parameter Name="Contact2EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CompanyName" Type="String" />
                        <asp:Parameter Name="NonDOTRandoms" Type="Boolean" />
                        <asp:Parameter Name="ProgID" Type="Int32" />
                        <asp:Parameter Name="SICCode" Type="String" />
                        <asp:Parameter Name="InsPolicyNo" Type="String" />
                        <asp:Parameter Name="UCReportingNo" Type="String" />
                        <asp:Parameter Name="LicReviewPerson" Type="String" />
                        <asp:Parameter Name="LicReviewTitle" Type="String" />
                        <asp:Parameter Name="Notes" Type="String" />
                        <asp:Parameter Name="OwnerOperator" Type="Boolean" />
                        <asp:Parameter Name="PASI210" Type="Boolean" />
                        <asp:Parameter Name="PASQ320" Type="Boolean" />
                        <asp:Parameter Name="PASQ400" Type="Boolean" />
                        <asp:Parameter Name="PASScanning" Type="Boolean" />
                        <asp:Parameter Name="Misc" Type="Boolean" />
                        <asp:Parameter Name="Address1Note" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="Address2Note" Type="String" />
                        <asp:Parameter Name="Address2" Type="String" />
                        <asp:Parameter Name="City2" Type="String" />
                        <asp:Parameter Name="State2" Type="String" />
                        <asp:Parameter Name="ZipCode2" Type="String" />
                        <asp:Parameter Name="Contact1FName" Type="String" />
                        <asp:Parameter Name="Contact1LName" Type="String" />
                        <asp:Parameter Name="Contact1Title" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo1" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo2" Type="String" />
                        <asp:Parameter Name="Contact1PhoneNo3" Type="String" />
                        <asp:Parameter Name="Contact1Fax" Type="String" />
                        <asp:Parameter Name="Contact1EMail" Type="String" />
                        <asp:Parameter Name="Contact2FName" Type="String" />
                        <asp:Parameter Name="Contact2LName" Type="String" />
                        <asp:Parameter Name="Contact2Title" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo1" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo2" Type="String" />
                        <asp:Parameter Name="Contact2PhoneNo3" Type="String" />
                        <asp:Parameter Name="Contact2Fax" Type="String" />
                        <asp:Parameter Name="Contact2EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_CompID" Type="Int32" />
                        <asp:Parameter Name="original_CompanyName" Type="String" />
                        <asp:Parameter Name="original_NonDOTRandoms" Type="Boolean" />
                        <asp:Parameter Name="original_ProgID" Type="Int32" />
                        <asp:Parameter Name="original_SICCode" Type="String" />
                        <asp:Parameter Name="original_InsPolicyNo" Type="String" />
                        <asp:Parameter Name="original_UCReportingNo" Type="String" />
                        <asp:Parameter Name="original_LicReviewPerson" Type="String" />
                        <asp:Parameter Name="original_LicReviewTitle" Type="String" />
                        <asp:Parameter Name="original_Notes" Type="String" />
                        <asp:Parameter Name="original_OwnerOperator" Type="Boolean" />
                        <asp:Parameter Name="original_PASI210" Type="Boolean" />
                        <asp:Parameter Name="original_PASQ320" Type="Boolean" />
                        <asp:Parameter Name="original_PASQ400" Type="Boolean" />
                        <asp:Parameter Name="original_PASScanning" Type="Boolean" />
                        <asp:Parameter Name="original_Misc" Type="Boolean" />
                        <asp:Parameter Name="original_Address1Note" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_Address2Note" Type="String" />
                        <asp:Parameter Name="original_Address2" Type="String" />
                        <asp:Parameter Name="original_City2" Type="String" />
                        <asp:Parameter Name="original_State2" Type="String" />
                        <asp:Parameter Name="original_ZipCode2" Type="String" />
                        <asp:Parameter Name="original_Contact1FName" Type="String" />
                        <asp:Parameter Name="original_Contact1LName" Type="String" />
                        <asp:Parameter Name="original_Contact1Title" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_Contact1PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Contact1Fax" Type="String" />
                        <asp:Parameter Name="original_Contact1EMail" Type="String" />
                        <asp:Parameter Name="original_Contact2FName" Type="String" />
                        <asp:Parameter Name="original_Contact2LName" Type="String" />
                        <asp:Parameter Name="original_Contact2Title" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_Contact2PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Contact2Fax" Type="String" />
                        <asp:Parameter Name="original_Contact2EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDocTypes" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [DocTypes] WHERE [DocTypeID] = @original_DocTypeID AND (([DocumentType] = @original_DocumentType) OR ([DocumentType] IS NULL AND @original_DocumentType IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [DocTypes] ([DocumentType], [Description]) VALUES (@DocumentType, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DocTypes] ORDER BY [DocTypeID]" UpdateCommand="UPDATE [DocTypes] SET [DocumentType] = @DocumentType, [Description] = @Description WHERE [DocTypeID] = @original_DocTypeID AND (([DocumentType] = @original_DocumentType) OR ([DocumentType] IS NULL AND @original_DocumentType IS NULL)) AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DocTypeID" Type="Int32" />
                        <asp:Parameter Name="original_DocumentType" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="DocumentType" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="DocumentType" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="original_DocTypeID" Type="Int32" />
                        <asp:Parameter Name="original_DocumentType" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDocStatus" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [DocStatus] WHERE [Status] = @original_Status AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [DocStatus] ([Status], [Description]) VALUES (@Status, @Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DocStatus]" UpdateCommand="UPDATE [DocStatus] SET [Description] = @Description WHERE [Status] = @original_Status AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Status" Type="String" />
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="original_Status" Type="String" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsLabs" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [Laboratories] WHERE [LabID] = @original_LabID AND (([LabName] = @original_LabName) OR ([LabName] IS NULL AND @original_LabName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [Laboratories] ([LabName], [Address1], [City1], [State1], [ZipCode1], [ContactFName], [ContactLName], [ContactTitle], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [LastUpdated], [UpdatedBy]) VALUES (@LabName, @Address1, @City1, @State1, @ZipCode1, @ContactFName, @ContactLName, @ContactTitle, @PhoneNo1, @PhoneNo2, @PhoneNo3, @Fax, @EMail, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Laboratories] ORDER BY [LabName]" UpdateCommand="UPDATE [Laboratories] SET [LabName] = @LabName, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [ContactFName] = @ContactFName, [ContactLName] = @ContactLName, [ContactTitle] = @ContactTitle, [PhoneNo1] = @PhoneNo1, [PhoneNo2] = @PhoneNo2, [PhoneNo3] = @PhoneNo3, [Fax] = @Fax, [EMail] = @EMail, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [LabID] = @original_LabID AND (([LabName] = @original_LabName) OR ([LabName] IS NULL AND @original_LabName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_LabID" Type="Int32" />
                        <asp:Parameter Name="original_LabName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LabName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LabName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_LabID" Type="Int32" />
                        <asp:Parameter Name="original_LabName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsMRO" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [MedicalReviewOfficers] WHERE [MROID] = @original_MROID AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [MedicalReviewOfficers] ([LastName], [FirstName], [Address1], [City1], [State1], [ZipCode1], [ContactFName], [ContactLName], [ContactTitle], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [LastUpdated], [UpdatedBy]) VALUES (@LastName, @FirstName, @Address1, @City1, @State1, @ZipCode1, @ContactFName, @ContactLName, @ContactTitle, @PhoneNo1, @PhoneNo2, @PhoneNo3, @Fax, @EMail, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [MedicalReviewOfficers] ORDER BY [LastName], [FirstName]" UpdateCommand="UPDATE [MedicalReviewOfficers] SET [LastName] = @LastName, [FirstName] = @FirstName, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [ContactFName] = @ContactFName, [ContactLName] = @ContactLName, [ContactTitle] = @ContactTitle, [PhoneNo1] = @PhoneNo1, [PhoneNo2] = @PhoneNo2, [PhoneNo3] = @PhoneNo3, [Fax] = @Fax, [EMail] = @EMail, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [MROID] = @original_MROID AND [LastName] = @original_LastName AND (([FirstName] = @original_FirstName) OR ([FirstName] IS NULL AND @original_FirstName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_MROID" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="LastName" Type="String" />
                        <asp:Parameter Name="FirstName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_MROID" Type="Int32" />
                        <asp:Parameter Name="original_LastName" Type="String" />
                        <asp:Parameter Name="original_FirstName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsCollectionSites" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [CollectionSites] WHERE [CollectionSiteID] = @original_CollectionSiteID AND (([CollName] = @original_CollName) OR ([CollName] IS NULL AND @original_CollName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([Terms] = @original_Terms) OR ([Terms] IS NULL AND @original_Terms IS NULL)) AND (([Misc] = @original_Misc) OR ([Misc] IS NULL AND @original_Misc IS NULL)) AND (([DateInput] = @original_DateInput) OR ([DateInput] IS NULL AND @original_DateInput IS NULL)) AND (([MedicalExaminerFName] = @original_MedicalExaminerFName) OR ([MedicalExaminerFName] IS NULL AND @original_MedicalExaminerFName IS NULL)) AND (([MedicalExaminerLName] = @original_MedicalExaminerLName) OR ([MedicalExaminerLName] IS NULL AND @original_MedicalExaminerLName IS NULL)) AND (([MedicalExaminerTitle] = @original_MedicalExaminerTitle) OR ([MedicalExaminerTitle] IS NULL AND @original_MedicalExaminerTitle IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [CollectionSites] ([CollName], [Address1], [City1], [State1], [ZipCode1], [ContactFName], [ContactLName], [ContactTitle], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [Terms], [Misc], [DateInput], [MedicalExaminerFName], [MedicalExaminerLName], [MedicalExaminerTitle], [LastUpdated], [UpdatedBy]) VALUES (@CollName, @Address1, @City1, @State1, @ZipCode1, @ContactFName, @ContactLName, @ContactTitle, @PhoneNo1, @PhoneNo2, @PhoneNo3, @Fax, @EMail, @Terms, @Misc, @DateInput, @MedicalExaminerFName, @MedicalExaminerLName, @MedicalExaminerTitle, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [CollectionSites] ORDER BY [CollName]" UpdateCommand="UPDATE [CollectionSites] SET [CollName] = @CollName, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [ContactFName] = @ContactFName, [ContactLName] = @ContactLName, [ContactTitle] = @ContactTitle, [PhoneNo1] = @PhoneNo1, [PhoneNo2] = @PhoneNo2, [PhoneNo3] = @PhoneNo3, [Fax] = @Fax, [EMail] = @EMail, [Terms] = @Terms, [Misc] = @Misc, [DateInput] = @DateInput, [MedicalExaminerFName] = @MedicalExaminerFName, [MedicalExaminerLName] = @MedicalExaminerLName, [MedicalExaminerTitle] = @MedicalExaminerTitle, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [CollectionSiteID] = @original_CollectionSiteID AND (([CollName] = @original_CollName) OR ([CollName] IS NULL AND @original_CollName IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([ContactFName] = @original_ContactFName) OR ([ContactFName] IS NULL AND @original_ContactFName IS NULL)) AND (([ContactLName] = @original_ContactLName) OR ([ContactLName] IS NULL AND @original_ContactLName IS NULL)) AND (([ContactTitle] = @original_ContactTitle) OR ([ContactTitle] IS NULL AND @original_ContactTitle IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([Terms] = @original_Terms) OR ([Terms] IS NULL AND @original_Terms IS NULL)) AND (([Misc] = @original_Misc) OR ([Misc] IS NULL AND @original_Misc IS NULL)) AND (([DateInput] = @original_DateInput) OR ([DateInput] IS NULL AND @original_DateInput IS NULL)) AND (([MedicalExaminerFName] = @original_MedicalExaminerFName) OR ([MedicalExaminerFName] IS NULL AND @original_MedicalExaminerFName IS NULL)) AND (([MedicalExaminerLName] = @original_MedicalExaminerLName) OR ([MedicalExaminerLName] IS NULL AND @original_MedicalExaminerLName IS NULL)) AND (([MedicalExaminerTitle] = @original_MedicalExaminerTitle) OR ([MedicalExaminerTitle] IS NULL AND @original_MedicalExaminerTitle IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="original_CollName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_Terms" Type="String" />
                        <asp:Parameter Name="original_Misc" Type="Boolean" />
                        <asp:Parameter Name="original_DateInput" Type="DateTime" />
                        <asp:Parameter Name="original_MedicalExaminerFName" Type="String" />
                        <asp:Parameter Name="original_MedicalExaminerLName" Type="String" />
                        <asp:Parameter Name="original_MedicalExaminerTitle" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="CollName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="Terms" Type="String" />
                        <asp:Parameter Name="Misc" Type="Boolean" />
                        <asp:Parameter Name="DateInput" Type="DateTime" />
                        <asp:Parameter Name="MedicalExaminerFName" Type="String" />
                        <asp:Parameter Name="MedicalExaminerLName" Type="String" />
                        <asp:Parameter Name="MedicalExaminerTitle" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="CollName" Type="String" />
                        <asp:Parameter Name="Address1" Type="String" />
                        <asp:Parameter Name="City1" Type="String" />
                        <asp:Parameter Name="State1" Type="String" />
                        <asp:Parameter Name="ZipCode1" Type="String" />
                        <asp:Parameter Name="ContactFName" Type="String" />
                        <asp:Parameter Name="ContactLName" Type="String" />
                        <asp:Parameter Name="ContactTitle" Type="String" />
                        <asp:Parameter Name="PhoneNo1" Type="String" />
                        <asp:Parameter Name="PhoneNo2" Type="String" />
                        <asp:Parameter Name="PhoneNo3" Type="String" />
                        <asp:Parameter Name="Fax" Type="String" />
                        <asp:Parameter Name="EMail" Type="String" />
                        <asp:Parameter Name="Terms" Type="String" />
                        <asp:Parameter Name="Misc" Type="Boolean" />
                        <asp:Parameter Name="DateInput" Type="DateTime" />
                        <asp:Parameter Name="MedicalExaminerFName" Type="String" />
                        <asp:Parameter Name="MedicalExaminerLName" Type="String" />
                        <asp:Parameter Name="MedicalExaminerTitle" Type="String" />
                        <asp:Parameter Name="LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="UpdatedBy" Type="String" />
                        <asp:Parameter Name="original_CollectionSiteID" Type="Int32" />
                        <asp:Parameter Name="original_CollName" Type="String" />
                        <asp:Parameter Name="original_Address1" Type="String" />
                        <asp:Parameter Name="original_City1" Type="String" />
                        <asp:Parameter Name="original_State1" Type="String" />
                        <asp:Parameter Name="original_ZipCode1" Type="String" />
                        <asp:Parameter Name="original_ContactFName" Type="String" />
                        <asp:Parameter Name="original_ContactLName" Type="String" />
                        <asp:Parameter Name="original_ContactTitle" Type="String" />
                        <asp:Parameter Name="original_PhoneNo1" Type="String" />
                        <asp:Parameter Name="original_PhoneNo2" Type="String" />
                        <asp:Parameter Name="original_PhoneNo3" Type="String" />
                        <asp:Parameter Name="original_Fax" Type="String" />
                        <asp:Parameter Name="original_EMail" Type="String" />
                        <asp:Parameter Name="original_Terms" Type="String" />
                        <asp:Parameter Name="original_Misc" Type="Boolean" />
                        <asp:Parameter Name="original_DateInput" Type="DateTime" />
                        <asp:Parameter Name="original_MedicalExaminerFName" Type="String" />
                        <asp:Parameter Name="original_MedicalExaminerLName" Type="String" />
                        <asp:Parameter Name="original_MedicalExaminerTitle" Type="String" />
                        <asp:Parameter Name="original_LastUpdated" Type="DateTime" />
                        <asp:Parameter Name="original_UpdatedBy" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDrugTestType" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [DrugTestTypes] WHERE [DrugTestTypeID] = @original_DrugTestTypeID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [DrugTestTypes] ([Description]) VALUES (@Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DrugTestTypes]" UpdateCommand="UPDATE [DrugTestTypes] SET [Description] = @Description WHERE [DrugTestTypeID] = @original_DrugTestTypeID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="original_DrugTestTypeID" Type="Int32" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="sdsDrugType" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [DrugTypes] WHERE [DrugTypeID] = @original_DrugTypeID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))" InsertCommand="INSERT INTO [DrugTypes] ([Description]) VALUES (@Description)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [DrugTypes]" UpdateCommand="UPDATE [DrugTypes] SET [Description] = @Description WHERE [DrugTypeID] = @original_DrugTypeID AND (([Description] = @original_Description) OR ([Description] IS NULL AND @original_Description IS NULL))">
                    <DeleteParameters>
                        <asp:Parameter Name="original_DrugTypeID" Type="Int32" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="Description" Type="String" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="Description" Type="String" />
                        <asp:Parameter Name="original_DrugTypeID" Type="Int32" />
                        <asp:Parameter Name="original_Description" Type="String" />
                    </UpdateParameters>
                </asp:SqlDataSource>
    </div>
                <p>Select an Employee from the drop down list to View/Edit Employee Information.</br>
               Press the buttons to display the selected Employee's Documents, Drug Tests and Current and Previous Employers.</br>
               If 'Maximum request length exceeded' error occurs, just reload the page. This will occur after about 5 buttons pressed.</br>
            </p>
</asp:Content>
