<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountReceiveRecordSummarySAAS.aspx.cs" Inherits="TTAccountReceiveRecordSummarySAAS" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>收支明细汇总表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1400px;
            width: expression (document.body.clientWidth <= 1400? "1400px" : "auto" ));
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShouKuanMingXiHuiZongBiao%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left">
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Account" Width="100px" runat="server"></asp:TextBox>
                                                            <asp:DropDownList ID="ddl_Account" runat="server" DataTextField="AccountName" DataValueField="AccountCode" AutoPostBack="true" OnSelectedIndexChanged="ddl_Account_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Currency" runat="server" DataTextField="Type" DataValueField="Type">
                                                            </asp:DropDownList></td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <asp:TextBox ID="DLC_StartTime" Width="100px" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <asp:TextBox ID="DLC_EndTime" Width="100px" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label19" runat="server" Text="付款方"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 150px;" align="left">
                                                            <asp:TextBox ID="TB_Payer" runat="server" Width="99%"></asp:TextBox>

                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label21" runat="server" Text="项目"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 100px;" align="left">
                                                            <asp:TextBox ID="TB_RelatedProjectID" runat="server" Width="99%"></asp:TextBox>

                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,CahXun%>" />

                                                        </td>
                                                        <td class="formItemBgStyle" align="right">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiShouZongE%>"></asp:Label>：
                                                           
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="LB_ReceiverAmount" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table cellpadding="5" cellspacing="0" border="0" width="100%">

                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="6%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="7%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShiShouJinE%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShiShouRiQi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouKuanFangShi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="7%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="本币金额"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="付款方"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DengJi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="8%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" AllowPaging="true" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="15"
                                                                ForeColor="#333333" GridLines="None" Height="1px"
                                                                ShowHeader="False" Width="100%">

                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="ReceiverAccount" HeaderText="实收金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReceiverTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="实收日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>


                                                                    <asp:BoundColumn DataField="ReAndPayType" HeaderText="收款方式">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Bank" HeaderText="银行">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn HeaderText="本币金额">
                                                                        <ItemTemplate>
                                                                            <%#  decimal .Parse(Eval("ReceiverAccount").ToString()) *  decimal .Parse(Eval("ExchangeRate").ToString())  %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="7%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                        DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="RelatedProjectID" DataNavigateUrlFormatString="TTProjectDetailView.aspx?ProjectID={0}"
                                                                        DataTextField="RelatedProjectID" HeaderText="登记" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <iframe runat="server" id="IFrame_Chart_Pie" src="TTTakeTopAnalystChartSet.aspx" style="width: 300px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>

                                                                        <%-- <asp:Chart ID="Chart_Pie" runat="server" Width="400px">
                                                                            <Series>
                                                                                <asp:Series ChartArea="ChartArea1" ChartType="Pie" Legend="Legend1" Name="Series1">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                                                </asp:ChartArea>
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
                                                                                <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="标题">
                                                                                </asp:Title>
                                                                            </Titles>
                                                                        </asp:Chart>--%>
                                                                    </td>
                                                                    <td align="center">
                                                                        <iframe runat="server" id="IFrame_Chart_PayAndReceive" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                        <%--  <asp:Chart ID="Chart_PayAndReceive" runat="server" Width="800px">
                                                                            <Series>
                                                                                <asp:Series ChartType="Column" Label="#VAL" Name="Series1">
                                                                                </asp:Series>
                                                                                <asp:Series ChartType="Column" Label="#VAL" Name="Series2">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Titles>
                                                                                <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="false" Name="标题">
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
