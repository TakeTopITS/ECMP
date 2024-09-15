<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowView.aspx.cs" Inherits="TTWorkFlowView" %>

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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label> 
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
                        <asp:DataList ID="DataList2" runat="server" Height="22px" Width="90%" CellPadding="0"
                            ForeColor="#333333">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table style="width: 100%;" cellpadding="4" cellspacing="0" class="bian">
                                    <tr>
                                        <td style="width: 10%; text-align: right;">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label> 
                                        </td>
                                        <td style="width: 20%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"WLID") %>
                                        </td>
                                        <td style="width: 10%; text-align: right;">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label> 
                                        </td>
                                        <td style="width: 20%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"WLType") %>
                                        </td>
                                        <td style="width: 20%; text-align: right;">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label> 
                                        </td>
                                        <td style="width: 20%; font-size: 10pt" align="left">
                                            <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"CreatorCode") %>'
                                                target="_blank">
                                                <%# DataBinder.Eval(Container.DataItem,"CreatorName") %>
                                            </a>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label> 
                                        </td>
                                        <td colspan="5" style="text-align: left">
                                            <%# DataBinder.Eval(Container.DataItem,"WLName") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label> 
                                        </td>
                                        <td colspan="5" style="text-align: left">
                                            <%# DataBinder.Eval(Container.DataItem,"Description") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MoBan%>"></asp:Label> 
                                        </td>
                                        <td colspan="3" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"TemName") %>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label> 
                                        </td>
                                        <td style="text-align: left;">
                                            <%# DataBinder.Eval(Container.DataItem,"CreateTime") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 20px; text-align: right">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label> 
                                        </td>
                                        <td style="height: 20px; text-align: left">
                                            <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                        </td>
                                        <td style="height: 20px; text-align: right"></td>
                                        <td style="height: 20px; text-align: left"></td>
                                        <td style="height: 20px; text-align: right"></td>
                                        <td style="height: 20px; text-align: left"></td>
                                        <td style="height: 20px; text-align: left"></td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                            
                            <ItemStyle CssClass="itemStyle" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        </asp:DataList><asp:Label ID="LB_UserName" runat="server" Font-Italic="False"
                            Font-Size="9pt" Font-Underline="False"  Visible="False" Width="3px"></asp:Label><asp:Label
                                ID="LB_UserCode" runat="server"  Font-Underline="False"
                                 Visible="False" Width="24px"></asp:Label>
                        <br />
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
