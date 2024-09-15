<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMySchedule.aspx.cs" Inherits="TTMySchedule" Culture="zh-CN" %>

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" Namespace="System.Web.UI" TagPrefix="asp" %>

<%----%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/modal.js"></script>

    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }

        #EventDetail_name_ctl02_ctl00 {
            max-height: 30px;
            width: expression (document.body.clientheight >= 30? "30px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

    </script>

    <script type="text/javascript">

        // required for copy'n'paste functionality
        var copied = null;

        /* Event editing helpers - modal dialog */
        function dialog() {
            var modal = new DayPilot.Modal();
            modal.top = 60;
            modal.width = 300;
            modal.opacity = 70;
            modal.border = "10px solid #d0d0d0";
            modal.closed = function () {
                if (this.result == "OK") {
                    dpc1.commandCallBack('refresh');
                }
                dpc1.clearSelection();
            };

            modal.height = 250;
            modal.zIndex = 100;
            return modal;
        }

        function create(start, end, resource) {
            var modal = dialog();
            modal.showUrl("TTMyScheduleNew.aspx?start=" + start.toStringSortable() + "&end=" + end.toStringSortable() + "&r=" + resource);
        }

        function edit(e) {
            var modal = dialog();
            modal.showUrl("TTMyScheduleEdit.aspx?id=" + e.value());
        }

        function afterRender(isCallBack) {
            dpn.visibleRangeChangedCallBack(); // update free/busy after adding/changing/deleting events in the calendar
        }

    </script>


</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                    <td align="left" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WoDeRiChengAnPai%>"></asp:Label><asp:Label ID="LB_Title" runat="server"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="30%" align="right" style="padding-right: 10px;">
                                            <asp:HyperLink ID="HL_MyMonthSchedule" Font-Underline="false" runat="server" NavigateUrl="TTMyMonthSchedule.aspx" Text="<%$ Resources:lang,MonthSchedule%>"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <table style="width: 100%;">
                                    <tr>
                                        <td valign="top" style="width: 250px;">
                                            <DayPilot:DayPilotNavigator ID="DayPilotNavigator1" runat="server"
                                                ClientObjectName="dpn"
                                                BoundDayPilotClientObjectName="dpc1"
                                                SelectMode="Week"
                                                ShowMonths="3"
                                                SkipMonths="3"
                                                DataStartField="start"
                                                DataEndField="end"
                                                VisibleRangeChangedHandling="CallBack"
                                                OnVisibleRangeChanged="DayPilotNavigator1_VisibleRangeChanged"
                                                ShowWeekNumbers="true"
                                                OnTimeRangeSelected="DayPilotNavigator1_TimeRangeSelected"
                                                OnBeforeCellRender="DayPilotNavigator1_BeforeCellRender"
                                                RowsPerMonth="Auto"></DayPilot:DayPilotNavigator>
                                        </td>
                                        <td valign="top">
                                            <DayPilot:DayPilotCalendar ID="DayPilotCalendar1" runat="server"
                                                DataStartField="start" DataEndField="end" DataTextField="name" DataIdField="id"
                                                DataServerTagFields="color"
                                                DataAllDayField="allday"
                                                OnEventMove="DayPilotCalendar1_EventMove"
                                                ViewType="Week"
                                                OnTimeRangeSelected="DayPilotCalendar1_TimeRangeSelected"
                                                TimeRangeSelectedHandling="JavaScript"
                                                TimeRangeSelectedJavaScript="create(start, end)"
                                                EventMoveHandling="CallBack"
                                                ContextMenuID="DayPilotMenu1"
                                                OnEventMenuClick="DayPilotCalendar1_EventMenuClick"
                                                EventResizeHandling="CallBack"
                                                OnEventResize="DayPilotCalendar1_EventResize"
                                                EventClickHandling="JavaScript"
                                                EventClickJavaScript="edit(e);"
                                                EventSelectHandling="JavaScript"
                                                xHeightSpec="BusinessHoursNoScroll"
                                                OnEventClick="DayPilotCalendar1_EventClick"
                                                ClientObjectName="dpc1"
                                                EventEditHandling="CallBack"
                                                OnEventEdit="DayPilotCalendar1_EventEdit"
                                                OnBeforeEventRender="DayPilotCalendar1_BeforeEventRender"
                                                EventDeleteHandling="JavaScript"
                                                OnEventDelete="DayPilotCalendar1_EventDelete"
                                                EventDeleteJavaScript="if (confirm('Do you really want to delete ' + e.text() + ' ?')) dpc1.eventDeleteCallBack(e);"
                                                OnEventSelect="DayPilotCalendar1_EventSelect"
                                                EventSelectColor="red"
                                                ShowAllDayEvents="True"
                                                OnBeforeHeaderRender="DayPilotCalendar1_BeforeHeaderRender"
                                                xShowToolTip="true"
                                                EventDoubleClickHandling="PostBack"
                                                OnEventDoubleClick="DayPilotCalendar1_OnEventDoubleClick"
                                                EventDoubleClickJavaScript="alert(e.value());"
                                                xEventHoverHandling="Disabled"
                                                TimeFormat="Auto"
                                                ContextMenuSelectionID="DayPilotMenuSelection"
                                                OnTimeRangeMenuClick="DayPilotCalendar1_TimeRangeMenuClick"
                                                OnCommand="DayPilotCalendar1_Command"
                                                OnBeforeCellRender="DayPilotCalendar1_BeforeCellRender"
                                                EventArrangement="Full"
                                                BubbleID="DayPilotBubble1"
                                                ColumnBubbleID="DayPilotBubble1"
                                                OnBeforeTimeHeaderRender="DayPilotCalendar1_BeforeTimeHeaderRender"
                                                AfterRenderJavaScript="afterRender(isCallBack);"
                                                HourWidth="60"
                                                BusinessBeginsHour="7"
                                                BusinessEndsHour="23" />

                                        </td>
                                    </tr>
                                </table>

                                <DayPilot:DayPilotMenu ID="DayPilotMenu1" runat="server" ShowMenuTitle="true">
                                    <DayPilot:MenuItem Text="<%$ Resources:lang,bianji%>" Action="JavaScript" JavaScript="edit(e);"></DayPilot:MenuItem>
                                    <%--  <DayPilot:MenuItem Text="Send" Action="JavaScript" JavaScript="alert('Sending event (id ' + e.value() +')');"></DayPilot:MenuItem>--%>
                                    <DayPilot:MenuItem Text="-"></DayPilot:MenuItem>
                                    <DayPilot:MenuItem Text="<%$ Resources:lang,fuzhi%>" Action="JavaScript" JavaScript="copied = e.value();"></DayPilot:MenuItem>
                                    <%--    <DayPilot:MenuItem Text="-" Action="NavigateUrl"></DayPilot:MenuItem>--%>
                                    <DayPilot:MenuItem Text="<%$ Resources:lang,shanchu%>" Action="Callback" Command="Delete" />
                                    <%--   <DayPilot:MenuItem Action="PostBack" Command="Delete" Text="Delete (PostBack)" Image='../Media/linked/menu_delete.png' />--%>
                                    <%--    <DayPilot:MenuItem Action="NavigateUrl" NavigateUrl="javascript:alert('Going somewhere else (id {0})');" Text="NavigateUrl test" />
                                    <DayPilot:MenuItem Action="NavigateUrl" NavigateUrl="http://www.google.com/" NavigateUrlTarget="_blank" Text="Google in New Window"></DayPilot:MenuItem>
                                    <DayPilot:MenuItem Text="Sub menu">
                                        <DayPilot:MenuItem Action="JavaScript" JavaScript="alert('test');" Text="Test" />
                                    </DayPilot:MenuItem>--%>
                                </DayPilot:DayPilotMenu>

                                <DayPilot:DayPilotMenu ID="DayPilotMenuSelection" runat="server" ClientObjectName="cmSelection">
                                    <%--  <DayPilot:MenuItem Action="JavaScript" JavaScript="dpc1.timeRangeSelectedCallBack(e.start, e.end, e.resource); dpc1.clearSelection();"
                                        Text="Create new event (JavaScript)" />
                                    <DayPilot:MenuItem Action="PostBack" Command="Insert" Text="Create new event (PostBack)" />
                                    <DayPilot:MenuItem Action="CallBack" Command="Insert" Text="Create new event (CallBack)" />--%>
                                    <%--    <DayPilot:MenuItem Text="-"></DayPilot:MenuItem>--%>
                                    <DayPilot:MenuItem Action="JavaScript" JavaScript="if (!copied) { alert('You need to copy an event first.'); return; } dpc1.commandCallBack('paste', {id:copied, start: e.start});" Text="<%$ Resources:lang,NianTie%>" />
                                    <%--  <DayPilot:MenuItem Text="-"></DayPilot:MenuItem>
                                    <DayPilot:MenuItem Action="JavaScript" JavaScript="alert('Start: ' + e.start.toString() + '\nEnd: ' + e.end.toString() + '\nResource id: ' + e.resource);" Text="Show selection details" />
                                    <DayPilot:MenuItem Action="JavaScript" JavaScript="dpc1.clearSelection();" Text="Clean selection" />--%>
                                </DayPilot:DayPilotMenu>

                                <DayPilot:DayPilotBubble
                                    ID="DayPilotBubble1"
                                    runat="server"
                                    OnRenderContent="DayPilotBubble1_RenderContent"
                                    ClientObjectName="bubble"
                                    Position="EventTop"
                                    Animation="Fast">
                                </DayPilot:DayPilotBubble>
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                    <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                        <table>
                            <tr>
                                <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True"
                                        ShowLines="True" Width="220px">
                                        <SelectedNodeStyle ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                    <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
