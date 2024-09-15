<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectManageOuter.aspx.cs" Inherits="TTProjectManageOuter" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<frameset rows="45,*" frameborder="no" framespacing="0">
    <frame src="TTPMTabOuter.aspx" name="topPMFrame" frameborder="no" scrolling="no" marginwidth="0" marginheight="0" />
    <frame src="TTInvolvedProject.aspx" name="detailPMFrame" frameborder="no" scrolling="auto" marginwidth="0" marginheight="0" />
</frameset>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
