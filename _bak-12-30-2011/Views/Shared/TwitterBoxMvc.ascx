<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<TwitterStatus>>" %>
<div class="yui-u first lowerBox" id="tweetBox">
    <div class="titleBar">
        <img src='<%= VirtualPathUtility.ToAbsolute("~/images/Twitter.png") %>' alt="NHDNUG Tweets" />
        <h2>
            NHDNUG Tweets</h2>
    </div>
    <div class="content">
        <ul id="tweetList">
            <% if (Model == null)
               { %>
               <li>Sorry, Twitter seems to be down and tweets cannot be loaded at this time. Please try refreshing the page to re-load tweets.</li>
            <%}
               else
               { %>
            <%foreach (var t in Model)
              {%>
            <li><a href="http://twitter.com/<%= t.User.ScreenName %>/status/<%= t.Id %>">
                <p>
                    "<%= t.Text%>"</p>
                <i>@
                    <%= t.CreatedDate.ToString("hh:mm tt dd MMM yyyy")%>
                    by
                    <%= t.User.ScreenName%></i> </a></li>
            <%} %>
        </ul>
        <% if (Model.Count() > 3)
           { %>
        <a href="http://twitter.com/<%= Model.ElementAt(0).User.ScreenName %>" style="font-weight: bold;">
            More Tweets</a>
        <% } %>
        <%} %>
    </div>
</div>
