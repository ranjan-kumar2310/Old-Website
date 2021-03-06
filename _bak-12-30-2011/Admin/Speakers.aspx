﻿<%@ Page Language="C#" AutoEventWireup="true" Inherits="NHDNUG.Mvc.Admin.Admin_Speakers"
    CodeBehind="Speakers.aspx.cs" MasterPageFile="~/Admin/Admin.Master" %>

<%@ Register Assembly="System.Web.Entity, Version=3.5.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089"
    Namespace="System.Web.UI.WebControls" TagPrefix="asp" %>
<asp:Content runat="server" ContentPlaceHolderID="pageBody">
<h2>Speakers</h2>

    <telerik:RadGrid ID="RadGrid1" runat="server" AllowAutomaticDeletes="True" AllowAutomaticInserts="True"
        AllowAutomaticUpdates="True" AllowPaging="True" AllowSorting="True" AutoGenerateDeleteColumn="True"
        AutoGenerateEditColumn="True" DataSourceID="SpeakersListEntityDataSource" GridLines="None">
        <MasterTableView AutoGenerateColumns="False" DataKeyNames="SpeakerID"
            DataSourceID="SpeakersListEntityDataSource" CommandItemDisplay="Top">
            <Columns>
                <telerik:GridBoundColumn DataField="SpeakerID" Visible="false" DataType="System.Int32"
                    HeaderText="SpeakerID" ReadOnly="True" SortExpression="SpeakerID" UniqueName="SpeakerID">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NameFirst" HeaderText="NameFirst" SortExpression="NameFirst"
                    UniqueName="NameFirst">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="NameLast" HeaderText="NameLast" SortExpression="NameLast"
                    UniqueName="NameLast">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="CompanyName" HeaderText="CompanyName" SortExpression="CompanyName"
                    UniqueName="CompanyName">
                </telerik:GridBoundColumn>
                <telerik:GridHTMLEditorColumn DataField="Bio" HeaderText="Bio" ItemStyle-Width="300">                    
                </telerik:GridHTMLEditorColumn>
                <telerik:GridBoundColumn DataField="URL" HeaderText="URL" SortExpression="URL" UniqueName="URL">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EmailAddress1" HeaderText="EmailAddress1" SortExpression="EmailAddress1"
                    UniqueName="EmailAddress1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="EmailAddress2" Visible="false"
                     HeaderText="EmailAddress2" SortExpression="EmailAddress2"
                    UniqueName="EmailAddress2">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="Twitter" HeaderText="Twitter" SortExpression="Twitter"
                    UniqueName="Twitter">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PhoneNumber1" Visible="false"
                    HeaderText="PhoneNumber1" SortExpression="PhoneNumber1"
                    UniqueName="PhoneNumber1">
                </telerik:GridBoundColumn>
                <telerik:GridBoundColumn DataField="PhoneNumber2" Visible="false"
                    HeaderText="PhoneNumber2" SortExpression="PhoneNumber2"
                    UniqueName="PhoneNumber2">
                </telerik:GridBoundColumn>
            </Columns>
        </MasterTableView>
    </telerik:RadGrid>
    
        <asp:EntityDataSource ID="SpeakersListEntityDataSource" runat="server" ConnectionString="name=NhdnugEntities"
        DefaultContainerName="NhdnugEntities" EnableDelete="True" EnableInsert="True"
        EnableUpdate="True" EntitySetName="SpeakerSet" OrderBy="it.NameLast">
    </asp:EntityDataSource>
</asp:Content>
