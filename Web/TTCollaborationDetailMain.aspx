<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCollaborationDetailMain.aspx.cs"   Inherits="TTCollaborationDetailMain" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

</head>

<frameset cols="55%,*" frameborder="no" border="0" framespacing="0">
      <frame src="TTCollaborationDetail.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>" name="leftFrame"   / >
      <frame src="TTCollaborationDetailList.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>" name="rightFrame"  />
</frameset>

<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
