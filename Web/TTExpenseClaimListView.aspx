<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTExpenseClaimListView.aspx.cs"
    Inherits="TTExpenseClaimListView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
        <table width="850" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
            <tr>
                <td width="7">
                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                </td>
                <td>
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td width="10%" align="center">
                                <strong>
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                            </td>
                            <td width="15%" align="center">
                                <strong>
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FeiYongID%>"></asp:Label></strong>
                            </td>
                            <td width="20%" align="center">
                                <strong>
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label></strong>
                            </td>
                            <td width="30%" align="center">
                                <strong>
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label></strong>
                            </td>
                            <td width="10%" align="center">
                                <strong>
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong>
                            </td>
                            <td width="15%" align="center">
                                <strong>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaShengShiJian%>"></asp:Label></strong>
                            </td>
                        </tr>
                    </table>
                </td>
                <td width="6" align="right">
                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                </td>
            </tr>
        </table>
        <asp:DataGrid ID="DataGrid2" runat="server"  AutoGenerateColumns="False"
            ShowHeader="false" Height="30px" Width="850">
            
            <Columns>
                <asp:BoundColumn DataField="ID" HeaderText="序号">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="RelatedExpenseID" HeaderText="费用ID">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Account" HeaderText="科目">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Description" HeaderText="描述">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="Amount" HeaderText="金额">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                </asp:BoundColumn>
                <asp:BoundColumn DataField="RegisterDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="登记时间">
                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                </asp:BoundColumn>
            </Columns>
            <ItemStyle CssClass="itemStyle" />
            <HeaderStyle />
            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
        </asp:DataGrid>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
