<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectSummaryPerformance.aspx.cs" Inherits="TTRCJProjectSummaryPerformance" %>
     

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目收支绩效汇总详细信息</title>
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

            aHandler();

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
                                                <table width="220" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">项目收支绩效汇总列表信息
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">返回</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td height="31">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" class="titlezi">
                                                            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                                                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                <Columns>
                                                                    <asp:ButtonField CommandName="RefreshButton" Text="刷新" />
                                                                    <asp:BoundField DataField="ProjectID" HeaderText="项目号" />
                                                                    <asp:BoundField DataField="ProjectYear" HeaderText="年份" />
                                                                    <asp:BoundField DataField="ProjectMonth" HeaderText="月份" />
                                                                    <asp:BoundField DataField="ProjectSTCV" HeaderText="合同额(STCV)" />
                                                                    <asp:BoundField DataField="ProjectBCWS" HeaderText="计划总额(BCWS)" />
                                                                    <asp:BoundField DataField="ProjectBCWP" HeaderText="挣值总额(BCWP)" />
                                                                    <asp:BoundField DataField="ProjectBCRWP" HeaderText="应收总额(BCRWP)" />
                                                                    <asp:BoundField DataField="ProjectPBCWP" HeaderText="实收总额(PBCWP)" />
                                                                    <asp:BoundField DataField="ProjectEAV" HeaderText="结算差异(EAV)" />
                                                                    <asp:BoundField DataField="ProjectRV" HeaderText="回款偏差(RV)" />
                                                                    <asp:BoundField DataField="ProjectACWP" HeaderText="实际成本(ACWP)" />
                                                                    <asp:BoundField DataField="ProjectAI" HeaderText="结算绩效(AI)" DataFormatString="{0:p}" />
                                                                    <asp:BoundField DataField="ProjectBVI" HeaderText="账单绩效(BVI)" DataFormatString="{0:p}" />
                                                                    <asp:BoundField DataField="ProjectRVI" HeaderText="回款绩效(RVI)" DataFormatString="{0:p}" />
                                                                    <asp:BoundField DataField="ProjectPL" HeaderText="工程利润(P&amp;L)" />
                                                                    <asp:BoundField DataField="ProjectRP" HeaderText="成本绩效（RP）" DataFormatString="{0:p}" />
                                                                    <asp:BoundField DataField="ProjectTotalSpending" HeaderText="总支出" />
                                                                    <asp:BoundField DataField="ProjectTotalIncome" HeaderText="总收入" />
                                                                    <asp:BoundField DataField="ProjectIncomeDifference" HeaderText="收支总差" />
                                                                    <asp:BoundField DataField="ProjectContractReceived" HeaderText="合同已收" />
                                                                    <asp:BoundField DataField="ProjectCPB" HeaderText="合同偏差(CPB)" />
                                                                    <asp:BoundField DataField="ThisMonthFinished" HeaderText="当月完成率" />
                                                                    <asp:BoundField DataField="TotalMonthFinished" HeaderText="最终完成率" />
                                                                </Columns>
                                                                <EditRowStyle BackColor="#999999" />
                                                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                <PagerSettings Mode="NextPreviousFirstLast" />
                                                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                                <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                                <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                                <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                            </asp:GridView>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" class="titlezi">
                                                            <asp:Label ID="lb_showMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <table id="Table1" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="220" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi"><u><span style="font-size:10.5pt;mso-bidi-font-size:
11.0pt;font-family:宋体;mso-ascii-font-family:Calibri;mso-ascii-theme-font:minor-latin;
mso-fareast-theme-font:minor-fareast;mso-hansi-font-family:Calibri;mso-hansi-theme-font:
minor-latin;mso-bidi-font-family:&quot;Times New Roman&quot;;mso-bidi-theme-font:minor-bidi;
mso-ansi-language:EN-US;mso-fareast-language:ZH-CN;mso-bidi-language:AR-SA">挣值分析图</span></u>&nbsp;</td>
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
                                <td height="31">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" class="titlezi">      
                                                            
                                                               <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                            <%--<asp:Chart ID="Chart1" runat="server" Height="500px" Width="800px">
                                                                <Series>
                                                                    <asp:Series Name="Series1" Legend="Legend1" ShadowOffset="1" XValueType="Double"></asp:Series>
                                                                    <asp:Series ChartArea="ChartArea1" Legend="Legend1" Name="Series2">
                                                                    </asp:Series>
                                                                </Series>
                                                                <ChartAreas>
                                                                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                                                                </ChartAreas>
                                                                <Legends>
                                                                    <asp:Legend DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="Legend1">
                                                                    </asp:Legend>
                                                                </Legends>
                                                                <Titles>
                                                                    <asp:Title Name="Title1" Text="挣值分析图">
                                                                    </asp:Title>
                                                                </Titles>
                                                            </asp:Chart>--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>                                  
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 40%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="请稍候，处理中..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
