<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsUserRecordList.aspx.cs"
    Inherits="TTGoodsUserRecordList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

    </script>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChanPinTiaoPeiJiLu%>"></asp:Label>
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
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td style="padding: 5px 5px 5px 5px;">
                                            <table style="width: 98%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td colspan="6" style="text-align: center; padding-top: 5px">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>

                                                                            <td width="9%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="20%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="18%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiYongShiJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="18%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiShiYongShiJian%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                    DataTextField="UserName" HeaderText="用户" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Position" HeaderText="位置">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="BeginUseTime" HeaderText="开始使用时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="EndUseTime" HeaderText="结束使用时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                        <asp:Label ID="LB_Sql1" runat="server"  Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_GoodsCode" runat="server"  Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_GoodsID" runat="server"  Visible="False"></asp:Label>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
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
