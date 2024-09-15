<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPGoodsInforView.aspx.cs" Inherits="TTAPPGoodsInforView" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <a href="TTAPPGoodsSummaryReport.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                        <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                </td>
                                                <td width="5">
                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                            </tr>
                                        </table>
                                        <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <table style="width: 100%;">
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="DataList1" runat="server" Width="98%" CellPadding="0" CellSpacing="0" ForeColor="#333333">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>

                                          <div class="npb npbs" >

                                                <table class="bian" style="width: 100%;" cellpadding="4" cellspacing="0">
                                                    <tr>
                                                        <td style="text-align: right; width: 23%;">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"GoodsCode") %>
                                                            <br />
                                                            <%# DataBinder.Eval(Container.DataItem,"GoodsName") %>
                                                        </td>


                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                                        <td style="text-align: left;"><%# DataBinder.Eval(Container.DataItem,"Type") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label>： </td>
                                                        <td style="text-align: left;"><%# DataBinder.Eval(Container.DataItem,"Price") %></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%# DataBinder.Eval(Container.DataItem,"Spec") %>
                                                        </td>
                                                    </tr>
                                                    </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Position") %>
                                                            </td>
                                                        </tr>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuanLiRen%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DataBinder.Eval(Container.DataItem,"OwnerName") %>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right; height: 8px;">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <%# DateTime.Parse( DataBinder.Eval(Container.DataItem,"BuyTime").ToString()).ToString("yyyy-MM-dd") %>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td colspan="2" style="text-align: center;">
                                                            <asp:Image ID="IM_ItemPhoto" Height="200px" Width="220px" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"PhotoURL") %>' />
                                                        </td>
                                                    </tr>

                                                </table>

                                            </div>

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
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
