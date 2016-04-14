<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<NHDNUG.Data.Meeting>>" %>
<script type="text/javascript">
    function pageLoad() {
        setPageTab("meetings");
    }
</script>
<%--<telerik:RadGrid ID="gridMeetings" runat="server" 
    AutoGenerateColumns="false" Skin="Gray">
    <MasterTableView DataKeyNames="MeetingID">
        <Columns>
            <telerik:GridBoundColumn DataField="Topic" HeaderText="Topic" />
            <telerik:GridBoundColumn DataField="Speaker.NameFirstLast" HeaderText="Speaker" />
            <telerik:GridBoundColumn DataField="StartDateTime" DataFormatString="{0:D}" HeaderText="Meeting Date" />
        </Columns>
        <NestedViewTemplate>
            <div class="meetingDetails">
            <h2><b>Topic: </b><%# Eval("Topic") %></h2>
            <p><%# Eval("Description") %></p>
            <h2><b>Speaker: </b><%# Eval("Speaker.NameFirstLast") %></h2>
            <p><%# Eval("Speaker.Bio") %></p>
            <h2><b>Follow-up Notes & Downloads</b></h2>
            <p>
            <%# Eval("FollowUpNotes") ?? "No follow-up notes." %>
            </p>
            </div>
        </NestedViewTemplate>
    </MasterTableView>    
    <ClientSettings Selecting-AllowRowSelect="true" AllowExpandCollapse="true">
    </ClientSettings>
</telerik:RadGrid>--%>