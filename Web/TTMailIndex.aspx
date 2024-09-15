<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailIndex.aspx.cs" Inherits="Index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title></title>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>

    <frameset id="Frame" cols="180,*"  border="0" framespacing="0" framepadding="0">
	    <frame name="Left" src="TTMailLeftTree.aspx" scrolling="auto" frameborder="0"  framepadding="0" framespacing="0"  >
	    <frame name="Desktop" src="TTMailDesktop.aspx" scrolling="auto" frameborder="0" framepadding="0" framespacing="0" style=" border-left:solid 1px #D8D8D8;border-right:solid 1px #D8D8D8;border-bottom:solid 1px #D8D8D8;">
    </frameset>

<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
