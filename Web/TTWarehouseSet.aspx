<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWarehouseSet.aspx.cs" Inherits="TTWarehouseSet" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1. Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td colspan="2" height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChuangKuSheZi%>"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
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
                                <td width="250px">
                                    <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td>
                                    <table style="width: 100%; text-align: center;">
                                        <tr>
                                            <td><b>
                                                <asp:Label ID="Label379" runat="server" Text="<%$ Resources:lang,CangKu%>"></asp:Label>
                                            </b></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="15%"><strong>
                                                                        <asp:Label ID="Label32228" runat="server" Text="资金算法"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label381" runat="server" Text="<%$ Resources:lang,FuChuangKu%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuiShuBuMenDaiMa%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label382" runat="server" Text="<%$ Resources:lang,GuiShuBuMenMingCheng%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center"><strong>
                                                                        <asp:Label ID="Label383" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                    </strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid21" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="2" ShowHeader="false" Width="98%">
                                                    <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:BoundColumn DataField="WHName" HeaderText="仓库">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CapitalMethod" HeaderText="资金算法">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ParentWH" HeaderText="父仓库">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BelongDepartCode" HeaderText="部门代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BelongDepartName" HeaderText="部门名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="Left">

                                                <br />
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label234231" runat="server" Text="<%$ Resources:lang,FuChuangKu%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_ParentWH" runat="server" Width="150px"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseParentWH" Enabled="True" PopupControlID="Panel2" TargetControlID="TB_ParentWH" Y="15">
                                                            </cc1:ModalPopupExtender>

                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label384" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_WHName" runat="server" Width="150"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label383335" runat="server" Text="库存资金算法"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_CapitalMethod" runat="server">
                                                                <asp:ListItem Value="FIFO" Text="<%$ Resources:lang,XianJingXianChu%>" />
                                                                <asp:ListItem Value="MWAM" Text="<%$ Resources:lang,JiaQuanPingJIng%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label385" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_WHSortNumber" runat="server" Width="130"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label386" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_DepartCode" runat="server" Width="80px"></asp:TextBox>
                                                            <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TB_DepartCode" Y="15">
                                                            </cc1:ModalPopupExtender>
                                                            <asp:Label ID="LB_DepartName" runat="server"></asp:Label>
                                                        </td>

                                                        <td style="text-align: right;">
                                                            <asp:Button ID="BT_AddWH" runat="server" CssClass="inpu" OnClick="BT_AddWH_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_UpdateWH" runat="server" CssClass="inpu" OnClick="BT_UpdateWH_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_DeleteWH" runat="server" CssClass="inpu" OnClick="BT_DeleteWH_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                        </td>

                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%; text-align: center;">
                                                    <tr>
                                                        <td><b>
                                                            <asp:Label ID="Label234232" runat="server" Text="仓位"></asp:Label>
                                                        </b></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label234233" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label234234" runat="server" Text="归属仓库"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label234237" runat="server" Text="备注"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid22" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid22_ItemCommand" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="2" ShowHeader="false" Width="98%">
                                                                <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>

                                                                    <asp:TemplateColumn HeaderText="仓位">

                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_WHPositionName" runat="server" CssClass="inpuLongest" Text='<%# DataBinder.Eval(Container.DataItem,"PositionName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="WHName" HeaderText="归属仓库">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="Comment" HeaderText="部门名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                    </asp:BoundColumn>

                                                                </Columns>
                                                                <HeaderStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="Left">
                                                            <br />
                                                            <table>
                                                                <tr>

                                                                    <td>
                                                                        <asp:Label ID="Label234239" runat="server" Text="<%$ Resources:lang,MingCheng%>">
                                                                        </asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_WHPositionName" runat="server" Width="250"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label234238" runat="server" Text="归属仓库"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LB_BelongWHName" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label234240" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_Comment" runat="server" Width="330"></asp:TextBox>
                                                                    </td>

                                                                    <td>
                                                                        <asp:Button ID="BT_AddWHPosition" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_AddWHPosition_Click" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_UpdateWHPosition" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_UpdateWHPosition_Click" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_DeleteWHPosition" runat="server" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_DeleteWHPosition_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
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
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseParentWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 5%; top: 5%;">
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
