<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSupplierAssetPaymentApplicantDetailView.aspx.cs" Inherits="TTSupplierAssetPaymentApplicantDetailView" %>


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
            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }
    </script>
</head>
<body>
    <center>
        <form id="form2" runat="server">
           
                <table style="width: 980px;">
                    <tr>
                        <td style="text-align: left; width: 100%;">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td width="7">
                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                 <td align="center" width="6%"><strong>
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                <td align="center" width="12%"><strong>
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                <td align="center" width="8%"><strong>
                                                    <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,GongYingShang %>"></asp:Label></strong></td>
                                                <%--  <td align="center" width="8%"><strong>
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>--%>
                                                <td align="center" width="15%"><strong>
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                <td align="center" width="8%"><strong>
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                <td align="center" width="6%"><strong>
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                <td align="center" width="6%"><strong>
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
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
                                 
                                    <asp:BoundColumn DataField="AssetCode" HeaderText="代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="6%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="AssetName" HeaderText="名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Manufacture" HeaderText="供应商">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                    </asp:BoundColumn>
                                    <%--   <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                    </asp:BoundColumn>--%>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>
                                </Columns>
                                <EditItemStyle BackColor="#2461BF" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <ItemStyle CssClass="itemStyle" />

                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
             
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
