<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceMyProjectPositionMap.aspx.cs" Inherits="TTPersonalSpaceMyProjectPositionMap" %>

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
                        <tr style="display: none;">
                            <td height="31">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Jing%>"></asp:Label>：</td>
                                                    <td>
                                                        <input type="text" id="LNG_value" runat="server"></input></td>
                                                    <td>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Wei%>"></asp:Label>纬：</td>
                                                    <td>
                                                        <input type="text" id="LAT_value" runat="server"></input>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" style="padding-top: 1px; padding-bottom: 1px; padding-right: 8px;" class="auto-style1"></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 2px 8px 8px 5px; overflow: hidden;" onmouseenter="javascript:displayScroll();" onmousemove="javascript:displayScroll();" onmouseover="javascript:displayScroll();" onmouseout="javascript:hideScroll();">

                                <div id="divRenyList" class="renyList" style="width: 100%; height: 350px; overflow: hidden;">
                                    <div id="status" style="text-align: center"></div>
                                    <div id="container" style="border: 0px solid gray; margin: 1px auto"></div>
                                </div>
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
        if (navigator.geolocation) {
            //document.getElementById("status").innerHTML = "HTML5 Geolocation is supported in your browser.";
            // 百度地图API功能
            //var map = new BMap.Map("container");
            //var point = new BMap.Point(113.373456, 23.14153);
            //map.centerAndZoom(point, 12);

            var lng, lat;

            var geolocation = new BMap.Geolocation();
            geolocation.getCurrentPosition(function (r) {
                if (this.getStatus() == BMAP_STATUS_SUCCESS) {
                    var mk = new BMap.Marker(r.point);
                    var map = new BMap.Map("container");
                    map.addOverlay(mk);

                    $.ajax({
                        type: "post",
                        async: false,
                        url: "Handler/getMyProjectLongitudeLatitude.ashx",
                        data: {}, //发送到服务器的参数
                        datatype: "json",
                        success: function (result) {

                            if (result) {
                                eval("var transresult=" + result);

                                map = new BMap.Map("container");
                                var point = new BMap.Point(116.404, 39.915);  // 中心点坐标：天安门

                                for (var i = 0; i < transresult.length; i++) {

                                    try {
                                        var point = new BMap.Point(transresult[i].longitude, transresult[i].latitude);
                                        mk = new BMap.Marker(point);
                                        map.addOverlay(mk);

                                        // 添加信息窗口
                                        addInfoWindow(mk, transresult[i].projectid, transresult[i].projectname);
                                    }
                                    catch
                                    {
                                    }

                                }

                                map.centerAndZoom(point, 5);  // 设置中心点和缩放比例
                            }
                        },
                        error: function (errorMsg) {
                            //alert("request data failed!!!");
                        }
                    });


                }
                else {
                    alert('failed' + this.getStatus());
                }
            }, { enableHighAccuracy: true })
        }
    };


    // 添加信息窗口
    function addInfoWindow(marker, title, content) {

        var infoWindow = new BMap.InfoWindow(title + content);
        marker.addEventListener("mouseover", function () {
            this.openInfoWindow(infoWindow);

            //图片加载完毕重绘infowindow
            document.getElementById('imgDemo').onload = function () {
                infoWindow.redraw();
            }
        });

        marker.addEventListener("mouseout", function () {
           
            this.closeInfoWindow(infoWindow);

          
        });
    }
</script>
