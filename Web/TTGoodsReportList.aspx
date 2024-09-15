<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsReportList.aspx.cs"
    Inherits="TTGoodsReportList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            height: 30px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <div>
                <br />
                <br />
                <table>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsSaleReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinXiaoShouBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsReturnReportForSale.aspx" class="link" target="Right">
                                <asp:Label ID="Label13" runat="server" Text="销售退货报表"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsPurchaseReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangPinCaiGouBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsReturnReportForPurchase.aspx" class="link" target="Right">
                                <asp:Label ID="Label14" runat="server" Text="采购退货报表"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsCheckInReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShangPinRuKuBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsApplicationReport.aspx?RelatedType=Other&RelatedID=0" class="link"
                                target="Right">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShangPinLingYongBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsShipmentReport.aspx?RelatedType=Other&RelatedID=0" class="link" target="Right">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShangPinChuKuBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsTransferReport.aspx?RelatedType=Other&RelatedID=0" class="link" target="Right">
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DiaoBoBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td class="style1">
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td class="style1">
                            <a href="TTGoodsMantanceReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShangPinWeiHuBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsScrapeReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangPinBaoFeiBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsCheckReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShangPinPanDianBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsSummaryReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangPinHuiZongBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsSafetyStockReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,AnQuanKuCunBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTGoodsCheckInOutInventoryReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LiaoPingShouFaChengBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
