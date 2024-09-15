<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTNewCustomAdd.aspx.cs" Inherits="TTNewCustomAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新客户开发模组设定</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <form id="form1" runat="server">
        <div>
            <div id="AboveDiv">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XinKeHuMoZuSheDing%>"></asp:Label>
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
                        <td style="padding: 0px 5px 5px 5px;" valign="top">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="padding-top: 5px;">
                                        <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <span style="font-size: 11pt">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,KeHuMoZu%>"></asp:Label>：</span>
                                                    <asp:DropDownList ID="DL_CustomerModule" runat="server"
                                                        Width="110px" AutoPostBack="true" Height="20px">
                                                        <asp:ListItem Text="<%$ Resources:lang,MuBiaoKeHuMoKuai%>" Value="target"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,ChanPinBaoJiaMoKuai%>" Value="product"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,XiaoShouGenZongMoKuai%>" Value="sale"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,ZhouJianJiHuaBiao%>" Value="checkWeekPlan"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,ZhouJianWenTiBiao%>" Value="checkWeekProblem"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,HuiYiJiangPingJiLu%>" Value="checkWeekRecord"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,WenTiZhengGaiTongZhiDan%>" Value="checkWeekNotice"/>
                                                        <asp:ListItem Text="<%$ Resources:lang,WenTiHuiZong%>" Value="checkWeekTotal"/>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <span style="font-size: 11pt">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</span>
                                                    <asp:DropDownList ID="DL_WLType" runat="server" DataTextField="Type" DataValueField="Type"
                                                        Width="110px" AutoPostBack="true" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>：
                            <asp:DropDownList ID="DL_WFTemplate" runat="server" DataTextField="TemName" DataValueField="IdentifyString"
                                Width="210px" AutoPostBack="true" Height="20px">
                            </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr style="font-weight: bold; font-size: 11pt">
                                                <td style="text-align: center" class="formItemBgStyle" colspan="2">
                                                    <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" />&nbsp;&nbsp;<input type="button" value="返回" id="BT_Return" onclick="javascript:history.go(-1)" class="inpu" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>

        <asp:HiddenField ID="HF_ID" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
