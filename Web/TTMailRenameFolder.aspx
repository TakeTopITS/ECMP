<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailRenameFolder.aspx.cs" Inherits="MailRenameFolder" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>重命名文件夹</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body style="margin-left: 0; margin-top: 0; margin-left: 0">
    <form id="form1" runat="server">
        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
            <tr>
                <td height="31" class="page_topbj">
                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                        <tr>
                            <td align="left">
                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="29">
                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChongMingMingWenJianJia%>"></asp:Label>
                                        </td>
                                        <td width="5">
                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td align="center" style="padding: 10px 5px 5px 5px;">
                    <table cellspacing="0" cellpadding="3" width="98%" class="formBgStyle">

                        <tr style="line-height: 2;">
                            <td style="width: 5%" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="Name" runat="server" Width="300px" CssClass="InputCss"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfN" runat="server" ControlToValidate="Name" CssClass="GbText"
                                    Display="Dynamic" ErrorMessage="名称不能为空！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" width="150" align="right" class="formItemBgStyle"></td>
                            <td align="left" class="formItemBgStyle">
                                <font face="宋体">&nbsp;</font><asp:Button ID="RenameBtn" runat="server" Text="<%$ Resources:lang,QueDing%>"
                                    CssClass="inpu" OnClick="NewBtn_Click" /><font face="宋体">&nbsp;</font><asp:Button
                                        ID="ReturnBtn" runat="server" Text="<%$ Resources:lang,FanHui%>" CssClass="inpu" OnClick="ReturnBtn_Click"
                                        CausesValidation="False" />
                            </td>
                        </tr>
                    </table>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
