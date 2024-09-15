<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserPositionView.aspx.cs" Inherits="TTUserPositionView" %>

<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<meta name="viewport" content="width=device-width, initial-scale=1" />
<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<!DOCTYPE html>
<html>
<head>
    <title>调用百度地图API地理定位实例</title>

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
            height: auto!important;
            height: 600px;
            min-height: 600px;
        }
          .auto-style1 {
              height: 35px;
          }
    </style>

    <script type="text/javascript" src="https://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Mesj2KjbrDAqsfcUrFBY7DNrQ4GZAUS0"></script>

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
                            <td height="31" class="page_topbj">
                                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>

                                        <td align="left" class="auto-style1">
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
                            <td>
                                <div id="status" style="text-align: center"></div>
                                <div id="container" style="border: 1px solid gray; margin: 5px auto"></div>
                            </td>
                        </tr>
                    </table>
                </div>
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
