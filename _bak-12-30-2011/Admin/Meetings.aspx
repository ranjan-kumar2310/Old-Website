<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin/Admin.Master"
    Inherits="NHDNUG.Mvc.Admin.Admin_Meetings" CodeBehind="Meetings.aspx.cs" %>
<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
    
<asp:Content ContentPlaceHolderID="pageBody" runat="server">
<h2>Meetings</h2>
    <telerik:RadGrid ID="RadGrid1" runat="server" 
        DataSourceID="MeetingsListEntityDataSource"
        PageSize="10" EnableViewState="false" AllowSorting="true"
        GridLines="None" AllowPaging="true">
        <MasterTableView CellSpacing="-1" DataKeyNames="MeetingID" 
            DataSourceID="MeetingsListEntityDataSource"
            AutoGenerateColumns="False">
            <Columns>
                <telerik:GridButtonColumn Text="Select" CommandName="Select">
                </telerik:GridButtonColumn>
                <telerik:GridBoundColumn DataField="MeetingID" DataType="System.Int32" HeaderText="MeetingID"
                    ReadOnly="True" SortExpression="MeetingID" 
                    UniqueName="MeetingID" Visible="false">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="StartDateTime" 
                    DataType="System.DateTime" HeaderText="StartDateTime"
                    DataFormatString="{0:dd MMM yy hh:mm tt}"
                    SortExpression="StartDateTime" UniqueName="StartDateTime">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Duration" 
                    DataType="System.Int32" HeaderText="Duration"
                    Visible="false"
                    SortExpression="Duration" UniqueName="Duration">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Topic" HeaderText="Topic" SortExpression="Topic"
                    UniqueName="Topic">
                </telerik:GridBoundColumn>
                <%--                    <telerik:GridBoundColumn DataField="Description" HeaderText="Description" SortExpression="Description" UniqueName="Description">
                    </telerik:GridBoundColumn>
