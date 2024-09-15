<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppMonthSchedule.aspx.cs" Inherits="TTAppMonthSchedule" Culture="zh-CN" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/modal.js"></script>

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
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
             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/
        });

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

                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">

                                        <a href="TakeTopAPPMain.html" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td align="left" style="padding: 2px 2px 2px 2px;">
                            <table style="width: 100%">
                                <tr>
                                    <td valign="top" style="width: 100%; overflow-x: auto;">
                                        <DayPilot:DayPilotMonth
                                            ID="DayPilotMonth1"
                                            runat="server"
                                            DataEndField="end"
                                            DataStartField="start"
                                            DataTextField="name"
                                            DataIdField="id"
                                            DataTagFields="name, id"
                                            AllowMultiSelect="false"
                                            ContextMenuID="DayPilotMenu1"
                                            OnEventMenuClick="DayPilotCalendar1_EventMenuClick"
                                            ClientObjectName="dpc1"
                                            EventMoveHandling="CallBack"
                                            OnEventMove="DayPilotMonth1_EventMove"
                                            EventClickHandling="JavaScript"
                                            EventClickJavaScript="edit(e);"
                                            Width="100%"
                                            EventResizeHandling="CallBack"
                                            OnEventResize="DayPilotMonth1_EventResize"
                                            OnTimeRangeSelected="DayPilotMonth1_TimeRangeSelected"
                                            OnBeforeEventRender="DayPilotMonth1_BeforeEventRender"
                                            EventDeleteJavaScript="if (confirm('Do you really want to delete ' + e.text() + ' ?')) dpc1.eventDeleteCallBack(e);"
                                            BubbleID="DayPilotBubble1"
                                            ShowToolTip="false"
                                            EventStartTime="false"
                                            EventEndTime="false"
                                            OnCommand="DayPilotMonth1_Command"
                                            OnBeforeCellRender="DayPilotMonth1_BeforeCellRender"
                                            OnEventClick="DayPilotMonth1_EventClick"
                                            ContextMenuSelectionID="DayPilotMenuSelection"
                                            OnBeforeHeaderRender="DayPilotMonth1_BeforeHeaderRender"
                                            OnTimeRangeMenuClick="DayPilotMonth1_TimeRangeMenuClick"
                                            TimeRangeSelectedHandling="JavaScript"
                                            TimeRangeSelectedJavaScript="create(start, end)"></DayPilot:DayPilotMonth>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" style="background-color:ButtonFace;">
                                     
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,chaxun%>" ></asp:Label>
                                       
                                    </td>
                                </tr>
                                <tr>
                                   <td valign="top" align="center" style="padding-top:10px;">
                                     
                                        <DayPilot:DayPilotNavigator ID="DayPilotNavigator1" runat="server"
                                            BoundDayPilotID="DayPilotMonth1"
                                            SelectMode="Month"
                                            ShowMonths="3"
                                            SkipMonths="3"
                                            DataStartField="start"
                                            DataEndField="end"
                                            VisibleRangeChangedHandling="CallBack"
                                            OnVisibleRangeChanged="DayPilotNavigator1_VisibleRangeChanged"></DayPilot:DayPilotNavigator>
                                        <br />
                                        <br />
                                        <div style="height: 20px"></div>
                                    </td>
                                </tr>
                            </table>

                            <DayPilot:DayPilotMenu ID="DayPilotMenu1" runat="server">
                                <DayPilot:MenuItem Text="<%$ Resources:lang,bianji%>" Action="JavaScript" JavaScript="edit(e);">
                                </DayPilot:MenuItem>
                                <%--    <DayPilot:MenuItem Text="Send" Action="JavaScript" JavaScript="alert('Sending event (id ' + e.value() + ')');">
                                    </DayPilot:MenuItem>
                                    <DayPilot:MenuItem Text="-" Action="NavigateUrl"></DayPilot:MenuItem>--%>
                                <DayPilot:MenuItem Text="<%$ Resources:lang,shanchu%>" Action="Callback" Command="Delete"></DayPilot:MenuItem>
                                <%--  <DayPilot:MenuItem Action="PostBack" Command="Delete" Text="Delete (PostBack)" />
                                    <DayPilot:MenuItem Action="NavigateUrl" NavigateUrl="javascript:alert('Going somewhere else (id {0})');"
                                        Text="NavigateUrl test" />--%>
                            </DayPilot:DayPilotMenu>

                            <DayPilot:DayPilotMenu ID="DayPilotMenu2" runat="server" ClientObjectName="menu2">
                                <DayPilot:MenuItem Text="Open" Action="JavaScript" JavaScript="alert('Opening event (id ' + e.value() + ')');">
                                </DayPilot:MenuItem>
                                <DayPilot:MenuItem Text="Send" Action="JavaScript" JavaScript="alert('Sending event (id ' + e.value() + ')');">
                                </DayPilot:MenuItem>
                                <DayPilot:MenuItem Text="-" Action="NavigateUrl"></DayPilot:MenuItem>
                                <DayPilot:MenuItem Text="Delete (CallBack)" Action="Callback" Command="Delete"></DayPilot:MenuItem>
                                <DayPilot:MenuItem Action="PostBack" Command="Delete" Text="Delete (PostBack)" />
                                <DayPilot:MenuItem Action="NavigateUrl" NavigateUrl="javascript:alert('Going somewhere else (id {0})');"
                                    Text="NavigateUrl test" />
                            </DayPilot:DayPilotMenu>


                            <DayPilot:DayPilotMenu ID="DayPilotMenuSelection" runat="server" ClientObjectName="dpms">
                                <%--   <DayPilot:MenuItem Action="JavaScript" JavaScript="dpm.timeRangeSelectedCallBack(e.start, e.end);"
                                        Text="<%$ Resources:lang,new%>"/>--%>
                                <%--    <DayPilot:MenuItem Action="PostBack" Command="Insert" Text="Create new event (PostBack)" />
                                    <DayPilot:MenuItem Action="CallBack" Command="Insert" Text="Create new event (CallBack)" />
                                    <DayPilot:MenuItem Text="-"></DayPilot:MenuItem>
                                    <DayPilot:MenuItem Action="JavaScript" JavaScript="alert('Start: ' + e.start.toString() + '\nEnd: ' + e.end.toString())"
                                        Text="Show selection details" />--%>
                            </DayPilot:DayPilotMenu>

                            <DayPilot:DayPilotBubble
                                ID="DayPilotBubble1"
                                runat="server"
                                OnRenderContent="DayPilotBubble1_RenderContent"
                                ClientObjectName="bubble"
                                Position="EventTop">
                            </DayPilot:DayPilotBubble>
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

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
