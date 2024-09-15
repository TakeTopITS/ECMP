<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractReportList.aspx.cs"
    Inherits="TTConstractReportList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                            <a href="TTConstractReceivablesReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongYingShouBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractPayableReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongYingFuBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractBankReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YinHangBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractImportReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JinKouYiLanBioa%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractIncomeExpenseReport.aspx" class="link" target="Right">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShouZhiBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractChangeReport.aspx" class="link" target="Right">
                                <asp:Label runat="server"  Text="<%$ Resources:lang,HeTongBianGengBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractCassificationAccountReport.aspx" class="link" target="Right">
                                <asp:Label runat="server" Text="<%$ Resources:lang,HeTongFengLiTaiZhuang%>"></asp:Label></a>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractExecuteReport.aspx" class="link" target="Right">
                                <asp:Label runat="server" Text="<%$ Resources:lang,HeTongTiQianZhiXingBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                     <tr>
                        <td>
                            <img src="ImagesSkin/docdtl.gif" alt="" />
                        </td>
                        <td style="height: 30px;">
                            <a href="TTConstractDIYQueryReport.aspx" class="link" target="Right">
                                <asp:Label runat="server" Text="<%$ Resources:lang,ZiDingYiBaoBiao%>"></asp:Label></a>
                        </td>
                    </tr>

                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
