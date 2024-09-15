<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserAttendanceRule.aspx.cs"
    Inherits="TTUserAttendanceRule" %>


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
            min-width: 2500px;
            width: expression (document.body.clientWidth <= 2500? "2500px" : "auto" ));
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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YGKQGZSZ%>"></asp:Label>
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
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server"
                                                    NodeWrap="True" ShowLines="True" Width="220px" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="center" style="width: 170px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td style="width: 100%; height: 14px; text-align: center">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="false" CellPadding="2" Font-Bold="true" ForeColor="#333333"
                                                                GridLines="None" OnItemCommand="DataGrid2_ItemCommand" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" 
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" 
                                                                                Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>

                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </td>
                                            <td align="left" valign="top" style="padding: 5px 0px 5px 5px;">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td>
                                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="6%" align="center">
                                                                                    <strong>ID</strong>
                                                                                </td>

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
                                                                                <td width="3%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>


                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ShowHeader="false"
                                                                ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" PageSize="20"
                                                                Width="98%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="ID">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:TemplateColumn>

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
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    </asp:TemplateColumn>

                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="3" align="left" class="formItemBgStyle">
                                                            <table>

                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YuangongDaiMa%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YuanGongMingChen%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：</td>
                                                                    <td>

                                                                        <asp:TextBox ID="DLC_CreateDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_CreateDate">
                                                                        </ajaxToolkit:CalendarExtender>

                                                                    </td>
                                                                    <td>状态：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Status" runat="server">
                                                                            <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                            <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3" class="formItemBgStyle">
                                                            <span style="color: #CC0000;">
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GSSL0903ZYFZHFW%>"></asp:Label></span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label285" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_MCheckInStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label286" runat="server" Text="<%$ Resources:lang,ZaoBanShangBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_MCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label37" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_MCheckInIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>

                                                            &nbsp;<asp:Label ID="Label287" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_MCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label288" runat="server" Text="<%$ Resources:lang,ZaoBanXiaBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_MCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label40" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_MCheckOutIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label289" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_ACheckInStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhongBanShangBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_ACheckInEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label6" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_ACheckInIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Label ID="Label291" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_ACheckOutStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label292" runat="server" Text="<%$ Resources:lang,ZhongBanXiaBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_AChectOutEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label7" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_ACheckOutIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label293" runat="server" Text="<%$ Resources:lang,WanBanShangBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_NCheckInStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label294" runat="server" Text="<%$ Resources:lang,WanBanShangBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_NCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label8" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_NCheckInIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Label ID="Label295" runat="server" Text="<%$ Resources:lang,WanBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_NCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label296" runat="server" Text="<%$ Resources:lang,WanBanXiaBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_NCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label26" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_NCheckOutIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label297" runat="server" Text="<%$ Resources:lang,JiaBanShangBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_OCheckInStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label298" runat="server" Text="<%$ Resources:lang,JiaBanShangBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_OCheckInEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label30" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_OCheckInIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Label ID="Label299" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanKaiShiShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_OCheckOutStart" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiaBanXiaBanJieShuShiJian%>"></asp:Label>
                                                            <asp:TextBox ID="TB_OCheckOutEnd" runat="server" Width="50px"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label35" runat="server" Text="IsMust"></asp:Label>
                                                            <asp:DropDownList ID="DDL_OCheckOutIsMust" runat="server">
                                                                <asp:ListItem Value="NO"></asp:ListItem>
                                                                <asp:ListItem Value="YES"></asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Longitude%>"></asp:Label>
                                                            <asp:TextBox ID="TB_Longitude" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Latitude%>"></asp:Label>
                                                            <asp:TextBox ID="TB_Latitude" runat="server" Width="100px" Text="0"></asp:TextBox>
                                                             <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>
                                                            <asp:TextBox ID="TB_Address" runat="server" Width="300px" ></asp:TextBox>
                                                             <a class="titleSpan" onclick="popShowByURL('TTUserAttendanceRuleBaiDuMap.aspx','BaiDuMap', 600, 500)">
                                                                <img src="ImagesSkin/GPS.jpg" alt="取经纬度" width="20" height="20" style="border: 0px;">
                                                            </a>
                                                           &nbsp;&nbsp;<asp:Label ID="Label2119" runat="server" Text="<%$ Resources:lang,YunXiZuiDaJuLi%>"></asp:Label>
                                                            <NickLee:NumberBox ID="NB_LargestDistance" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="80px">0.00</NickLee:NumberBox>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Mi%>"></asp:Label>
                                                        </td>
                                                        
                                                    </tr>
                                                    <tr>
                                                        <td align="left"  colspan="3" class="formItemBgStyle">
                                                            <asp:Label ID="Label2120" runat="server" Text="<%$ Resources:lang,ZDYBZGDWZBGDYYKQDYG%>"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: Left;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_AddUserAttendanceRule" runat="server" CssClass="inpu"
                                                                Enabled="False" OnClick="BT_AddUserAttendanceRule_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;<asp:Button ID="BT_UpdateUserAttendanceRule" runat="server" CssClass="inpu"
                                                                Enabled="False" OnClick="BT_UpdateUserAttendanceRule_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;<asp:Button ID="BT_DeleteUserAttendanceRule" runat="server" CssClass="inpu"
                                                                Enabled="False" OnClick="BT_DeleteUserAttendanceRule_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp;<asp:Button ID="BT_PaiBanRule" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_PaiBanRule_Click"  Text="排班" />
                                                        </td>
                                                        <td style="text-align: Right;" width="130px" class="formItemBgStyle"></td>
                                                        <td style="text-align: left;" width="130px" class="formItemBgStyle"></td>
                                                    </tr>
                                                </table>
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
