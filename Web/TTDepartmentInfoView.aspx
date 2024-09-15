<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDepartmentInfoView.aspx.cs"
    Inherits="TTDepartmentInfoView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.7.2.min.js"></script><script type="text/javascript" src="js/allAHandler.js"></script><script type="text/javascript" language="javascript">$(function () {if (top.location != self.location) { } else { CloseWebPage(); }});</script></head>
<body>

    <form id="form1" runat="server">

        <table style="width: 100%;" cellpadding="0" cellspacing="0" class="bian">
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
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZuZhiJiaGou%>"></asp:Label>
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
                <td valign="top" style="padding: 5px 0px 5px 0px; text-align :center ;">
                    <table width="50%" align="center" cellpadding="3" cellspacing="0" class="formBgStyle">
                        <tr>
                            <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                            </td>
                            <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                <asp:TextBox ID="TB_DepartCode" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%; text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                            </td>
                            <td style="text-align: left; width: 70%;" class="formItemBgStyle">
                                <asp:TextBox ID="TB_DepartName" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShangJiDaiMa%>"></asp:Label>：
                            </td>
                            <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                <asp:TextBox ID="TB_ParentCode" runat="server" Enabled="False"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 30%; height: 26px; text-align: right" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QuanXian%>"></asp:Label>：
                            </td>
                            <td style="width: 70%; height: 26px; text-align: left" class="formItemBgStyle">
                                <asp:DropDownList ID="DL_Authority" runat="server" AutoPostBack="True" Enabled="False">
                                    <asp:ListItem Value="所有" Text="<%$ Resources:lang,SuoYou%>"/>
                                    <asp:ListItem Value="部分" Text="<%$ Resources:lang,BuFen%>"/>
                                </asp:DropDownList>
                            </td>
                        </tr>

                    </table>
                    <br />
                    <table cellpadding="0" cellspacing="0" width="80%" align="center">
                        <tr>
                            <td align="left" style="height: 26px;">
                                <b>
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GLQXYHZXYHKKDCBM%>"></asp:Label>：</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GuanLianBuMenDaiMa%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="30%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanLianBuMenMingCheng%>"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeader="false"
                                    Width="100%">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    
                                    <ItemStyle CssClass="itemStyle" />
                                    <Columns>
                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="DepartCode" HeaderText="关联部门代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="DepartName" HeaderText="关联部门名称">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                        </asp:BoundColumn>
                                    </Columns>
                                </asp:DataGrid>
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>

            </tr>


        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
