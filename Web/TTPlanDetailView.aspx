<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPlanDetailView.aspx.cs" Inherits="TTPlanDetailView" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
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
                            <td style="padding-top: 5px">

                                <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                    Width="100%">
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderTemplate>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="30%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangJiPingFen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiXingRen%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                            <tr>
                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem ,"PlanID") %>
                                                </td>
                                                <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem,"PlanType") %>
                                                </td>
                                                <td class="tdLeft" style="width: 30%; text-align: left;">
                                                    <%#DataBinder .Eval (Container .DataItem,"PlanName") %>
                                                </td>
                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                    <%#DataBinder.Eval(Container.DataItem, "StartTime", "{0:yyyy/MM/dd}")%>
                                                </td>
                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                    <%#DataBinder.Eval(Container.DataItem, "EndTime", "{0:yyyy/MM/dd}")%>
                                                </td>
                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem,"Progress") %>%
                                                </td>
                                                <td class="tdLeft" style="width: 8%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem,"ScoringBySelf") %>
                                                </td>
                                                <td class="tdLeft" style="width: 8%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem,"ScoringByLeader") %>
                                                </td>
                                                <td class="tdLeft" style="width: 8%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                </td>
                                                <td class="tdRight" style="width: 6%; text-align: center;">
                                                    <%#DataBinder .Eval (Container .DataItem, "UserName") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                </td>
                                                <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                    <span style="font-size: 9pt"></span>
                                                    <%#DataBinder .Eval (Container .DataItem,"PlanDetail") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <ItemStyle CssClass="itemStyle" />
                                </asp:DataList>

                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
