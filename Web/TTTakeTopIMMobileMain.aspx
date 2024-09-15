<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopIMMobileMain.aspx.cs"
    Inherits="TTTakeTopIMMobileMain" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head2" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script language="javascript" type="text/javascript">

        window.onload = function () {

            window.frames["imBottomFrame"].location.reload();
        }


        $(function () {



        });
    </script>

</head>
<frameset cols="45%,*" frameborder="no" border="0" framespacing="0">
   <frame id="imBottomFrame" name="imBottomFrame" src="TTTakeTopIMSend.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>&ChatterCode=<%=Request.QueryString["ChatterCode"].ToString()%>" />
   <frame id="imTopFrame" name="imTopFrame" src="TTTakeTopIMDetailView.aspx?CoID=<%=Request.QueryString["CoID"].ToString()%>&ChatterCode=<%=Request.QueryString["ChatterCode"].ToString()%>" / > 
</frameset>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
