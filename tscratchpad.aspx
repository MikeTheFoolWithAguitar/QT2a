<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="tscratchpad.aspx.cs" Inherits="WingtipToys.tscratchpad" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <h3>Scratch Pad</h3>
        <asp:AdRotator ID="AdRotator1" runat="server" AdvertisementFile="~/tscratchpadAds.xml"  />
    <asp:DataList ID="DataList1" runat="server" DataKeyField="EmployeeID" DataSourceID="SqlDataSource1">
        <ItemTemplate>
            EmployeeID:
            <asp:Label ID="EmployeeIDLabel" runat="server" Text='<%# Eval("EmployeeID") %>' />
            <br />
            CompID:
            <asp:Label ID="CompIDLabel" runat="server" Text='<%# Eval("CompID") %>' />
            <br />
            LName:
            <asp:Label ID="LNameLabel" runat="server" Text='<%# Eval("LName") %>' />
            <br />
            FName:
            <asp:Label ID="FNameLabel" runat="server" Text='<%# Eval("FName") %>' />
            <br />
            MInitial:
            <asp:Label ID="MInitialLabel" runat="server" Text='<%# Eval("MInitial") %>' />
            <br />
            SSNo:
            <asp:Label ID="SSNoLabel" runat="server" Text='<%# Eval("SSNo") %>' />
            <br />
            Title:
            <asp:Label ID="TitleLabel" runat="server" Text='<%# Eval("Title") %>' />
            <br />
            CDLdriver:
            <asp:Label ID="CDLdriverLabel" runat="server" Text='<%# Eval("CDLdriver") %>' />
            <br />
            CMVdriver:
            <asp:Label ID="CMVdriverLabel" runat="server" Text='<%# Eval("CMVdriver") %>' />
            <br />
            LicSt:
            <asp:Label ID="LicStLabel" runat="server" Text='<%# Eval("LicSt") %>' />
            <br />
            LicenseNo:
            <asp:Label ID="LicenseNoLabel" runat="server" Text='<%# Eval("LicenseNo") %>' />
            <br />
            LicenseClass:
            <asp:Label ID="LicenseClassLabel" runat="server" Text='<%# Eval("LicenseClass") %>' />
            <br />
            Sex:
            <asp:Label ID="SexLabel" runat="server" Text='<%# Eval("Sex") %>' />
            <br />
            BirthDate:
            <asp:Label ID="BirthDateLabel" runat="server" Text='<%# Eval("BirthDate") %>' />
            <br />
            AirBrakeRestr:
            <asp:Label ID="AirBrakeRestrLabel" runat="server" Text='<%# Eval("AirBrakeRestr") %>' />
            <br />
            Notes:
            <asp:Label ID="NotesLabel" runat="server" Text='<%# Eval("Notes") %>' />
            <br />
            Address1:
            <asp:Label ID="Address1Label" runat="server" Text='<%# Eval("Address1") %>' />
            <br />
            City1:
            <asp:Label ID="City1Label" runat="server" Text='<%# Eval("City1") %>' />
            <br />
            State1:
            <asp:Label ID="State1Label" runat="server" Text='<%# Eval("State1") %>' />
            <br />
            ZipCode1:
            <asp:Label ID="ZipCode1Label" runat="server" Text='<%# Eval("ZipCode1") %>' />
            <br />
            PhoneNo1:
            <asp:Label ID="PhoneNo1Label" runat="server" Text='<%# Eval("PhoneNo1") %>' />
            <br />
            PhoneNo2:
            <asp:Label ID="PhoneNo2Label" runat="server" Text='<%# Eval("PhoneNo2") %>' />
            <br />
            PhoneNo3:
            <asp:Label ID="PhoneNo3Label" runat="server" Text='<%# Eval("PhoneNo3") %>' />
            <br />
            Fax:
            <asp:Label ID="FaxLabel" runat="server" Text='<%# Eval("Fax") %>' />
            <br />
            EMail:
            <asp:Label ID="EMailLabel" runat="server" Text='<%# Eval("EMail") %>' />
            <br />
            LastUpdated:
            <asp:Label ID="LastUpdatedLabel" runat="server" Text='<%# Eval("LastUpdated") %>' />
            <br />
            UpdatedBy:
            <asp:Label ID="UpdatedByLabel" runat="server" Text='<%# Eval("UpdatedBy") %>' />
            <br />
