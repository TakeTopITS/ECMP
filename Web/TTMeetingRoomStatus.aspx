<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMeetingRoomStatus.aspx.cs"
    Inherits="TTMeetingRoomStatus" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI.BusyBox" TagPrefix="nickleebusybox" %>
<%@ Register Assembly="NickLee.Web.UI.VB" Namespace="NickLee.Web.UI.VB" TagPrefix="NickLeeVB" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会议室状态图</title>
    <link href="css/Schedule.css" rel="stylesheet" type="text/css" />
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="AboveDiv">
            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29"><%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanHuiYiShi%>"></asp:Label>
                                            </td>
                                            <td width="5"><%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="padding: 5px 5px 5px 5px">
                        <br />
                        <NickLeeVB:ScheduleGeneral ID="Schedule1" runat="server" GridLines="Both" SeparateDateHeader="True"
                            DataRangeStartField="BeginTime" DataRangeEndField="EndTime" TitleField="Address"
                            StartOfTimeScale="8:00" EndOfTimeScale="18:00" TimeScaleInterval="60" Layout="Horizontal"
                            CellSpacing="0" ShowValueMarks="True" Style="width: 100%;">
                            <TitleTemplate>
                                <%# Container.DataItem %>
                            </TitleTemplate>
                            <AlternatingItemStyle CssClass="normal2" />
                            <RangeHeaderTemplate>
                                <%#Convert.ToDateTime(Container.DataItem).ToShortTimeString()%>
                            </RangeHeaderTemplate>
                            <DateHeaderTemplate>
                                <%# Convert.ToDateTime(Container.DataItem).ToShortDateString() %>
                            </DateHeaderTemplate>
                            <TitleStyle CssClass="heading" BackColor="#507CD1" ForeColor="White" />
                            <ItemStyle CssClass="normal" />
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                    CommandName="Edit" Text='<%# DataBinder.Eval(Container.DataItem,"Name") %>'>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <RangeHeaderStyle CssClass="heading" BackColor="#507CD1" ForeColor="White" />
                            <BackgroundStyle CssClass="empty" />
                        </NickLeeVB:ScheduleGeneral>
                        <br />
                        <br />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
