<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPicture.aspx.cs" Inherits="TTPicture" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript">
        function AlertPicturePage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }

        $(function () { if (top.location != self.location) { } else { CloseWebPage(); } });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <input type="button" value="去拍照" onclick="AlertPicturePage('TTPictureFile.aspx')" /><br />
            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BaoCunPaiZhaoLuJing%>"></asp:Label>：<asp:TextBox ID="TXT_PictureUrl" runat="server" Width="500"></asp:TextBox>

        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
