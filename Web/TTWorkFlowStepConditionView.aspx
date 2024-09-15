<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowStepConditionView.aspx.cs"
    Inherits="TTWorkFlowStepConditionView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form2" runat="server">
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
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,TiaoJianSeZhi%>"></asp:Label>
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
                    <td class="tdBottom" style="padding: 5px 5px 5px 5px;">
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                            <tr>
                                <td width="7">
                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="10%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                </strong>
                                            </td>
                                            <td width="70%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,TiaoJianMiaoShu%>"></asp:Label>
                                                </strong>
                                            </td>
                                            <td width="20%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiaYiBu%>"></asp:Label>
                                                </strong>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="6" align="right">
                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                            </tr>
                        </table>
                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" GridLines="None"
                            Width="100%" ShowHeader="false">

                            <Columns>
                                <asp:BoundColumn DataField="StepID" HeaderText="步序">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="ConDetail" HeaderText="条件描述">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                </asp:BoundColumn>
                            </Columns>
                            <ItemStyle CssClass="itemStyle" />
                        </asp:DataGrid>

                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
