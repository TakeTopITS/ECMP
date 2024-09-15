<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectPrimaveraData.aspx.cs" Inherits="TTProjectPrimaveraData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <contenttemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="1500px" cellspacing="0" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuDaoChuDaoRu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding-left: 5px;">
                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left">
                                                <table width="50%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XMDCJKBM%>"></asp:Label>
                                                            ：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="ddl_Code" runat="server" DataTextField="Code" DataValueField="Code">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="<%$ Resources:lang,DaoChuXiangMuWBS%>" Width="120px" />
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="<%$ Resources:lang,DaoRuXiangMuWBS%>" Width="120px"  />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XMDRJKBM%>"></asp:Label>
                                                            ：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZYEJXMGLPT%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="<%$ Resources:lang,DaoChuXiangMuZuoYe%>" Width="120px" />
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="<%$ Resources:lang,DaoRuZuoYeShuJu%>" Width="120px" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: center" colspan="2">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QAZDRXMWBS%>"></asp:Label>
                                                            —&gt;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaoRuZuoYeShuJu%>"></asp:Label>—&gt;<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DRXMFYBZYCJXQWDLSXFZWFDRSJ%>"></asp:Label></td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="<%$ Resources:lang,DaoChuXiangMuFeiYong%>" Width="120px" />
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: center">
                                                            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="<%$ Resources:lang,DaoRuXiangMuFeiYong%>"  Width="120px" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr style="font-size: 10pt">
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </contenttemplate>
                <triggers>
                    <%--       <asp:PostBackTrigger ControlID="Button1" />
                    <asp:PostBackTrigger ControlID="Button2" />
                    <asp:PostBackTrigger ControlID="Button3" />--%>
                    <asp:PostBackTrigger ControlID="Button4" />
                    <asp:PostBackTrigger ControlID="Button5" />
                    <asp:PostBackTrigger ControlID="Button6" />
                </triggers>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <progresstemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </progresstemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
