<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPnPCameraShow.aspx.cs" Inherits="TTPnPCameraShow" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    
    <div style="width:100%; height:100%;">
        <iframe id="rightCamera" frameborder="0" name="rightCamera" src="" style="margin-top: 0px;" runat="server"></iframe>
    </div>
    
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
