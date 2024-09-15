<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCollaborationView.aspx.cs"
    Inherits="TTCollaborationView" %>

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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XieZuoMingXi%>"></asp:Label>
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
                    <td class="tdBottom">
                        <br />
                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Width="80%">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table style="width: 100%;" cellpadding="4" cellspacing="0" class="bian">
                                    <tr>
                                        <td style="width: 10%; text-align: right;">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                        </td>
                                        <td style="width: 30%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"CoID") %>
                                        </td>
                                        <td style="width: 20%; text-align: right;">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                        </td>
                                        <td style="width: 40%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"CreatorCode") %><%# DataBinder.Eval(Container.DataItem,"CreatorName") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; height: 13px;">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XieZuoMingCheng%>"></asp:Label>：
                                        </td>
                                        <td colspan="3" style="height: 13px" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"CollaborationName") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right; height: 81px;">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XieZuoNeiRong%>"></asp:Label>：
                                        </td>
                                        <td colspan="3" style="height: 81px" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"Comment") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <span style="font-size: 9pt">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：</span>
                                        </td>
                                        <td align="left">
                                            <%# DataBinder.Eval(Container.DataItem, "CreateTime")%>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                        </td>
                                        <td align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            
                            <ItemStyle CssClass="itemStyle" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        </asp:DataList>
                        <br />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
