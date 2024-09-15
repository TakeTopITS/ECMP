<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsProductionOrder.aspx.cs" Inherits="TTGoodsProductionOrder" %>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShengChanZuoYeDan%>"></asp:Label>
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
                                <td align="right" style="padding: 5px 5px 0px 5px;">
                                    <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
                                </td>
                            </tr>
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
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="15%">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="15%">
                                                            <strong>
                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,GongXu%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" width="15%">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" width="15%">
                                                            <strong>
                                                                <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" width="6">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid5_ItemCommand"
                                        OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="25" ShowHeader="false"
                                        Width="100%">
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
                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='Assign' /&gt;&lt;/div&gt;">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:ButtonColumn>
                                            <asp:BoundColumn DataField="PDID" HeaderText="PDID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="PDName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="RouteName" HeaderText="工艺">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ProductionDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生产时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BelongDepartName" HeaderText="部门">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="打印">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                <ItemTemplate>
                                                    <a href='TTGoodsProductionOrderView.aspx?PDID=<%# DataBinder.Eval(Container.DataItem,"PDID") %>' target="_blank">
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" style="width: 60%; padding: 5px 5px 5px 5px;">
                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left" width="25%">
                                                    <asp:TextBox ID="TB_PDName" runat="server" Width="98%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,GongXu%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left" width="25%">
                                                    <asp:TextBox ID="TB_RouteName" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_ProductionType" runat="server" Width="150px">
                                                        <asp:ListItem Value="SelfMade" Text="<%$ Resources:lang,ZiZhi%>" />
                                                        <asp:ListItem Value="OutSourcing" Text="<%$ Resources:lang,WeiWai%>" />
                                                        <asp:ListItem Value="Delivery" Text="交付" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:TextBox ID="DLC_ProductionDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_ProductionDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WanChengShiJian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_FinishedDate" runat="server" ReadOnly="false"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="DLC_FinishedDate_CalendarExtender" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_FinishedDate">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="LB_PDID" runat="server" Visible="false"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:DropDownList ID="DL_PDStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_PDStatus_SelectedIndexChanged">
                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                        <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                        <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                        <asp:ListItem Value="已记账" Text="<%$ Resources:lang,YiJiZhang%>" />
                                                        <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,JiaGongFei%>"></asp:Label><asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Enabled="False" OnBlur="" OnFocus=""
                                                        OnKeyPress="" PositiveColor="" Width="120px" Precision="3">
                                                                0.000
                                                    </NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"
                                                        Height="25px" Width="80px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_BelongDepartName" Width="80px" runat="server" Enabled="false"></asp:TextBox>
                                                    <asp:Label ID="LB_BelongDepartCode" runat="server" Visible="false"></asp:Label>
                                                    <asp:Button ID="BT_SelectDepartment" runat="server" Text="<%$ Resources:lang,XuanZe%>" OnClick="BT_SelectDepartment_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：
                                                </td>
                                                <td colspan="5" align="left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_RelatedType" runat="server" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged"
                                                                    AutoPostBack="True">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                    <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                    <asp:ListItem Value="MRPPlan" Text="<%$ Resources:lang,MRPZhuJiHua%>" />
                                                                    <asp:ListItem Value="SaleOrder" Text="<%$ Resources:lang,XiaoShouDingDan%>" />
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td>
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RelatedID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Precision="0" Width="53px">0</NickLee:NumberBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="BT_RelatedMRPPlan" runat="server" Text="<%$ Resources:lang,MRPZhuJiHua%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="BT_RelatedMRPPlan_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel5" TargetControlID="BT_RelatedMRPPlan" Y="150">
                                                                </cc1:ModalPopupExtender>

                                                                <asp:Button ID="BT_RelatedSaleOrder" runat="server" Text="<%$ Resources:lang,XiaoShouDingDan%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="BT_RelatedSaleOrder_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                                                    CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_RelatedSaleOrder" Y="150">
                                                                </cc1:ModalPopupExtender>

                                                                <asp:Button ID="BT_RelatedProject" runat="server" Text="<%$ Resources:lang,XiangMu%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="TB_RelatedProject_ModalPopupExtender" runat="server" Enabled="True"
                                                                    TargetControlID="BT_RelatedProject" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                                                    BackgroundCssClass="modalBackground" Y="150">
                                                                </cc1:ModalPopupExtender>
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
                                        <br />
                                        <table cellpadding="0" cellspacing="0" width="100%">

                                            <tr>
                                                <td align="left">

                                                    <table align="center" cellpadding="0" cellspacing="0" width="99%">

                                                        <tr>
                                                            <td align="right" style="padding-bottom: 5px;">
                                                                <asp:Button ID="BT_CreateDetail" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" />
                                                            </td>
                                                        </tr>

                                                        <tr style="font-size: 10pt">

                                                            <td>

                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="130%">

                                                                    <tr>

                                                                        <td width="7">

                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                        </td>

                                                                        <td>

                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                <tr>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>



                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="8%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="6%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="13%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="6%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="8%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="6%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>
                                                                                    <td align="center" width="8%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center" width="10%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>


                                                                                    <td align="center" width="8%">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YiRuKu %>"></asp:Label>
                                                                                        </strong>
                                                                                    </td>

                                                                                    <td align="center">

                                                                                        <strong>Bom</strong>
                                                                                    </td>
                                                                                    <td>&nbsp;</td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>

                                                                        <td align="right" width="6">

                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                    OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                    Width="130%">
                                                                    <Columns>
                                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:ButtonColumn>
                                                                        <asp:TemplateColumn HeaderText="Delete">
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Amount" HeaderText="加工费">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="CheckInNumber" HeaderText="入库数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:ButtonColumn CommandName="BOM" Text="&lt;div&gt;&lt;img src=ImagesSkin/BOM.png border=0 width=24 height=24 alt='BOM' /&gt;&lt;/div&gt;">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:ButtonColumn>

                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <a href='TTDocumentTreeView.aspx?RelatedType=BOM&RelatedItemCode=<%#DataBinder.Eval (Container .DataItem ,"GoodsCode") %>&RelatedID=<%#DataBinder.Eval (Container .DataItem ,"BomVerID") %>'>
                                                                                    <img src="ImagesSkin/Doc.gif" class="noBorder" />
                                                                                </a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>

                                                                    <EditItemStyle BackColor="#2461BF" />

                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                    <ItemStyle CssClass="itemStyle" />

                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label113333" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td width="50%">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="99%">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">

                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left; width: 25%;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                        <asp:ListItem Value="OTHER" />
                                                        <asp:ListItem Value="GoodsPJRecord" Text="<%$ Resources:lang,XiangMuGuanLianLiaoPing%>" />
                                                        <asp:ListItem Value="ProjectBOMRecord" Text="ProjectBOMRecord" />
                                                        <asp:ListItem Value="ProductionPlan" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">ID:
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                </td>
                                                <td style="text-align: center;" class="formItemBgStyle">
                                                    <asp:HyperLink ID="HL_ItemRelatedDoc" runat="server" NavigateUrl="TTItemRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenDang%>" Target="_blank" />
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>

                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                    ：</td>
                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="99%"></asp:TextBox>
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">

                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: right;" colspan="4" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong %>" OnClick="BT_Clear_Click" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: right;" colspan="4" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Brand" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left;">

                                                    <NickLee:NumberBox ID="NB_Number" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="53px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">

                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="100px" Precision="4">0.0000</NickLee:NumberBox></td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiaoHuoShiJian %>"></asp:Label>
                                                </td>

                                                <td colspan="2" class="formItemBgStyle" style="text-align: left">

                                                    <asp:TextBox ID="DLC_DeliveryDate" runat="server"></asp:TextBox>

                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_DeliveryDate" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>：
                                                </td>
                                                <td colspan="2" class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_DefaultProcess" runat="server" Width="50%"></asp:TextBox>
                                                    <asp:DropDownList ID="DL_DefaultProcess" DataTextField="ProcessName" DataValueField="ProcessName" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_DefaultProcess_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">BomVer:</td>
                                                <td colspan="2" class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_BomVerID" runat="server" DataTextField="VerID" AutoPostBack="True" DataValueField="VerID" Width="80px" OnSelectedIndexChanged="DL_BomVerID_SelectedIndexChanged"></asp:DropDownList>

                                                    <asp:Button ID="BT_GoodsBOM" runat="server" CssClass="inpu" Width="50px" Text="BOM"></asp:Button>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                        Enabled="True" TargetControlID="BT_GoodsBOM" PopupControlID="Panel4"
                                                        CancelControlID="IMBT_CloseBOM" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                    </cc1:ModalPopupExtender>
                                                </td>

                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label85" runat="server" Text="批号"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_BatchNumber" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label174" runat="server" Text="生产日期"></asp:Label>：
                                                </td>
                                                <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ProductionDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="TB_ProductionDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label195" runat="server" Text="完工日期"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_FinishedDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="TB_FinishedDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label194" runat="server" Text="生产设备号"></asp:Label>：</td>
                                                <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ProductionEquipmentNumber" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label196" runat="server" Text="材质单号"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_MaterialFormNumber" runat="server"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label514" runat="server" Text="<%$ Resources:lang,BaoZhuangFangShi %>"></asp:Label>：
                                                </td>
                                                <td colspan="2" class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_PackagingSystem" runat="server" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>

                                        </table>
                                    </td>

                                    <td>

                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0"
                                            Width="100%">

                                            <cc1:TabPanel ID="TabPanel5" runat="server">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label512" runat="server" Text="<%$ Resources:lang,LPKCLB%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeLiaoPin %>"></asp:Label>：

                                                    <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">

                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                            <tr>

                                                                <td width="7">

                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>

                                                                <td>

                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                        <tr>

                                                                            <td width="12%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="12%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="19%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong>
                                                                            </td>



                                                                            <td align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid7_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">

                                                            <Columns>

                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>

                                                                <asp:TemplateColumn HeaderText="代码">

                                                                    <ItemTemplate>

                                                                        <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode").ToString().Trim() %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:TemplateColumn>

                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                    DataTextField="GoodsName" HeaderText="名称" Target="_blank">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
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

                                            <cc1:TabPanel ID="TabPanel6" runat="server">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeLiaoPin %>"></asp:Label>：

                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">

                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                            <tr>

                                                                <td width="7">

                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>

                                                                <td>

                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                        <tr>

                                                                            <td width="15%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="20%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="15%" align="center"><strong>

                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>

                                                                            <td width="35%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid6_ItemCommand" CellPadding="4"
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

                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel2" runat="server" TabIndex="21">
                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>:
                                                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />

                                                    <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Code%>"></asp:Label>:
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
                                                                                    <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,YuCaiGouLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label171" runat="server" Text="<%$ Resources:lang,YuRuKuLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,YuChuKuLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,YuShengChanLiang %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemProcess" runat="server" Text="<%$ Resources:lang,KuChengLiang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="8%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="LB_dgChildItemUnit" runat="server" Text="<%$ Resources:lang,Unit %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td>&nbsp;
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
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <a href='TTDocumentTreeView.aspx?RelatedType=BOM&RelatedItemCode=<%#DataBinder.Eval (Container .DataItem ,"ItemCode") %>&RelatedID=<%#DataBinder.Eval (Container .DataItem ,"BomVersionID") %>'>
                                                                            <img src="ImagesSkin/Doc.gif" class="noBorder" />
                                                                        </a>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="项目BOM" TabIndex="22">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label58" runat="server" Text="项目BOM"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <br />

                                                    <div id="GoodsListDivID12" style="width: 150%; height: 428px; overflow: auto; text-align: left;">

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
                                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="作业需求计划" TabIndex="2">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ZuoYeXuQiuJiHua%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <br />

                                                    <div id="GoodsListDivID1" style="width: 100%; height: 428px; overflow: auto; text-align: left;">

                                                        <table>

                                                            <tr>

                                                                <td class="formItemBgStyle" style="text-align: right">

                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,JiHua %>"></asp:Label>：
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <asp:DropDownList ID="DL_PlanVerID" runat="server" DataTextField="PlanVerName"
                                                                        DataValueField="PlanVerID" AutoPostBack="True" OnSelectedIndexChanged="DL_PlanVerID_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: right">

                                                                    <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <asp:DropDownList ID="DL_PlanProductionType" runat="server">
                                                                    </asp:DropDownList>
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: right">

                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,MRPBanBen %>"></asp:Label>：
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <asp:DropDownList ID="DL_PlanMRPVersionID" runat="server" DataTextField="PlanMRPVerID"
                                                                        DataValueField="ID" Width="70px" AutoPostBack="True" OnSelectedIndexChanged="DL_PlanMRPVersionID_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <asp:DropDownList ID="DL_BusinessType" runat="server">

                                                                        <asp:ListItem Value="Other" />

                                                                        <asp:ListItem Value="Project" />

                                                                        <asp:ListItem Value="SaleOrder" />

                                                                        <asp:ListItem Value="Project" />
                                                                    </asp:DropDownList>
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <NickLee:NumberBox ID="NB_BusinessID" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="60px">0</NickLee:NumberBox>
                                                                </td>

                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_Find_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                            <tr>

                                                                <td width="7">

                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>

                                                                <td>

                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                        <tr>

                                                                            <td width="7%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="13%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td width="6%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="6%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="6%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="6%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="5%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="6%" align="center">

                                                                                <strong>

                                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,GongYi %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="8%" align="center"><strong>

                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label></strong></td>

                                                                            <td width="4%" align="center"><strong>

                                                                                <asp:Label ID="Label84" runat="server" Text="ID"></asp:Label></strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="200%" CellPadding="4" OnItemCommand="DataGrid3_ItemCommand"
                                                            ForeColor="#333333" GridLines="None">

                                                            <Columns>

                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>

                                                                <asp:TemplateColumn HeaderText="代码">

                                                                    <ItemTemplate>

                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode") %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:TemplateColumn>

                                                                <asp:BoundColumn DataField="ItemName" HeaderText="名称">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="RequireNumber" HeaderText="需求数量">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="OrderNumber" HeaderText="下单数量" Visible="False">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>

                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsProductionOrderDetailViewByProductionPlan.aspx?SourceType=ProductionPlan&SourceID={0}"
                                                                    DataTextField="OrderNumber" Target="_blank" HeaderText="下单数量">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="OrderTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="下单时间">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="RequireTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="需求时间">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="DefaultProcess" HeaderText="工艺">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>

                                                                <asp:TemplateColumn HeaderText="源类型">

                                                                    <ItemTemplate>

                                                                        <%# ShareClass. GetMRPFormTypeAndName(Eval("SourceType").ToString(),Eval("SourceRecordID").ToString()) %>
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                </asp:TemplateColumn>

                                                                <asp:BoundColumn DataField="SourceRecordID" HeaderText="ID">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
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
                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popBOMWindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label13" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td style="width: 380px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="380px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popSelectDepartmentWindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label90" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView5" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView5_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="ImageButton1" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label103" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" colspan="2" style="height: 10px; text-align: left">

                                        <strong>
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GouMaiShenQingGongZuoLiu%>"></asp:Label>：</strong>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="物料生产" Text="<%$ Resources:lang,LiaoPingShengChan%>" />
                                        </asp:DropDownList>

                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                            Width="144px">
                                        </asp:DropDownList>

                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                            Target="_blank">
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,MoBanWeiHu%>"></asp:Label>
                                        </asp:HyperLink>

                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click"
                                            Text="<%$ Resources:lang,ShuaXin%>" />
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_WLName" runat="server" Width="387px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_Description" runat="server" Height="48px" TextMode="MultiLine"
                                            Width="441px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right;"></td>

                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">（<asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>要求收到处理信息：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" /><asp:CheckBox
                                        ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian%>" />

                                        <span style="font-size: 10pt">) </span>

                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" />

                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                            DynamicServicePath="">
                                        </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                            </table>

                            <table cellpadding="0" cellspacing="0" width="100%">

                                <tr style="font-size: 10pt;">

                                    <td style="height: 14px; text-align: left">
                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu%>"></asp:Label>：
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td style="height: 11px; text-align: left">

                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">

                                            <tr>

                                                <td width="7">

                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                </td>

                                                <td>

                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                        <tr>

                                                            <td align="center" width="10%">

                                                                <strong>
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="55%">

                                                                <strong>
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="15%">

                                                                <strong>
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="10%">

                                                                <strong>
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="10%">

                                                                <strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td align="right" width="6">

                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                </td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False"
                                            Width="100%">

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <EditItemStyle BackColor="#2461BF" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <Columns>

                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>

                                                <asp:TemplateColumn>

                                                    <ItemTemplate>

                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                            Target="_blank"><img class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td style="text-align: right">

                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>

                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
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
                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
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
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
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
                    <asp:Panel ID="Panel4" runat="server" CssClass="modalPopup" Style="display: none;">
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
                                        <asp:ImageButton ID="IMBT_CloseBOM" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
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
                                        <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnItemCommand="DataGrid10_ItemCommand"
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
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="ImageButton2" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <asp:Label ID="LB_UserCode" runat="server"
                            Visible="False"></asp:Label>
                        <asp:Label ID="LB_UserName" runat="server"
                            Visible="False"></asp:Label>
                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
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
