<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAllMemberWorkLoad.aspx.cs"
    Inherits="TTAllMemberWorkLoad" %>

<%@ Register Assembly="DayPilot.MonthPicker" Namespace="DayPilot.Web.UI" TagPrefix="DayPilot" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <%-- <link type="text/css" href='Themes/themes.css' rel="stylesheet" />
    <link type="text/css" href='Media/layout.css' rel="stylesheet" />
    <link type="text/css" href='Media/elements.css' rel="stylesheet" />
    <script type="text/javascript" src="js/disabled_iuppiter.js"></script>
    <script type="text/javascript" src="js/modal.js"></script>--%>

    <link type="text/css" href='Themes/traditional.css' rel="stylesheet" />
    <link type="text/css" href='Themes/bubble_default.css' rel="stylesheet" />
    <link type="text/css" href='Themes/menu_default.css' rel="stylesheet" />
    <link type="text/css" href='Themes/navigator_blue.css' rel="stylesheet" />
    <link type="text/css" href='Themes/navigator_white.css' rel="stylesheet" />
    <link type="text/css" href='Themes/navigator_green.css' rel="stylesheet" />
    <link type="text/css" href='Themes/calendar_green.css' rel="stylesheet" />
    <link type="text/css" href='Themes/calendar_blue.css' rel="stylesheet" />
    <link type="text/css" href='Themes/calendar_white.css' rel="stylesheet" />
    <link type="text/css" href='Themes/month_green.css' rel="stylesheet" />
    <link type="text/css" href='Themes/month_blue.css' rel="stylesheet" />
    <link type="text/css" href='Themes/month_white.css' rel="stylesheet" />
    <link type="text/css" href='Themes/scheduler_green.css' rel="stylesheet" />
    <link type="text/css" href='Themes/scheduler_blue.css' rel="stylesheet" />
    <link type="text/css" href='Themes/scheduler_white.css' rel="stylesheet" />
    <link type="text/css" href='Media/layout.css' rel="stylesheet" />
    <link type="text/css" href='Media/elements.css' rel="stylesheet" />

    <script type="text/javascript" src="../js/modal.js"></script>

    <style type="text/css">
        #AboveDiv {
            min-width: 1840px;
            width: expression (document.body.clientWidth <= 1840? "1840px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <form id="form1" runat="server">
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
                                                        <strong>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanSuoYouYuanGongGongZuoFuHe%>"></asp:Label></strong>
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
                            <td valign="top">
                                <table width="100%">
                                    <tr>
                                        <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;"
                                            valign="top" align="left">
                                            <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                ShowLines="True" Width="220px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                        </td>
                                        <td width="170px" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                            <table width="170px" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td style="width: 170px; height: 2px; text-align: left">
                                                        <table width="170px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="5%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenChengYuan%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                            Width="170px" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                            ShowHeader="false">

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="部门成员：">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                            Style="text-align: center" />
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                            Style="text-align: center" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        </asp:DataGrid>
                                                    </td>
                                                    <td style="width: 370px; height: 2px; text-align: left">
                                                        <table width="370px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td align="center">

                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                            OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                            AllowCustomPaging="false" AllowPaging="true" PageSize="50" ShowHeader="False"
                                                            Width="370px">
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="部门成员：">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ProjectID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'
                                                                            Style="text-align: center" />
                                                                        <asp:Label ID="BT_ProjectName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ProjectName") %>'
                                                                            Style="text-align: left;" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>

                                        <td valign="top" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <div id="toolbar">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Year" runat="server" Style="font-weight: normal; color: black"
                                                                            OnSelectedIndexChanged="DL_Year_SelectedIndexChanged" AutoPostBack="True">
                                                                        </asp:DropDownList></td>
                                                                    <td>
                                                                        <asp:RadioButtonList ID="RB_HaveWorkload" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RB_HaveWorkload_SelectedIndexChanged">
                                                                            <%--                                                        <asp:ListItem Selected="false" Value="hour" Text="<%$ Resources:lang,hour %>" />--%>
                                                                            <asp:ListItem Selected="false" Value="day" Text="<%$ Resources:lang,Tian %>" />
                                                                            <asp:ListItem Selected="false" Value="week" Text="<%$ Resources:lang,Zhou %>" />
                                                                            <asp:ListItem Selected="True" Value="month" Text="<%$ Resources:lang,Yue %>" />
                                                                            <asp:ListItem Selected="false" Value="year" Text="<%$ Resources:lang,Nian %>" />
                                                                        </asp:RadioButtonList></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                        <div style="width: 100%; overflow: auto;">
                                                            <DayPilot:DayPilotScheduler ID="DayPilotScheduler1" runat="server" CssClassPrefix="scheduler_blue"
                                                                CssOnly="true" ScrollLabelsVisible="false" HeaderFontSize="8pt"
                                                                DataStartField="start" DataEndField="end" DataTextField="name" DataValueField="id"
                                                                DataResourceField="column" DataTagFields="id, name" HeaderHeight="20" EventHeight="40"
                                                                EventFontSize="11px" Width="99%" RowHeaderWidth="120" CellDuration="1440" CellGroupBy="Month">
                                                            </DayPilot:DayPilotScheduler>

                                                            <%-- EventClickHandling="JavaScript" EventClickJavaScript="alert(e.text() + '('+ e.start() +'--' + e.end() + ')');"--%>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td>
                                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="负荷列表">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,FuHeLieBiao %>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <div style="width: 2500px; word-break: break-all; word-wrap: break-word;">
                                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="50%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZuBie %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td>

                                                                                                <asp:TextBox ID="TB_BelongDepartName" runat="server" Width="125px"></asp:TextBox>

                                                                                                <cc1:ModalPopupExtender ID="TB_BelongDepartName_ModalPopupExtender" runat="server"
                                                                                                    Enabled="True" TargetControlID="TB_BelongDepartName" PopupControlID="Panel1"
                                                                                                    CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                                                </cc1:ModalPopupExtender>

                                                                                                <asp:Label ID="LB_BelongDepartCode" runat="server" Visible="False"></asp:Label>
                                                                                            </td>

                                                                                            <td>
                                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiangMuMingChen %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>

                                                                                                <asp:TextBox ID="TB_ProjectName" runat="server"></asp:TextBox>

                                                                                                <asp:Button ID="BT_SelectProject" runat="server" CssClass="inpu" Visible="False" Text="<%$ Resources:lang,XuanZhe %>" />

                                                                                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                                                    Enabled="True" TargetControlID="BT_SelectProject" PopupControlID="Panel2"
                                                                                                    CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150" DynamicServicePath="">
                                                                                                </cc1:ModalPopupExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,RenWuMingCheng %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TB_TaskName" runat="server"></asp:TextBox>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ZhiXingRen %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TB_TaskOperator" runat="server"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,RenWuKaiShiShiJian %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox>

                                                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,RenWuJieShuShiJian %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox>

                                                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                    runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                                                </ajaxToolkit:CalendarExtender>
                                                                                            </td>

                                                                                            <td>
                                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                                ：
                                                                                            </td>
                                                                                            <td align="left">

                                                                                                <asp:DropDownList ID="DL_Status" DataTextField="HomeName" DataValueField="Status" runat="server"></asp:DropDownList>
                                                                                            </td>
                                                                                            <td>&nbsp;</td>
                                                                                            <td>&nbsp;</td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td colspan="5" align="right">

                                                                                                <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Font-Size="10pt" OnClick="BT_Find_Click"
                                                                                                    Text="<%$ Resources:lang,ChaXun %>" />

                                                                                                <asp:Button runat="server" Text="<%$ Resources:lang,DaoChu %>" CssClass="inpu" ID="BT_ExportClick" OnClientClick="document.getElementById('BT_Export').click();"></asp:Button>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:Label ID="LB_ResultNumber" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td>&nbsp;</td>
                                                                                            <td>&nbsp;</td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <br />
                                                                                    <br />
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
                                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZuBieDaiMa %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZuBieMingChen %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangMuXuHao %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangMuDaiMa %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangMuMingChen %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>

                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHua %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JHYJKSSJ %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JHYJJSSJ %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,RenWu %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,RWYJKSSJ %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShiJiShouLiShiJian %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,RWYJJSSJ %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZuiXinCaoZuoShiJian %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,RenWuZhuangTai %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="20%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RenWuRiZhi %>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataKeyField="ProjectID"
                                                                                        ShowHeader="False" ForeColor="#333333" Width="100%" BorderWidth="0px">
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <HeaderTemplate>
                                                                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                                                <tr>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BuMenDaiMa%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiangMuXuHao%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiangMuBianHao%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangMuMingChen%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; height: 22px; text-align: center" class="tdTitleLeft">
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiHuaQiDongRiQi%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiHuaJieShuRiQi%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,RenWuKaiShiShiJian%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShouCiShouLiShiJian%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,RenWuJieShuShiJian%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZuiHouChuLiShiJian%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 20%; height: 22px; text-align: center" class="tdTitleRight">
                                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,RenWuRiZhi%>"></asp:Label>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </HeaderTemplate>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemTemplate>
                                                                                            <table cellpadding="4" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"DepartCode") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: left" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"DepartName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectCode") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: left" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: left" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"PlanName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"PlanBeginTime","{0:yyyy/MM/dd}") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"PlanEndTime","{0:yyyy/MM/dd}") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: left" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskBeginDate","{0:yyyy/MM/dd}") %>
                                                                                                    </td>
                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskFirstOperateTime","{0:yyyy/MM/dd}") %>
                                                                                                    </td>

                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskEndDate","{0:yyyy/MM/dd}") %>
                                                                                                    </td>

                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskLastestOperateTime") %>
                                                                                                    </td>

                                                                                                    <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"Status") %>
                                                                                                    </td>

                                                                                                    <td style="width: 20%; text-align: left" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"TaskLog") %>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </ItemTemplate>

                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                    </asp:DataList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </div>
                                                                </ContentTemplate>
                                                            </cc1:TabPanel>
                                                            <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="计划完成率">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,JiHuaWanChengLu %>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                                                                        <tr>
                                                                            <td valign="top" align="center">
                                                                                <table>

                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <asp:CheckBox ID="CB_Scope" Checked="true" runat="server" Text="0% and 100%" />
                                                                                            <DayPilot:MonthPicker ID="MonthPicker1" runat="server" YearEnd="2099" />
                                                                                            <asp:Button ID="BT_FindPlanRate" runat="server" Text="<%$ Resources:lang,chaxun%>" OnClick="BT_FindPlanRate_Click" />
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <!--startprint1-->
                                                                                <table style="width: 800px;">
                                                                                    <tr>
                                                                                        <td style="height: 80px; font-size: xx-large; text-align: center; line-height: 110%;">
                                                                                            <br />
                                                                                            <strong>

                                                                                                <asp:Label ID="LB_ProjectName" runat="server"></asp:Label>
                                                                                            </strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="height: 80px; font-size: xx-large; text-align: center; line-height: 110%;">

                                                                                            <br />

                                                                                            <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td align="center">
                                                                                            <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                                            <%--<asp:Chart ID="Chart1" Width="980px" runat="server">
                                                                                                    <Series>
                                                                                                        <asp:Series Name="Series1" ChartType="Pie" ChartArea="ChartArea1" Legend="Legend1"></asp:Series>
                                                                                                    </Series>
                                                                                                    <ChartAreas>
                                                                                                        <asp:ChartArea Name="ChartArea1" AlignmentOrientation="Horizontal"></asp:ChartArea>
                                                                                                    </ChartAreas>
                                                                                                    <Legends>
                                                                                                        <asp:Legend Name="Legend1">
                                                                                                            <CellColumns>
                                                                                                                <asp:LegendCellColumn Name="Column2">
                                                                                                                    <Margins Left="15" Right="15" />
                                                                                                                </asp:LegendCellColumn>
                                                                                                                <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column3">
                                                                                                                    <Margins Left="15" Right="15" />
                                                                                                                </asp:LegendCellColumn>
                                                                                                            </CellColumns>
                                                                                                        </asp:Legend>
                                                                                                    </Legends>
                                                                                                    <Titles>
                                                                                                        <asp:Title Name="标题" Alignment="TopCenter" IsDockedInsideChartArea="False" DockedToChartArea="ChartArea1"></asp:Title>
                                                                                                    </Titles>
                                                                                                </asp:Chart>--%>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                                <!--endprint1-->
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ContentTemplate>
                                                            </cc1:TabPanel>
                                                        </cc1:TabContainer>
                                                    </td>
                                                </tr>


                                            </table>
                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td>
                                <asp:Button runat="server" ID="BT_Export" OnClick="BT_Export_Click" Style="display: none;"></asp:Button>
                                <asp:Label ID="LB_DepartCode" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_DepartName" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_UnderlingCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UnderLingName" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_OperatorCode" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_OperatorName" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>

                                <asp:Label ID="LB_SQL1" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_SQL2" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_SQL3" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                    </table>
                </div>

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
                    <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                        <table>
                            <tr>
                                <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
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
                </asp:Panel>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Export" />
            </Triggers>
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
