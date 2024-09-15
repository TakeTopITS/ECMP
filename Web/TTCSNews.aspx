<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCSNews.aspx.cs" Inherits="TTCSNews" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style>
        html
        {
            overflow-x: hidden;
        }
    </style>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <form id="form1" runat="server">
    <table width="100%" cellpadding="0" cellspacing="0">
        <tr>
            <td height="31" class="page_topbj">
                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                    <tr>
                        <td align="left">
                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="29">
                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                    </td>
                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                        <asp:Label ID="LB_CompanyNews" runat="server" Text="<%$ Resources:lang,LastestNews%>"></asp:Label>
                                    </td>
                                    <td width="5">
                                        <img alt="" src="ImagesSkin/main_top_r.jpg" width="5" height="31" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td valign="top" style="padding: 5px 5px 5px 5px">
                <asp:DataList ID="DataList1" runat="server" Width="98%">
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <%#DataBinder .Eval (Container.DataItem ,"Content") %>
                    </ItemTemplate>
                    <ItemStyle HorizontalAlign="Left" />
                </asp:DataList>
            </td>
        </tr>
    </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
