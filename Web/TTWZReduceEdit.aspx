<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZReduceEdit.aspx.cs" Inherits="TTWZReduceEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>减值编辑-领导审批</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JianZhiLieBiao%>"></asp:Label>
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
                                            <td valign="top" style="padding-top: 5px;" class="formItemBgStyle">
                                                <div style="width: 2000px;">
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
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaJianZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiXingRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KuCunZongE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TongJiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TongJiKuCun%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TongJiBiLi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,TongJiJianZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TongJiJingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="报批" ? true : false %>'>批准</asp:LinkButton>
                                                                    <%--<asp:Button runat="server" CssClass="inpu" Text="批准" CommandName="submit" CommandArgument='<%# Eval("ReduceCode") %>' Visible='<%# Eval("Process").ToString()=="报批" ? true : false %>' />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ReduceCode" HeaderText="减值编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PlanTime" HeaderText="计划日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PlanTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="计划减值">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ExcuteTime" HeaderText="执行日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DetailNumber" HeaderText="明细条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreTotalMoney" HeaderText="库存总额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreDownMoney" HeaderText="减值金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CleanMoney" HeaderText="净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalNumber" HeaderText="统计条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalStore" HeaderText="统计库存">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalRatio" HeaderText="统计比例">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalDownMoney" HeaderText="统计减值">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalCleanMoney" HeaderText="统计净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="Remark" HeaderText="说明">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Process" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MainLeaderName" HeaderText="主管领导">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MarkerName" HeaderText="编制人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
