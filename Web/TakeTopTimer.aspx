<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopTimer.aspx.cs" Inherits="TakeTopTimer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="color: red; padding-top: 50px; text-align: center;">
            正在运行（RUNING)
            <br />
            <asp:Label ID="LB_RefresTime" runat="server"></asp:Label>
            <br />
            <asp:Label ID="LB_Timer" runat="server"></asp:Label>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
