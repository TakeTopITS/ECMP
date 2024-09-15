<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPDIYSystemMain.aspx.cs" Inherits="TTAPPDIYSystemMain" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            /*  if (top.location != self.location) { } else { CloseWebPage(); }*/
        });
    </script>

</head>
<frameset id="TakeTopMDI" rows="*,1" cols="*">
    <frameset id="bodyFrame" cols="*">

        <frame name="left" src="TTAPPDIYSystemHandleRecord.aspx?TemIdentifyString=<%=Request.QueryString["TemIdentifyString"].ToString()%>&ModuleName=<%=Request.QueryString["ModuleName"].ToString()%>">
            <%-- <frame  name="right" src="TTDIYSystemByForm.aspx?TemIdentifyString=<%=Request.QueryString["TemIdentifyString"].ToString()%>&ModuleName=<%=Request.QueryString["ModuleName"].ToString()%>">   --%>
    </frameset>
</frameset>


<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
