<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppReportViewMain.aspx.cs" Inherits="TTAppReportViewMain" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
</head>
<frameset id="TakeTopMDI" rows="*,1" cols="*" frameborder="no" border="0" framespacing="0">
<FRAMESET id="bodyFrame" rows="50, *"  frameborder="no" border="0" framespacing="0">
 
 <frame  name="top" src="TTAppReportViewTopFrame.aspx">   
 <frame  name="bottom" src="TTAppReportViewFrame.aspx?LinkAddress=<%=Request.QueryString["LinkAddress"].ToString()%>"> 
 
</FRAMESET>
</frameset>


<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
