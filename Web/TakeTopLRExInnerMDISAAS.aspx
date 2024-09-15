<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopLRExInnerMDISAAS.aspx.cs" Inherits="TakeTopLRExInnerMDISAAS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <style>

#leftTopFrameID {background: #D53E54;}
#leftMiddleFrameID{background: linear-gradient(180deg, #D53E54 0%, #057BF9 100%);}
#rightTopFrameID{background: linear-gradient(90deg, #D53E54 0%, #057BF9 100%);}
/* #rightTabFrameID{background: #EFF2F7;} */



    </style>
</head>
<frameset id="TakeTopLRMDI" cols="45,*" rows="*" frameborder="no" border="0" framespacing="0">

    <frameset rows="43,*,1" name="leftFrame" id="leftFrame" frameborder="no" border="0" framespacing="0">
        <frame src='TakeTopLRTop.aspx?UserCode=<%=strUserCode%>&Flag=<%=Session["SkinFlag"].ToString() %>' id="leftTopFrameID" name="lefTopFrame" scrolling="no" noresize />
        <frame src='TakeTopLRExLeft.aspx?UserCode=<%=strUserCode%>&Flag=<%=Session["SkinFlag"].ToString()%>' id="leftMiddleFrameID" name="leftMiddleFrame" scrolling="auto" noresize />
        <frame src='TakeTopSystemOtherCodeRunPage.aspx?UserCode=<%=strUserCode%>&Flag=<%=Session["SkinFlag"].ToString()%>' id="leftUpdateFrameID" name="leftUpdateFrame" scrolling="no" noresize />
    </frameset>

    <frameset rows="0,*" name="rightFrame" id="rightFrame" frameborder="no" border="0" framespacing="0">
        <frame src='TakeTopMainTopSAAS.aspx?UserCode=<%=strUserCode%>&Flag=<%=Session["SkinFlag"].ToString()%>' id="rightTopFrameID" name="rightTopFrame" frameborder="no" scrolling="no" marginwidth="0" marginheight="0" marginbottom="0" />
        <frame src='TakeTopMainTab.aspx?UserCode=<%=strUserCode%>&Flag=<%=Session["SkinFlag"].ToString()%>' id="rightTabFrameID" name="rightTabFrame" scrolling="no" />
    </frameset>

</frameset>


<noframes>
    <body>你的浏览器不支持框架！</body>
</noframes>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
