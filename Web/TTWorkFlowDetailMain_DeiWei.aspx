<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowDetailMain_DeiWei.aspx.cs" Inherits="TTWorkFlowDetailMain_DeiWei" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            var MustInFrame = '<%=Session["MustInFrame"].ToString() %>'.trim();
            if (MustInFrame == 'YES') {
                if (top.location != self.location) { } else { CloseWebPage(); }
            }

        });
    </script>
</head>
<frameset id="TakeTopMDI" rows="*,1" cols="*">
<FRAMESET id="bodyFrame" rows="*,175" frameborder="yes" border="1" framespacing="1" class="bian">
 
     <frame  name="right" src="TTWorkFlowDetailData.aspx?ID=<%=Request.QueryString["ID"].ToString()%>" > 

     <frame  name="left" src="TTWorkFlowDetail.aspx?ID=<%=Request.QueryString["ID"].ToString()%>">   
 
</FRAMESET>
</frameset>


<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
