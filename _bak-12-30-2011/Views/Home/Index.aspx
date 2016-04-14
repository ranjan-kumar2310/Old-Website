<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="upperContent" ContentPlaceHolderID="pageUpperBody" runat="server">

<div id="meetingold" style="display: none">
<h1>Next Meeting</h1>
<% var meeting = ViewData["meeting"] as NHDNUG.Data.Meeting; %>
<b>Topic: </b><%= meeting.Topic %><br />
<b>Speaker: </b>
<% if (!String.IsNullOrEmpty(meeting.Speaker.URL))
   { %>
<a href='<%= meeting.Speaker.URL %>'><%= meeting.Speaker.NameFirstLast%></a>
<%}
   else
   {%>
<%= meeting.Speaker.NameFirstLast%>
<% } %>
<br />
<p>
<b>Description: </b><%= meeting.Description.StripTagsAndAttributes(new string[]{"i","b","u","a"}) %>
</p>
<b>When: </b>  <%= Html.Encode(meeting.StartDateTime.Value.ToString("dddd, MMMM, dd @ hh:mm tt")) %><br />

<% if (meeting.Sponsor != null)
   { %>
<b> Sponsor : </b><img src="<%= VirtualPathUtility.ToAbsolute("~/images/sponsors/" + meeting.Sponsor.LogoFileName) %>" />
<% } %>
</div>
<% Html.RenderPartial("UpcomingMeetings", ViewData["meetings"]); %>
<div id="rightbar">
    <div id="newsletter">
        <h2>Get Email Updates</h2>
        <p style="margin-bottom:.5em;">Want to be reminded about our montly meetings? Sign-up below and 
        we promise no more than
        two emails per month.</p>

        <% Html.RenderPartial("NewsletterSignup"); %>
    </div>

    <% Html.RenderPartial("Facebook"); %>
</div>
</asp:Content>

<asp:Content ID="indexContent" ContentPlaceHolderID="pageBody" runat="server">
    <% Html.RenderPartial("TwitterBoxMvc", ViewData["twitter"]); %>
    <% Html.RenderPartial("FindMeeting"); %>
    
    <%-- This MailChip script renames the jQuery variable, so we need it 
         at the bottom of the page to prevent it from breaking other jQuery
         scripts. Ideally, this script can be refactored in the future.--%>
    <script type="text/javascript" src="http://nhdnug.us1.list-manage.com/subscribe/xs-js?u=7caabf49168c8e4afd10d62fd&amp;id=f3a96ce54f"></script>
</asp:Content>
