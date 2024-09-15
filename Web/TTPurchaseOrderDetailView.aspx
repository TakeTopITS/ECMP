<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPurchaseOrderDetailView.aspx.cs"
    Inherits="TTPurchaseOrderDetailView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>
    <center>
        <form id="form1" runat="server">
            <div>
                <table width="100%">
                    <tr>
                        <td align="center">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                </td>
                                                <td width="6%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                </td>
                                                <td width="6%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                </td>
                                                <td width="16%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GouMaiLiYou%>"></asp:Label></strong>
                                                </td>
                                                <td width="14%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                ShowHeader="false" Width="100%">
                                <Columns>
                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="AssetName" HeaderText="名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                        DataTextField="ApplicantName" Target="_blank" HeaderText="申请人">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:HyperLinkColumn>
                                    <asp:BoundColumn DataField="PurReason" HeaderText="购买理由">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="16%" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="状态">
                                        <ItemTemplate>
                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                    </asp:TemplateColumn>
                                </Columns>
                                <ItemStyle CssClass="itemStyle"></ItemStyle>
                                <PagerStyle HorizontalAlign="Center"></PagerStyle>
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
