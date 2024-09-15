<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMeetingView.aspx.cs" Inherits="TTMeetingView" %>

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
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HuiYiXinXi%>"></asp:Label>
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
                        <table width="80%" style="margin-top: 5px;">
                            <tr>
                                <td>
                                    <asp:DataList ID="DataList1" runat="server" CssClass="bian" CellPadding="0" ForeColor="#333333" Width="100%">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table width="100%" cellpadding="3" cellspacing="0">
                                                <tr>
                                                    <td style="width: 20%; text-align: right">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 80%; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Name") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Host") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"BeginTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"EndTime") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label>：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Organizer") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="height: 60px; text-align: right">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HuiYiNeiRong%>"></asp:Label>：
                                                    </td>
                                                    <td style="height: 60px; text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Content") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: Right;">
                                                        <a href='TTMeetingDocView.aspx?RelatedID=<%#DataBinder.Eval(Container.DataItem, "ID")%>'
                                                            target="_blank">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HuiYiWenDang%>"></asp:Label></a>
                                                    </td>
                                                    <td style="text-align: left;"></td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                    </asp:DataList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left; height: 20px;"></td>
                            </tr>
                            <tr>
                                <td style="text-align: left;">
                                    <table class="FullBorderTable" style="width: 700px">
                                        <tr>
                                            <td style="width: 151px; text-align: right">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YuHuiZhe%>"></asp:Label>：
                                            </td>
                                            <td style="width: 600px; text-align: left;">
                                                <asp:Repeater ID="RP_Attendant" runat="server">
                                                    <ItemTemplate>
                                                        <asp:Label ID="Label1" runat="server" style="margin:1px 0;" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                            Width="80px" />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
