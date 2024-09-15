<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectCostFeeIDs.aspx.cs" Inherits="TTRCJProjectCostFeeIDs" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>成本费项列表管理</title>
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
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">成本费项大类信息
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
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GV_CostFeeID" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnPageIndexChanging="GV_CostFeeID_PageIndexChanging" OnSelectedIndexChanged="GV_CostFeeID_SelectedIndexChanged" ShowHeaderWhenEmpty="True" AllowSorting="True" OnSorting="GV_CostFeeID_Sorting" OnRowDataBound="GV_CostFeeID_RowDataBound">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="ID" HeaderText="成本费项大类编号" SortExpression="ID" />
                                                                                <asp:BoundField DataField="Title" HeaderText="中文标题" />
                                                                                <asp:TemplateField HeaderText="费项类型">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FeeType") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("FeeType").ToString().Trim()=="0"?"直接费项项目":"间接费项项目" %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:CommandField ShowSelectButton="True" HeaderText="选择" SelectImageUrl="~/ImagesSkin/edit.gif" ButtonType="Button" />
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
                                                    <tr>
                                                        <td align="center" class="titlezi">
                                                            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="left">
                                                                        <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="220">成本费项大类编号：</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:TextBox ID="tbID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="200">中文标题：</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:TextBox ID="tbTitle" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="120">费项类型:</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:DropDownList ID="DDL_FeeType" runat="server">
                                                                                        <asp:ListItem Value="0">直接费用项目</asp:ListItem>
                                                                                        <asp:ListItem Value="1">间接费用项目</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="3">
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Label ID="lb_ShowMessageID" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Button ID="btnAddNewItem" runat="server" Text="新增数据" Width="146px" OnClick="btnAddNewItem_Click" />
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Button ID="btnEditItem" runat="server" Text="修改数据" Width="146px" OnClick="btnEditItem_Click" />
                                                                        </table>
                                                                    </td>
                                                                    <td align="left">
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 2px">
                                                                            <asp:Button ID="btnDeleteItem" runat="server" Text="删除数据" Width="146px" OnClick="btnDeleteItem_Click" OnClientClick="return confirm('您确认删除该记录吗?')" />
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
                                </td>
                            </tr>
                        </table>
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">成本费项子类列表
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
                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                        <tr>
                                            <td align="left">
                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center" class="titlezi">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:GridView ID="GV_CostFeeSubID" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeaderWhenEmpty="True" OnPageIndexChanging="GV_CostFeeSubID_PageIndexChanging" OnSelectedIndexChanged="GV_CostFeeSubID_SelectedIndexChanged" AllowSorting="True" OnSorting="GV_CostFeeSubID_Sorting" OnRowDataBound="GV_CostFeeSubID_RowDataBound">
                                                                            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                                            <Columns>
                                                                                <asp:BoundField DataField="ID" HeaderText="成本费项子类编号" SortExpression="ID" />
                                                                                <asp:BoundField DataField="CostFeeID" HeaderText="成本费项大类编号" />
                                                                                <asp:BoundField DataField="SubTitle" HeaderText="中文标题" />
                                                                                <asp:TemplateField HeaderText="固定费项">
                                                                                    <EditItemTemplate>
                                                                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("IsFixed") %>'></asp:TextBox>
                                                                                    </EditItemTemplate>
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("IsFixed").ToString().Trim()=="0"?"否":"是" %>'></asp:Label>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateField>
                                                                                <asp:CommandField ShowSelectButton="True" />
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
                            <tr>
                                <td height="31">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="center" class="titlezi">
                                                            <table width="100%" border="1" align="center" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td align="left">
                                                                        <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="220">成本费项子类编号：</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:TextBox ID="TB_SubID" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="200">费项大类：</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:TextBox ID="TB_FeeType" runat="server" ReadOnly="True"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table width="240" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="120">固定费项:</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:DropDownList ID="DDL_IsFixed" runat="server">
                                                                                        <asp:ListItem Value="1">是</asp:ListItem>
                                                                                        <asp:ListItem Value="0">否</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table width="320" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td align="right" width="200">中文标题：</td>
                                                                                <td align="left" width="120">
                                                                                    <asp:TextBox ID="TB_SubFeeTitle" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left" colspan="4">
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Label ID="lb_ShowMessageSubID" runat="server" ForeColor="Red" Text=""></asp:Label>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Button ID="BT_AddNewSubFee" runat="server" Text="新增数据" Width="146px" OnClick="BT_AddNewSubFee_Click" />
                                                                        </table>
                                                                    </td>
                                                                    <td>
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" width="240">
                                                                            <asp:Button ID="BT_EditSubFee" runat="server" Text="修改数据" Width="146px" OnClick="BT_EditSubFee_Click" />
                                                                        </table>
                                                                    </td>
                                                                    <td align="left">
                                                                        <table align="left" border="0" cellpadding="0" cellspacing="0" style="width: 2px">
                                                                            <asp:Button ID="BT_DelSubFee" runat="server" Text="删除数据" Width="146px" OnClientClick="return confirm('您确认删除该记录吗?')" OnClick="BT_DelSubFee_Click" />
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
