<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectAdjustPrice.aspx.cs" Inherits="TTRCJProjectAdjustPrice" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>市场价格调整</title>
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
                        <table id="Table1" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="145" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">价格调整列表
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="340" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" width="120">专业分类：</td>
                                                        <td align="left" width="220">
                                                            <asp:DropDownList ID="DDL_PerformanceType" runat="server" Style="margin-left: 0px" AutoPostBack="True" OnSelectedIndexChanged="DDL_PerformanceType_SelectedIndexChanged" Enabled="False"></asp:DropDownList>
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
                                <td align="left" style="padding: 5px 5px 5px 5px" valign="top" width="100%">
                                    <table align="center" border="1" cellpadding="0" cellspacing="0" width="96%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True" />
                                                        <asp:BoundField DataField="ID" HeaderText="记录号" />
                                                        <asp:BoundField DataField="AdjustID" HeaderText="调整编号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="绩效记录序号" />
                                                        <asp:BoundField DataField="ItemNum" HeaderText="数量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceDeviceAdjust" HeaderText="设备调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialAdjust" HeaderText="主材调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageAdjust" HeaderText="人工调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialAdjust" HeaderText="材料调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineAdjust" HeaderText="机械调整单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ProjectBCWS" HeaderText="预算合计合价(BCWS)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemTaxesBudget" HeaderText="预算税金合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceDeviceBudget" HeaderText="预算设备合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialBudget" HeaderText="预算主材合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageBudget" HeaderText="预算人工合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialBudget" HeaderText="预算材料合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineBudget" HeaderText="预算机械合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPricePurchaseFee" HeaderText="管理费及利润费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPricePurchaseFeeBudget" HeaderText="费率措施费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemComprehensiveFeeBudget" HeaderText="规费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="Memo" HeaderText="备注" />
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
                        <br />
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="145" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">价格调整管理
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
                                <td align="left" style="padding: 5px 5px 5px 5px" valign="top">
                                    <table align="center" border="1" cellpadding="0" cellspacing="0" width="96%">
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">子项序号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemNo" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">定额号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemName" runat="server" ReadOnly="True" Enabled="False" AutoPostBack="True"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">调整编号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_AdjustID" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">数量：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemNum" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">设备调整单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_DeviceAdjust" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">主材调整单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_MainAdjust" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">人工调整单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_WageAdjust" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">材料调整单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_MartAdjust" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">机械调整单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_MachineAdjust" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">预算设备合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceDeviceBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">主材预算合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceMainMaterialBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">人工预算合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceWageBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">材料预算合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ProjectMaterialBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">机械预算合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ProjectMachineBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">预算合计合价(BCWS)：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ProjectBCWS" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">费率措施费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ItemPricePurchaseFeeBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">规费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemComprehensiveFeeBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="200">管理费及利润费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ItemPricePurchaseFee" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="280">
                                                    <tr>
                                                        <td align="right" width="120">预算税金合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemTaxesBudget" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" colspan="2">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="600">
                                                    <tr>
                                                        <td align="right" width="120">备注：</td>
                                                        <td align="left" width="480">
                                                            <asp:TextBox ID="TB_Memo" runat="server" Width="468px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" align="left">
                                                <asp:Label ID="lb_ShowMessage" runat="server" Font-Size="Small" ForeColor="Red" Text="消息提示：无"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="btnSavePriceAdjust" runat="server" OnClick="btnSavePriceAdjust_Click" Text="新增价格调整数据" Width="146px" />
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="btnEditPriceAdjust" runat="server" OnClick="btnEditPriceAdjust_Click" OnClientClick="return confirm('修改该记录导致所有相关绩效重新计算，确认修改该记录吗?')" Text="修改价格调整数据" Width="146px" />
                                                </table>
                                            </td>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="btnDelPriceAdjust" runat="server" OnClick="btnDelPriceAdjust_Click" OnClientClick="return confirm('您确认删除该调整记录吗?')" Text="删除调整数据入库" Width="146px" />
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
                        <br />
                        <table id="Table2" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="145" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">价格调整日志
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
                                <td align="left" style="padding: 5px 5px 5px 5px" valign="top" width="100%">
                                    <table align="center" border="1" cellpadding="0" cellspacing="0" width="96%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowDataBound="GridView2_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="记录号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="绩效记录序号" />
                                                        <asp:BoundField DataField="ItemNum" HeaderText="数量" />
                                                        <asp:BoundField DataField="ItemPriceDeviceAdjust" HeaderText="设备调整单价" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialAdjust" HeaderText="主材调整单价" />
                                                        <asp:BoundField DataField="ItemPriceWageAdjust" HeaderText="人工调整单价" />
                                                        <asp:BoundField DataField="ItemPriceMaterialAdjust" HeaderText="材料调整单价" />
                                                        <asp:BoundField DataField="ItemPriceMachineAdjust" HeaderText="机械调整单价" />
                                                        <asp:BoundField DataField="ProjectBCWS" HeaderText="预算合计合价(BCWS)" />
                                                        <asp:BoundField DataField="Memo" HeaderText="备注" />
                                                        <asp:BoundField DataField="AdjustByWho" HeaderText="调整人" />
                                                        <asp:BoundField DataField="AdjustTime" HeaderText="操作日期" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" />
                                                        <asp:BoundField DataField="AdjustMemo" HeaderText="调整说明" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
