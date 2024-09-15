<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserLogonLog.aspx.cs" Inherits="TTUserLogonLog" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanYongHuRiZhi%>"></asp:Label>
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
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 170px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="center">
                                                <table style="width: 170px;">
                                                    <tr>
                                                        <td style="width: 100%">
                                                            <asp:Calendar ID="Calendar1" runat="server"
                                                                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399"
                                                                Height="90%" ShowGridLines="True" Width="169px"
                                                                OnSelectionChanged="Calendar1_SelectionChanged">
                                                                <SelectedDayStyle BackColor="#CCCCFF" BorderStyle="Outset" Font-Bold="True" />
                                                                <SelectorStyle BackColor="#FFCC66" />
                                                                <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                                                                <OtherMonthDayStyle ForeColor="#CC9966" />
                                                                <NextPrevStyle Font-Size="9pt" ForeColor="#663399" />
                                                                <DayHeaderStyle BackColor="Honeydew" Font-Bold="True" Height="1px" />
                                                                <TitleStyle BackColor="#99CCCC" ForeColor="#336699" />
                                                            </asp:Calendar>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center">&nbsp;</td>
                                                    </tr>


                                                    <tr>
                                                        <td style="width: 166px; text-align: center">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QSRYHM%>"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="70%">
                                                                        <asp:TextBox ID="TB_UserName" Width="100%" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_FindUserName" runat="server"
                                                                            Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_FindUserName_Click" /></td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center; height: 21px;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QSRDLIP%>"></asp:Label>
                                                            :</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center; height: 21px;">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="70%">
                                                                        <asp:TextBox ID="TB_IP" runat="server" Width="100%"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:Button ID="BT_FindIP" runat="server" Text="<%$ Resources:lang,ChaXun%>"
                                                                            OnClick="BT_FindIP_Click" /></td>
                                                                </tr>
                                                            </table>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center; height: 21px;">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QXZDLLX%>"></asp:Label>
                                                            :</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center; height: 21px;">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="70%">
                                                                        <asp:DropDownList ID="DL_DeviceType" runat="server">
                                                                            <asp:ListItem>APP</asp:ListItem>
                                                                            <asp:ListItem>WEB</asp:ListItem>
                                                                        </asp:DropDownList>
                                                                        <td>
                                                                            <asp:Button ID="BT_FindDeviceType" runat="server" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_FindDeviceType_Click" />
                                                                        </td>
                                                                </tr>
                                                            </table>


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center">&nbsp;</td>
                                                    </tr>


                                                    <tr>
                                                        <td style="width: 166px; text-align: center">
                                                            <asp:Button ID="BT_AllUserLogonLog" runat="server" CssClass="inpuLong"
                                                                OnClick="BT_AllUserLogonLog_Click" Text="<%$ Resources:lang,SuoYouYongHuRiZhi%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 166px; text-align: center">
                                                            <asp:Button ID="BT_GetPosition" runat="server" CssClass="inpuLong"
                                                                OnClick="BT_GetPosition_Click" Text="<%$ Resources:lang,JiSuanDengLuWeiZhi%>" />
                                                        </td>
                                                    </tr>


                                                </table>
                                                <br />
                                            </td>
                                            <td style="padding-top: 5px">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="left" class="tdFullBorder" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td style="text-align: left; width: 60%;" colspan="2">
                                                                        <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label ID="LB_QueryScope" runat="server"
                                                                            Font-Size="9pt"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: right; width: 40%; padding-right: 10px" colspan="2">
                                                                        <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                    <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                        &nbsp;
                                                                    <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 100%;">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="6%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YongHuDaiMa%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongHuMingChen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="7%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YongHuIP%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="17%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DengLuWeiZhi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DengLuShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZuiXinShiYongShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>&nbsp;</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                            Height="25px" Width="100%"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UserCode" HeaderText="用户代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UserName" HeaderText="用户名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DeviceType" HeaderText="登录类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UserIP" HeaderText="用户IP">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Position" HeaderText="位置">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="17%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="LoginTime" HeaderText="登录时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="LastestTime" HeaderText="最新使用时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn ItemStyle-HorizontalAlign="Center">
                                                                                    <ItemTemplate>
                                                                                        <a href="TTUserOperateLogView.aspx?UserCode=<%# DataBinder.Eval(Container, "DataItem.UserCode") %>&OperateTime=<%# DataBinder.Eval(Container, "DataItem.LoginTime") %>" target="_blank">--><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangXiXinXi%>"></asp:Label>
                                                                                        </a>

                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
