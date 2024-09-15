<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppUserPositionView.aspx.cs" Inherits="TTAppUserPositionView" %>

<%--<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />--%>
<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>调用百度地图API地理定位</title>

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
            max-width: 540px;
            width: expression (document.body.clientWidth >= 540? "540px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
            /*min-height: 640px;
            height: expression (document.body.clientHeight <= 640 "640px" : "auto" ));*/
        }

        #container {
            height: auto!important;
            height: 220px;
            min-height: 220px;
        }
    </style>

    <script type="text/javascript" src="https://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Mesj2KjbrDAqsfcUrFBY7DNrQ4GZAUS0"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            

        });

    </script>

</head>
<body style="margin: 5px 10px;">
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
              
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                                <div id="container" style=" margin: 0px auto"></div>
                            </td>
                        </tr>
                        <tr>
                            <td height="31" class="page_topbj" style ="display :none ;">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Jing%>"></asp:Label>：</td>
                                        <td>
                                            <input type="text" id="LNG_value" runat="server"></input></td>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Wei%>"></asp:Label>：</td>
                                        <td>
                                            <input type="text" id="LAT_value" runat="server"></input>
                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
            
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>


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

                    lng = document.getElementById("LNG_value").value;
                    lat = document.getElementById("LAT_value").value;

                    var point = new BMap.Point(lng, lat);
                    //map.panTo(point);
                    //map.centerAndZoom(point, 18);

                    mk = new BMap.Marker(point);
                    map = new BMap.Map("container");
                    map.addOverlay(mk);
                    map.centerAndZoom(point, 18);
                }
                else {
                    alert('failed' + this.getStatus());
                }
            }, { enableHighAccuracy: true })
        }
    };

</script>

