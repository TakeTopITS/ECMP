<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProRelatedPlanView.aspx.cs" Inherits="TTProRelatedPlanView" %>

<%@ Register Assembly="DayPilot.MonthPicker" Namespace="DayPilot.Web.UI" TagPrefix="DayPilot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



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
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right">
                                            <a href="#" onclick="preview1()">
                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" align="center">
                                <table>

                                    <tr>
                                        <td align="left">
                                            <asp:CheckBox ID="CB_Scope" Checked="true" runat="server" Text="0% and 100%" />
                                            <DayPilot:MonthPicker ID="MonthPicker1" runat="server" YearEnd="2099" />
                                            <asp:Button ID="BT_Find" runat="server" Text="<%$ Resources:lang,chaxun%>" OnClick="BT_Find_Click" />
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

                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>

                    </table>

                    <!--endprint1-->
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
