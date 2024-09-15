<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailProfileSet.aspx.cs"
    Inherits="TTMailProfileSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>邮件系统配置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
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
                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                        </td>
                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YouJianXiTongPeiZhi%>"></asp:Label>
                                        </td>
                                        <td width="5">
                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td valign="top" style="padding: 10px 5px 10px 5px;">
                    <table align="center" cellspacing="0" cellpadding="3" width="98%" class="formBgStyle">
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YongHuMingCheng%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_UserName" runat="server" Width="300px">Admin</asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfN" runat="server" ControlToValidate="TB_UserName"
                                    Display="Dynamic" ErrorMessage="名称不能为空！"></asp:RequiredFieldValidator>
                                <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150; height: 31px;" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DianZiYouJian%>"></asp:Label>(Email)
                            </td>
                            <td style="height: 31px" align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_Email" runat="server" Width="300px" CssClass="InputCss">admin@gmail.com</asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfE" runat="server" ControlToValidate="TB_Email"
                                    Display="Dynamic" ErrorMessage="电子邮件不能为空！"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="reE" runat="server" ControlToValidate="TB_Email"
                                    Display="Dynamic" ErrorMessage="电子邮件的格式不正确！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DengLuMing%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_AliasName" runat="server" Width="300px" CssClass="InputCss">Admin</asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfA" runat="server" ControlToValidate="TB_AliasName"
                                    Display="Dynamic" ErrorMessage="名称不能为空！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="line-height: 2">
                            <td align="right" style="height: 31px" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>:
                            </td>
                            <td style="height: 31px" align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_Password" runat="server" CssClass="InputCss" TextMode="Password"
                                    Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TB_Password"
                                    Display="Dynamic" ErrorMessage="密码不能为空！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>

                        <tr style="line-height: 2">
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,POP3DiZhi%>"></asp:Label>&nbsp;</td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_Pop3ServerIP" runat="server" CssClass="InputCss" Width="300px">pop.gmail.com</asp:TextBox>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle"></td>
                            <td style="width: 150" align="left" class="formItemBgStyle">
                                <asp:CheckBox ID="CB_EnablePOPSSL" runat="server" Text="EnablePOPSSL" />
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,POP3DuanKou%>"></asp:Label>&nbsp;</td>
                            <td align="left" class="formItemBgStyle">
                                <font face="宋体">
                                    <asp:TextBox ID="TB_Pop3ServerPort" runat="server" CssClass="InputCss" Width="300px">25</asp:TextBox></font>
                            </td>
                        </tr>

                        <tr style="line-height: 2;">
                            <td style="width: 150; height: 31px;" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,SMTPDiZhi%>"></asp:Label>&nbsp;</td>
                            <td style="height: 31px" align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_SmtpIP" runat="server" Width="300px" CssClass="InputCss">smtp.gmail.com</asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfI" runat="server" ControlToValidate="TB_SmtpIP"
                                    Display="Dynamic" ErrorMessage="IP地址不能为空！"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle"></td>
                            <td style="width: 150" align="left" class="formItemBgStyle">
                                <asp:CheckBox ID="CB_EnableSMTPSSL" runat="server" Text="EnableSMTPSSL" />
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td style="width: 150" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,SMTPDuanKou%>"></asp:Label>&nbsp;</td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_SmtpPort" runat="server" Width="300px" CssClass="InputCss">25</asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfP" runat="server" ControlToValidate="TB_SmtpPort"
                                    Display="Dynamic" ErrorMessage="端口不能为空！"></asp:RequiredFieldValidator>
                                <asp:RangeValidator ID="rvP" runat="server" ControlToValidate="TB_SmtpPort" Display="Dynamic"
                                    ErrorMessage="端口输入范围错误！" MaximumValue="65535" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                            </td>
                        </tr>


                        <tr style="line-height: 2;">
                            <td style="width: 150" width="150" align="right" class="formItemBgStyle"></td>
                            <td align="left" class="formItemBgStyle">
                                <font face="宋体"></font>
                                <asp:Button ID="BT_Add" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Add_Click" /><font
                                    face="宋体"></font>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
