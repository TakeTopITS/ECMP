<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPGoodsInforForAfterSaleService.aspx.cs" Inherits="TTAPPGoodsInforForAfterSaleService" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <link href="js/layer/mobile/need/layer.css" rel="stylesheet" />
    <script src="js/layer/mobile/layer.js"></script>
    <script src="js/jweixin-1.0.0.js"></script>

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
</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
                                        </td>
                                        <td></td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="font-size: 10pt; width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" align="left" style="padding-left: 5px; padding-top: 10px;">
                                            <table cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="5%" align="left">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiLieHao%>"></asp:Label>
                                                    </td>
                                                    <td width="10%" align="left">
                                                        <asp:TextBox ID="TB_GoodsSN" Width="150px" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td width="5%" align="left" style="padding-left:5px;">

                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />

                                                    </td>
                                                    <td style="padding-left:20px;">

                                                        <asp:Button ID="BT_Qrcode" runat="server" CssClass="inpuQrCode" OnClientClick="qrcode()" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" valign="top">
                                            <%--<asp:Label ID="LB_GoodsOwner" runat="server" Text="<%$ Resources:lang,ShangPinLieBiao%>"></asp:Label>--%>
                                         
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="25%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiLieHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="17%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="6%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaoQiShiJian%>"></asp:Label></strong>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                ShowHeader="false" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="25">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="编号">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_GoodsSN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SN") %>'
                                                                class="inpuLongest" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="DaiMa">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="17%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="WarrantyPeriod" HeaderText="保修期">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="6%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="WarrantyEndTime" HeaderText="保修结束时间" DataFormatString="{0:yyyy/MM/dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:BoundColumn>

                                                </Columns>

                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 1200px; text-align: Center;">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                            <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                            &nbsp;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                    style="z-index: 9999; width: 99%; height: 93%; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table cellpadding="0" width="1200px" cellspacing="0" class="bian">
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShouHouRenWu%>"></asp:Label>&nbsp;</td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                            </td>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center" width="9%">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="8%">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="12%">
                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="8%">
                                                            <strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="8%">
                                                            <strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                            <strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                            <strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="7%">
                                                            <strong>
                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="7%">
                                                            <strong>
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="7%">
                                                            <strong>
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="7%">
                                                            <strong>
                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                        ShowHeader="False" OnItemCommand="DataGrid2_ItemCommand"
                                        Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="编号">
                                                <ItemTemplate>
                                                    <asp:Button ID="BT_TaskID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TaskID") %>'
                                                        CssClass="inpu" />
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                <ItemStyle CssClass="itemBorder" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Task" HeaderText="任务">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="FinishPercent" HeaderText="完成程度">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LingYongPeiJian%>"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ChangJia%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                        Height="30px" Width="100%" ID="DataGrid3">

                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <ItemStyle CssClass="itemStyle"></ItemStyle>
                                        <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                    </asp:DataGrid>
                                    <asp:Label ID="LB_UserCode" runat="server"
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server"
                                        Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>

                    </div>
                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
