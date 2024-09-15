<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountFinancialIntervalSet.aspx.cs" Inherits="TTAccountFinancialIntervalSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>帐套区间选定</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
        .auto-style1
        {
            font-size: x-large;
            font-weight: bold;
        }
        .auto-style2
        {
            font-size: x-large;
        }
        </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
           
        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhangTaoQuJianXuanDing%>"></asp:Label>
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
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="center" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; width:90%;">
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" align="left" colspan="4">&nbsp; <span class="auto-style1">
                                                            <asp:Label ID="LB_YiXuanDingDeCaiWuZhangTaoQuJian" runat="server" Text="<%$ Resources:lang,YiXuanDingDeCaiWuZhangTaoQuJian%>"></asp:Label></span></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_ZhangTaoMingCheng" runat="server" Text="<%$ Resources:lang,ZhangTaoMingCheng%>"></asp:Label></td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                            <asp:Label ID="lbl_FinancialName" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_QuJianMingCheng" runat="server" Text="<%$ Resources:lang,QuJianMingCheng%>"></asp:Label></td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="lbl_IntervalName" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle" colspan="4">&nbsp; <b><span class="auto-style2">
                                                            <asp:Label ID="LB_GengGaiCaiWuZhangTaoQuJian" runat="server" Text="<%$ Resources:lang,GengGaiCaiWuZhangTaoQuJian%>"></asp:Label></span></b></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_ZhangTaoMingCheng1" runat="server" Text="<%$ Resources:lang,ZhangTaoMingCheng%>"></asp:Label></td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                            <asp:DropDownList ID="DL_FinancialID" runat="server" AutoPostBack="True" DataTextField="FinancialName" DataValueField="FinancialCode" OnSelectedIndexChanged="DL_FinancialID_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_QuJianMingCheng1" runat="server" Text="<%$ Resources:lang,QuJianMingCheng%>"></asp:Label></td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_IntervalID" runat="server" DataTextField="IntervalName" DataValueField="IntervalCode">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">&nbsp;</td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left; vertical-align: middle;">
                                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XuanDing%>" />
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
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
