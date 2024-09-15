<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectCostPerformanceList.aspx.cs" Inherits="TTRCJProjectCostPerformanceBenchmar" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>成本绩效基准信息管理</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link href="css/inputitemsheet.css" rel="stylesheet" type="text/css" />
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
                        <table id="Table2" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">成本绩效基准信息列表
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
                                                        <td class="titleIditem">专业分类：</td>
                                                        <td align="left" width="220">
                                                            <asp:DropDownList ID="DDL_PerformanceType" runat="server" Style="margin-left: 0px" AutoPostBack="True" OnSelectedIndexChanged="DDL_PerformanceType_SelectedIndexChanged"></asp:DropDownList>
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
                                                <table width="280" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="Label3" runat="server" Text="请输入序号：" Width="80"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="tb_QueryID" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="bt_QueryByID" runat="server" Text="<%$ Resources:lang,ChaXun %>" OnClick="bt_QueryByID_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnPageIndexChanging="GridView1_PageIndexChanging" AllowPaging="True" OnRowDataBound="GridView1_RowDataBound" PageSize="15">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:CommandField ShowSelectButton="True">
                                                            <ItemStyle Wrap="False" />
                                                        </asp:CommandField>
                                                        <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="定额号">
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="TypeName" HeaderText="专业分类">
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ItemUnit" HeaderText="单位" />
                                                        <asp:BoundField DataField="ItemNum" HeaderText="数量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemContent" HeaderText="定额名称">
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="SubItem" HeaderText="分部分项">
                                                            <HeaderStyle Wrap="False" />
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="ItemPriceDeviceAdjust" HeaderText="设备原定单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialAdjust" HeaderText="主材原定单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageAdjust" HeaderText="人工原定单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialAdjust" HeaderText="材料原定单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineAdjust" HeaderText="机械原定单价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceDeviceBudget" HeaderText="预算设备合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialBudget" HeaderText="预算主材合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageBudget" HeaderText="预算人工合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialBudget" HeaderText="预算材料合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineBudget" HeaderText="预算机械合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPricePurchaseFee" HeaderText="管理费及利润费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPricePurchaseFeeBudget" HeaderText="费率措施费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemComprehensiveFeeBudget" HeaderText="规费" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemTaxesBudget" HeaderText="预算税金合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ProjectBCWS" HeaderText="预算合计合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="Name" HeaderText="承包商">
                                                            <ItemStyle Wrap="False" />
                                                        </asp:BoundField>
                                                        <asp:BoundField DataField="BeginTime" HeaderText="开始时间" DataFormatString="{0:yyyy/MM/dd}" />
                                                        <asp:BoundField DataField="EndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}" />
                                                        <asp:TemplateField HeaderText="自动分月">
                                                            <ItemTemplate>
                                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("IfSplit").ToString() == "1" ? "是":"否" %>'></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="价格已调整">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">手工录入成本绩效基准数据
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
                                                        <td class="titleIditem">单位：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemUnit" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">数量：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemCount" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">定额名称：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemContent" class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">分部分项：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_SubItem" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">设备原定单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceDevice" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">主材原定单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceMainMaterial" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">人工原定单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemWage" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">材料原定单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceMaterial" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">机械原定单价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceMachine" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" class="titlezi" colspan="2">
                                                <table border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:CheckBox ID="CB_IfEveryMonth" runat="server" Text="自动计算月计划额" Width="263px" AutoPostBack="True" OnCheckedChanged="CB_IfEveryMonth_CheckedChanged" />
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算设备合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceDeviceBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算主材合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceMainMaterialBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算人工合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceWageBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算材料合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ProjectMaterialBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算机械合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ProjectMachineBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">管理费及利润费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ItemPricePurchaseFee" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">费率措施费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="tb_ItemPricePurchaseFeeBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">规费：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemComprehensiveFeeBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">预算税金合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemTaxesBudget" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">合计预算合价：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemPriceTotalBudge" Class="inputitem" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">承包商：</td>
                                                        <td align="left" width="120">
                                                            <asp:DropDownList ID="DDL_ProjectSupplierID" class="inputitem" runat="server" AutoPostBack="True"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">开始时间：</td>
                                                        <td align="left">
                                                            <asp:TextBox ID="TB_BeginTime" Class="calendaritem" runat="server"></asp:TextBox>
                                                            <asp:Calendar ID="Calendar1" runat="server" Visible="False" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>
                                                        </td>
                                                        <td align="left" width="20">
                                                            <asp:Button ID="BT_Calendar1" runat="server" Text="T" OnClick="BT_Calendar1_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" colspan="2">
                                                <table class="tableitem">
                                                    <tr>
                                                        <td class="titleIditem">结束时间：</td>
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
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Label ID="lb_ShowMessage" runat="server" Text="消息提示：无" Font-Size="Small" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                <table width="240" border="0" align="center" cellpadding="0" cellspacing="0">
                                                    <asp:Button ID="btnSaveBenchmarData" runat="server" Text="新增绩效基准数据" Width="146px" OnClick="btnSaveBenchmarData_Click" />
                                                </table>
                                            </td>
                                            <td>
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Button ID="BT_EditBenchmarData" runat="server" Text="修改绩效基准数据" Width="127px" OnClick="BT_EditBenchmarData_Click" />
                                                </table>
                                            </td>
                                            <td>
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Button ID="btnDelBenchmarData" runat="server" OnClick="btnDelBenchmarData_Click" OnClientClick="return confirm('您确认删除该记录吗?')" Text="删除绩效基准数据" Width="127px" />
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">导入成本绩效基准数据
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
                                <td style="padding: 5px 5px 5px 5px" valign="top" align="left">
                                    <table width="96%" border="1" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                    <ContentTemplate>
                                                        <div>
                                                            <upload:inputfile id="FileUpload_Training" runat="server" width="400px" />
                                                            &nbsp;<asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" Text="导入数据" />
                                                            <br />


                                                            <div id="ProgressBar">
                                                                <upload:progressbar id="ProgressBar1" runat="server" height="100px" width="500px">
                                                                </upload:progressbar>
                                                            </div>
                                                        </div>
                                                    </ContentTemplate>
                                                    <Triggers>
                                                        <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                    </Triggers>
                                                </asp:UpdatePanel>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" colspan="3">

                                                <asp:Button ID="BT_ExportToExcel" runat="server" OnClick="BT_ExportToExcel_Click" Text="导出到Excel文件" />
                                            </td>

                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3">
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:Label ID="LB_ShowMessageImport" runat="server" Text="" ForeColor="Red"></asp:Label>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" colspan="3">
                                                <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <asp:TextBox ID="TB_AnalysMsg" runat="server" Height="388px" TextMode="MultiLine" Width="1292px"></asp:TextBox>
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
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />

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

