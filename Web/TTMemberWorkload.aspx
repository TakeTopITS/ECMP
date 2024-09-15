<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMemberWorkload.aspx.cs"
    Inherits="TTMemberWorkload" Culture="zh-CN" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

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
            min-width: 1240px;
            width: expression (document.body.clientWidth <= 1240? "1240px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <form id="form1" runat="server">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanChengYuanGongZuoFuHe%>"></asp:Label></strong>
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
                                <td valign="top" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <div id="toolbar">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:DropDownList ID="DL_Year" runat="server" Style="font-weight: normal; color: black"
                                                        OnSelectedIndexChanged="DL_Year_SelectedIndexChanged" AutoPostBack="True">
                                                    </asp:DropDownList></td>
                                                <td>
                                                    <asp:RadioButtonList ID="RB_HaveWorkload" runat="server" RepeatDirection="Horizontal" AutoPostBack="true" OnSelectedIndexChanged="RB_HaveWorkload_SelectedIndexChanged">
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
                                    </div>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_DepartName" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_SQL1" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_SQL2" runat="server" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>

