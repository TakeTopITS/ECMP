<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppWorkFlowManageMain.aspx.cs" Inherits="TTAppWorkFlowManageMain" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>


    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>




</head>
     
<frameset id="TakeTopMDI" rows="*,1" cols="*" frameborder="no" border="0" framespacing="0">
<frameset cols="500,1000" name="bodyFrame" id="bodyFrame" frameborder="no" border="0" framespacing="0">
    <frame  id="leftFrame" name="leftFrame"    src="TTAppWorkFlow.aspx">  
    <frame  id="rightFrame"  name="rightFrame"   src="TTAppWorkFlowDetailMain.aspx"> 
</frameset>
</frameset>
          
