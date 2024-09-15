<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestionView.aspx.cs"
    Inherits="TTCustomerQuestionView" %>

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
                                    <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KHFWXXXX%>"></asp:Label>
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
                    <td valign="top">
                        <br />
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="6" style="text-align: center; height: 18px;">
                                    <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                        Width="100%">
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <HeaderTemplate>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="11%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuWuLeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YaoQiuDaFuShiJian%>"></asp:Label>间</strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,EMail%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="5%" align="center">
                                                                    <strong>
                                                                      <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CYHSJ%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="7%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                </tr>
                                            </table>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                <tr>
                                                    <td class="tdLeft" style="width: 5%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 11%; padding-left: 5px; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"ContactPerson") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder.Eval(Container.DataItem, "AnswerTime", "{0:yyyy/MM/dd}")%>
                                                    </td>
                                                    <td class="tdLeft" style="width: 15%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"Company") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"PhoneNumber") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"EMail") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 5%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem,"IsImportant") %>
                                                    </td>
                                                    <td class="tdLeft" style="width: 10%; text-align: center;">
                                                        <%#DataBinder.Eval(Container.DataItem, "SummitTime", "{0:yyyy/MM/dd hh:MM:ss}")%>
                                                    </td>
                                                    <td class="tdLeft" style="width: 7%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                    </td>
                                                    <td class="tdRight" style="width: 7%; text-align: center;">
                                                        <%#DataBinder .Eval (Container .DataItem, "RecorderCode") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WenTi%>"></asp:Label>
                                                    </td>
                                                    <td class="tdRight" colspan="7" style="width: 95%; text-align: left; padding-left: 5px">

                                                        <%#DataBinder .Eval (Container .DataItem,"Question") %>
                                                    </td>
                                                    <td class="tdLeft" style="text-align: Center;">
                                                        <%#DataBinder .Eval (Container .DataItem, "UserIP") %>
                                                    </td>
                                                    <td class="tdRight" colspan="2" style="text-align: Left;">
                                                        <%#DataBinder .Eval (Container .DataItem, "UserPosition") %>
                                                    </td>
                                                </tr>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataList>
                                    <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                        <tr>
                                            <td colspan="11" class="tdTopLine">&nbsp;
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
