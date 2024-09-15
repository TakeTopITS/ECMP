<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionHandleRecord.aspx.cs"
    Inherits="TTCustomerQuestionHandleRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 800px;
            width: expression (document.body.clientWidth <= 800? "800px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

    </script>

</head>
<body>

    <form id="form1" runat="server">
        <div id="AboveDiv">
            <asp:DataList runat="server" HorizontalAlign="Center" CellPadding="0" ForeColor="#333333" Height="1px" Width="98%"
                ID="DataList3">
                <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White"></FooterStyle>
                <HeaderTemplate>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                        <tr>
                            <td width="7">
                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="7%" align="center">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                        </td>
                                        <td width="10%" align="center">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                        </td>
                                        <td width="20%" align="center">
                                            <strong>
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LianXiFangShi%>"></asp:Label></strong>
                                        </td>
                                        <td width="15%" align="center">
                                            <strong>
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuFangFa%>"></asp:Label></strong>
                                        </td>
                                        <td width="20%" align="center">
                                            <strong>
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChuLiShiJian%>"></asp:Label></strong>
                                        </td>
                                        <td width="8%" align="center">
                                            <strong>
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YongShiChangDu%>"></asp:Label></strong>
                                        </td>
                                        <td width="10%" align="center">
                                            <strong>
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                        </td>
                                        <td width="10%" align="center">
                                            <strong>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="6" align="right">
                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemStyle CssClass="itemStyle"></ItemStyle>
                <ItemTemplate>
                    <table cellpadding="4" cellspacing="0" width="100%">
                        <tr>
                            <td class="tdLeft" style="width: 7%; text-align: center;">
                                <%#DataBinder .Eval (Container .DataItem ,"ID") %> 
                            </td>
                            <td class="tdLeft" style="width: 10%; padding-left: 5px; text-align: left;">
                                <%#DataBinder.Eval(Container.DataItem, "CustomerAcceptor")%>
                            </td>
                            <td class="tdLeft" style="width: 20%; text-align: center;">
                                <%#DataBinder.Eval(Container.DataItem, "AcceptorContactWay")%>
                            </td>
                            <td class="tdLeft" style="width: 15%; text-align: center;">
                                <%#DataBinder.Eval(Container.DataItem, "HandleWay")%>
                            </td>
                            <td class="tdLeft" style="width: 20%; text-align: center;">
                                <%#DataBinder.Eval(Container.DataItem, "HandleTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                            </td>
                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                <%#DataBinder .Eval (Container .DataItem ,"UsedTime") %>
                                <%#DataBinder .Eval (Container .DataItem ,"TimeUnit") %>       
                            </td>
                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                <%#DataBinder .Eval (Container .DataItem ,"HandleStatus") %>
                            </td>
                            <td class="tdRight" style="width: 10%; text-align: center;">
                                <%#DataBinder .Eval (Container .DataItem ,"OperatorName") %>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChuLiNeiRong%>"></asp:Label>
                            </td>
                            <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">
                                <%#DataBinder.Eval(Container.DataItem, "HandleDetail")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KeFangPingJia%>"></asp:Label>
                            </td>
                            <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">
                                <%#DataBinder.Eval(Container.DataItem, "CustomerComment")%>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiaCiFuWuShiJian%>"></asp:Label>
                            </td>
                            <td class="tdRight" style="width: 10%; text-align: left; padding-left: 5px">
                                <%#DataBinder.Eval(Container.DataItem, "NextServiceTime")%>                   
                            </td>
                            <td class="tdLeft" style="width: 20%; text-align: center; font-size: 10pt;">
                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TiQianTongZhiTianShu%>"></asp:Label>
                            </td>
                            <td class="tdRight" colspan="6" style="text-align: left; padding-left: 5px">
                                <%#DataBinder.Eval(Container.DataItem, "PreDays")%>                   
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333"></SelectedItemStyle>
            </asp:DataList>
            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                <tr>
                    <td colspan="11" class="tdTopLine">&nbsp;
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
