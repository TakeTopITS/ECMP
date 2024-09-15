<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsMRPPlanDetailView.aspx.cs" Inherits="TTGoodsMRPPlanDetailView" %>

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
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

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
                                <td style="padding: 5px 5px 5px 5px;">
                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="计划内容">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
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
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BanHao %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="13%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                                </td>
                                                                                 <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>BomID</strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WanChengShuLiang %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WeiWanShuLiang %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaoHuoShiJian %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
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
                                                                Height="1px" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
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
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BomVerID" HeaderText="BomVerID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="FinishedNumber" HeaderText="完成数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UnFinishedNumber" HeaderText="未完数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanStartDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="计划开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="DeliveryDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发货时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>


                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
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
                                            </ContentTemplate>
                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="采购需求计划" TabIndex="1">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiGouXuQiuJiHua%>"></asp:Label>
                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">

                                                    <tr>
                                                        <td colspan="6">
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
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,SunHaoLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiaDanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XuQiuShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="RequireNumber" HeaderText="需求数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OrderNumber" HeaderText="下单数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

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
                                            </ContentTemplate>
                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="作业需求计划" TabIndex="2">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZuoYeXuQiuJiHua%>"></asp:Label>
                                            </HeaderTemplate>

                                            <ContentTemplate>

                                                 <table width="100%" cellpadding="0" cellspacing="0" align="center">

                                                    <tr>
                                                        <td colspan="6">
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
                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,SunHaoLiang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,XiaDanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,XuQiuShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="RequireNumber" HeaderText="需求数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OrderNumber" HeaderText="已下单量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
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
                                            
                                            </ContentTemplate>
                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="委外需求计划" TabIndex="2">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,WeiWaiXuQiuJiHua%>"></asp:Label>
                                            </HeaderTemplate>

                                            <ContentTemplate>

                                           


                                                    <table width="100%" cellpadding="0" cellspacing="0" align="center">

                                                    <tr>
                                                        <td colspan="6">
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
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,SunHaoLiang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,XiaDanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XuQiuShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="RequireNumber" HeaderText="需求数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OrderNumber" HeaderText="已下单量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
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
                                            </ContentTemplate>
                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
