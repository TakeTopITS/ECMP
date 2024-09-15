<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBDBudgetMGraph.aspx.cs" Inherits="TTBDBudgetMGraph" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongFenXi%>"></asp:Label></td>
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
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table align="left" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td rowspan="3" align="left" style="width: 15%;">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True" Width="100%">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="center">
                                                <table width="70%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,NianFen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_Year" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="DLC_MonthNum_CalendarExtender" runat="server" Format="yyyy" TargetControlID="txt_Year">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YueFen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_Month" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM" TargetControlID="txt_Month">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FenXiLeiXing%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True">
                                                                <asp:ListItem Value="部门" Text="<%$ Resources:lang,BuMen%>" />
                                                                <asp:ListItem Value="科目" Text="<%$ Resources:lang,KeMu%>" />
                                                                <asp:ListItem Value="部门+科目" Text="<%$ Resources:lang,BuMenKeMu%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DropDownList2" runat="server" Visible="False">
                                                            </asp:DropDownList>
                                                            <asp:TextBox ID="TextBox1" runat="server" Width="100px"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TextBox1">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Label ID="lbl_DCode" runat="server" Visible="False"></asp:Label>
                                                            &nbsp;<asp:Label ID="lbl_DName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_DepartString" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="font-size: 10pt">
                                            <td align="center">


                                                <iframe runat="server" id="IFrame_Chart_Budget" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>

                                                <%-- <asp:Chart ID="Chart_Budget" runat="server" Width="800px">
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
                                                <br />
                                                <asp:Label ID="LB_ProjectStatus" runat="server" Font-Size="10pt"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
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
                </ContentTemplate>
                <Triggers>
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