<br />
        </ItemTemplate>
    </asp:DataList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:QT2a %>" DeleteCommand="DELETE FROM [Employees] WHERE [EmployeeID] = @original_EmployeeID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND [LName] = @original_LName AND [FName] = @original_FName AND (([MInitial] = @original_MInitial) OR ([MInitial] IS NULL AND @original_MInitial IS NULL)) AND [SSNo] = @original_SSNo AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([CDLdriver] = @original_CDLdriver) OR ([CDLdriver] IS NULL AND @original_CDLdriver IS NULL)) AND (([CMVdriver] = @original_CMVdriver) OR ([CMVdriver] IS NULL AND @original_CMVdriver IS NULL)) AND (([LicSt] = @original_LicSt) OR ([LicSt] IS NULL AND @original_LicSt IS NULL)) AND (([LicenseNo] = @original_LicenseNo) OR ([LicenseNo] IS NULL AND @original_LicenseNo IS NULL)) AND (([LicenseClass] = @original_LicenseClass) OR ([LicenseClass] IS NULL AND @original_LicenseClass IS NULL)) AND (([Sex] = @original_Sex) OR ([Sex] IS NULL AND @original_Sex IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AirBrakeRestr] = @original_AirBrakeRestr) OR ([AirBrakeRestr] IS NULL AND @original_AirBrakeRestr IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))" InsertCommand="INSERT INTO [Employees] ([CompID], [LName], [FName], [MInitial], [SSNo], [Title], [CDLdriver], [CMVdriver], [LicSt], [LicenseNo], [LicenseClass], [Sex], [BirthDate], [AirBrakeRestr], [Notes], [Address1], [City1], [State1], [ZipCode1], [PhoneNo1], [PhoneNo2], [PhoneNo3], [Fax], [EMail], [LastUpdated], [UpdatedBy]) VALUES (@CompID, @LName, @FName, @MInitial, @SSNo, @Title, @CDLdriver, @CMVdriver, @LicSt, @LicenseNo, @LicenseClass, @Sex, @BirthDate, @AirBrakeRestr, @Notes, @Address1, @City1, @State1, @ZipCode1, @PhoneNo1, @PhoneNo2, @PhoneNo3, @Fax, @EMail, @LastUpdated, @UpdatedBy)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT * FROM [Employees] ORDER BY [LName], [FName]" UpdateCommand="UPDATE [Employees] SET [CompID] = @CompID, [LName] = @LName, [FName] = @FName, [MInitial] = @MInitial, [SSNo] = @SSNo, [Title] = @Title, [CDLdriver] = @CDLdriver, [CMVdriver] = @CMVdriver, [LicSt] = @LicSt, [LicenseNo] = @LicenseNo, [LicenseClass] = @LicenseClass, [Sex] = @Sex, [BirthDate] = @BirthDate, [AirBrakeRestr] = @AirBrakeRestr, [Notes] = @Notes, [Address1] = @Address1, [City1] = @City1, [State1] = @State1, [ZipCode1] = @ZipCode1, [PhoneNo1] = @PhoneNo1, [PhoneNo2] = @PhoneNo2, [PhoneNo3] = @PhoneNo3, [Fax] = @Fax, [EMail] = @EMail, [LastUpdated] = @LastUpdated, [UpdatedBy] = @UpdatedBy WHERE [EmployeeID] = @original_EmployeeID AND (([CompID] = @original_CompID) OR ([CompID] IS NULL AND @original_CompID IS NULL)) AND [LName] = @original_LName AND [FName] = @original_FName AND (([MInitial] = @original_MInitial) OR ([MInitial] IS NULL AND @original_MInitial IS NULL)) AND [SSNo] = @original_SSNo AND (([Title] = @original_Title) OR ([Title] IS NULL AND @original_Title IS NULL)) AND (([CDLdriver] = @original_CDLdriver) OR ([CDLdriver] IS NULL AND @original_CDLdriver IS NULL)) AND (([CMVdriver] = @original_CMVdriver) OR ([CMVdriver] IS NULL AND @original_CMVdriver IS NULL)) AND (([LicSt] = @original_LicSt) OR ([LicSt] IS NULL AND @original_LicSt IS NULL)) AND (([LicenseNo] = @original_LicenseNo) OR ([LicenseNo] IS NULL AND @original_LicenseNo IS NULL)) AND (([LicenseClass] = @original_LicenseClass) OR ([LicenseClass] IS NULL AND @original_LicenseClass IS NULL)) AND (([Sex] = @original_Sex) OR ([Sex] IS NULL AND @original_Sex IS NULL)) AND (([BirthDate] = @original_BirthDate) OR ([BirthDate] IS NULL AND @original_BirthDate IS NULL)) AND (([AirBrakeRestr] = @original_AirBrakeRestr) OR ([AirBrakeRestr] IS NULL AND @original_AirBrakeRestr IS NULL)) AND (([Notes] = @original_Notes) OR ([Notes] IS NULL AND @original_Notes IS NULL)) AND (([Address1] = @original_Address1) OR ([Address1] IS NULL AND @original_Address1 IS NULL)) AND (([City1] = @original_City1) OR ([City1] IS NULL AND @original_City1 IS NULL)) AND (([State1] = @original_State1) OR ([State1] IS NULL AND @original_State1 IS NULL)) AND (([ZipCode1] = @original_ZipCode1) OR ([ZipCode1] IS NULL AND @original_ZipCode1 IS NULL)) AND (([PhoneNo1] = @original_PhoneNo1) OR ([PhoneNo1] IS NULL AND @original_PhoneNo1 IS NULL)) AND (([PhoneNo2] = @original_PhoneNo2) OR ([PhoneNo2] IS NULL AND @original_PhoneNo2 IS NULL)) AND (([PhoneNo3] = @original_PhoneNo3) OR ([PhoneNo3] IS NULL AND @original_PhoneNo3 IS NULL)) AND (([Fax] = @original_Fax) OR ([Fax] IS NULL AND @original_Fax IS NULL)) AND (([EMail] = @original_EMail) OR ([EMail] IS NULL AND @original_EMail IS NULL)) AND (([LastUpdated] = @original_LastUpdated) OR ([LastUpdated] IS NULL AND @original_LastUpdated IS NULL)) AND (([UpdatedBy] = @original_UpdatedBy) OR ([UpdatedBy] IS NULL AND @original_UpdatedBy IS NULL))">
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
  <%--  <asp:FormView ID="FormView1" runat="server" AllowPaging="True" DataKeyNames="EmployeeID" DataSourceID="SqlDataSource1">
        <EditItemTemplate>
            EmployeeID:
            <asp:DynamicControl ID="EmployeeIDDynamicControl" runat="server" DataField="EmployeeID" Mode="ReadOnly" />
            <br />
            CompID:
            <asp:DynamicControl ID="CompIDDynamicControl" runat="server" DataField="CompID" Mode="Edit" />
            <br />
            LName:
            <asp:DynamicControl ID="LNameDynamicControl" runat="server" DataField="LName" Mode="Edit" />
            <br />
            FName:
            <asp:DynamicControl ID="FNameDynamicControl" runat="server" DataField="FName" Mode="Edit" />
            <br />
            MInitial:
            <asp:DynamicControl ID="MInitialDynamicControl" runat="server" DataField="MInitial" Mode="Edit" />
            <br />
            SSNo:
            <asp:DynamicControl ID="SSNoDynamicControl" runat="server" DataField="SSNo" Mode="Edit" />
            <br />
            Title:
            <asp:DynamicControl ID="TitleDynamicControl" runat="server" DataField="Title" Mode="Edit" />
            <br />
            CDLdriver:
            <asp:DynamicControl ID="CDLdriverDynamicControl" runat="server" DataField="CDLdriver" Mode="Edit" />
            <br />
            CMVdriver:
            <asp:DynamicControl ID="CMVdriverDynamicControl" runat="server" DataField="CMVdriver" Mode="Edit" />
            <br />
            LicSt:
            <asp:DynamicControl ID="LicStDynamicControl" runat="server" DataField="LicSt" Mode="Edit" />
            <br />
            LicenseNo:
            <asp:DynamicControl ID="LicenseNoDynamicControl" runat="server" DataField="LicenseNo" Mode="Edit" />
            <br />
            LicenseClass:
            <asp:DynamicControl ID="LicenseClassDynamicControl" runat="server" DataField="LicenseClass" Mode="Edit" />
            <br />
            Sex:
            <asp:DynamicControl ID="SexDynamicControl" runat="server" DataField="Sex" Mode="Edit" />
            <br />
            BirthDate:
            <asp:DynamicControl ID="BirthDateDynamicControl" runat="server" DataField="BirthDate" Mode="Edit" />
            <br />
            AirBrakeRestr:
            <asp:DynamicControl ID="AirBrakeRestrDynamicControl" runat="server" DataField="AirBrakeRestr" Mode="Edit" />
            <br />
            Notes:
            <asp:DynamicControl ID="NotesDynamicControl" runat="server" DataField="Notes" Mode="Edit" />
            <br />
            Address1:
            <asp:DynamicControl ID="Address1DynamicControl" runat="server" DataField="Address1" Mode="Edit" />
            <br />
            City1:
            <asp:DynamicControl ID="City1DynamicControl" runat="server" DataField="City1" Mode="Edit" />
            <br />
            State1:
            <asp:DynamicControl ID="State1DynamicControl" runat="server" DataField="State1" Mode="Edit" />
            <br />
            ZipCode1:
            <asp:DynamicControl ID="ZipCode1DynamicControl" runat="server" DataField="ZipCode1" Mode="Edit" />
            <br />
            PhoneNo1:
            <asp:DynamicControl ID="PhoneNo1DynamicControl" runat="server" DataField="PhoneNo1" Mode="Edit" />
            <br />
            PhoneNo2:
            <asp:DynamicControl ID="PhoneNo2DynamicControl" runat="server" DataField="PhoneNo2" Mode="Edit" />
            <br />
            PhoneNo3:
            <asp:DynamicControl ID="PhoneNo3DynamicControl" runat="server" DataField="PhoneNo3" Mode="Edit" />
            <br />
            Fax:
            <asp:DynamicControl ID="FaxDynamicControl" runat="server" DataField="Fax" Mode="Edit" />
            <br />
            EMail:
            <asp:DynamicControl ID="EMailDynamicControl" runat="server" DataField="EMail" Mode="Edit" />
            <br />
            LastUpdated:
            <asp:DynamicControl ID="LastUpdatedDynamicControl" runat="server" DataField="LastUpdated" Mode="Edit" />
            <br />
            UpdatedBy:
            <asp:DynamicControl ID="UpdatedByDynamicControl" runat="server" DataField="UpdatedBy" Mode="Edit" />
            <br />
            <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update" Text="Update" ValidationGroup="Insert" />
            &nbsp;<asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </EditItemTemplate>
        <InsertItemTemplate>
            CompID:
            <asp:DynamicControl ID="CompIDDynamicControl" runat="server" DataField="CompID" Mode="Insert" ValidationGroup="Insert" />
            <br />
            LName:
            <asp:DynamicControl ID="LNameDynamicControl" runat="server" DataField="LName" Mode="Insert" ValidationGroup="Insert" />
            <br />
            FName:
            <asp:DynamicControl ID="FNameDynamicControl" runat="server" DataField="FName" Mode="Insert" ValidationGroup="Insert" />
            <br />
            MInitial:
            <asp:DynamicControl ID="MInitialDynamicControl" runat="server" DataField="MInitial" Mode="Insert" ValidationGroup="Insert" />
            <br />
            SSNo:
            <asp:DynamicControl ID="SSNoDynamicControl" runat="server" DataField="SSNo" Mode="Insert" ValidationGroup="Insert" />
            <br />
            Title:
            <asp:DynamicControl ID="TitleDynamicControl" runat="server" DataField="Title" Mode="Insert" ValidationGroup="Insert" />
            <br />
            CDLdriver:
            <asp:DynamicControl ID="CDLdriverDynamicControl" runat="server" DataField="CDLdriver" Mode="Insert" ValidationGroup="Insert" />
            <br />
            CMVdriver:
            <asp:DynamicControl ID="CMVdriverDynamicControl" runat="server" DataField="CMVdriver" Mode="Insert" ValidationGroup="Insert" />
            <br />
            LicSt:
            <asp:DynamicControl ID="LicStDynamicControl" runat="server" DataField="LicSt" Mode="Insert" ValidationGroup="Insert" />
            <br />
            LicenseNo:
            <asp:DynamicControl ID="LicenseNoDynamicControl" runat="server" DataField="LicenseNo" Mode="Insert" ValidationGroup="Insert" />
            <br />
            LicenseClass:
            <asp:DynamicControl ID="LicenseClassDynamicControl" runat="server" DataField="LicenseClass" Mode="Insert" ValidationGroup="Insert" />
            <br />
            Sex:
            <asp:DynamicControl ID="SexDynamicControl" runat="server" DataField="Sex" Mode="Insert" ValidationGroup="Insert" />
            <br />
            BirthDate:
            <asp:DynamicControl ID="BirthDateDynamicControl" runat="server" DataField="BirthDate" Mode="Insert" ValidationGroup="Insert" />
            <br />
            AirBrakeRestr:
            <asp:DynamicControl ID="AirBrakeRestrDynamicControl" runat="server" DataField="AirBrakeRestr" Mode="Insert" ValidationGroup="Insert" />
            <br />
            Notes:
            <asp:DynamicControl ID="NotesDynamicControl" runat="server" DataField="Notes" Mode="Insert" ValidationGroup="Insert" />
            <br />
            Address1:
            <asp:DynamicControl ID="Address1DynamicControl" runat="server" DataField="Address1" Mode="Insert" ValidationGroup="Insert" />
            <br />
            City1:
            <asp:DynamicControl ID="City1DynamicControl" runat="server" DataField="City1" Mode="Insert" ValidationGroup="Insert" />
            <br />
            State1:
            <asp:DynamicControl ID="State1DynamicControl" runat="server" DataField="State1" Mode="Insert" ValidationGroup="Insert" />
            <br />
            ZipCode1:
            <asp:DynamicControl ID="ZipCode1DynamicControl" runat="server" DataField="ZipCode1" Mode="Insert" ValidationGroup="Insert" />
            <br />
            PhoneNo1:
            <asp:DynamicControl ID="PhoneNo1DynamicControl" runat="server" DataField="PhoneNo1" Mode="Insert" ValidationGroup="Insert" />
            <br />
            PhoneNo2:
            <asp:DynamicControl ID="PhoneNo2DynamicControl" runat="server" DataField="PhoneNo2" Mode="Insert" ValidationGroup="Insert" />
            <br />
            PhoneNo3:
            <asp:DynamicControl ID="PhoneNo3DynamicControl" runat="server" DataField="PhoneNo3" Mode="Insert" ValidationGroup="Insert" />
            <br />
            Fax:
            <asp:DynamicControl ID="FaxDynamicControl" runat="server" DataField="Fax" Mode="Insert" ValidationGroup="Insert" />
            <br />
            EMail:
            <asp:DynamicControl ID="EMailDynamicControl" runat="server" DataField="EMail" Mode="Insert" ValidationGroup="Insert" />
            <br />
            LastUpdated:
            <asp:DynamicControl ID="LastUpdatedDynamicControl" runat="server" DataField="LastUpdated" Mode="Insert" ValidationGroup="Insert" />
            <br />
            UpdatedBy:
            <asp:DynamicControl ID="UpdatedByDynamicControl" runat="server" DataField="UpdatedBy" Mode="Insert" ValidationGroup="Insert" />
            <br />
            <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert" Text="Insert" ValidationGroup="Insert" />
            &nbsp;<asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel" Text="Cancel" />
        </InsertItemTemplate>
        <ItemTemplate>
            EmployeeID:
            <asp:DynamicControl ID="EmployeeIDDynamicControl" runat="server" DataField="EmployeeID" Mode="ReadOnly" />
            <br />
            CompID:
            <asp:DynamicControl ID="CompIDDynamicControl" runat="server" DataField="CompID" Mode="ReadOnly" />
            <br />
            LName:
            <asp:DynamicControl ID="LNameDynamicControl" runat="server" DataField="LName" Mode="ReadOnly" />
            <br />
            FName:
            <asp:DynamicControl ID="FNameDynamicControl" runat="server" DataField="FName" Mode="ReadOnly" />
            <br />
            MInitial:
            <asp:DynamicControl ID="MInitialDynamicControl" runat="server" DataField="MInitial" Mode="ReadOnly" />
            <br />
            SSNo:
            <asp:DynamicControl ID="SSNoDynamicControl" runat="server" DataField="SSNo" Mode="ReadOnly" />
            <br />
            Title:
            <asp:DynamicControl ID="TitleDynamicControl" runat="server" DataField="Title" Mode="ReadOnly" />
            <br />
            CDLdriver:
            <asp:DynamicControl ID="CDLdriverDynamicControl" runat="server" DataField="CDLdriver" Mode="ReadOnly" />
            <br />
            CMVdriver:
            <asp:DynamicControl ID="CMVdriverDynamicControl" runat="server" DataField="CMVdriver" Mode="ReadOnly" />
            <br />
            LicSt:
            <asp:DynamicControl ID="LicStDynamicControl" runat="server" DataField="LicSt" Mode="ReadOnly" />
            <br />
            LicenseNo:
            <asp:DynamicControl ID="LicenseNoDynamicControl" runat="server" DataField="LicenseNo" Mode="ReadOnly" />
            <br />
            LicenseClass:
            <asp:DynamicControl ID="LicenseClassDynamicControl" runat="server" DataField="LicenseClass" Mode="ReadOnly" />
            <br />
            Sex:
            <asp:DynamicControl ID="SexDynamicControl" runat="server" DataField="Sex" Mode="ReadOnly" />
            <br />
            BirthDate:
            <asp:DynamicControl ID="BirthDateDynamicControl" runat="server" DataField="BirthDate" Mode="ReadOnly" />
            <br />
            AirBrakeRestr:
            <asp:DynamicControl ID="AirBrakeRestrDynamicControl" runat="server" DataField="AirBrakeRestr" Mode="ReadOnly" />
            <br />
            Notes:
            <asp:DynamicControl ID="NotesDynamicControl" runat="server" DataField="Notes" Mode="ReadOnly" />
            <br />
            Address1:
            <asp:DynamicControl ID="Address1DynamicControl" runat="server" DataField="Address1" Mode="ReadOnly" />
            <br />
            City1:
            <asp:DynamicControl ID="City1DynamicControl" runat="server" DataField="City1" Mode="ReadOnly" />
            <br />
            State1:
            <asp:DynamicControl ID="State1DynamicControl" runat="server" DataField="State1" Mode="ReadOnly" />
            <br />
            ZipCode1:
            <asp:DynamicControl ID="ZipCode1DynamicControl" runat="server" DataField="ZipCode1" Mode="ReadOnly" />
            <br />
            PhoneNo1:
            <asp:DynamicControl ID="PhoneNo1DynamicControl" runat="server" DataField="PhoneNo1" Mode="ReadOnly" />
            <br />
            PhoneNo2:
            <asp:DynamicControl ID="PhoneNo2DynamicControl" runat="server" DataField="PhoneNo2" Mode="ReadOnly" />
            <br />
            PhoneNo3:
            <asp:DynamicControl ID="PhoneNo3DynamicControl" runat="server" DataField="PhoneNo3" Mode="ReadOnly" />
            <br />
            Fax:
            <asp:DynamicControl ID="FaxDynamicControl" runat="server" DataField="Fax" Mode="ReadOnly" />
            <br />
            EMail:
            <asp:DynamicControl ID="EMailDynamicControl" runat="server" DataField="EMail" Mode="ReadOnly" />
            <br />
            LastUpdated:
            <asp:DynamicControl ID="LastUpdatedDynamicControl" runat="server" DataField="LastUpdated" Mode="ReadOnly" />
            <br />
            UpdatedBy:
            <asp:DynamicControl ID="UpdatedByDynamicControl" runat="server" DataField="UpdatedBy" Mode="ReadOnly" />
            <br />
            <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit" Text="Edit" />
            &nbsp;<asp:LinkButton ID="DeleteButton" runat="server" CausesValidation="False" CommandName="Delete" Text="Delete" />
            &nbsp;<asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New" Text="New" />
        </ItemTemplate>
    </asp:FormView>--%>
    <p>
    </p>
</asp:Content>
