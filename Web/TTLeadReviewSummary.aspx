<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTLeadReviewSummary.aspx.cs"
    Inherits="TTLeadReviewSummary" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }
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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangJiPingHeHuiZong%>"></asp:Label>
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
                    <td class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">

                        <br />

                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="height: 16px; padding: 5px 5px 5px 5px;" align="right">
                                    <a href="#" onclick="preview1()">
                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                    </a></td>
                            </tr>
                        </table>
                        <!--startprint1-->
                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                    <br />
                                    <strong>
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,ShangJiPingHeHuiZong%>"></asp:Label>
                                    </strong>
                                    <br />
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="40%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PingHeRiQi%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="40%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,PingHeRen%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataList ID="DataList1" runat="server" Width="98%" CellPadding="0" ForeColor="#333333">
                                        <ItemTemplate>
                                            <table style="width: 100%;" cellpadding="4" cellspacing="0">
                                                <tr>
                                                    <td style="width: 20%; text-align: center" class="tdRight">
                                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                    </td>
                                                    <td style="width: 40%; text-align: center" class="tdLeft">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ReviewTime","{0:yyyy/MM/dd}") %>
                                                    </td>
                                                    <td style="width: 40%; text-align: center" class="tdRight">
                                                        <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 20%; text-align: center" class="tdRight">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,PingHeYiJian%>"></asp:Label>
                                                    </td>
                                                    <td colspan="3" style="text-align: left; padding-left: 5px" class="tdRight">
                                                        <span style="font-size: 9pt">&nbsp;<%#DataBinder .Eval (Container .DataItem ,"Review") %>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle CssClass="itemStyle" />
                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    </asp:DataList>
                                </td>
                            </tr>
                        </table>
                        <!--endprint1-->

                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label
                            ID="LB_UserName" runat="server" Width="62px" Visible="False"></asp:Label>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
