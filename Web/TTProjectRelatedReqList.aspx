<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRelatedReqList.aspx.cs"
    Inherits="TTProjectRelatedReqList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
        <div>
            <br />
            <br />
            <table class="FullBorderTable">
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTMakeProjectRequirement.aspx?ProjectID=<%=Request.QueryString["ProjectID"].ToString()%>"
                            class="link" target="iframe" ><asp:Label ID="LB_hlCreateReq" runat="server" Text="<%$ Resources:lang,CreateReq%>"></asp:Label></a>
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="ImagesSkin/docdtl.gif" alt="" />
                    </td>
                    <td style="height: 30px;">
                        <a href="TTProjectRelatedReq.aspx?ProjectID=<%=Request.QueryString["ProjectID"].ToString()%>"
                            class="link" target="iframe" ><asp:Label ID="LB_hlRelatedReq" runat="server" Text="<%$ Resources:lang,RelatedReq%>"></asp:Label></a>
                    </td>
                </tr>
            </table>
        </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
