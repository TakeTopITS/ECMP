<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAssetReportList.aspx.cs"
    Inherits="TTAssetReportList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1
        {
            height: 30px;
        }
    </style>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
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
                        <a href="TTAssetPurchaseReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZiChanCaiGouBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
               <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetCheckInReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZiChanRuKuBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetApplicationReport.aspx?RelatedType=Other&RelatedID=0" class="link"
                            target="Right">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZiChanLingYongBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetShipmentReport.aspx?RelatedType=Other&RelatedID=0" class="link" target="Right">
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZiChanChuKuBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td class="style1">
                        <a href="TTAssetMantanceReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZiChanWeiHuBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetScrapeReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZiChanBaoFeiBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetCheckReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZiChanPanDianBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetSummaryReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZiChanHuiZongBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTAssetSafetyStockReport.aspx" class="link" target="Right">
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,AnQuanKuCunBaoBiao%>"></asp:Label></a>
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
