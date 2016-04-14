<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<IEnumerable<NHDNUG.Data.Meeting>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageBody" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
   <% Html.Telerik().StyleSheetRegistrar().StyleSheets(s => s.Add("~/Content/telerik.common.min.css").Add("~/Content/telerik.default.min.css")).Render(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageUpperBody" runat="server">

<div style="background:#FFF;padding:15px;">
    <h1>
        Meeting Archive</h1>
    <p>
        Past meetings at North Houston DNUG</p>
        <%             
             Html.Telerik().PanelBar().Name("panMeetings")                   
                 .BindTo(Model, (item, m) => {
                     item.Text = String.Format("{0}: {1}", m.StartDateTime.Value.ToString("MMMM yyyy"), m.Topic);
                     item.Content = () => { %>
                                 <p>
                                    <b>Speaker: </b>
                                    <% if (!String.IsNullOrEmpty(m.Speaker.URL))
                                       { %>
                                    <a href='<%= m.Speaker.URL %>'>
                                        <%= m.Speaker.NameFirstLast%></a>
                                    <%}
                                       else
                                       {%>
                                    <%= m.Speaker.NameFirstLast%>
                                    <% } %>
                                </p>
                                <p>
                                    <b>Session Description:</b> <%= m.Description.StripTagsAndAttributes(new string[] { "i", "b", "u", "a" })%>
                                </p>
                                <p>
                                    <b>Speaker Bio:</b> <%= m.Speaker.Bio.StripTagsAndAttributes(new string[] { "i", "b", "u", "a" })%>
                                </p>
                                  
                            <%};
                 })
                 .SelectedIndex(0)                
                 .Render();    
        %>
    </div>
   <script type="text/javascript">
       setPageTab("meetings");
    </script>
</asp:Content>
