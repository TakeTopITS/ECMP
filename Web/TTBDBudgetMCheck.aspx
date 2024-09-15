<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBDBudgetMCheck.aspx.cs" Inherits="TTBDBudgetMCheck" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongChaXun%>"></asp:Label></td>
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
                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="width: 15%;">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="100%">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="center">
                                                <table width="80%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YuSuanLeiXing%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DropDownList1" Width="110px" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                                                                <asp:ListItem />
                                                                <asp:ListItem Value="预算标准" Text="<%$ Resources:lang,YuSuanBiaoZhun%>" />
                                                                <asp:ListItem Value="预算记录" Text="<%$ Resources:lang,YuSuanJiLu%>" />
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_DepartString" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_DepartName" runat="server" Width="100px"></asp:TextBox>
                                                            <asp:Label ID="lbl_DepartCode" runat="server" Visible="False"></asp:Label>
                                                        </td>



                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_AccountName" runat="server" Width="100px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianFen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_Year" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="DLC_MonthNum_CalendarExtender" runat="server" Format="yyyy" TargetControlID="txt_Year">
                                                            </cc1:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YueFen%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="txt_Month" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="MM" TargetControlID="txt_Month">
                                                            </cc1:CalendarExtender>
                                                        </td>

                                                        <td colspan="2" class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                            <asp:Button ID="Button1" runat="server" CssClass="inpu" OnClick="Button1_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                                        </td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <br />
                                                <asp:Panel ID="Budget_Base" runat="server">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                        width="100%">
                                                        <tr>
                                                            <td align="left" class="page_topbj">&nbsp;
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongBiaoZhun%>"></asp:Label>： </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="30%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="15%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label></strong></td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,NianFen%>"></asp:Label></strong></td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YueFen%>"></asp:Label></strong></td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                        OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" Width="100%" ShowHeader="false">
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_BudgetID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                </ItemTemplate>
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="AccountName" HeaderText="会计科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn HeaderText="会计科目">
                                                                <ItemTemplate>
                                                                    <%# ShareClass.GetAccountName(Eval("AccountCode").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="YearNum" HeaderText="年份">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MonthNum" HeaderText="月份">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MoneyNum" HeaderText="金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                        </Columns>

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid>
                                                </asp:Panel>
                                                <br />
                                                <br />
                                                <asp:Panel ID="Budget_Operation" runat="server">
                                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="left" class="page_topbj" colspan="6">&nbsp;&nbsp;&nbsp;<asp:Label ID="lbl_BudgetID" runat="server" Visible="False"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuSuanFeiYongJiLu%>"></asp:Label>：</td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6">
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="25%"><strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="15%"><strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,NianFen%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YueFen%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                        </asp:BoundColumn>
                                                                        <%--   <asp:BoundColumn DataField="AccountName" HeaderText="会计科目">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn HeaderText="会计科目">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.GetAccountName(Eval("AccountCode").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="YearNum" HeaderText="年份">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="MonthNum" HeaderText="月份">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="MoneyNum" HeaderText="金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UserName" HeaderText="申请人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>

                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                </asp:DataGrid>
                                                                &nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShengYuYuSuan%>"></asp:Label>：
                                                            <asp:Label ID="lbl_MoneyNum" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
