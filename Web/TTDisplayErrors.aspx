<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDisplayErrors.aspx.cs" Inherits="TTDisplayErrors" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">

    <title>´íÎóÏûÏ¢</title>
    <style type="text/css">
        <!--
        body {
            font-size: 14px;
            line-height: 21px;
            color: #333333;
            bgcolor: #FFFFFF;
            margin-top: 150px;
        }

        .huizi {
            font-size: 14px;
            color: #666666;
        }
        -->
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="697" height="220" border="0" align="center" cellpadding="0" cellspacing="0" background="Images/error.jpg">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="4" cellpadding="4">
                        <tr>
                            <td width="24%">&nbsp;</td>
                            <td width="76%"><strong>
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XTFSCWYYHCSRX %>"></asp:Label>£º</strong></td>
                        </tr>
                    </table>
                    <table width="100%" border="0" cellspacing="4" cellpadding="3">
                        <tr>
                            <td width="24%" rowspan="6"></td>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MYQXSYCGN %>"></asp:Label>;</td>
                        </tr>
                         <tr>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label2222" runat="server" Text="<%$ Resources:lang,KNSHHGQQTCXTBCXJRSY %>"></asp:Label>;</td>
                        </tr>

                       <%-- <tr>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QJCNDSQYHSCSKJYXRQYMYCC %>"></asp:Label>;</td>
                        </tr>--%>
                      <%--  <tr>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QJCNSYDBBSHYBHCGNHMK %>"></asp:Label>;</td>
                        </tr>--%>
                        <tr>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,PZWJCWNZZSYDBBKNSBHGBB %>"></asp:Label>;</td>
                        </tr>
                        <tr>
                            <td width="76%" class="huizi">¡¤<asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RBNJQQLXXTGLY %>"></asp:Label>;</td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
