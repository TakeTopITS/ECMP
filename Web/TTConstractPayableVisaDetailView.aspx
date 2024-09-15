<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractPayableVisaDetailView.aspx.cs" Inherits="TTConstractPayableVisaDetailView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table align="center" cellpadding="0" cellspacing="0" width="99%">
                <tr style="font-size: 10pt">
                    <td>
                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                            width="100%">
                            <tr>
                                <td width="7">
                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                <td>
                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            
                                            <td align="center" width="5%"><strong>
                                                <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                            <td align="center" width="12%"><strong>
                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>

                                            <td align="center" width="8%"><strong>
                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                            <td align="center" width="8%"><strong>
                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>
                                            <td align="center" width="8%"><strong>
                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>
                                            <td align="center" width="9%"><strong>
                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>
                                        </tr>
                                    </table>
                                </td>
                                <td align="right" width="6">
                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                            </tr>
                        </table>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" 
                            ShowHeader="False"
                            Width="100%">
                            <Columns>
                               
                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="VisaDetailName" HeaderText="名称">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="VisaNumber" HeaderText="数量">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="VisaPrice" HeaderText="单价">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="VisaAmount" HeaderText="金额">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                </asp:BoundColumn>
                            </Columns>
                            <EditItemStyle BackColor="#2461BF" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemStyle CssClass="itemStyle" />
                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataGrid>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
