<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserAttendanceReportNew.aspx.cs" Inherits="TTUserAttendanceReportNew" %>

<%@ Import Namespace="System.Data" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            //            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

        var objCalendar;
        function onCalendarShown(cal, e) {
            // var cal = $find("calendar1");
            //Setting the default mode to month
            cal._switchMode("months", true);
            objCalendar = cal;
            //Iterate every month Item and attach click event to it
            if (cal._monthsBody) {
                var monNum = 1;
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        var objCell = row.cells[j].firstChild;
                        objCell.innerHTML = "<br />" + monNum++;
                        $addHandler(objCell, "click", call);
                    }
                }
            }
        }

        function onCalendarHidden(cal, e) {
            //Iterate every month Item and remove click event from it
            if (cal._monthsBody) {
                for (var i = 0; i < cal._monthsBody.rows.length; i++) {
                    var row = cal._monthsBody.rows[i];
                    for (var j = 0; j < row.cells.length; j++) {
                        $removeHandler(row.cells[j].firstChild, "click", call);
                    }
                }
            }
        }

        function call(eventElement) {
            var target = eventElement.target;
            switch (target.mode) {
                case "month":
                    var cal = objCalendar;
                    cal._visibleDate = target.date;
                    cal.set_selectedDate(target.date);
                    cal._switchMonth(target.date);
                    cal._blur.post(true);
                    cal.raiseDateSelectionChanged();
                    break;
            }
        }
    </script>

    <style type="text/css">
        .tableReport td {
            vertical-align: middle;
            line-height: 20px;
            white-space: nowrap;
            padding: 5px 10px;
        }

        .itemStyle {
            width: 80px;
        }

        .reportTr {
            background-color: #fff;
        }

        #AboveDiv {
            min-width: 1600px;
            width: expression (document.body.clientWidth <= 1600? "1600px" : "auto" ));
        }
    </style>


