<%@ Page Language="C#" MasterPageFile="~/Views/Shared/Site.Master"  Inherits="System.Web.Mvc.ViewPage<IEnumerable<NHDNUG.Data.Sponsor>>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="pageBody" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="pageHeader" runat="server">
   <% Html.Telerik().StyleSheetRegistrar().StyleSheets(s => s.Add("~/Content/telerik.common.min.css").Add("~/Content/telerik.default.min.css")).Render(); %>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="pageUpperBody" runat="server">

<div style="background:#FFF;padding:15px;">
    <h1>
        Our Sponsors</h1>
    <p>
        Our monthly meetings would not be possible if not for the generous support of our sponsors.  Here is a list of our recent sponsors.  We 
        appreciate all of their support.</p>
    <br /><br />
    
   <div class="content">
        <ul id="sponsorList">
            <% if (Model == null)
               { %>
               <li>Our sponsors page is currently down.  Please check later for our complete list.</li>
            <%}
               else
               { %>
            <%
                bool isAlt = true;
              foreach (var t in Model)
              {%>
            <li <%if(isAlt) {  %>class="alt"<% } %>>
            
                <table>
                    <tr>
                        <td style="width: 250px">
                            <a href="<%= t.URL %>" target="_new"><img border="0" src="<%= VirtualPathUtility.ToAbsolute("~/images/sponsors/" + t.LogoFileName) %>" alt="<%= t.Name %>" /></a>
                        </td>
                        <td style="vertical-align: top">
                            <div class="sponsorName"><a href="<%= t.URL %>" target="_new"><%= t.Name %></a></div>
                            <div class="sponsorUrl"><a href="<%= t.URL %>" target="_new"><%= t.URL %></a></div>
                        </td>
                    </tr>
                </table>
              
             </li>
                <% isAlt = !isAlt; %>
            <%} %>
        </ul>
        <%} %>
    </div>
    </div>
   <script type="text/javascript">
       setPageTab("sponsors");
    </script>
</asp:Content>