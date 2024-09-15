<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRTXTest.aspx.cs" Inherits="TTRTXTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>发送消息提示</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <form id="form1" runat="server">
    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RTXLianJieCeShi%>"></asp:Label>
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
            <td align="left" style="padding: 5px 5px 5px 5px;">
                <br />
                <table style="position: relative">
                    <tr>
                        <td style="width: 100px; height: 39px;">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FuWuQiDiZhi%>"></asp:Label>：
                        </td>
                        <td style="width: 100px; height: 39px;">
                            <asp:TextBox ID="txtSvrIP" runat="server" Style="position: relative">127.0.0.1</asp:TextBox>
                        </td>
                        <td style="width: 128px; height: 39px;">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,AppServerDuanKou%>"></asp:Label>：
                        </td>
                        <td style="width: 100px; height: 39px;">
                            <asp:TextBox ID="txtSvrPort" runat="server" Style="position: relative">8006</asp:TextBox>
                        </td>
                    </tr>
                </table>
                <div>
                    <table style="width: 502px; position: relative">
                        <tr>
                            <td style="width: 133px">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiaoXiTiXingJieShouZhe%>"></asp:Label>：
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtReceivers" runat="server" Style="position: relative"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiTiXingBiaoTi%>"></asp:Label>：
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtMsgTitle" runat="server" Style="position: relative"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiTiXingTingLiuShiJian%>"></asp:Label>：
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtTime" runat="server" Style="position: relative"></asp:TextBox>
                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Miao%>"></asp:Label></td>
                        </tr>
                        <tr>
                            <td style="width: 133px">
                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiaoXiNeiRong%>"></asp:Label>：
                            </td>
                            <td style="width: 250px">
                                <asp:TextBox ID="txtMsgContent" runat="server" Style="position: relative" TextMode="MultiLine"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 133px; height: 26px;">
                            </td>
                            <td style="width: 250px; height: 26px;">
                                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Style="position: relative"
                                    Text="<%$ Resources:lang,FaSong%>" />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChaXunYongHuZhuangTai%>"></asp:Label><br />
                    <table style="width: 445px; position: relative">
                        <tr>
                            <td colspan="3">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：
                                <asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 100px">
                                <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Style="position: relative"
                                    Text="<%$ Resources:lang,ChaXunYongHuZhuangTai%>" />
                            </td>
                            <td>
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Style="position: relative;
                                    top: 0px; left: 0px;" Text="<%$ Resources:lang,YongHuQuanXianLieBiao%>" />
                            </td>
                            <td>
                                <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Style="position: relative"
                                    Text="<%$ Resources:lang,HuoQuBanBenXinXi%>" />
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:TextBox ID="txtResult" runat="server" Style="position: relative" TextMode="MultiLine"
                                    Height="134px" Width="423px"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
