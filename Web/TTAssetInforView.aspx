<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAssetInforView.aspx.cs" Inherits="TTAssetInforView" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>

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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>

            <div id="AboveDiv">
                <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                    <tr>
                        <td>

                            <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZiChanXinXi%>"></asp:Label>
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
                                    <td align="center">
                                        <table style="width: 90%;">
                                            <tr>
                                                <td style="width: 90%; text-align: right;">

                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server"
                                                        Visible="False"></asp:Label>&nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 90%; height: 1px;">
                                                    <asp:DataList ID="DataList1" runat="server" Width="90%" CellPadding="0" CellSpacing="0" ForeColor="#333333">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <ItemTemplate>
                                                            <table class="bian" style="width: 98%;" cellpadding="4" cellspacing="0">
                                                                <tr>
                                                                    <td style="text-align: right" width="10%">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 10%; text-align: left;">
                                                                        <%# DataBinder.Eval(Container.DataItem,"AssetCode") %>
                                                                    </td>
                                                                    <td style="width: 10%; text-align: right">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="width: 40%; text-align: left;">
                                                                        <%# DataBinder.Eval(Container.DataItem,"AssetName") %>
                                                                    </td>
                                                                    <td style="text-align: right" rowspan="5">
                                                                        <asp:Image ID="IM_ItemPhoto" Height="200px" Width="220px" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"PhotoURL") %>' /></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="10%" style="text-align: right">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                                                    <td style="width: 10%; text-align: left;"><%# DataBinder.Eval(Container.DataItem,"Type") %></td>
                                                                    <td style="width: 10%; text-align: right">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>： </td>
                                                                    <td style="width: 40%; text-align: left;"><%# DataBinder.Eval(Container.DataItem,"Price") %></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="3" style="text-align: left">
                                                                        <%# DataBinder.Eval(Container.DataItem,"Spec") %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>：
                                                                    </td>
                                                                    <td colspan="2" style="text-align: left">
                                                                        <%# DataBinder.Eval(Container.DataItem,"Position") %>
                                                                    </td>
                                                                    <td style="text-align: left;">IP:  <%# DataBinder.Eval(Container.DataItem,"IP") %>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right;">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="height: 8px; text-align: left;">
                                                                        <%# DataBinder.Eval(Container.DataItem,"OwnerName") %>
                                                                    </td>
                                                                    <td style="text-align: right; height: 8px;">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MaiRuShiJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="height: 8px; text-align: left;">
                                                                        <%# DataBinder.Eval(Container.DataItem,"BuyTime") %>
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                        </ItemTemplate>
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataList>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
