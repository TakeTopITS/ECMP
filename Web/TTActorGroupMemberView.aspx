<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTActorGroupMemberView.aspx.cs"
    Inherits="TTActorGroupMemberView" %>

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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JueSeZuChengYuanXinXi%>"></asp:Label>
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
                    <td>
                        <br />
                        <table width="90%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                            <tr>
                                <td width="7">
                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                </td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td width="10%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                            </td>
                                            <td width="15%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                            </td>
                                            <td width="15%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label></strong>
                                            </td>
                                            <td width="60%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label></strong>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="6" align="right">
                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                </td>
                            </tr>
                        </table>
                        <asp:DataGrid ID="DataGrid2" runat="server" Width="90%" AutoGenerateColumns="False"
                            ShowHeader="false" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
                            <Columns>
                                <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Actor" HeaderText="角色">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                </asp:BoundColumn>
                            </Columns>
                            
                            <ItemStyle CssClass="itemStyle" />
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <EditItemStyle BackColor="#2461BF" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                        </asp:DataGrid>
                        <br />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
