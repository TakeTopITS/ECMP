<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppReportViewTopFrame.aspx.cs" Inherits="TTAppReportViewTopFrame" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
     <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
      
            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td colspan="2" height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <%--<a href="TTAppReport.aspx" target ="_parent"  onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                     <a href="javascript:window.history.go(-1)" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">  
                                        <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <img src="ImagesSkin/return.png" alt="" />
                                                </td>
                                                <td align="left" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP"><asp:Label runat ="server" Text="<%$ Resources:lang,Back%>" />
                                                </td>
                                                <td width="5">
                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                </td>
                                            </tr>
                                        </table>
                                          <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                    </a>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
                </table> 
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
