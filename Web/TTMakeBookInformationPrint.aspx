<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeBookInformationPrint.aspx.cs" Inherits="TTMakeBookInformationPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script type="text/javascript" language="javascript">
        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print()
            CloseLayer();
        }
    </script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <form id="form1" runat="server">
    <div>
        <table>
            <tr>
                <td>
                    <img src="Logo/school20140917163822logo.png" />
                </td>
                <td>
                    <asp:Image ID="Image1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TuShuMingCheng%>"></asp:Label>&nbsp;<asp:Label ID="LB_AssetName" runat="server" Text="*"></asp:Label></td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShiYongBuMen%>"></asp:Label>&nbsp;<asp:Label ID="LB_Department" runat="server" Text="*"></asp:Label></td>
                <td>
                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QiDongRiQi%>"></asp:Label>&nbsp;<asp:Label ID="LB_StartTime" runat="server" Text="*"></asp:Label></td>
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
