<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMManagement.aspx.cs" Inherits="TTBMManagement" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link href="css/tab_CSCC.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="CSS/tab.js"></script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="AboveDiv">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhaoBiaoXinXi%>"></asp:Label>
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
                    <td width="100%">

                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr>
                                <td align="left">
                                    <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="18" Width="100%"
                                        CellPadding="0" ForeColor="#333333" GridLines="None" ShowHeader="False" Height="1px">
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="1%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BidWay" HeaderText="招标方式">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Remark" HeaderText="招标内容">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="45%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="EnterDate" HeaderText="编制日期" DataFormatString="{0:yyyy-MM-dd}">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="中标信息">
                                                <ItemTemplate>
                                                    <%# GetSupplierName(Eval("ID").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Left" Width="15%" />
                                            </asp:TemplateColumn>
                                        </Columns>

                                        <ItemStyle CssClass="itemStyle" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>

                    </td>
                </tr>
            </table>

            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>

        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
