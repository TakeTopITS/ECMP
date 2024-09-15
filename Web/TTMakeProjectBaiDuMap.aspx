<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeProjectBaiDuMap.aspx.cs" Inherits="TTMakeProjectBaiDuMap" %>

<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<!DOCTYPE html>
<html>
<head>
    <title>项目地图</title>

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }

        #container {
            height: auto !important;
            height: 600px;
            min-height: 600px;
        }

        .auto-style1 {
            height: 35px;
        }
    </style>

    <script type="text/javascript" language="javascript">
        function displayScroll() {

            document.getElementById("divRenyList").style.overflow = "auto";
        }

        function hideScroll() {

            document.getElementById("divRenyList").style.overflow = "hidden";
        }
    </script>

    <script type="text/javascript" src="https://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Mesj2KjbrDAqsfcUrFBY7DNrQ4GZAUS0"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

</head>
<body style="margin: 5px 10px;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31">
                                <div>
                                     <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Longitude%>" /></label>
                                    <input type="text" id="longitude" name="longitude" disabled>
                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,Latitude%>" /></label>
                                    <input type="text" id="latitude" name="latitude" disabled>
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DiZhi%>" /></label>
                                    <input type="text" id="address" name="address" style="width:300px;" disabled>

                                    <asp:Label ID="Label2" runat="server" CssClass="inpu"  Text="<%$ Resources:lang,XuanZe%>" onclick="setLngLat()" width="80px"/></label>
                                   
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 2px 8px 8px 5px; overflow: hidden;" onmouseenter="javascript:displayScroll();" onmousemove="javascript:displayScroll();" onmouseover="javascript:displayScroll();" onmouseout="javascript:hideScroll();">
                                <div id="map" style="width:100%;height:850px;"></div>
                            </td>
                        </tr>
                    </table>
                </div>

                <img id="imgDemo" src="Images/bg.jpg" alt="imgkk" style="width: 200px; height: 200px;" />

            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>


<script type="text/javascript">

    window.onload = function () {

        var map = new BMap.Map("map");
        map.centerAndZoom(new BMap.Point(116.404, 39.915), 11);
        map.enableScrollWheelZoom(true);

        var marker = new BMap.Marker(new BMap.Point(116.404, 39.915));
        map.addOverlay(marker);

        var geolocation = new BMap.Geolocation({
            enableHighAccuracy: true, // 是否使用高精度定位，默认:true
            timeout: 10000, // 超过10秒后停止定位，默认：无穷大
            maximumAge: 0 //定位结果缓存0毫秒，每次调用均重新获取
        });
        geolocation.getCurrentPosition(function (r) {
            if (this.getStatus() == BMAP_STATUS_SUCCESS) {

                var lng = window.parent.document.getElementById("TabContainer1_TabPanel1_TB_Longitude").value;
                var lat = window.parent.document.getElementById("TabContainer1_TabPanel1_TB_Latitude").value;
                var address = window.parent.document.getElementById("TabContainer1_TabPanel1_TB_ProjectLocation").value;

                document.getElementById("longitude").value = lng;
                document.getElementById("latitude").value = lat;
                document.getElementById("address").value = address;

                if (lng == "" || lat == "") {

                    lng = r.point.lng;
                    lat = r.point.lat;
                }

                var point = new BMap.Point(lng, lat);
                map.centerAndZoom(point, 15);
                var marker = new BMap.Marker(point);
                map.addOverlay(marker);
                map.panTo(point);

            }
        });



        map.addEventListener("click", function (e) {

            var geocoder = new BMap.Geocoder();

            geocoder.getLocation(e.point, function (rs) {

                document.getElementById("longitude").value = rs.point.lng;
                document.getElementById("latitude").value = rs.point.lat;
                document.getElementById("address").value = rs.address;

            });
        });
    };



    //设置父页面的经纬度
    function setLngLat() {

        var lng = document.getElementById("longitude").value;
        var lat = document.getElementById("latitude").value;
        var address = document.getElementById("address").value;

        window.parent.document.getElementById("TabContainer1_TabPanel1_TB_Longitude").value = lng;
        window.parent.document.getElementById("TabContainer1_TabPanel1_TB_Latitude").value = lat;
        window.parent.document.getElementById("TabContainer1_TabPanel1_TB_ProjectLocation").value = address;

        //关闭地图窗口
        CloseLayer();

    }

</script>
