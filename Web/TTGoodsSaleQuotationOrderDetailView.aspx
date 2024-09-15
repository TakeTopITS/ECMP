<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsSaleQuotationOrderDetailView.aspx.cs" Inherits="TTGoodsSaleQuotationOrderDetailView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title></title>
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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                width="100%">
                <tr>
                    <td width="7">
                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                    </td>
                    <td>
                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td align="center" width="5%">
                                    <strong>
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                </td>
                                <td align="center" width="10%">
                                    <strong>
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                </td>
                                <td align="center" width="15%">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                </td>
                                <td align="center" width="10%">

                                    <strong>
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                    </strong>
                                </td>
                                <td align="center" width="15%">
                                    <strong>
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                </td>
                                 <td align="center" width="10%">

                                    <strong>
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                    </strong>
                                </td>
                                <td align="center" width="10%">
                                    <strong>
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                </td>
                                <td align="center" width="10%">
                                    <strong>
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                </td>
                                <td align="center" width="10%">
                                    <strong>
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                </td>

                            </tr>
                        </table>
                    </td>
                    <td align="right" width="6">
                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                    </td>
                </tr>
            </table>
            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                ShowHeader="False"
                Width="100%">
                
                <Columns>
                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                    </asp:BoundColumn>
                </Columns>

                <EditItemStyle BackColor="#2461BF" />

                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                <ItemStyle CssClass="itemStyle" />

                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
            </asp:DataGrid>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
