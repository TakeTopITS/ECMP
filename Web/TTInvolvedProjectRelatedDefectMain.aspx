<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTInvolvedProjectRelatedDefectMain.aspx.cs" Inherits="TTInvolvedProjectRelatedDefectMain" %>


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

<frameset cols="150,*">
      <frame src="TTInvolvedProjectRelatedDefectList.aspx?ProjectID=<%=Request.QueryString["ProjectID"].ToString()%>" name="leftFrame" frameborder="no"  marginwidth="0" marginheight="0" allowtransparency="true" / >
      <frame src="TTProRelatedDefectSummary.aspx?ProjectID=<%=Request.QueryString["ProjectID"].ToString()%>" name="iframe" frameborder="no" marginwidth="0" marginheight="0" allowtransparency="true"/>
    </frameset>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
