<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserAttendanceRecordForMe.aspx.cs" Inherits="TTUserAttendanceRecordForMe" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1980px;
            width: expression (document.body.clientWidth <= 1980? "1980px" : "auto" ));
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" width="345">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WoDeKaoQin%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" width="345">
                                              
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="padding: 5px 0px 5px 5px"
                                                valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,KaoQinGuiZe%>"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td align="center" width="3%"><strong>ID</strong> </td>
                                                                                
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label268" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label269" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label53" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label272" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label273" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label274" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label275" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label46" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label276" runat="server" Text="<%$ Resources:lang,WanBanShangBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label277" runat="server" Text="<%$ Resources:lang,WanBanShangBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label48" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label278" runat="server" Text="<%$ Resources:lang,WanBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label279" runat="server" Text="<%$ Resources:lang,WanBanXiaBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label49" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label2118" runat="server" Text="<%$ Resources:lang,JiaBanShangBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label281" runat="server" Text="<%$ Resources:lang,JiaBanShangBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label50" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>

                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label282" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label283" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanJieShuShiJian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="2%"><strong>
                                                                                    <asp:Label ID="Label52" runat="server" Text="IsMust"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="4%"><strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                                                                                </strong>(<asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)</td>


                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="false" CellPadding="4" ForeColor="#333333"
                                                                GridLines="None"  Width="100%" PageSize="20">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:BoundColumn>
                                                                 
                                                                    <asp:BoundColumn DataField="CreateDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="建立时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MCheckInStart" HeaderText="早班上班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MCheckInEnd" HeaderText="早班上班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MCheckInIsMust" HeaderText="早班上班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MCheckOutStart" HeaderText="早班下班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MCheckOutEnd" HeaderText="早班下班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MCheckOutIsMust" HeaderText="早班下班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="ACheckInStart" HeaderText="中班上班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ACheckInEnd" HeaderText="中班上班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ACheckInIsMust" HeaderText="中上午上班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="ACheckOutStart" HeaderText="中班下班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ACheckOutEnd" HeaderText="中班下班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ACheckOutIsMust" HeaderText="中午下班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="NCheckInStart" HeaderText="晚班上班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="NCheckInEnd" HeaderText="晚班上班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="NCheckInIsMust" HeaderText="晚班上班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="NCheckOutStart" HeaderText="晚班下班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="NCheckOutEnd" HeaderText="晚班下班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="NCheckOutIsMust" HeaderText="晚班下班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="OCheckInStart" HeaderText="加班上班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OCheckInEnd" HeaderText="加班上班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OCheckInIsMust" HeaderText="加班上班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="OCheckOutStart" HeaderText="加班下班开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OCheckOutEnd" HeaderText="加班下班结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="OCheckOutIsMust" HeaderText="加班下班必须">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LargestDistance" HeaderText="允许最大距离">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                         
                                                            <asp:Label ID="Label2120" runat="server" Text="<%$ Resources:lang,WoDeKaoQinJiLu%>" ></asp:Label>
                                                            <asp:DropDownList ID="DL_DisplayType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_DisplayType_SelectedIndexChanged">
                                                                <asp:ListItem Value="显示异常" Text="<%$ Resources:lang,XianShiYiChang%>" />
                                                                <asp:ListItem Value="显示全部" Text="<%$ Resources:lang,XianShiQuanBu%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="2%" align="center">
                                                                                    <strong>ID</strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuGuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ChuQingRiQi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WanBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WanBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiaBanShangBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label></strong>
                                                                                    (<asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>)
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ChiDao%>"></asp:Label></strong>
                                                                                    (<asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>)
                                                                                </td>

                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZaoTui%>"></asp:Label></strong>
                                                                                    (<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>)
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,WeiZhi%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ShowHeader="false" ForeColor="#333333" GridLines="None" AllowPaging="True" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                PageSize="100" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LeaderName" HeaderText="主管">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="AttendanceDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="考勤日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("MCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckInDistance").ToString().Trim () %> (m)
                                                              
                                                                 <br />
                                                                            IsMust:<%# Eval("MCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("MCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("MCheckOutDistance").ToString().Trim () %> (m)
                                                                
                                                                <br />
                                                                            IsMust:<%# Eval("MCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("ACheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckInDistance").ToString().Trim () %> (m)
                                                                
                                                                  <br />
                                                                            IsMust:<%# Eval("ACheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("ACheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("ACheckOutDistance").ToString().Trim () %> (m)
                                                                 
                                                                  <br />
                                                                            IsMust:<%# Eval("ACheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("NCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckInDistance").ToString().Trim () %> (m)
                                                                
                                                                  <br />
                                                                            IsMust:<%# Eval("NCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("NCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("NCheckOutDistance").ToString().Trim () %> (m)
                                                               
                                                                  <br />
                                                                            IsMust: <%# Eval("NCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("OCheckIn").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckInAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckInDistance").ToString().Trim () %> (m)
                                                                 
                                                                    <br />
                                                                            IsMust: <%# Eval("OCheckInIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <%# Eval("OCheckOut").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckOutAddress").ToString().Trim () %>
                                                                            <br />
                                                                            <%# Eval("OCheckOutDistance").ToString().Trim () %> (m)
                                                                  
                                                                  <br />
                                                                            IsMust: <%# Eval("OCheckOutIsMust").ToString().Trim () %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:BoundColumn DataField="LargestDistance" HeaderText="允许最大距离">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LateMinute" HeaderText="迟到分钟">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EarlyMinute" HeaderText="早退分钟">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>

                                                                            <a href='TTUserAttendancePosition.aspx?MemberUserCode= <%# Eval("UserCode").ToString().Trim () %> &AttendanceTime=<%# Eval("AttendanceDate").ToString().Trim () %>' target="_blank">
                                                                                <img id="IMG_GPS" src="ImagesSkin/GPS.jpg" width="20" height="20" /></a>

                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td style="width: 100%; text-align: left;" class="formItemBgStyle">&nbsp; &nbsp;<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                                            <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label><asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
