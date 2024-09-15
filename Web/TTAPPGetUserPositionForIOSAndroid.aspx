<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPGetUserPositionForIOSAndroid.aspx.cs" Inherits="TTAPPGetUserPositionForIOSAndroid" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<meta http-equiv="Content-Type" content="textml; charset=UTF-8" />

<!DOCTYPE html>
<html>
<head runat="server">
    <title></title>

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
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
            min-height: 640px;
            height: expression (document.body.clientHeight <= 640 "640px" : "auto" ));
        }

        #container {
            height: auto !important;
            height: 530px;
            min-height: 530px;
        }

        .round {
            border: 1px solid #dedede;
            border-radius: 10%;
        }
    </style>

    <script type="text/javascript" src="https://lib.sinaapp.com/js/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript" src="https://api.map.baidu.com/api?v=2.0&ak=Mesj2KjbrDAqsfcUrFBY7DNrQ4GZAUS0"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <link href="js/layer/mobile/need/layer.css" rel="stylesheet" />
    <script src="js/layer/mobile/layer.js"></script>
    <script src="js/jweixin-1.0.0.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



        });

    </script>

</head>
<body >
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>



        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
            <tr>
                <td style="" height="31" class="page_topbj">
                    <table width="99%">
                        <tr>
                            <td style="width: 50%; text-align: left;">
                                <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                    <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="30" align="right">
                                                <img src="ImagesSkin/Return.png" alt="" />
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                            </td>

                                            <td class="titleziAPP" style="width: 100px; text-align: center; padding-top: 5px;">
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </td>
                                        </tr>
                                    </table>
                                </a>
                            </td>

                            <td style="vertical-align: middle; text-align: center;" class="round">
                                <asp:Button ID="BT_SavePosition" runat="server" CssClass="inpuLong" Height="30px" OnClick="BT_SavePosition_Click" Text="<%$ Resources:lang,DingWeiBingFanHuiZhuYe%>" />

                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
           <tr>
                <td>
                    <table width="99%">
                        <tr>
                            <td style="width: 50%; text-align: left; vertical-align: middle;">
                                <asp:RadioButtonList ID="RBL_ShiftType" runat="server" TextAlign="Left" CellPadding="10" CellSpacing="10">
                                </asp:RadioButtonList></td>
                          <td style="vertical-align: middle; text-align: center;" class="round">
                                <br />
                                <br />
                                <asp:Button ID="BT_Attendance" runat="server" CssClass="inpuLong" Style="border: 1px solid #dedede; border-radius: 10%;" Width="80%" Height="30px" OnClick="BT_Attendance_Click" Text="<%$ Resources:lang,DaKaBingFanHuiZhuYe%>" />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>

                </td>
            <tr>
                <td>

                    <table width="99%">
                        <tr>
                            <td alight="right">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Jing%>"></asp:Label>：</td>
                            <td>
                                <input type="text" id="LNG_value" runat="server" style="width: 100px;" readonly></input>
                            </td>
                            <td>
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Wei%>"></asp:Label>：</td>
                            <td>
                                <input type="text" id="LAT_value" runat="server" style="width: 100px;" readonly></input>
                            </td>

                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td>
                    <div id="status" style="text-align: center">
                        <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';"></a>
                    </div>
                    <div id="container" style="width: 99%; border: 1px solid gray; margin: 5px auto"></div>
                </td>
            </tr>
        </table>
        <asp:Label ID="LB_Sql" runat="server"></asp:Label>

        <%--     </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>--%>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>


<script type="text/javascript">

    var isWxConfigReady = false; //config是否验证通过
    var loadingIndex;
    var mk, map;
    function wxApi() {


        var loadingIndex = layer.open({
            type: 2
            , content: 'ImagesSkin/Processing.gif'
        });
        wx.config({
            debug: false, // 开启调试模式,调用的所有api的返回值会在客户端alert出来，若要查看传入的参数，可以在pc端打开，参数信息会通过log打出，仅在pc端时才会打印。
            appId: '<%=signModel.appId %>', // 必填，公众号的唯一标识
            timestamp: '<%=signModel.time %>', // 必填，生成签名的时间戳(随便填写)
            nonceStr: '<%=signModel.randstr %>', // 必填，生成签名的随机串(随便填写)
            signature: '<%=signModel.signstr %>', // 必填，签名，见附录1

            jsApiList: [
                'getLocation',
                'openLocation'
            ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
        });


        wx.ready(function () {
            layer.close(loadingIndex);
            // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
            isWxConfigReady = true;

            wx.getLocation({
                type: 'wgs84', // 默认为wgs84的gps坐标，如果要返回直接给openLocation用的火星坐标，可传入'gcj02'
                success: function (res) {
                    var latitude = res.latitude; // 纬度，浮点数，范围为90 ~ -90
                    var longitude = res.longitude; // 经度，浮点数，范围为180 ~ -180。

                    var lng = '';	//百度经度
                    var lat = '';	//百度纬度
                    var convertor = new BMap.Convertor();
                    var ggPoint = new BMap.Point(longitude, latitude);
                    var pointArr = [];
                    pointArr.push(ggPoint);
                    convertor.translate(pointArr, 1, 5, function (data) {
                        if (data.status === 0) {
                            var point = data.points[0];
                            lng = point.lng;
                            lat = point.lat;

                            document.getElementById("LNG_value").value = lng;
                            document.getElementById("LAT_value").value = lat;

                            mk = new BMap.Marker(point);
                            map = new BMap.Map("container");
                            map.addOverlay(mk);
                            map.centerAndZoom(point, 18);

                        }
                        else {
                            alert('坐标转换失败');
                        }
                    });




                    //wx.openLocation({
                    //latitude: latitude, // 纬度，浮点数，范围为90 ~ -90
                    //longitude: longitude, // 经度，浮点数，范围为180 ~ -180。
                    //name: '我的位置', // 位置名
                    //address: '', // 地址详情说明
                    //scale: 10, // 地图缩放级别,整形值,范围从1~28。默认为最大
                    //infoUrl: '' // 在查看位置界面底部显示的超链接,可点击跳转
                    //});
                }
            });
        });
        wx.error(function (res) {
            layer.close(loadingIndex);
            alert('failed' + JSON.stringify(res));
            // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
        });
    }

    window.onload = function () {


        wxApi();
    };

</script>
