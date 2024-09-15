<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCollaborationDetailMain.aspx.cs" Inherits="TTAppCollaborationDetailMain" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=1" />


<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
</head>

<frameset rows="500,*" frameborder="no" border="0" framespacing="0">
      <frame src="TTAppCollaborationDetail.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>" name="leftFrame"   / >
      <frame src="TTAppCollaborationDetailList.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>" name="rightFrame"  />
</frameset>

<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