--%>
                <telerik:GridBoundColumn DataField="FollowUpNotes" 
                    HeaderText="FollowUpNotes" SortExpression="FollowUpNotes"
                    Visible="false"
                    UniqueName="FollowUpNotes">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="MeetingType" HeaderText="MeetingType" SortExpression="MeetingType"
                    UniqueName="MeetingType">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Address.Name" DataType="System.String" HeaderText="Location"
                    SortExpression="Address.Name" UniqueName="Address.Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Speaker.NameFirstLast" DataType="System.String"
                    HeaderText="Speaker" SortExpression="Speaker.NameFirstLast" UniqueName="Speaker.NameFirstLast">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Sponsor.Name" DataType="System.String" HeaderText="Sponsor"
                    SortExpression="Sponsor.Name" UniqueName="Sponsor.Name">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CreatedDateTime" DataType="System.DateTime" HeaderText="Created"
                    SortExpression="CreatedDateTime" UniqueName="CreatedDateTime">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="LastUpdatedDateTime" DataType="System.DateTime"
                    HeaderText="LastUpdated" SortExpression="LastUpdatedDateTime" UniqueName="LastUpdatedDateTime">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
        <ClientSettings>
            <Selecting AllowRowSelect="True" />
        </ClientSettings>
    </telerik:RadGrid>
    
    <asp:EntityDataSource ID="MeetingsListEntityDataSource" runat="server" 
        ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EnableDelete="True" 
        EnableInsert="True" OrderBy="it.StartDateTime DESC"
        EnableUpdate="True" EntitySetName="MeetingSet" 
        Include="Speaker, Sponsor, Address">
    </asp:EntityDataSource>
    
    <h3>Meeting Details</h3>
    <asp:DetailsView ID="DetailsView1" runat="server" 
        AutoGenerateRows="False"
        CellPadding="4" DataKeyNames="MeetingID" 
        DataSourceID="MeetingEntityDataSource"
        GridLines="None">
        <Fields>
            <asp:BoundField DataField="MeetingID" HeaderText="MeetingID" InsertVisible="False"
                ReadOnly="True" SortExpression="MeetingID" />
            <asp:TemplateField HeaderText="StartDateTime" SortExpression="StartDateTime">
                <EditItemTemplate>
                    <telerik:RadDateTimePicker ID="RadDateTimePicker1" runat="server" Culture="English (United States)"
                        DbSelectedDate='<%# Bind("StartDateTime") %>'>
                        <TimePopupButton HoverImageUrl="" ImageUrl="" />
                        <TimeView runat="server" CellSpacing="-1">
                        </TimeView>
                        <Calendar runat="server" UseColumnHeadersAsSelectors="False" UseRowHeadersAsSelectors="False"
                            ViewSelectorText="x">
                        </Calendar>
                        <DatePopupButton HoverImageUrl="" ImageUrl="" />
                    </telerik:RadDateTimePicker>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("StartDateTime") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Duration" SortExpression="Duration">
                <EditItemTemplate>
                    <telerik:RadNumericTextBox ID="RadNumericTextBox1" runat="server" Culture="English (United States)"
                        DbValue='<%# Bind("Duration") %>' Width="350px" ButtonsPosition="Right" IncrementSettings-InterceptArrowKeys="true"
                        IncrementSettings-InterceptMouseWheel="true" IncrementSettings-Step="1" MinValue="1"
                        MaxValue="960" ShowSpinButtons="true" DataType="System.Int32">
                    </telerik:RadNumericTextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label2" runat="server" Text='<%# Bind("Duration") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="Topic" HeaderText="Topic" SortExpression="Topic" ControlStyle-Width="350px" />
            <asp:TemplateField HeaderText="Description" SortExpression="Description">
                <EditItemTemplate>
                    <telerik:RadEditor ID="DescriptionTextBox" runat="server" ToolbarMode="ShowOnFocus"
                        Content='<%# Bind("Description") %>'>
                        <Tools>
                            <telerik:EditorToolGroup>
                                <telerik:EditorTool Name="Bold" />
                                <telerik:EditorTool Name="Italic" />
                                <telerik:EditorTool Name="Underline" />
                                <telerik:EditorTool Name="InsertOrderedList" />
                                <telerik:EditorTool Name="InsertUnorderedList" />
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="LinkManager" />
                                <telerik:EditorTool Name="Unlink" />
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="AjaxSpellCheck" />
                            </telerik:EditorToolGroup>
                        </Tools>
                    </telerik:RadEditor>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label3" runat="server" Text='<%# Bind("Description") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="MeetingType" HeaderText="MeetingType" SortExpression="MeetingType" />
            <asp:TemplateField HeaderText="FollowUpNotes" SortExpression="FollowUpNotes">
                <EditItemTemplate>
                    <telerik:RadEditor ID="FollowUpNotesTextBox" runat="server" ToolbarMode="ShowOnFocus"
                        Content='<%# Bind("FollowUpNotes") %>'>
                        <Tools>
                            <telerik:EditorToolGroup>
                                <telerik:EditorTool Name="Bold" />
                                <telerik:EditorTool Name="Italic" />
                                <telerik:EditorTool Name="Underline" />
                                <telerik:EditorTool Name="InsertOrderedList" />
                                <telerik:EditorTool Name="InsertUnorderedList" />
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="LinkManager" />
                                <telerik:EditorTool Name="Unlink" />
                                <telerik:EditorSeparator />
                                <telerik:EditorTool Name="AjaxSpellCheck" />
                            </telerik:EditorToolGroup>
                        </Tools>
                    </telerik:RadEditor>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label4" runat="server" Text='<%# Bind("FollowUpNotes") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Address" SortExpression="Address.AddressID">
                <EditItemTemplate>
                    <asp:DropDownList ID="AddressDropDownList" runat="server" DataSourceID="AddressEntityDataSource"
                        DataTextField="Name" DataValueField="AddressID" SelectedValue='<%# Bind("Address.AddressID") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Speaker" SortExpression="Speaker.SpeakerID">
                <EditItemTemplate>
                    <asp:DropDownList ID="SpeakerDropDownList" runat="server" DataSourceID="SpeakerEntityDataSource"
                        DataTextField="Name" DataValueField="SpeakerID" SelectedValue='<%# Bind("Speaker.SpeakerID") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="Sponsor" SortExpression="Sponsor.SponsorID">
                <EditItemTemplate>
                    <asp:DropDownList ID="SponsorDropDownList" runat="server" DataSourceID="SponsorEntityDataSource"
                        DataTextField="Name" DataValueField="SponsorID" SelectedValue='<%# Bind("Sponsor.SponsorID") %>'
                        AppendDataBoundItems="true">
                        <asp:ListItem Text="" Value=""></asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="CreatedDateTime" HeaderText="CreatedDateTime" ReadOnly="True"
                SortExpression="CreatedDateTime" />
            <asp:BoundField DataField="LastUpdatedDateTime" HeaderText="LastUpdatedDateTime"
                ReadOnly="True" SortExpression="LastUpdatedDateTime" />
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" ShowInsertButton="True" ButtonType="Button" />
        </Fields>
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <EditRowStyle BackColor="#999999" />
        <AlternatingRowStyle BackColor="#EFEFEF" />
        <RowStyle BackColor="#FFFFFF" />
    </asp:DetailsView>
    
    <asp:EntityDataSource ID="MeetingEntityDataSource" runat="server" ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EnableDelete="True" EnableInsert="True"
        EnableUpdate="True" EntitySetName="MeetingSet" AutoGenerateWhereClause="true"
        Include="Address, Speaker, Sponsor">
        <WhereParameters>
            <asp:ControlParameter ControlID="RadGrid1" Name="MeetingID" />
        </WhereParameters>
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="AddressEntityDataSource" runat="server" ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EntitySetName="AddressSet" Select="it.[AddressID], it.[Name]">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="SpeakerEntityDataSource" runat="server" ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EntitySetName="SpeakerSet" Select="it.[SpeakerID], it.[NameFirst] + ' ' + it.[NameLast] AS Name">
    </asp:EntityDataSource>
    <asp:EntityDataSource ID="SponsorEntityDataSource" runat="server" ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EntitySetName="SponsorSet" Select="it.[SponsorID], it.[Name]">
    </asp:EntityDataSource>
</asp:Content>
