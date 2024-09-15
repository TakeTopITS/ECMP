<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemExchangeRunning.aspx.cs" Inherits="TTSystemExchangeRunning" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                               
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                     <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShuJiJiaoHanFuWuQiDong%>"></asp:Label>
                                                                 
                                                                </td>
                                                                <td width="5">
                                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td></td>
                                                    <td align="right">间隔时间：</td>
                                                    <td align="left">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000"  ID="NB_IntervalTime" runat="server" Precision="0" Width="60px" Amount="5">0</NickLee:NumberBox>
                                                        秒</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top">
                                            <table width="98%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td valign="top" style="padding: 5px 5px 5px 5px;" style="font-size: smaller;">
                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10%" align="center">
                                                                                            <strong><asp:Label ID="Label12342" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="15%" align="center">
                                                                                              <strong><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="60%" align="center">
                                                                                              <strong><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZiXingMingLing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="15%" align="center">
                                                                                                <strong><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZiXingShiJian%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" DataKeyField="ID"
                                                                        ShowHeader="false" ForeColor="#333333" Width="100%" BorderWidth="0">
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderTemplate>
                                                                        </HeaderTemplate>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemTemplate>
                                                                            <table cellpadding="4" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                                    </td>
                                                                                    <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"DBServerName") %>
                                                                                    </td>
                                                                                    <td valign="top" style="width: 60%; text-align: left;"
                                                                                        class="tdLeft">
                                                                                        <span style="font-size: 9pt">&nbsp;<%#DataBinder .Eval (Container .DataItem ,"SqlOrderString") %></span></td>

                                                                                    <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"RunTime") %>
                                                                                    </td>
                                                                                </tr>

                                                                            </table>
                                                                        </ItemTemplate>
                                                                        
                                                                        <ItemStyle BackColor="#EFF3FB" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    </asp:DataList>
                                                                    <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                        <tr>
                                                                            <td colspan="11" class="tdTopLine">&nbsp;
                                                                                <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
                                                                                </asp:Timer>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
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
        <div style="position: absolute; left: 35%; top: 35%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
