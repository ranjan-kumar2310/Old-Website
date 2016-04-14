<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl<IEnumerable<NHDNUG.Data.Meeting>>" %>
    <script type="text/javascript">
        var curUC = "";

        function setMeetingTab(pos) {
            //Clear selection first
            var oldPos = "#divuc" + ucPos;
            var newPos = "#divuc" + pos;
            
            //$(selClass).removeClass("ucSelected");
            $(oldPos).hide();
            //Set selection
            $(newPos).show();
           // $("#uctab" + pos).addClass("ucSelected");
            alert("ping");
            ucPos = pos;
        }

        function setMeetingTab2(obj) {

            if (curUC != "") {
              
                var tmp = document.all["li" + curUC];
                // tmp.style.display = "none";
                tmp.className = "ucUnselectedLi";

                tmp = document.all["div" + curUC];
                tmp.className = "ucUnselected";
             
            }

            curUC = obj.id;

            var divobj = document.all["li" + curUC];
          //  divobj.style.display = "";
         //    alert(divobj);
            divobj.className = "ucSelectedLi";
            divobj = document.all["div" + curUC];
            divobj.className = "ucSelected";
        }

        function setMeetingTab3(obj) {

            if (curUC != "") {

                var tmp = document.getElementById("li" + curUC);
                // tmp.style.display = "none";
                tmp.className = "ucUnselectedLi";

                tmp = document.getElementById("div" + curUC);
                tmp.className = "ucUnselected";

            }

            curUC = obj.id;

            var divobj = document.getElementById("li" + curUC);
            //  divobj.style.display = "";
            //    alert(divobj);
            divobj.className = "ucSelectedLi";
            divobj = document.getElementById("div" + curUC);
            divobj.className = "ucSelected";
        }


        function setMeetingTab3a(obj) {

            if (curUC != "") {
                $("#li" + curUC).removeClass("ucSelectedLi");
                $("#div" + curUC).removeClass("ucSelected");
                $("#li" + curUC).addClass("ucUnselectedLi");
                $("#div" + curUC).addClass("ucUnselected");

            }

            curUC = obj.id;
            $("#li" + curUC).removeClass("ucUnselectedLi");
            $("#div" + curUC).removeClass("ucUnselected");
            $("#li" + curUC).addClass("ucSelectedLi");
            $("#div" + curUC).addClass("ucSelected");
        }
    </script>
    <div id="upcomingMeetings">
    <h1>Upcoming Meetings</h1>
    <div id="upcomingLeft">
    <ul>
    <% int cnt = 0;
        foreach(var m in Model)
       { %>
       <li id="liuc<%= cnt %>" class="ucUnselectedLi"> <div id="uc<%= cnt %>" class="ucIcon" onclick="setMeetingTab3(this)">
                <div class="ucMon"><%= m.StartDateTime.Value.ToString("MMM") %></div>
                <div class="ucDate"><%= m.StartDateTime.Value.Day %></div>
            </div>
       </li>
    <%   cnt++;
        } %>
    </ul>
    </div>
    <div id="upcomingRight">
    <% cnt = 0;
       foreach(var m in Model)
       { %>
       <div id="divuc<%= cnt%>" class="ucUnselected">
        <div class="ucDisplay">
            <div class="ucDisplayUpper">
                <div class="ucTopic"><%= m.Topic %></div>
                <% if(m.Speaker != null) { %>
                <div class="ucSpeaker">
                    <% if (!String.IsNullOrEmpty(m.Speaker.URL))
                       { %>
                       <a href='<%= m.Speaker.URL %>' target='_new'><%= m.Speaker.NameFirstLast%></a>
                    <% }
                       else
                       { %>
                        <%= m.Speaker.NameFirstLast%>
                    <% } %>
                </div>
                <% } %>
                <div class="ucDesc"><%= (String.IsNullOrEmpty(m.Description)) ? "... coming soon ..." : m.Description %></div>
            </div>
            <% if (m.Sponsor != null)
               { %>
               <div class="ucSponsor">
                <div class="ucSponsorInner">
                Sponsored by:<br />
                <% if (!String.IsNullOrEmpty(m.Sponsor.LogoFileName))
                   { %>
                    <% if (!String.IsNullOrEmpty(m.Sponsor.URL))
                       { %>
                        <a href="<%= m.Sponsor.URL %>" target="_new">
                            <img src="<%= VirtualPathUtility.ToAbsolute("~/images/sponsors/" + m.Sponsor.LogoFileName)%>" border="0" />
                        </a>
                    <% }
                       else
                       { %>
                        <img src="<%= VirtualPathUtility.ToAbsolute("~/images/sponsors/" + m.Sponsor.LogoFileName)%>" border="0" />
                    <% } %>
                <% }
                   else
                   { %>
                    <% if (!String.IsNullOrEmpty(m.Sponsor.URL))
                       { %>
                        <a href="<%= m.Sponsor.URL %>" target="_new">
                            <%= m.Sponsor.Name%>
                        </a>
                    <% }
                       else
                       { %>
                            <%= m.Sponsor.Name%>
                    <% } %>
                <% } %>
               </div>
               </div>
            <% } %>
        </div>

       </div>
    <%   cnt++;
        } %>
        </div>
     </div>
     <script type="text/javascript">
            setMeetingTab3(document.getElementById("uc0"));

     </script>