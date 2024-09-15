<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDisplayCustomErrorMessage.aspx.cs" Inherits="TTDisplayCustomErrorMessage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>错误消息</title>
    <style type="text/css">
        <!--
        body {
            font-size: 14px;
            line-height: 21px;
            color: #333333;
            bgcolor: #FFFFFF;
            margin-top: 10px;
        }

        .huizi {
            font-size: 14px;
            color:red;
        }
        -->
    </style>

    <script type="text/javascript" language="javascript">

        $(function () { if (top.location != self.location) { } else { CloseWebPage(); } });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="800" height="520" border="0" align="center" cellpadding="0" cellspacing="0" >
            <tr>
                <td valign="top" class ="huizi" style="padding-top :60px;">
                   ·<asp:Label ID="LB_ErrorText" runat="server"></asp:Label>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
