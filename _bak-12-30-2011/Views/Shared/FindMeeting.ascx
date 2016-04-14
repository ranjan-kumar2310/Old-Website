<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<script type="text/javascript">
    var map = null;
    var LA = new VELatLong(30.21044, -95.467486);
    var pinPoint = null;
    var pinPixel = null;
    
    function GetMap() {
        map = new VEMap('map');
        map.SetDashboardSize(VEDashboardSize.Small);
        map.LoadMap(LA, 14, VEMapStyle.Road, false, VEMapMode.Mode2D, true, 1);

        AddPin();
    }

    function AddPin() {
        // Add a new pushpin to the center of the map.
        //pinPoint = map.GetCenter();
        //pinPixel = map.LatLongToPixel(pinPoint);

        var shape = new VEShape(VEShapeType.Pushpin, map.GetCenter());
        shape.SetTitle('Lone Star College - Montgomery');
        shape.SetDescription('3200 College Park Dr.<br />The Woodlands, TX 77384<br />Meetings in Room F-306<br /><a href=\"http://maps.live.com/default.aspx?v=2&FORM=LMLTCP&cp=30.21044~-95.467486&style=r&lvl=15&tilt=-90&dir=0&alt=-1000&phx=0&phy=0&phscl=1&where1=3200%20college%20park%20dr%2C%2077384&encType=1\">Click Here for Directions</a>');
        
        map.AddShape(shape);
    }

    $(document).ready(function() {
        GetMap();
    });
</script>
<div class="yui-u lowerBox">
    <div class="titleBar">
        <h2>Find the Meetings</h2>
    </div>
    <div class="content">
    All meetings are held at <b>Lone Star College - Montgomery, ROOM F-306</b>&nbsp;<a href="http://www.lonestar.edu/maps-montgomery.htm">MAP</a><br />
    3200 College Park Drive<br />
    The Woodlands, TX 77384<br />
    <div style="position:relative;width:100%;height:220px;margin-top:20px;" id="map">
    </div>
    </div>
</div>