<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsShipmentOrderByQrCode.aspx.cs" Inherits="TTGoodsShipmentOrderByQrCode" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = AssetListDivID.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            AssetListDivID.scrollTop = disPostion;
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        //复选框全选
        function ChooseAll(item) {
            $("input[name=dlCode]").each(function () {
                if (item.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }

        //多选择按钮判断
        function ClickBarPrintMore() {
            var str = "";
            var businessType = "GoodsCheckOut";

            var intCount = 0;

            $("input[name=dlCode]").each(function () {
                if ($(this).attr("checked")) {
                    str = str + $(this).attr("id") + ","; // 整个以,隔开
                    intCount++;
                }
            });

            if (intCount > 15) {
                alert('每次选择不要超过15个物料代码进行打印，A4纸一版显示不完！');
                return false;
            }

            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                window.open("TTPrintBarCode.aspx?BusinessCodes=" + escape(str) + "&BusinessType=GoodsCheckOut");

                //jQuery.ajax({
                //    type: "post",
                //    url: "TTMakeAssetPrintMorePost.aspx?AssetCodes=" + escape(str),
                //    success: function (result) {

                //    }
                //});
            }
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChuKuDan%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right" style="padding: 5px 5px 5px 5px;">
                                                <table width="100%">
                                                    <tr>
                                                        <td wiidth="60%" align="center">
                                                            <table>
                                                                <tr>
                                                                    <td align="left">（
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:Label ID="Label211" runat="server" Text="<%$ Resources:lang,CangKu %>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_FindWareHouse" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,KeHu %>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_CustomerName" runat="server" Width="120px"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_FindAll" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindAll_Click" />）
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right">
                                                            <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                   <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label231" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label232" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                    <td align="center" width="5%">
                                                                        <strong>
                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="13%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ChuKuYuanYin%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ChuKuCangKu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,kehu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td align="center" width="5%">
                                                                        <strong></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    ShowHeader="false" Height="1px" OnItemCommand="DataGrid5_ItemCommand" OnPageIndexChanged="DataGrid5_PageIndexChanged"
                                                    PageSize="25" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ShipmentNO" HeaderText="ShipmentNO">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="GSHOName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ApplicationReason" HeaderText="出库原因">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="WareHouse" HeaderText="仓库">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CustomerName" HeaderText="客户">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="打印">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            <ItemTemplate>
                                                                <a href='TTGoodsShipmentOrderView.aspx?ShipmentNO=<%# DataBinder.Eval(Container.DataItem,"ShipmentNO") %>' target="_blank">
                                                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    </Columns>

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        </td> </tr> </table>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 980px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="text-align: right" width="15%" class="formItemBgStyle">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_GSHOName" runat="server" Width="96%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right" width="15%">
                                        <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                        <asp:DropDownList ID="DL_ShipmentType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_ShipmentNO" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right" width="15%">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Applicant" runat="server" Width="96%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:DropDownList ID="DL_CurrencyType" runat="server" ataTextField="Type" DataValueField="Type">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Customer" runat="server" DataTextField="CustomerName" DataValueField="CustomerCode">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChuKuCangKu%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_WHName" runat="server" Width="150px"></asp:TextBox>
                                        <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseWH" Enabled="True" PopupControlID="Panel13" TargetControlID="TB_WHName" Y="15">
                                        </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ChuKuShiJian%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_ShipTime" runat="server" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ShipTime">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ChuKuYuanYin%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="TB_ShipmentReason" runat="server" Width="98%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：</td>
                                    <td colspan="3" class="formItemBgStyle" style="text-align: right">
                                        <table>
                                            <tr>
                                                <td align="right">
                                                    <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />

                                                        <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                        <asp:ListItem Value="MRPPlan" Text="<%$ Resources:lang,MRPZhuJiHua%>" />
                                                        <asp:ListItem Value="SaleOrder" Text="<%$ Resources:lang,XiaoShouDingDan%>" />
                                                        <asp:ListItem Value="Constract" Text="<%$ Resources:lang,HeTong%>" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td align="left">
                                                    <NickLee:NumberBox ID="NB_RelatedID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                </td>
                                                <td align="left">
                                                    <asp:Button ID="BT_RelatedProject" runat="server" Text="<%$ Resources:lang,XiangMu%>" Visible="false" />
                                                    <cc1:ModalPopupExtender ID="TB_RelatedProject_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_RelatedProject" Y="150">
                                                    </cc1:ModalPopupExtender>

                                                    <asp:Button ID="BT_RelatedMRPPlan" runat="server" Text="<%$ Resources:lang,MRPZhuJiHua%>" Visible="false" />
                                                    <cc1:ModalPopupExtender ID="BT_RelatedMRPPlan_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel4" TargetControlID="BT_RelatedMRPPlan" Y="150">
                                                    </cc1:ModalPopupExtender>

                                                    <asp:Button ID="BT_RelatedSaleOrder" runat="server" Text="<%$ Resources:lang,XiaoShouDingDan%>" Visible="false" />
                                                    <cc1:ModalPopupExtender ID="BT_RelatedSaleOrder_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_RelatedSaleOrder" Y="150">
                                                    </cc1:ModalPopupExtender>

                                                    <asp:Button ID="BT_SelectConstract" runat="server" Text="<%$ Resources:lang,HeTong%>" Visible="false" />
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender3" runat="server" Enabled="True"
                                                        TargetControlID="BT_SelectConstract" PopupControlID="Panel14" CancelControlID="IMBT_CloseCS"
                                                        BackgroundCssClass="modalBackground" Y="150">
                                                    </cc1:ModalPopupExtender>

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right"></td>
                                    <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>

                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                            <br />

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="6" align="left">
                                        <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td colspan="6" align="left" class="page_topbj">
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ChuKuDanMingXi%>"></asp:Label>：
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" style="padding: 5px 5px 0px 5px;">
                                                    <table width="100%">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label203335" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left; width: 30%;">
                                                                <asp:TextBox ID="TB_QrSN" runat="server" Width="99%" Height="30px" AutoPostBack="true" OnTextChanged="TB_QrSN_TextChanged"></asp:TextBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="BT_CreateDetail" runat="server" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" Text="<%$ Resources:lang,New %>" />

                                                            </td>
                                                            <td style="text-align: right; padding-top: 10px;">
                                                                <input type="button" class="inpuLong" value="打印条形码" onclick="ClickBarPrintMore();" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6" align="right">
                                                    <table width="110%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center"><strong></strong></td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label229" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label230" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                        </td>

                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label191" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <%-- <td width="6%" align="center">
                                                                                    <strong>单价</strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>金额</strong>
                                                                                </td>--%>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BaoXiuQiTian%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ChuKuWeiZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <%--  <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                        Height="1px" OnItemCommand="DataGrid1_ItemCommand" Width="110%" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None">
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                <ItemTemplate>
                                                                    <input value='<%#Eval("ID") %>' id='<%#Eval("ID") %>' type="checkbox" name="dlCode" />
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:ButtonColumn>
                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateColumn>

                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <%-- <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>--%>
                                                            <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WarrantyPeriod" HeaderText="保修期（天）">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SN" HeaderText="序列号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FromPosition" HeaderText="出库位置">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <%--   <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label206" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label2072222" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table align="center" width="100%">
                                <tr>
                                    <td width="45%" class="formItemBgStyle">
                                        <table align="center" width="100%" cellpadding="1" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_SN" runat="server" Width="99%" AutoPostBack="true" OnTextChanged="TB_SN_TextChanged"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:TextBox ID="TB_Manufacturer" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                    &nbsp;<asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong%>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="80px" Height="40px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress="" Visible="false"
                                                        PositiveColor="" Width="85px" Height="40px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                                        Width="64px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="NB_WarrantyPeriod" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="85px">0</NickLee:NumberBox>
                                                    天</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="批号"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_BatchNumber" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label198" runat="server" Text="生产日期"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_ProductionDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_ProductionDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label207" runat="server" Text="失效日期"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_ExpiryDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_ExpiryDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label224" runat="server" Text="生产设备号"></asp:Label></td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ProductionEquipmentNumber" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label225" runat="server" Text="材质单号"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_MaterialFormNumber" runat="server"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label226" runat="server" Text="注册证号"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:TextBox ID="TB_RegistrationNumber" runat="server" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" align="left" class="formItemBgStyle">

                                                    <asp:TextBox ID="TB_ToPosition" runat="server" Width="95%"></asp:TextBox>

                                                    <asp:DropDownList ID="DL_InWareHouse" runat="server" AutoPostBack="True" Visible="false" DataTextField="WHName" DataValueField="WHName" OnSelectedIndexChanged="DL_InWareHouse_SelectedIndexChanged">
                                                    </asp:DropDownList>

                                                    <asp:DropDownList ID="DL_WHPosition" runat="server" Visible="false" DataTextField="PositionName" DataValueField="PositionName">
                                                    </asp:DropDownList>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,ChuKuWeiZhi%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" align="left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TB_FromPosition" runat="server" Width="90%"></asp:TextBox>
                                                                <asp:Label ID="LB_FromGoodsID" runat="server"></asp:Label>
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <asp:Label ID="Label228" runat="server" Text="出库仓位"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TB_FromWHPosition" runat="server" Width="90%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Comment" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                                </td>
                                                <td align="left" width="25%" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" Enabled="false" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                        <asp:ListItem Value="GoodsPJRecord" Text="<%$ Resources:lang,XiangMuGuanLianLiaoPing%>" />
                                                        <asp:ListItem Value="ProjectBOMRecord" Text="ProjectBOMRecord" />
                                                        <asp:ListItem Value="GoodsCONRecord" Text="<%$ Resources:lang,ChuHuoTongZhiDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsSARecord" Text="<%$ Resources:lang,XiaoShouShenQingDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsSORecord" Text="<%$ Resources:lang,XiaoShouDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPARecord" Text="<%$ Resources:lang,LingLiaoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPFRecord" Text="<%$ Resources:lang,BuLiaoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPURRecord" Text="<%$ Resources:lang,TuiHuoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPDRecord" Text="<%$ Resources:lang,ShengChanDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsBOMRecord" Text="<%$ Resources:lang,BOMJiLu%>" />
                                                        <asp:ListItem Value="GoodsBORecord" Text="<%$ Resources:lang,JieChuDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsCSRecord" Text="<%$ Resources:lang,HeTongLiaoPingJiLu%>" />
                                                        <asp:ListItem Value="GoodsCIORecord" Text="<%$ Resources:lang,RuKuDanJiLu%>" />
                                                    </asp:DropDownList></td>
                                                <td align="right" width="15%" class="formItemBgStyle">ID:</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" Enabled="false" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                    <asp:Label ID="LB_SourceRelatedID" runat="server" Visible="False" Text="0"></asp:Label>
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="60%" class="formItemBgStyle">
                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <table>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left" colspan="3">
                                                                <table>
                                                                    <tr>
                                                                        <td width="15%" align="right">
                                                                            <asp:DropDownList ID="DL_SourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SourceType_SelectedIndexChanged">
                                                                                <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                                <asp:ListItem Value="GoodsOA" Text="<%$ Resources:lang,LingLiaoDan%>" />
                                                                                <asp:ListItem Value="GoodsCON" Text="<%$ Resources:lang,ChuHuoTongZhiDan%>" />
                                                                                <asp:ListItem Value="GoodsSA" Text="<%$ Resources:lang,XiaoShouLingYongDan%>" />
                                                                                <asp:ListItem Value="GoodsSO" Text="<%$ Resources:lang,XiaoShouDan%>" />
                                                                                <asp:ListItem Value="GoodsPF" Text="<%$ Resources:lang,BuLiaoDan%>" />
                                                                                <asp:ListItem Value="GoodsPUR" Text="<%$ Resources:lang,TuiHuoDan%>" />
                                                                                <asp:ListItem Value="GoodsPD" Text="生产作业单" />
                                                                                <asp:ListItem Value="GoodsBO" Text="<%$ Resources:lang,JieChuDan%>" />
                                                                                <asp:ListItem Value="Contract" Text="<%$ Resources:lang,HeTong%>" />
                                                                                <asp:ListItem Value="GoodsCIO" Text="<%$ Resources:lang,RuKuDan%>" />
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td align="right">ID:</td>
                                                                        <td width="15%" align="left">
                                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SourceID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                                PositiveColor="" Precision="0" Width="35px">0</NickLee:NumberBox>
                                                                        </td>
                                                                        <td align="left">

                                                                            <asp:Button ID="BT_SelectPA" runat="server" Text="<%$ Resources:lang,LingLiaoDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectPA_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_ClosePA" Enabled="True" PopupControlID="Panel5" TargetControlID="BT_SelectPA">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectCON" runat="server" Text="<%$ Resources:lang,ChuHuoTongZhiDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectCON_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_CloseCON" Enabled="True" PopupControlID="Panel10" TargetControlID="BT_SelectCON">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectSA" runat="server" Text="<%$ Resources:lang,XiaoShouLingYongDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectSA_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_CloseSA" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_SelectSA">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectSO" runat="server" Text="<%$ Resources:lang,XiaoShouDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectSO_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_CloseSO" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_SelectSO">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectPF" runat="server" Text="<%$ Resources:lang,BuLiaoDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectPF_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_ClosePF" Enabled="True" PopupControlID="Panel6" TargetControlID="BT_SelectPF">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectPUR" runat="server" Text="<%$ Resources:lang,TuiHuoDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectPUR_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                                                                CancelControlID="IMBT_ClosePUR" Enabled="True" PopupControlID="Panel7" TargetControlID="BT_SelectPUR" Y="150">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectPD" runat="server" Text="生产作业单" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectPD_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                                                                CancelControlID="IMBT_ClosePD" Enabled="True" PopupControlID="Panel8" TargetControlID="BT_SelectPD" Y="150">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectBO" runat="server" Text="<%$ Resources:lang,JieChuDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectBO_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                                                                CancelControlID="IMBT_CloseBO" Enabled="True" PopupControlID="Panel9" TargetControlID="BT_SelectBO" Y="150">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectCS" runat="server" Text="<%$ Resources:lang,HeTong%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectCS_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_CSClose" Enabled="True" PopupControlID="Panel12" TargetControlID="BT_SelectCS">
                                                                            </cc1:ModalPopupExtender>

                                                                            <asp:Button ID="BT_SelectCIO" runat="server" Text="<%$ Resources:lang,RuKuDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender2" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                                CancelControlID="IMBT_CIOClose" Enabled="True" PopupControlID="Panel11" TargetControlID="BT_SelectCIO">
                                                                            </cc1:ModalPopupExtender>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,LiaoPinKuCunLieBiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <asp:Label runat="server" Text="<%$ Resources:lang,QXQYCKDLP %>"></asp:Label>
                                                    ：
                                                    <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="12%"><strong>
                                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="14%"><strong>
                                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="14%"><strong>
                                                                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                            </strong></td>


                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label>
                                                                            </strong>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label227" runat="server" Text="仓位"></asp:Label>
                                                                                </strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid2_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode") %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                    DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="WHPosition" HeaderText="仓位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <EditItemStyle BackColor="#2461BF" />

                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />

                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel6" runat="server" TabIndex="1">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <asp:Label runat="server" Text="<%$ Resources:lang,QXQYRKDLP %>"></asp:Label>：
                                                    <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td width="20%" align="center"><strong>
                                                                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="35%" align="center"><strong>
                                                                                <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid9_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}"
                                                                    DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel12" runat="server" TabIndex="2">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>:
                                                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,Code%>"></asp:Label>:
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_FindItemCode" runat="server" Width="80px"></asp:TextBox>
                                                            </td>

                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label214" runat="server" Text="<%$ Resources:lang,Name%>"></asp:Label>
                                                                : </td>
                                                            <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                                                <asp:TextBox ID="TB_FindItemName" runat="server" Width="80px"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,Specification%>"></asp:Label>
                                                                : </td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <asp:TextBox ID="TB_FindItemSpec" runat="server" Width="80px"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right;">
                                                                <asp:Label ID="Label216" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>
                                                                : </td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <asp:TextBox ID="TB_FindModelNumber" runat="server" Width="80px"></asp:TextBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <asp:Button ID="BT_MaterialBudgetFind" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_MaterialBudgetFind_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemID" runat="server" Text="<%$ Resources:lang,ID %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemCode" runat="server" Text="<%$ Resources:lang,Code %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemName" runat="server" Text="<%$ Resources:lang,Name %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="center"><strong>
                                                                                <asp:Label ID="Label333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildBomVersion" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemNumber" runat="server" Text="<%$ Resources:lang,Number %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,YuCaiGouLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,YuRuKuLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label204" runat="server" Text="<%$ Resources:lang,YuChuKuLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label213" runat="server" Text="<%$ Resources:lang,YuShengChanLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemProcess" runat="server" Text="<%$ Resources:lang,KuChengLiang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemUnit" runat="server" Text="<%$ Resources:lang,Unit %>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid25" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid25_ItemCommand"
                                                            Width="200%" ShowHeader="False" BorderColor="#7FC4ED" BorderStyle="Solid" BorderWidth="1px">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <ItemStyle CssClass="itemStyle" HorizontalAlign="Center" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="物料类型">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.GetItemType(Eval("ItemCode").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AleadyPurchased" HeaderText="已采购量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AleadyCheckIn" HeaderText="已入库量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AleadyCheckOut" HeaderText="已出库量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="AleadyProduction" HeaderText="已生产量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="库存量">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.GetMaterialsStockNumber(Eval("ItemCode").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel14" runat="server" HeaderText="项目BOM" TabIndex="3">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label210" runat="server" Text="项目BOM"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <br />

                                                    <div id="GoodsListDivID12" style="width: 140%; height: 428px; overflow: auto; text-align: left;">

                                                        <table cellpadding="2" cellspacing="0">

                                                            <tr>

                                                                <td>

                                                                    <asp:Label ID="LB_tbItemBomVersion" runat="server" Text="<%$ Resources:lang,Version%>"></asp:Label>:
                                                                </td>

                                                                <td align="left">

                                                                    <asp:DropDownList ID="DL_ChangeProjectItemBomVersionID" runat="server" AutoPostBack="True"
                                                                        DataTextField="VerID" DataValueField="ID" OnSelectedIndexChanged="DL_ChangeProjecrItemBomVersionID_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <hr />

                                                        <asp:TreeView ID="TreeView4" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                                            NodeWrap="True" ShowLines="True">

                                                            <RootNodeStyle CssClass="rootNode" />

                                                            <NodeStyle CssClass="treeNode" />

                                                            <LeafNodeStyle CssClass="leafNode" />

                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                        </asp:TreeView>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel10" runat="server" TabIndex="4">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,ChuHuoTongZhiDan %>"></asp:Label>:
                                                                        <asp:Label ID="LB_CONID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi %>"></asp:Label>明细：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div22" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="7%" align="center"><strong>
                                                                                <asp:Label ID="Label163" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,LiaoPinDaiMa %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,LiaoPinMingCheng %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label166" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,KeHuXingHao %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label168" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label169" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label170" runat="server" Text="<%$ Resources:lang,ZhuangXiangShuLiang %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label172" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label173" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label174" runat="server" Text="<%$ Resources:lang,WanChengZhuangTai %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label175" runat="server" Text="<%$ Resources:lang,ChuHuShiJian %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid22" runat="server" AutoGenerateColumns="False" Height="30px"
                                                            OnItemCommand="DataGrid22_ItemCommand" Width="150%" CellPadding="4" ShowHeader="False"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CustomerModelNumber" HeaderText="客户型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="BoxNumber" HeaderText="装箱数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="FinishStatus" HeaderText="完成状态">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutTime" HeaderText="出货时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid><asp:Label ID="Label176" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel1" runat="server" TabIndex="5">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,XiaoShouLingYongDan%>"></asp:Label>:
                                                                        <asp:Label ID="LB_SAID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <br />
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Button ID="BT_TransferFromApplicationForm" runat="server" CssClass="inpuLong" OnClick="BT_TransferFromApplicationForm_Click" Text="<%$ Resources:lang,ZhiJieZhuanChengChuKuDan %>" /></td>
                                                        </tr>
                                                    </table>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label217" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="30px"
                                                            Width="150%" CellPadding="4" ShowHeader="False" ForeColor="#333333" OnItemCommand="DataGrid4_ItemCommand"
                                                            GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid><asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel3" runat="server" TabIndex="6">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,XiaoShouDan%>"></asp:Label>:
                                                    <asp:Label ID="LB_SOID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Button ID="BT_TransferFromSaleOrderForm" runat="server" CssClass="inpuLong" OnClick="BT_TransferFromSaleOrderForm_Click" Text="<%$ Resources:lang,ZhiJieZhuanChengChuKuDan%>" /></td>
                                                        </tr>
                                                    </table>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong></td>
                                                                            <td align="center" width="30%"><strong>
                                                                                <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label218" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid7_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="200%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid><asp:Label ID="LB_Sql7" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_Sql8" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel4" runat="server" TabIndex="7">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,LingLiaoDan%>"></asp:Label>:
                                                    <asp:Label ID="LB_PAID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Button runat="server" Text="<%$ Resources:lang,ZhiJieZhuanChengChuKuDan %>" CssClass="inpuLong" ID="Button1" OnClick="BT_TransferFromProductionApplicationOrderForm_Click"></asp:Button></td>
                                                        </tr>
                                                    </table>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="13%" align="center"><strong>
                                                                                <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,LiaoPinDaiMa %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,ShangPinMing %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label219" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False" Height="30px"
                                                            OnItemCommand="DataGrid10_ItemCommand" Width="200%" CellPadding="4" ShowHeader="False"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel5" runat="server" TabIndex="8">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,ShengChanBuLiao%>"></asp:Label>:
                                                    <asp:Label ID="LB_PFID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div3" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="13%" align="center"><strong>
                                                                                <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,LiaoPinDaiMa%>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,LiaoPinMingCheng%>"></asp:Label></strong></td>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong></td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label220" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid14" runat="server" AutoGenerateColumns="False" Height="30px"
                                                            OnItemCommand="DataGrid14_ItemCommand" Width="200%" CellPadding="4" ShowHeader="False"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel7" runat="server" TabIndex="9">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,CaiGouTuiHuo%>"></asp:Label>:
                                                                        <asp:Label ID="LB_PURID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div4" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShangPinMingCheng %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="11%" align="center"><strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label221" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XuLieHao %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TuiHuoYuanYin %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" OnItemCommand="DataGrid12_ItemCommand" Width="200%" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="11%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SN" HeaderText="序列号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ReturnReason" HeaderText="退货原因">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel8" runat="server" TabIndex="10">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="生产作业单"></asp:Label>:
                                                                        <asp:Label ID="LB_PDID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td></td>
                                                            <td align="right" widt="20%">
                                                                <asp:Button ID="BT_PDMRPExpend" runat="server" CssClass="inpuLong" OnClick="BT_PDMRPExpend_Click" Text="<%$ Resources:lang,MRPZhanKai %>" /></td>
                                                            <td align="center" width="20%" style="padding-top: 5px;">
                                                                <asp:HyperLink ID="HL_GoodsMaterialIssueOrder" runat="server" Target="_blank" Text="<%$ Resources:lang,TLFLD %>"></asp:HyperLink></td>
                                                        </tr>
                                                    </table>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>

                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="20%"><strong>
                                                                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid16" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid16_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="200%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>

                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>

                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td width="14%" align="center"><strong>
                                                                                <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                                            <td width="14%" align="center"><strong>
                                                                                <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,GongYi %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid17" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="200%" OnItemCommand="DataGrid17_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                    DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="OrderTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="下单时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="RequireTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="需求时间">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="DefaultProcess" HeaderText="工艺">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel9" runat="server" TabIndex="11">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,ShangPinJieChu %>"></asp:Label>:
                                                                        <asp:Label ID="LB_BOID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi %>"></asp:Label>明细：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div5" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td width="7%" align="center"><strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label13424" runat="server" Text="<%$ Resources:lang,ShangPinMing %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="12%" align="center"><strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label222" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YiTui %>"></asp:Label></strong></td>
                                                                            <td width="8%" align="center"><strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" OnItemCommand="DataGrid20_ItemCommand" Width="200%" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ReturnNumber" HeaderText="已退">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel11" runat="server" HeaderText="<%$ Resources:lang,HeTongLiaoPingQingDan %>" TabIndex="12">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label178" runat="server" Text="<%$ Resources:lang,HeTongLiaoPingQingDan %>"></asp:Label><asp:Label ID="Label188" Text="<%$ Resources:lang,HeTong %>" runat="server" Font-Bold="True" Width="100%"></asp:Label><asp:Label ID="LB_ConstractCode" runat="server" Font-Bold="True" Width="100%">  </asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                            width="200%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td width="4%" align="center"><strong>
                                                                                <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label270" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="18%" align="center"><strong>
                                                                                <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label223" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center" width="5%"><strong>
                                                                                <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                            <td align="center" width="7%"><strong>
                                                                                <asp:Label ID="Label185" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label186" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label187" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid24" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid24_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="200%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="物料类型">
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.GetItemType(Eval("GoodsCode").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SaleOrderNumber" HeaderText="在单量（销售单）">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseOrderNumber" HeaderText="在订单 ">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel13" runat="server" TabIndex="13">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,RuKuDan%>"></asp:Label>:
                                                                        <asp:Label ID="LB_CIODID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <div id="Div1111" style="width: 100%; height: 428px; overflow: auto;">
                                                        <table width="200%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label196" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label197" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label200" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="13%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label201" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label202" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="6%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label203" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label208" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid27" runat="server" AutoGenerateColumns="False"
                                                            ShowHeader="False" Height="1px" OnItemCommand="DataGrid27_ItemCommand"
                                                            Width="200%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsCode={0}"
                                                                    DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckInNumber" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewDetail" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewDetail_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label209" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel13" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table>
                                <tr>
                                    <td>
                                        <table width="500px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                            Width="500px"
                                            ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_AAID" runat="server" CssClass="inpu" Style="text-align: center"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"AAID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="GAAName" HeaderText="申请名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInfoSimple.aspx?UserCode={0}"
                                                    DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:HyperLinkColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseSA" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="25%">
                                                                <strong>
                                                                    <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="15%">
                                                                <strong>
                                                                    <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid6_ItemCommand"
                                            ShowHeader="false"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_SOID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"SOID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="SOID" DataNavigateUrlFormatString="TTGoodsSaleOrderDetail.aspx?SOID={0}"
                                                    DataTextField="SOName" HeaderText="名称" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="SaleTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="销售时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="SalesCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="SalesName" HeaderText="业务员" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:HyperLinkColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseSO" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel4" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="30%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,JiHuaMing%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <%-- <td align="center" width="5%">
                                                                                    <strong></strong>
                                                                                </td>--%>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnItemCommand="DataGrid8_ItemCommand"
                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_PlanVerID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"PlanVerID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="PlanVerName" HeaderText="计划名">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="BelongDepartName" HeaderText="归属部门">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CreatorName" HeaderText="申请人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel5" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label147" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid11" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid11_ItemCommand"
                                            Width="100%" AllowPaging="True" PageSize="8"
                                            ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_AAID" runat="server" CssClass="inpu" Style="text-align: center"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"AAID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="GAAName" HeaderText="申请名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePA" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel6" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label149" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid13" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid13_ItemCommand"
                                            Width="100%" AllowPaging="True" PageSize="8"
                                            ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_AAID" runat="server" CssClass="inpu" Style="text-align: center"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"AAID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="GAAName" HeaderText="申请名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePF" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel7" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 900px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 100%; padding: 5px 5px 5px 5px;"
                                        valign="top" align="left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid15" runat="server" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnItemCommand="DataGrid15_ItemCommand"
                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ROID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ROID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ReturnName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePUR" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel8" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="25%">
                                                                <strong>
                                                                    <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid18" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid18_ItemCommand"
                                            ShowHeader="false"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_PDID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"PDID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="PDName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ProductionDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生产时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePD" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel9" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="18%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="52%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieChuYuanYin%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid19" runat="server" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnItemCommand="DataGrid19_ItemCommand"
                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_BorrowNO" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"BorrowNO") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ApplicationReason" HeaderText="借出原因">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="52%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseBO" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel10" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="40%"><strong>
                                                                <asp:Label ID="Label160" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                            </strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label161" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid21" runat="server" AllowPaging="false" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid21_ItemCommand" ShowHeader="false" Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_COOID" runat="server" CssClass="inpu" Style="text-align: center" Text='<%# DataBinder.Eval(Container.DataItem,"COOID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="COOName" HeaderText="申请名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="打印">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    <ItemTemplate>
                                                        <a href='TTGoodsCheckOutNoticeOrderView.aspx?COOID=<%# DataBinder.Eval(Container.DataItem,"COOID") %>' target="_blank">
                                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                        </a>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseCON" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel12" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 900px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 100%; padding: 5px 5px 5px 5px;"
                                        valign="top" align="left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label143" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong></td>
                                                            <td width="6%" align="center"><strong>
                                                                <asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong></td>
                                                            <td width="8%" align="center"><strong>
                                                                <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong></td>
                                                            <td width="8%" align="center"><strong>
                                                                <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid23" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            Height="1px" OnItemCommand="DataGrid23_ItemCommand" Width="100%"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="合同代码">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ConstractCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ConstractCode") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                    DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Currency" HeaderText="币种">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CSClose" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel11" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label193" runat="server" Text="<%$ Resources:lang,CangKu%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="30%">
                                                                <strong>
                                                                    <asp:Label ID="Label194" runat="server" Text="<%$ Resources:lang,RuKuShiJian%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid26" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid26_ItemCommand"
                                            ShowHeader="false"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_CheckInID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"CheckInID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="GCIOName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="WareHouse" HeaderText="仓库">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="CheckInDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="入库时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="打印">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                    <ItemTemplate>
                                                        <a href='TTGoodsCheckInOrderView.aspx?CheckInID=<%# DataBinder.Eval(Container.DataItem,"CheckInID") %>' target="_blank">
                                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;"
                                        valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CIOClose" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                     <asp:Panel ID="Panel14" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView6" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView6_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseCS" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

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
