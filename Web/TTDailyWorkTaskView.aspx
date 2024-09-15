<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDailyWorkTaskView.aspx.cs"
    Inherits="TTDailyWorkTaskView" %>

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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenWuFenPaiJiLuHuiZong%>"></asp:Label>
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
                            <td class="tdBottom">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>

                                            <table cellpadding="0" cellspacing="0" width="98%">
                                                <tr>
                                                    <td align="left" class="tdFullBorder" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                        <table style="width: 90%">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HuiZong%>" />:
                                                                    <asp:Label ID="LB_Total" runat="server"></asp:Label>
                                                                </td>
                                                               
                                                                <td style="background: #f0f0f0; text-align: right; width: 300px; display: none;" colspan="2">
                                                                      <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label ID="LB_QueryScope" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                                <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                                <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table cellpadding="0" cellspacing="0" width="98%" style="margin-top: 5px">
                                                            <tr>
                                                                <td style="width: 100%">
                                                                    <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemTemplate>
                                                                            <table width="100%" class="bian" cellpadding="5" cellspacing="0">
                                                                                <tr>
                                                                                    <td style="width: 10%; text-align: right;">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>:</strong>
                                                                                    </td>
                                                                                    <td style="width: 23%; text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                                                    </td>
                                                                                    <td style="width: 10%; text-align: right;">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>: </strong>
                                                                                    </td>
                                                                                    <td style="width: 23%; text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                                                    </td>
                                                                                    <td style="width: 10%; text-align: right;">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RenWuHao%>"></asp:Label>:</strong>
                                                                                    </td>
                                                                                    <td style="width: 23%; font-size: 10pt; text-align: left;">
                                                                                        <a href='TTProjectTaskView.aspx?TaskID=<%# DataBinder.Eval(Container.DataItem,"TaskID") %>'
                                                                                            target="_blank">
                                                                                            <%# DataBinder.Eval(Container.DataItem,"TaskID") %></a>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right">
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td colspan="3" style="text-align: left">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                                                    </td>
                                                                                    <td style="text-align: right">
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaoZuoZhe%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="font-size: 10pt; width: 135px; text-align: left">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperatorName") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FenPaiZhe%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left; font-size: 10pt">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"AssignManCode") %><%# DataBinder.Eval(Container.DataItem,"AssignManName") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right; height: 17px;">
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FenPaiZheYiJian%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td colspan="5" style="height: 17px; text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"Content") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperatorName") %>
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouLiRenShiJian%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;" colspan="3">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperationTime","{0:yyyy/MM/dd}") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right">
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouLiRenFanKui%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td colspan="3" style="text-align: left">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"OperatorContent") %>
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left; font-size: 10pt">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left; font-size: 10pt">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %>%
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"ManHour") %>
                                                                                    </td>
                                                                                    <td style="text-align: right;">
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>:
                                                                                    </td>
                                                                                    <td style="text-align: left;">
                                                                                        <%# DataBinder.Eval(Container.DataItem,"Expense") %>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td colspan="6" style="font-size: 10pt; height: 14px; text-align: left"></td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                    </asp:DataList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 800px; height: 16px; text-align: left;">
                                                                    <asp:Label ID="LB_Sql" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                    <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>
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
                            </td>
                        </tr>
                    </table>
                    </div>
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
