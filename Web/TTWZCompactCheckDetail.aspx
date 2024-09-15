<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactCheckDetail.aspx.cs" Inherits="TTWZCompactCheckDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合同明细编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">



        $(function () { 


           
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongMingXiBianJi%>"></asp:Label>
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle" width="60%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ObjectCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_CheckCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: center" class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,JianHao%>" CssClass="inpu" OnClick="BT_Reset_Click" />&nbsp;
                                                                        <input type="button" value="返回" class="inpu" onclick="window.location.href = 'TTWZCompactCheckList.aspx'" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 100%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1500px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,HeTongShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HeTongDanJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouLiaoShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShouLiaoJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DaYinBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_CompactDetail" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_CompactDetail_ItemCommand" OnPageIndexChanged="DG_CompactDetail_PageIndexChanged">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# Eval("ID")+"|"+ Eval("CheckCode")+"|"+Eval("ObjectCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>
                                                                                            <%--<asp:Button ID="BT_Edit" runat="server" CssClass="inpu" Text="编辑" CommandArgument='<%# Eval("ID")+"|"+ Eval("CheckCode")+"|"+Eval("ObjectCode") %>' CommandName="edit" />--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="StandardCode" HeaderText="规格书编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("StandardCode").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Factory" HeaderText="生产厂家">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CompactNumber" HeaderText="合同数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactPrice" HeaderText="合同单价">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactMoney" HeaderText="合同金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CollectNumber" HeaderText="收料数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CollectMoney" HeaderText="收料金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsPrint" HeaderText="打印标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="PurchaseCode" HeaderText="采购清单ID" Visible="false">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                                    </asp:BoundColumn>--%>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                
                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            </asp:DataGrid>
                                                                        </div>
                                                                        <asp:Label ID="LB_CompactDetailSql" runat="server" Visible="False"></asp:Label>
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
                </div>
                <asp:HiddenField ID="HF_CompactDetailID" runat="server" />
                <asp:HiddenField ID="HF_CompactCode" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Reset" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
