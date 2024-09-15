<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactListPrintDetail.aspx.cs" Inherits="TTWZCompactListPrintDetail" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            font-family: 微软雅黑,宋体;
            font-size: 1em;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { 



        });

    </script>

</head>
<body>
    <center>
        <form id="form2" runat="server">
            <div style="position: relative; top: 50px;">
                <table style="width: 1800px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <table width="100%">
                                <tr>
                                      <td>&nbsp;</td>
                                    <td width="200px">
                                        <img src="Logo/FormLogo.png" /></td>
                                    <td width="550px" style="font-size: xx-large; text-align: center;">
                                        <br />
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,HeTong%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="formItemBgStyle" style="text-align: left; width: 100%;">

                          
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                        </td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>

                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HeTongShuLiang%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HeTongDanJia%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="3%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,CaiJianBiaoZhi%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="3%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShouLiaoShuLiang%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="3%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShouLiaoZongE%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                    </td>


                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DG_CompactDetail" runat="server"  AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="false"
                                    Width="100%">
                                    <Columns>

                                        <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 9) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("Grade").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CompactNumber" HeaderText="合同数量">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CompactPrice" HeaderText="合同单价">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CompactMoney" HeaderText="合同金额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                        </asp:BoundColumn>

                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:BoundColumn DataField="IsCheck" HeaderText="材检标志">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="CollectNumber" HeaderText="收料数量">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="CollectMoney" HeaderText="收料金额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                        </asp:BoundColumn>

                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>
                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("StandardCode").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>

                                        <asp:TemplateColumn>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                            <HeaderTemplate>
                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                            </ItemTemplate>
                                        </asp:TemplateColumn>


                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                    <ItemStyle CssClass="itemStyle" />
                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                </asp:DataGrid>
                          
                            <asp:Label ID="LB_CompactDetailSql" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>

            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
