<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPKPIManagement.aspx.cs" Inherits="TTAPPKPIManagement" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

            SetDataGridTrClickLink();


        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {

            setTrClickLink("DataGrid3");
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
                    <table cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <%-- <tr>
                                        <td class="tdFullBorder" style="padding-right: 5px; padding-top: 5px; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg');"
                                            align="right">
                                            <asp:Button ID="BT_AllKPI" runat="server" CssClass="inpuLong" OnClick="BT_AllKPI_Click"
                                                Text="<%$ Resources:lang,SuoYouJiXiao%>" />
                                        </td>
                                    </tr>--%>
                                    <%-- <tr>
                                        <td style="width: 100%; padding: 5px 5px 5px 5px;" align="left">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuanJiXiao%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; height: 1px">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiWoShenHeDeJiXiao %>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="5%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="25%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiXiaoMingCheng %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GuiShu %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShangJiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZongPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
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
                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                        PageSize="6" ShowHeader="False" Width="100%">

                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="KPICheckID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="KPICheckID" DataNavigateUrlFormatString="TTKPILeaderReview.aspx?KPICheckID={0}"
                                                                                DataTextField="KPICheckName" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                DataTextField="UserName" HeaderText="受考人" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalSelfPoint" HeaderText="自评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalLeaderPoint" HeaderText="上级评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalThirdPartPoint" HeaderText="第三方评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalPoint" HeaderText="总评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid><asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WoShenHeGuoDeJiXiao %>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="5%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="25%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiXiaoMingCheng %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuiShu %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShangJiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZongPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
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
                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid5_PageIndexChanged"
                                                                        PageSize="6" ShowHeader="False" Width="100%">

                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="KPICheckID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="KPICheckID" DataNavigateUrlFormatString="TTKPILeaderReview.aspx?KPICheckID={0}"
                                                                                DataTextField="KPICheckName" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                DataTextField="UserName" HeaderText="受考人" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalSelfPoint" HeaderText="自评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalLeaderPoint" HeaderText="上级评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalThirdPartPoint" HeaderText="第三方评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalPoint" HeaderText="总评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid><asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,QiTaChengYuanJiXiao %>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; height: 1px">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DaiWoShenHeDeJiXiao %>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="5%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="25%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiXiaoMingCheng %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,GuiShu %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShangJiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZongPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged"
                                                                        PageSize="6" ShowHeader="False" Width="100%">

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="KPICheckID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="KPICheckID" DataNavigateUrlFormatString="TTKPIThirdPartReview.aspx?KPICheckID={0}"
                                                                                DataTextField="KPICheckName" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                DataTextField="UserName" HeaderText="受考人" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalSelfPoint" HeaderText="自评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalLeaderPoint" HeaderText="上级评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalThirdPartPoint" HeaderText="第三方评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalPoint" HeaderText="总评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    </asp:DataGrid><asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,WoShenHeGuoDeJiXiao %>"></asp:Label>：
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="5%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="25%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,JiXiaoMingCheng %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GuiShu %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="9%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShangJiPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZongPingFen %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td align="center" width="8%">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                        PageSize="6" ShowHeader="False" Width="100%">

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="KPICheckID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="KPICheckID" DataNavigateUrlFormatString="TTKPIThirdPartReview.aspx?KPICheckID={0}"
                                                                                DataTextField="KPICheckName" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                DataTextField="UserName" HeaderText="受考人" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalSelfPoint" HeaderText="自评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalLeaderPoint" HeaderText="上级评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalThirdPartPoint" HeaderText="第三方评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TotalPoint" HeaderText="总评分">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    </asp:DataGrid><asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; padding-left: 10px;">&nbsp;
                                        </td>
                                    </tr>--%>
                                    <tr>
                                        <td style="text-align: left; padding-left: 10px;">
                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,WoDeJiXiao %>"></asp:Label>：
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; padding: 5px 5px 5px 8px;">
                                            <%-- <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                width="100%">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="15%">
                                                                    <strong>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" >
                                                                    <strong>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JiXiaoMingCheng %>"></asp:Label></strong>
                                                                </td>
                                                          
                                                                <td align="center" width="15%">
                                                                    <strong>
                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                </td>
                                                          
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>--%>
                                            <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                PageSize="12" ShowHeader="False" Width="100%">
                                                <Columns>

                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>


                                                            <div class="npb npbs">
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href="TTAPPMyKPICheckSet.aspx?KPICheckID=<%# DataBinder.Eval(Container.DataItem,"KPICheckID") %>"> <%# DataBinder.Eval(Container.DataItem,"KPICheckID") %> <%# DataBinder.Eval(Container.DataItem,"KPICheckName") %></a></h4>
                                                                    <h5>  <%# DataBinder.Eval(Container.DataItem,"creatorname") %>    <sub></sub></h5>
                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"starttime") %>---<%# DataBinder.Eval(Container.DataItem,"endtime") %></h6>
                                                                    <label><%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %></label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>

                                                    </asp:TemplateColumn>


                                                    <%--                                                    <asp:BoundColumn DataField="KPICheckID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="KPICheckID" DataNavigateUrlFormatString="TTAPPMyKPICheckSet.aspx?KPICheckID={0}"
                                                        DataTextField="KPICheckName" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left"  />
                                                    </asp:HyperLinkColumn>
                                               
                                                    <asp:TemplateColumn HeaderText="状态">
                                                        <ItemTemplate>
                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                    </asp:TemplateColumn>--%>
                                                </Columns>
                                                <EditItemStyle BackColor="#2461BF" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            </asp:DataGrid><asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
