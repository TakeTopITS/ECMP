<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectCost.aspx.cs" Inherits="TTRCJProjectCost" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成本控制</title>
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">项目收支绩效汇总信息</td>
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
                                <td style="padding: 5px 5px 5px 5px" valign="top" align="left">
                                    <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">项目号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectNo" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">计划总额(BCWS)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectBCWS" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">挣值总额(BCWP)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectBCWP" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">应收总额(BCRWP)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectBCRWP" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">合同额(STCV)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectSTCV" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">计划偏差(SV)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectSV" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">账单盈亏(BV)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectBV" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">结算差异(EAV)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectEAV" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">合同已收：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectContractReceived" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">计划完成率(SPI)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectSPI" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">账单绩效(BVI)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectBVI" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">结算绩效(AI)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectAI" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">合同偏差(CPB)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectCPB" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">实收总额(PBCWP)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectPBCWP" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">回款绩效(RVI)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectRVI" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">回款偏差(RV)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectRV" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">合同完成率(CFI)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectCFI" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">工程利润(P&amp;L)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectPL" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">总支出：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectTotalSpending" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">收支总差：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectIncomeDifference" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">实际成本(ACWP)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectACWP" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">成本绩效(RP)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectRP" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">总收入：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tbProjectTotalIncome" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="2">
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Label ID="lb_ShowMessage1" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </table>
                                            </td>
                                            <td>
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Button ID="Button1" runat="server" Text="导出成本绩效数据" OnClick="Button1_Click" />
                                                </table>
                                            </td>
                                            <td>
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:LinkButton ID="btnGetAllPerformanceList" runat="server" OnClick="btnGetAllPerformanceList_Click" Width="197px">了解更多详细信息</asp:LinkButton>
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">成本绩效信息列表
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="center" class="titlezi">
                                                <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">手工录入基准信息</asp:LinkButton>
                                            </td>
                                            <td align="center" class="titlezi">
                                                <asp:Button ID="Button3" runat="server" Text="清除所有测试数据(测试专用)" OnClick="Button2_Click" Visible="False" />
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DDL_PerformanceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DDL_PerformanceType_SelectedIndexChanged"></asp:DropDownList>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px" valign="top" align="left">
                                    <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">序号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemNo" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">定额号：</td>
                                                        <td align="left" width="220">
                                                            <asp:TextBox ID="TB_ItemName" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">定额名称：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemContent" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">开始时间最小值：</td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TB_BeginTime" Class="calendaritem" runat="server"></asp:TextBox>
                                                            <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                                        </td>
                                                        <td align="left" width="20">
                                                            <asp:Button ID="BT_Calendar1" runat="server" Text="T" OnClick="BT_Calendar1_Click" />
                                                        </td>
                                                        <td class="titleIditem">开始时间最大值：</td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TB_EndTime" Class="calendaritem" runat="server"></asp:TextBox>
                                                            <asp:Calendar ID="Calendar2" runat="server" Visible="False" OnSelectionChanged="Calendar2_SelectionChanged"></asp:Calendar>
                                                        </td>
                                                        <td align="left" width="20">
                                                            <asp:Button ID="BT_Calendar2" runat="server" Text="T" OnClick="BT_Calendar2_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">分部分项：</td>
                                                        <td align="left" width="120">
                                                            <asp:DropDownList ID="DDL_SubItem" runat="server" AutoPostBack="True" DataTextField="SubItem"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" class="titlezi">
                                                <table border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Button ID="bt_QueryByID" runat="server" Text="<%$ Resources:lang,ChaXun %>" OnClick="bt_QueryByID_Click" />
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
                                                        <td align="center" class="titlezi" colspan="3">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnRowCommand="GridView1_RowCommand1" OnRowDataBound="GridView1_RowDataBound" PageSize="15">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:CommandField ShowSelectButton="True" SelectText="选择">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:CommandField>
                                                                                <asp:ButtonField CommandName="AdjustPrice" Text="价格调整">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:ButtonField>
                                                                                <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                                                <asp:BoundField DataField="ItemName" HeaderText="定额号" HtmlEncode="False">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="ItemContent" HeaderText="定额名称">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="SubItem" HeaderText="分部分项">
                                                                                    <HeaderStyle Wrap="False" />
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="ItemUnit" HeaderText="单位" />
                                                                                <asp:BoundField DataField="ItemNum" HeaderText="数量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceDeviceBudget" HeaderText="预算设备合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMainMaterialBudget" HeaderText="预算主材合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceWageBudget" HeaderText="预算人工合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMaterialBudget" HeaderText="预算材料合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMachineBudget" HeaderText="预算机械合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPricePurchaseFee" HeaderText="管理费及利润费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPricePurchaseFeeBudget" HeaderText="费率措施费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemComprehensiveFeeBudget" HeaderText="规费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemTaxesBudget" HeaderText="预算税金合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="BCWS" HeaderText="预算合计合价(BCWS)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="TotalWork" HeaderText="实际工作总量" DataFormatString="{0:N3}" HtmlEncode="False">
                                                                                    <HeaderStyle Width="50px" Wrap="False" />
                                                                                    <ItemStyle Width="50px" Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="TotalConfirmWork" HeaderText="确认工作总量" DataFormatString="{0:N3}" HtmlEncode="False">
                                                                                    <HeaderStyle Width="50px" Wrap="False" />
                                                                                    <ItemStyle Width="50px" Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="ItemPriceDeviceActual" HeaderText="实际设备合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMainMaterialActual" HeaderText="实际主材合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMaterialActual" HeaderText="实际材料合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceWageActual" HeaderText="实际人工合计" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMachineActual" HeaderText="机械执行合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemComprehensiveFeeActual" HeaderText="实际费率措施费合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemTaxesActual" HeaderText="实际税金合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceTotalActual" HeaderText="执行合计合价（BCWP）" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectPlanCompleteBalance" HeaderText="计划完成差额(SV)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectBCRWP" HeaderText="应收款额(BCRWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectAI" HeaderText="结算绩效指数(AI)" DataFormatString="{0:p}" />
                                                                                <asp:BoundField DataField="ProjectEAV" HeaderText="结算差异(EAV)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectPBCWP" HeaderText="实收款(PBCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectRV" HeaderText="结款偏差(RV)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectRVI" HeaderText="结款绩效指标(RVI)" DataFormatString="{0:p}" />
                                                                                <asp:BoundField DataField="Name" HeaderText="承包商">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:BoundField>
                                                                                <asp:BoundField DataField="BeginTime" HeaderText="开始时间" DataFormatString="{0:yyyy/MM/dd}" />
                                                                                <asp:BoundField DataField="EndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}" />
                                                                                <asp:TemplateField HeaderText="价格已调整">
                                                                                    <%--<EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("ItemPriceChanged") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>--%>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("ItemPriceChanged").ToString() == "1" ? "是":"否" %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
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
                        <table id="Table2" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">价格调整信息列表
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
                                <td height="31">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" class="titlezi" colspan="3">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" OnRowCommand="GridView2_RowCommand" OnRowDataBound="GridView2_RowDataBound" PageSize="15">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:ButtonField CommandName="ActualWorks" Text="实际工作">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:ButtonField>
                                                                                <asp:BoundField DataField="AdjustID" HeaderText="调整编号" />
                                                                                <asp:BoundField DataField="ItemNo" HeaderText="绩效记录序号" />
                                                                                <asp:BoundField DataField="ItemNum" HeaderText="数量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceDeviceAdjust" HeaderText="设备调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMainMaterialAdjust" HeaderText="主材调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceWageAdjust" HeaderText="人工调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMaterialAdjust" HeaderText="材料调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMachineAdjust" HeaderText="机械调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ProjectBCWS" HeaderText="预算合计合价(BCWS)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="BCWP" HeaderText="实际合计合价(BCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="BCRWP" HeaderText="应收款(BCRWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="PBCWP" HeaderText="实收款(PBCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceDeviceBudget" HeaderText="预算设备合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMainMaterialBudget" HeaderText="预算主材合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceWageBudget" HeaderText="预算人工合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMaterialBudget" HeaderText="预算材料合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPriceMachineBudget" HeaderText="预算机械合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPricePurchaseFee" HeaderText="管理费及利润费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemPricePurchaseFeeBudget" HeaderText="费率措施费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemComprehensiveFeeBudget" HeaderText="规费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="ItemTaxesBudget" HeaderText="预算税金合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                                                <asp:BoundField DataField="Memo" HeaderText="备注">
                                                                                    <ItemStyle Wrap="False" />
                                                                                </asp:BoundField>
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
                <Triggers>
                    <asp:PostBackTrigger ControlID="Button1" />
                </Triggers>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
