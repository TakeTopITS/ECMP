<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZStorePrintPage.aspx.cs" Inherits="TTWZStorePrintPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>库存列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" language="javascript">
        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print()
            CloseLayer();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" cellpadding="0" cellspacing="0" class="formBgStyle">
                <tr>
                    <td align="left" class="formItemBgStyle">
                        <table class="formBgStyle" style="width: 100%;">
                            <tr>
                                <td colspan="3" style="text-align: center;" class="formItemBgStyle">
                                    <h1>
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KCZJDTHZB%>"></asp:Label></h1>
                                </td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：&nbsp;&nbsp;&nbsp;&nbsp;<asp:Literal ID="LT_StockCode" runat="server"></asp:Literal></td>
                                <td class="formItemBgStyle">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HuiZongYueFen%>"></asp:Label>：&nbsp;&nbsp;<asp:Literal ID="LT_YearMonth" runat="server"></asp:Literal></td>
                                <td class="formItemBgStyle">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BaoBiaoRiQi%>"></asp:Label>：&nbsp;&nbsp;<asp:Literal ID="LT_CurrentTime" runat="server"></asp:Literal></td>
                            </tr>
                            <tr>
                                <td colspan="3" class="formItemBgStyle">
                                    <hr />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="padding-top: 0px;">


                        <asp:Repeater ID="RT_List" runat="server" OnItemDataBound="RT_List_ItemDataBound">
                            <HeaderTemplate>
                                <table class="formBgStyle" width="100%">
                                    <tr style="font-size:15px; font-weight:bold;">
                                        <td class="formItemBgStyle" style="width:15%;">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:15%;">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangQiJieE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BenQiShouE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiJiShouE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BenQiFaE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiJiFaE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BenQiJieE%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="width:10%;">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PingJunZhanYong%>"></asp:Label></td>
                                    </tr>
                            </HeaderTemplate>
                            <ItemTemplate>

                                <tr>

                                    <td class="formItemBgStyle"><%# Eval("DLCode") %></td>
                                    <td class="formItemBgStyle"><%# Eval("DLName") %></td>
                                    <td class="formItemBgStyle"><%# Eval("上期结额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("本期收额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("累计收额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("本期发额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("累计发额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("本期结额") %></td>
                                    <td class="formItemBgStyle"><%# Eval("平均占用") %></td>

                                </tr>

                            </ItemTemplate>
                            <FooterTemplate>
                                
                                
                              </table>

                            </FooterTemplate>
                        </asp:Repeater>

                        <table class="formBgStyle" style="width:100%;">
                            <tr>
                                <td class="formItemBgStyle" style="width:15%;">
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeJi%>"></asp:Label>：</td>
                                <td class="formItemBgStyle" style="width:15%;">&nbsp;</td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_PreviousMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_CurrentCollectMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_TotalCollectMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_CurrentSendMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_TotalSendMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_CurrentMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle" style="width:10%;">
                                    <asp:Literal ID="LT_AvgMoney" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                        <%--<asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="True"
                            Width="100%">
                            <Columns>
                                <asp:BoundColumn DataField="DLCode" HeaderText="大类">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLName" HeaderText="大类名称">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="上期结额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="本期收额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="累计收额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="本期发额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="累计发额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="本期结额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DLCode" HeaderText="平均占用">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditItemStyle BackColor="#2461BF" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            
                            <ItemStyle CssClass="itemStyle" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        </asp:DataGrid>--%>
                    </td>
                </tr>
                <tr>
                    <td class="formItemBgStyle">
                        <div id="divOver" style="text-align: center">
                            <br />
                            <p class="noprint">
                                <input id="print" type="button" class="btn" value="确认打印" onclick="printpage();" />
                                <input id="print0" type="button" value="关闭" onclick="CloseLayer();" class="btn" />
                            </p>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
