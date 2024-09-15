<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUnHandledCaseList.aspx.cs"
    Inherits="TTUnHandledCaseList" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table style="border-collapse: collapse;">
                <tr>
                    <td style="vertical-align: bottom; text-align: center; width: 180px;">
                        <br />
                        <table style="width: 170px">
                            <tr>
                                <td colspan="2">
                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="False" AutoGenerateColumns="False" PageSize="18" Width="100%"
                                        CellPadding="0" ForeColor="#333333" GridLines="None" ShowHeader="False" Height="1px">
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="1%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <a href='<%#DataBinder .Eval (Container .DataItem,"LinkAddress") %>' target="rightFrame">
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <%#DataBinder .Eval (Container .DataItem,"HomeName") %> ：
                                                                </td>
                                                                <td><%# GetNumberCount(Eval("SQLCode").ToString()) %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </a>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="dibian2" HorizontalAlign="Center" Width="10%" />
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
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
