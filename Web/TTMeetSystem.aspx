<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMeetSystem.aspx.cs" Inherits="TTMeetSystem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body scrolling="no">
    <form id="form1" runat="server">
    <div style="width:100%; height:100%;">
        <iframe id="IFrameMeet" frameborder="0" name="IFrameMeet" scrolling="no" src=""
             style="margin-top: 0px; height:100%; width:100%;" runat="server"></iframe>
    </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