</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table style="width: 1080px;">
                        <tr>
                            <td style="text-align: right;">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Height="22px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_StartTime">
                                </ajaxToolkit:CalendarExtender>

                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JieSuShiJian%>"></asp:Label>
                            </td>
                            <td style="text-align: left;">

                                <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_EndTime">
                                </ajaxToolkit:CalendarExtender>

                            </td>
                            <td align="center">

                                <asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpuLong" OnClick="BT_ExportToExcel_Click" Text="<%$ Resources:lang,DaoChuDaoExcel%>" />

                            </td>
                            <td align="left"></td>
                            <td>
                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BuMenDaiMa%>"></asp:Label>
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TB_DepartCode" Width="80px" runat="server"></asp:TextBox>
                                <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" Enabled="True"
                                    TargetControlID="TB_DepartCode" PopupControlID="Panel1" CancelControlID="IMBT_Close"
                                    BackgroundCssClass="modalBackground" Y="150">
                                </cc1:ModalPopupExtender>
                                <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                <asp:CheckBox ID="CB_IncludeChildDepartment" Text="包含子部门" runat="server" Checked="true" />
                            </td>
                            <td style="text-align: right;">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuanGongMingChen%>"></asp:Label>
                            </td>
                            <td style="text-align: left;">
                                <asp:TextBox ID="TB_UserName" runat="server"></asp:TextBox>
                            </td>
                            <td align="center">
                                <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                            </td>
                            <td align="center">
                                <a href="#" onclick="preview1()">
                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <table cellpadding="0" cellspacing="0" width="100%">
                        <tr>
                            <td align="center">

                                <!--startprint1-->

                                <table style="width: 100%; table-layout: fixed;">
                                    <tr>
                                        <td style="width: 100%; height: 40px; font-size: xx-large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuanGongKaoQinBaoBiao%>"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%; height: 40px; font-size: large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label4" runat="server" Text=""></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                </table>

                             <%--   <asp:DataGrid ID="ds_Report" runat="server" Width="100%"></asp:DataGrid>--%>

                                <table class="tableReport" border="0" cellpadding="0" cellspacing="0" width="100%" >
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                        </td>
                                        <td>
                                            <table width="100%" border="1" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                    </td>

                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label9" runat="server" Text="部门"></asp:Label></strong>
                                                    </td>

                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label10" runat="server" Text="工号"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="职位"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" runat="server" id="leaveTd">
                                                        <strong>
                                                            <asp:Label ID="Label12" runat="server" Text="请假(小时)"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label19" runat="server" Text="出勤天数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label20" runat="server" Text="应出勤天数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label21" runat="server" Text="迟到次数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label27" runat="server" Text="迟到时长(分钟)"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label28" runat="server" Text="旷工迟到次数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label29" runat="server" Text="早退次数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label30" runat="server" Text="早退时长(分钟)"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label31" runat="server" Text="旷工天数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" rowspan="2">
                                                        <strong>
                                                            <asp:Label ID="Label32" runat="server" Text="夜班天数"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" runat="server" id="overtimeTd">
                                                        <strong>
                                                            <asp:Label ID="Label33" runat="server" Text="加班时长(小时)"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" runat="server" id="kqjgTd">
                                                        <strong>
                                                            <asp:Label ID="Label34" runat="server" Text="考勤结果"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <asp:Repeater runat="server" ID="rpLeaveCol">
                                                        <ItemTemplate>
                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label35" runat="server" Text='<%#Eval("Type") %>'></asp:Label></strong>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>

                                                    <asp:Repeater runat="server" ID="rpOvertimeCol">
                                                        <ItemTemplate>
                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label36" runat="server" Text='<%#Eval("Type") %>'></asp:Label></strong>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:Repeater runat="server" ID="rpDays">
                                                        <ItemTemplate>
                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label runat="server" Text="<%# GetDataItem()%>"></asp:Label></strong>
                                                            </td>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </tr>
                                                <asp:Repeater runat="server" ID="rpReport" OnItemDataBound="rpReport_ItemDataBound">
                                                    <ItemTemplate>
                                                        <tr class="reportTr">
                                                            <td align="center"><%#Eval("姓名") %></td>

                                                            <td align="center"><%#Eval("部门") %></td>
                                                            <td align="center"><%#Eval("工号") %></td>
                                                            <td align="center"><%#Eval("职位") %></td>
                                                            <asp:Repeater runat="server" ID="rpReportLeave">
                                                                <ItemTemplate>
                                                                    <td align="center"><%#DataBinder.Eval((Container.Parent.Parent as RepeaterItem).DataItem,(GetDataItem() as DataRowView).Row["Type"].ToString()) %></td>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                            <td align="center"><%#Eval("出勤天数") %></td>
                                                            <td align="center"><%#Eval("应出勤天数") %></td>
                                                            <td align="center"><%#Eval("迟到次数") %></td>
                                                            <td align="center"><%#Eval("迟到时长") %></td>
                                                            <td align="center"><%#Eval("旷工迟到次数") %></td>
                                                            <td align="center"><%#Eval("早退次数") %></td>
                                                            <td align="center"><%#Eval("早退时长") %></td>
                                                            <td align="center"><%#Eval("旷工天数") %></td>
                                                            <td align="center"><%#Eval("夜班天数") %></td>
                                                            <asp:Repeater runat="server" ID="rpReportOvertime">
                                                                <ItemTemplate>
                                                                    <td align="center"><%#DataBinder.Eval((Container.Parent.Parent as RepeaterItem).DataItem,(GetDataItem() as DataRowView).Row["Type"].ToString()) %></td>
                                                                </ItemTemplate>
                                                            </asp:Repeater>

                                                            <asp:Repeater runat="server" ID="rpReportDays">
                                                                <ItemTemplate>
                                                                    <td align="center">
                                                                        <%#DataBinder.Eval((Container.Parent.Parent as RepeaterItem).DataItem,GetDataItem().ToString()) %>
                                                                    </td>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </tr>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>

                                <!--endprint1-->
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100%; text-align: Center;">
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>

                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
                </Triggers>
            </asp:UpdatePanel>
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
