<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZStorePrintList.aspx.cs" Inherits="TTWZStorePrintList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>库存列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">
        function clickPrint() {
            var strStockCode = $("#DDL_StockCode").val();
            var strYear = $("#DDL_Year").val();
            var strMonth = $("#DDL_Month").val();

            var url = "TTWZStorePrintPage.aspx?StockCode=" + escape(strStockCode) + "&Year=" + strYear + "&Month=" + strMonth;
            window.open(url);
        }

        $(function () { 

           

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="100%" cellpadding="0" cellspacing="0">
                <tr>
                    <td align="left" class="formItemBgStyle">
                        <table class="formBgStyle" style="width: 60%;">
                            <tr>
                                <td class="formItemBgStyle">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                <td class="formItemBgStyle">
                                    <asp:DropDownList ID="DDL_StockCode" runat="server" DataTextField="StockCode" DataValueField="StockCode"></asp:DropDownList>
                                </td>
                                <td class="formItemBgStyle" colspan="3">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label>：<asp:DropDownList ID="DDL_Year" runat="server"></asp:DropDownList>&nbsp;&nbsp;
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label>：<asp:DropDownList ID="DDL_Month" runat="server"></asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="4" class="formItemBgStyle">
                                    <asp:Button ID="BT_Seach" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_Seach_Click" />&nbsp;
                                    <input type="button" value="打印预览" class="inpuLong" onclick="clickPrint();" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td valign="top" style="padding-top: 5px;">
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
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                            </td>
                                            <td width="12%" align="left">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShangQiJieE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BenQiShouE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LeiJiShouE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BenQiFaE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiJiFaE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BenQiJieE%>"></asp:Label></strong>
                                            </td>
                                            <td width="9%" align="right">
                                                <strong>
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,PingJunZhanYong%>"></asp:Label></strong>
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
                            Width="100%">
                            <Columns>
                                <asp:BoundColumn DataField="DLCode" HeaderText="大类">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                </asp:BoundColumn>
                                <%--<asp:BoundColumn DataField="DLName" HeaderText="大类名称">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                </asp:BoundColumn>--%>
                                <asp:TemplateColumn>
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                    <HeaderTemplate>
                                        大类名称
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <%# ShareClass.StringCutByRequire(Eval("DLName").ToString(), 190) %>
                                    </ItemTemplate>
                                </asp:TemplateColumn>
                                <asp:BoundColumn DataField="上期结额" HeaderText="上期结额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="本期收额" HeaderText="本期收额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="累计收额" HeaderText="累计收额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="本期发额" HeaderText="本期发额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="累计发额" HeaderText="累计发额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="本期结额" HeaderText="本期结额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="平均占用" HeaderText="平均占用">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                </asp:BoundColumn>
                            </Columns>
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditItemStyle BackColor="#2461BF" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            
                            <ItemStyle CssClass="itemStyle" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        </asp:DataGrid>
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="formItemBgStyle">
                        <table class="formBgStyle" style="width: 100%;">
                            <tr>
                                <td class="formItemBgStyle" colspan="9">
                                    <hr />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="formItemBgStyle">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HeJi%>"></asp:Label>：</td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_PreviousMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_CurrentCollectMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_TotalCollectMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_CurrentSendMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_TotalSendMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_CurrentMoney" runat="server"></asp:Literal>
                                </td>
                                <td class="formItemBgStyle">
                                    <asp:Literal ID="LT_AvgMoney" runat="server"></asp:Literal>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
