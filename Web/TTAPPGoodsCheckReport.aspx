<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPGoodsCheckReport.aspx.cs" Inherits="TTAPPGoodsCheckReport" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />

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
        }

        .ToolBar {
            position: fixed !important;
            bottom: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background-color: ButtonFace;
            width: 100%;
            height: 30px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <link href="js/layer/mobile/need/layer.css" rel="stylesheet" />
    <script src="js/layer/mobile/layer.js"></script>
    <script src="https://res.wx.qq.com/open/js/jweixin-1.0.0.js"></script>

    <script type="text/javascript" language="javascript">
        var txtGoodsSN = '#<%=TB_GoodsSN.ClientID%>';
        var btnFind = '#<%=BT_Find.ClientID%>';
        $(function () {



        });

        var loadingIndex; //提示层index
        var isWxConfigReady = false; //config是否验证通过
        $(function () {

            try {
                if ('<%=signModel.appId %>' == '') {
                    return;
                }

                var ids = "," + "@Model.MenuIds" + ",";
                $("a[id^='my_a_']").each(function (i, item) {
                    var val = $(this).attr("id").replace("my_a_", "");
                    if (ids.indexOf("," + val + ",") == -1) {
                        $(this).hide();
                    }
                });
                wxApi();
            }
            catch
            {
            }
        });


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
                    'checkJsApi',
                    'onMenuShareTimeline',
                    'onMenuShareAppMessage',
                    'onMenuShareQQ',
                    'onMenuShareWeibo',
                    'hideMenuItems',
                    'showMenuItems',
                    'hideAllNonBaseMenuItem',
                    'showAllNonBaseMenuItem',
                    'translateVoice',
                    'startRecord',
                    'stopRecord',
                    'onRecordEnd',
                    'playVoice',
                    'pauseVoice',
                    'stopVoice',
                    'uploadVoice',
                    'downloadVoice',
                    'chooseImage',
                    'previewImage',
                    'uploadImage',
                    'downloadImage',
                    'getNetworkType',
                    'openLocation',
                    'getLocation',
                    'hideOptionMenu',
                    'showOptionMenu',
                    'closeWindow',
                    'scanQRCode',
                    'chooseWXPay',
                    'openProductSpecificView',
                    'addCard',
                    'chooseCard',
                    'openCard'
                    //,


                    //'openEnterpriseChat',
                    //'openEnterpriseContact',
                    //'onMenuShareQZone',
                    //'onVoiceRecordEnd',
                    //'onVoicePlayEnd',
                    //'translateVoice',


                ] // 必填，需要使用的JS接口列表，所有JS接口列表见附录2
            });


            wx.ready(function () {
                layer.close(loadingIndex);
                // config信息验证后会执行ready方法，所有接口调用都必须在config接口获得结果之后，config是一个客户端的异步操作，所以如果需要在页面加载时就调用相关接口，则须把相关接口放在ready函数中调用来确保正确执行。对于用户触发时才调用的接口，则可以直接调用，不需要放在ready函数中。
                isWxConfigReady = true;
            });
            wx.error(function (res) {
                layer.close(loadingIndex);
                alert(JSON.stringify(res));
                // config信息验证失败会执行error函数，如签名过期导致验证失败，具体错误信息可以打开config的debug模式查看，也可以在返回的res参数中查看，对于SPA可以在这里更新签名。
            });
        }

        function qrcode() {
            wx.scanQRCode({
                needResult: 1, // 默认为0，扫描结果由微信处理，1则直接返回扫描结果，
                scanType: ["qrCode", "barCode"], // 可以指定扫二维码还是一维码，默认二者都有
                success: function (res) {
                    var result = res.resultStr; // 当needResult 为 1 时，扫码返回的结果
                    if (typeof (result) != "undefined") {

                        result = result.substring(result.indexOf(',') + 1, result.length);

                        //文本框赋值	
                        $(txtGoodsSN).val(result);
                        //点击查询按钮
                        $(btnFind).click();
                    }
                }
            });

        }

    </script>

    <script type="text/javascript" language="javascript">
        $(function () {

            //

            SetDataGridTrClickLink();
        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {


            setTrClickLink("DataGrid1");

        }


    </script>


</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%;">

                                    <tr>
                                        <td style="width: 100%;">
                                            <%-- <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>--%>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="25">
                                                <Columns>


                                                    <asp:TemplateColumn HeaderText="">

                                                        <ItemTemplate>

                                                            <div class="npb npbs">
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href="TTAPPGoodsInforViewForCheck.aspx?GoodsCode=<%# Eval("GoodsCode").ToString() %>"><%# Eval("GoodsCode") %>  <%# Eval("GoodsName") %>   </a></h4>
                                                                    <h5><%# Eval("Number").ToString() %><sub></sub></h5>
                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"UnitName") %></h6>

                                                                    <%--  <label><%# ShareClass. GetStatusHomeNameByTaskStatus(Eval("Status").ToString()) %></label>--%>
                                                                </div>

                                                            </div>


                                                        </ItemTemplate>

                                                    </asp:TemplateColumn>



                                                    <%--                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTAPPGoodsInforViewForCheck.aspx?GoodsCode={0}"
                                                        DataTextField="GoodsName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                    </asp:HyperLinkColumn>

                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                    </asp:BoundColumn>--%>
                                                </Columns>

                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                    <%-- <tr>
                                        <td style="width: 1200px; text-align: center;">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                            <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                        </td>
                                    </tr>--%>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%; text-align: left; padding-top: 10px; padding-bottom: 10px; background-color: aliceblue;"
                        onclick="javascript:this.style.height=310;">
                        <table style="width: 100%;">
                            <tr>
                                <td colspan="2" style="text-align: right; padding-right: 10px;">
                                    <table width="100%">
                                        <tr>
                                            <td style="width: 70%;">&nbsp;
                                            </td>
                                            <td style="width: 20%; text-align: left;">
                                                <img src="ImagesSkin/up.png" />
                                            </td>
                                            <td style="padding-top: 5px; width: 10%; text-align: center;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/ImagesSkin/down.png" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 20%; text-align: right;">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                </td>
                                <td style="width: 60%; text-align: left;">

                                    <asp:TextBox ID="TB_GoodsSN" Width="99%" runat="server"></asp:TextBox>
                                </td>
                                <td style="text-align: center;">
                                    <asp:Button ID="BT_Qrcode" runat="server" CssClass="inpuQrCode" OnClientClick="qrcode()" />
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：

                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                <td colspan="2">
                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：</td>
                                <td colspan="2">
                                    <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>

                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WeiZhi%>"></asp:Label>：
                                </td>
                                <td colspan="2">
                                    <asp:TextBox ID="TB_Position" runat="server" Width="50%"></asp:TextBox>
                                    <asp:DropDownList ID="DL_WareHouse" runat="server" DataTextField="WHName" DataValueField="WHName"
                                        Height="25px" AutoPostBack="True" OnSelectedIndexChanged="DL_WareHouse_SelectedIndexChanged">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;"><a href="javascript:window.print()">
                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                </a></td>
                                <td colspan="2">
                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center;" colspan="3">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                    &nbsp;
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>

                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>

                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
