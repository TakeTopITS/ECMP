<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsShipmentOrderFromOther.aspx.cs" Inherits="TTGoodsShipmentOrderFromOther" %>

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

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">

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

        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangPinChuKu%>"></asp:Label>
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
                                            <td align="right" style="padding: 5px 5px 0px 5px;">
                                                <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
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
                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                   
                                                                    <td align="center" width="5%">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="18%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="39%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuKuYuanYin%>"></asp:Label></strong>
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
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ApplicationReason" HeaderText="出库原因">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="39%" />
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 980px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label205" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="text-align: right" width="15%" class="formItemBgStyle">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                    </td>
                                    <td style="width: 30%; text-align: left" class="formItemBgStyle">
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
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_Applicant" runat="server" Width="96%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">&nbsp;</td>
                                    <td class="formItemBgStyle" style="text-align: left">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                    </td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_CurrencyType" runat="server" ataTextField="Type" DataValueField="Type"
                                            Width="100px">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChuKuShiJian%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="DLC_ShipTime" runat="server" ReadOnly="false"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ShipTime">
                                        </cc1:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle" colspan="3">
                                        <asp:DropDownList ID="DL_Customer" runat="server" DataTextField="CustomerName" DataValueField="CustomerCode">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ChuKuCangKu%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_WareHouse" runat="server" AutoPostBack="True" DataTextField="WHName"
                                            DataValueField="WHName" OnSelectedIndexChanged="DL_WareHouse_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChuKuYuanYin%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="TB_ShipmentReason" runat="server" Width="98%"></asp:TextBox>
                                    </td>
                                </tr>
                            </table>

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right" style="padding: 5px 5px 0px 5px;">

                                        <asp:Button ID="BT_CreateDetail" runat="server" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" Text="<%$ Resources:lang,New %>" />

                                        &nbsp;&nbsp;
                                        <input type="button" class="inpuLong" value="打印条形码" onclick="ClickBarPrintMore();" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="left">
                                        <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td colspan="6" align="left" class="page_topbj">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuKuDanMingXi%>"></asp:Label>：
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <table width="110%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center" width="5%"><strong></strong></td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                        </td>

                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShangPinMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ChuKuWeiZhi%>"></asp:Label></strong>
                                                                        </td>
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
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SN" HeaderText="序列号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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

                                                            <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="生产厂家">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="FromPosition" HeaderText="存放位置">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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
                            <asp:Label ID="Label207" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table align="center" width="100%">
                                <tr>
                                    <td class="formItemBgStyle">
                                        <table align="center" width="100%" cellpadding="1" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                                <td align="left" width="25%" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                        <asp:ListItem Value="GoodsAORecord" Text="<%$ Resources:lang,ShenQingDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsSORecord" Text="<%$ Resources:lang,XiaoShouDanJiLu%>" />
                                                    </asp:DropDownList></td>
                                                <td align="right" width="15%" class="formItemBgStyle">ID:</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                    <asp:Label ID="LB_SourceRelatedID" runat="server" Visible="False" Text="0"></asp:Label>
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_SN" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong%>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:TextBox ID="TB_Manufacturer" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress="" Visible="false"
                                                        PositiveColor="" Width="85px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                                        Width="64px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="NB_WarrantyPeriod" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="85px">0</NickLee:NumberBox>
                                                    天</td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" align="left" class="formItemBgStyle">

                                                    <asp:TextBox ID="TB_ToPosition" runat="server" Width="99%"></asp:TextBox>

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
                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Comment" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">

                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>

                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
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
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>
                                                                ：</td>
                                                            <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                                <table>
                                                                    <tr>
                                                                        <td align="right" width="15%">
                                                                            <asp:DropDownList ID="DL_SourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SourceType_SelectedIndexChanged">
                                                                                <asp:ListItem Text="<%$ Resources:lang,QiTa%>" Value="Other" />
                                                                                <asp:ListItem Text="<%$ Resources:lang,ShenQingDan%>" Value="GoodsAO" />
                                                                                <asp:ListItem Text="<%$ Resources:lang,XiaoShouDan%>" Value="GoodsSO" />
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td align="right">ID:</td>
                                                                        <td align="left" width="15%">
                                                                            <NickLee:NumberBox ID="NB_SourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="35px">0</NickLee:NumberBox>
                                                                        </td>
                                                                        <td align="left">
                                                                            <asp:Button ID="BT_SelectAO" runat="server" Text="<%$ Resources:lang,ShenQingDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectAO_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseAO" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_SelectAO" Y="150">
                                                                            </cc1:ModalPopupExtender>
                                                                            <asp:Button ID="BT_SelectSO" runat="server" Text="<%$ Resources:lang,XiaoShouDan%>" Visible="false" />
                                                                            <cc1:ModalPopupExtender ID="BT_SelectSO_ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseSO" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_SelectSO" Y="150">
                                                                            </cc1:ModalPopupExtender>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: left;"></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                        <cc1:TabContainer ID="TabContainer1" runat="server" ActiveTabIndex="0" CssClass="ajax_tab_menu" Width="100%">
                                            <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="0">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,LiaoPinKuCunLieBiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,QXQYCKDSP %>"></asp:Label>
                                                    ：
                                                        <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="200%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="12%"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label227" runat="server" Text="仓位"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="200%">
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
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}" DataTextField="GoodsName" HeaderText="名称" Target="_blank">
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
                                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
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

                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,QXQYRKDSP %>"></asp:Label>
                                                    ：
                                                        <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="200%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="35%"><strong>
                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid9_ItemCommand" ShowHeader="False" Width="200%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="代码">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}" DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:HyperLinkColumn>

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
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                            </asp:DataGrid>
                                                        </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel1" runat="server" TabIndex="2">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ShenQingDan%>"></asp:Label>
                                                    :
                                                    <asp:Label ID="LB_AOID" runat="server"></asp:Label>
                                                    &nbsp;<asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                    ：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Button ID="BT_TransferFromApplicationForm" runat="server" CssClass="inpuLong" OnClick="BT_TransferFromApplicationForm_Click" Text="<%$ Resources:lang,ZhiJieZhuanChengChuKuDan %>" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="200%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label62222" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShangPinMingCheng %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label63334" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                            </strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="False" Width="200%">
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
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        </asp:DataGrid>
                                                        <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel3" runat="server" TabIndex="3">
                                                <HeaderTemplate>

                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,XiaoShouDan%>"></asp:Label>
                                                    :
                                                    <asp:Label ID="LB_SOID" runat="server"></asp:Label>
                                                    &nbsp;<asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                    ：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Button ID="BT_TransferFromSaleOrderForm" runat="server" CssClass="inpuLong" OnClick="BT_TransferFromSaleOrderForm_Click" Text="<%$ Resources:lang,ZhiJieZhuanChengChuKuDan%>" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="200%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="30%"><strong>
                                                                                <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>
                                                                            </strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid7_ItemCommand" ShowHeader="False" Width="200%">
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
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>

                                                        <asp:Label ID="LB_Sql7" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_Sql8" runat="server" Visible="False"></asp:Label>
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

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
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
                                                                    <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                            Width="500px" AllowPaging="True" PageSize="10" OnPageIndexChanged="DataGrid3_PageIndexChanged"
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
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseAO" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
                                                                    <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="25%">
                                                                <strong>
                                                                    <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="15%">
                                                                <strong>
                                                                    <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="15%">
                                                                <strong>
                                                                    <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
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

                                                <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
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
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseSO" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
