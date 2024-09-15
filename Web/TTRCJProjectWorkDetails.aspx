<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectWorkDetails.aspx.cs" Inherits="T_RCJProjectWorkDetails" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>录入实际工作</title>
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

        function OpenWorkDetailsLog(url, w, h) {
            window.open(url, "newwindow", "height=h, width=w,toolbar=no, menubar=no, scrollbars=no, resizable=no, location=no, status=no")
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
                                                <table width="145" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">实际工作录入
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
                                                            <asp:LinkButton ID="LB_WorkDetailsLog" runat="server" OnClick="LB_WorkDetailsLog_Click">实际工作量登记日志</asp:LinkButton>
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
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 319px">
                                                    <tr>
                                                        <td align="right" width="100">运算序号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ID" runat="server" Width="207px" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="100">序号：</td>
                                                        <td align="left" width="220">
                                                            <asp:TextBox ID="TB_ItemNo" runat="server" ReadOnly="True" Style="margin-left: 0px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td colspan="2">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="420px">
                                                    <tr>
                                                        <td align="right" width="100">工作月份：</td>
                                                        <td align="left" width="320">
                                                            <asp:DropDownList ID="DDL_YearList" runat="server" AutoPostBack="True" DataValueField="ProjectYear" OnSelectedIndexChanged="DDL_YearList_SelectedIndexChanged"></asp:DropDownList>
                                                            <asp:DropDownList ID="DDL_MonthList" runat="server" DataValueField="ProjectMonth"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 319px">
                                                    <tr>
                                                        <td align="right" width="100">定额号：</td>
                                                        <td align="left" width="120">
                                                            <asp:TextBox ID="TB_ItemName" runat="server" Width="207px" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="320">
                                                    <tr>
                                                        <td align="right" width="100">定额名称：</td>
                                                        <td align="left" width="220">
                                                            <asp:TextBox ID="TB_ItemContent" runat="server" Style="margin-left: 0px" ReadOnly="True"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" colspan="2">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="420">
                                                    <tr>
                                                        <td align="right" width="100">工作量：</td>
                                                        <td align="left" width="320">
                                                            <asp:TextBox ID="TB_WorkNumDetails" runat="server" Style="margin-left: 0px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="4">
                                                <asp:Label ID="lb_ShowMessage" runat="server" Font-Size="Small" ForeColor="Red" Text="消息提示：无"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_SaveWorkDetails" runat="server" Text="新增工作记录" Width="146px" OnClick="BT_SaveWorkDetails_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_EditWorkDetails" runat="server" Text="修改工作记录" Width="127px" OnClick="BT_EditWorkDetails_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_DelWorkDetails" runat="server" Text="删除工作记录" Width="127px" OnClientClick="return confirm('删除该记录则对应的工作确认记录和收款记录一起被删除，您确认删除该记录吗?')" OnClick="BT_DelWorkDetails_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="Table1" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">实际工作量信息列表
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
                                                <asp:GridView ID="gvWorkDetails" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvWorkDetails_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvWorkDetails_PageIndexChanging" OnRowDataBound="gvWorkDetails_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:CommandField HeaderText="选择" ShowSelectButton="True" />
                                                        <asp:BoundField DataField="ID" HeaderText="运算序号" />
                                                        <asp:BoundField DataField="WorkConfirmID" HeaderText="确认序号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="定额号" />
                                                        <asp:BoundField DataField="WorkYear" HeaderText="工作年份" />
                                                        <asp:BoundField DataField="WorkMonth" HeaderText="工作月份" />
                                                        <asp:BoundField DataField="WorkNum" HeaderText="工作量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="BCWP" HeaderText="实际合计合价(BCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="BCRWP" HeaderText="应收款额(BCRWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="PBCWP" HeaderText="实收款(PBCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ComfirmPercent" HeaderText="确认比列" DataFormatString="{0:p2}" />
                                                        <asp:BoundField DataField="RecievePercent" HeaderText="收款比列" DataFormatString="{0:p2}" />
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
                        <table id="Table3" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">实际工作确认
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
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 319px">
                                                    <tr>
                                                        <td align="right" width="100">工作月份：</td>
                                                        <td align="left" width="320">
                                                            <asp:DropDownList ID="DDL_YearListConfirm" runat="server" DataValueField="ProjectYear"></asp:DropDownList>
                                                            <asp:DropDownList ID="DDL_MonthListConfirm" runat="server" DataValueField="ProjectMonth"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td colspan="2">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="420px">
                                                    <tr>
                                                        <td align="right" width="100">确认工作量：</td>
                                                        <td align="left" width="320">
                                                            <asp:TextBox ID="TB_WorkNumConfirm" runat="server" Style="margin-left: 0px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lb_ShowConfirmMessage" runat="server" Font-Size="Small" ForeColor="Red" Text="消息提示：无"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_SaveWorkConfirm" runat="server" Text="新增工作确认" Width="146px" OnClick="BT_SaveWorkConfirm_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_EditWorkConfirm" runat="server" Text="修改工作确认" Width="127px" OnClick="BT_EditWorkConfirm_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_DelWorkConfirm" runat="server" Text="删除工作确认" Width="127px" OnClientClick="return confirm('您确认删除该记录吗?')" OnClick="BT_DelWorkConfirm_Click" />
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
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">确认工作量信息列表
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
                                                            <asp:LinkButton ID="LB_WorkConfirmLog" runat="server" OnClick="LB_WorkConfirmLog_Click">确认工作量登记日志</asp:LinkButton>
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
                                                <asp:GridView ID="gvWorkConfirm" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvWorkConfirm_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvWorkConfirm_PageIndexChanging" OnRowDataBound="gvWorkConfirm_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:CommandField HeaderText="选择" ShowSelectButton="True" />
                                                        <asp:BoundField DataField="ID" HeaderText="运算序号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="定额号" />
                                                        <asp:BoundField DataField="WorkYear" HeaderText="工作年份" />
                                                        <asp:BoundField DataField="WorkMonth" HeaderText="工作月份" />
                                                        <asp:BoundField DataField="WorkNum" HeaderText="工作量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceDeviceActual" HeaderText="设备实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialActual" HeaderText="主材实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageActual" HeaderText="人工实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialActual" HeaderText="材料实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineActual" HeaderText="机械实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemComprehensiveFeeActual" HeaderText="实际费率措施费合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemTaxesActual" HeaderText="税金实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ProjectBCRWP" HeaderText="应收款额(BCRWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ProjectPBCWP" HeaderText="实收款(PBCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
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
                        <table id="Table5" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">收款工作记录
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
                                            <td>
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 319px">
                                                    <tr>
                                                        <td align="right" width="100">工作月份：</td>
                                                        <td align="left" width="320">
                                                            <asp:DropDownList ID="DDL_YearListMoney" runat="server" DataValueField="ProjectYear"></asp:DropDownList>
                                                            <asp:DropDownList ID="DDL_MonthListMoney" runat="server" DataValueField="ProjectMonth"></asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td colspan="2">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="420px">
                                                    <tr>
                                                        <td align="right" width="100">收款数额：</td>
                                                        <td align="left" width="320">
                                                            <asp:TextBox ID="TB_WorkNumMoney" runat="server" Style="margin-left: 0px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="lb_ShowMoneyMessage" runat="server" Font-Size="Small" ForeColor="Red" Text="消息提示：无"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_SaveWorkMoney" runat="server" Text="新增收款记录" Width="146px" OnClick="BT_SaveWorkMoney_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_EditWorkMoney" runat="server" Text="修改收款记录" Width="127px" OnClick="BT_EditWorkMoney_Click" />
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table align="center" border="0" cellpadding="0" cellspacing="0" width="240">
                                                    <asp:Button ID="BT_DelWorkMoney" runat="server" Text="删除收款记录" Width="127px" OnClientClick="return confirm('您确认删除该记录吗?')" OnClick="BT_DelWorkMoney_Click" />
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <table id="Table4" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">收款工作信息列表
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
                                                            <asp:LinkButton ID="LB_QueryWorkMoneyLog" runat="server" OnClick="LB_QueryWorkMoneyLog_Click">收款登记日志</asp:LinkButton>
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
                                                <asp:GridView ID="gvMoneyConfirm" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" OnSelectedIndexChanged="gvMoneyConfirm_SelectedIndexChanged" AllowPaging="True" OnPageIndexChanging="gvMoneyConfirm_PageIndexChanging" OnRowDataBound="gvMoneyConfirm_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:CommandField HeaderText="选择" ShowSelectButton="True" />
                                                        <asp:BoundField DataField="ID" HeaderText="运算序号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="定额号" />
                                                        <asp:BoundField DataField="WorkYear" HeaderText="工作年份" />
                                                        <asp:BoundField DataField="WorkMonth" HeaderText="工作月份" />
                                                        <asp:BoundField DataField="MoneyNum" HeaderText="实收款(PBCWP)" DataFormatString="{0:N2}" HtmlEncode="False" />
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
