<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReceivablesPayableForForm.aspx.cs" Inherits="TTReceivablesPayableForForm" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
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
                                                <table width="280" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YeWuDanShouFuKuanChuLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql5" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql1" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql4" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql2" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql6" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql7" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 220px; border-left: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" width="170" style="padding: 5px 2px  0px 5px; border-left: solid 1px #D8D8D8">
                                                <table cellpadding="0" cellspacing="0" style="width: 170px;">
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
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
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
                                                                ShowHeader="false" Width="170px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="部门人员：">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td rowspan="2" style="width: 100%; padding: 0px 5px 0px 5px; border-right: solid 1px #D8D8D8;">
                                                <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                    <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShangPinCaiGou%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="25%"><strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZongJinE %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaiGouShiJian %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuoZhe %>"></asp:Label></strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                            OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="20" ShowHeader="False"
                                                                            Width="100%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="POID" HeaderText="单号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTGoodsPurchaseOrderView.aspx?POID={0}"
                                                                                    DataTextField="GPOName" HeaderText="名称" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="收付款">
                                                                                    <ItemTemplate>
                                                                                        <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"POID") %>&RelatedType=GoodsPO' target="_blank">
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouFuKuan%>"></asp:Label></a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                    DataTextField="OperatorName" HeaderText="用户" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                    <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaiGouTuiHuo%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td width="20%" align="center"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                <td width="20%" align="center"><strong></strong></td>
                                                                                <td width="20%" align="center"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong></td>
                                                                                <td width="20%" align="center"><strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="False" Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged"
                                                                PageSize="20" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="AAID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="GAAName" HeaderText="申请名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="收付款">
                                                                        <ItemTemplate>
                                                                            <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"AAID") %>&RelatedType=GoodsAO' target="_blank">
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ShouFuKuan%>"></asp:Label></a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ApplyTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="申请时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="ApplicantName" HeaderText="用户" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                    <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShangPinXiaoShou%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJinE %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong></strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,CaoZuoZhe %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="20" ShowHeader="False"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="SOID" HeaderText="单号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="SOID" DataNavigateUrlFormatString="TTGoodsSaleOrderView.aspx?SOID={0}"
                                                                        DataTextField="SOName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="收付款">
                                                                        <ItemTemplate>
                                                                            <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"SOID") %>&RelatedType=GoodsSO' target="_blank">
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShouFuKuan%>"></asp:Label></a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="SaleTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="销售时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="OperatorName" HeaderText="用户" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                    <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XiaoShouTuiHuo%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td width="35%" align="center"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong></strong></td>
                                                                                <td width="15%" align="center"><strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,CaoZuoZhe %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="False" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                PageSize="20" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ROID" HeaderText="单号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ROID" DataNavigateUrlFormatString="TTGoodsReturnOrderView.aspx?ROID={0}"
                                                                        DataTextField="ReturnName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="收付款">
                                                                        <ItemTemplate>
                                                                            <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"ROID") %>&RelatedType=GoodsRO' target="_blank">
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShouFuKuan%>"></asp:Label></a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ReturnTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="退货时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="OperatorName" HeaderText="用户" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                    <cc2:TabPanel ID="TabPanel6" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LiaoPingShengChan%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,GongXu %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,JiaGongFei %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>&nbsp;</strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShengChanShiJian %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                <td align="center" width="5%"><strong></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid7" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                OnPageIndexChanged="DataGrid7_PageIndexChanged" PageSize="25" ShowHeader="False"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="PDID" HeaderText="PDID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PDName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="RouteName" HeaderText="工序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="收付款">
                                                                        <ItemTemplate>
                                                                            <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"PDID") %>&RelatedType=GoodsPD' target="_blank">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouFuKuan%>"></asp:Label></a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ProductionDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生产时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="打印">
                                                                        <ItemTemplate>
                                                                            <a href='TTGoodsProductionOrderView.aspx?PDID=<%# DataBinder.Eval(Container.DataItem,"PDID") %>' target="_blank">
                                                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                    <cc2:TabPanel ID="TabPanel5" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZiChanCaiGou%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DanHao %>"></asp:Label></strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZongJinE %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaiGouShiJian %>"></asp:Label></strong></td>
                                                                                <td align="center" width="15%"><strong></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                OnPageIndexChanged="DataGrid6_PageIndexChanged" PageSize="20" ShowHeader="False"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="POID" HeaderText="单号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="POID" DataNavigateUrlFormatString="TTAssetPurchaseOrderView.aspx?POID={0}"
                                                                        DataTextField="POName" HeaderText="名称" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PurTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="采购时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="收付款">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                        <ItemTemplate>
                                                                            <a href='TTReceivablesPayableDetail.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"POID") %>&RelatedType=AssetPO' target="_blank">
                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,ShouFuKan%>"></asp:Label></a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>

                                                </cc2:TabContainer>

                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
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


