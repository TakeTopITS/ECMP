<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserFeedbackSummary.aspx.cs"
    Inherits="TTUserFeedbackSummary" %>


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
    <form id="form1" runat="server">
        <table align="center" style="width: 700px">
            <tr>
                <td colspan="5" style="text-align: right; width: 700px;">&nbsp; 
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label> <strong><span
                        style="font-size: 11pt"> </strong>
                    <asp:Label ID="LB_UserName" runat="server" 
                        Width="62px" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="width: 700px" align="center">
                    <span>
                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FanKuiYiJianLieBiao%>"></asp:Label>:
                </td>
            </tr>
            <tr>
                <td colspan="5" style="width: 700px">
                    <asp:DataList ID="DataList1" CellPadding="0" CellSpacing="0" runat="server" Width="700px">
                        <ItemTemplate>
                            <table cellpadding="4" cellspacing="0" class="bian" style="width: 700px">
                                <tr>
                                    <td style="width: 150px; text-align: center">
                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                    </td>
                                    <td style="width: 200px; text-align: center">
                                        <%#DataBinder .Eval (Container .DataItem ,"FBTime","{0:yyyy/MM/dd}") %>
                                    </td>
                                    <td style="width: 200px; text-align: center"></td>
                                    <td style="width: 150px; text-align: center"></td>
                                </tr>
                                <tr>
                                    <td style="width: 150px; text-align: right">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FanKuiYiJian%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" style="width: 550px; text-align: left">
                                        <span style="font-size: 9pt">
                                            <%#DataBinder .Eval (Container .DataItem ,"Feedback") %>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 19px; text-align: right"></td>
                                </tr>
                            </table>
                        </ItemTemplate>
                        <HeaderTemplate>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="150" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="200" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label></strong>
                                                </td>
                                                <td width="200" align="center">
                                                    <strong></strong>
                                                </td>
                                                <td width="150" align="center">
                                                    <strong></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>
                        </HeaderTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td colspan="5" style="width: 700px"></td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
