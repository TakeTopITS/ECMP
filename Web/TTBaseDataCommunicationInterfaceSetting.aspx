<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBaseDataCommunicationInterfaceSetting.aspx.cs" Inherits="TTBaseDataCommunicationInterfaceSetting" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1. Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
    <style type="text/css">
        .auto-style1 {
            width: 200px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,TongXunJieKouLei%>"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
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
                                <td>
                                    <table style="width: 100%; text-align: center;">

                                        <tr>
                                            <td colspan="2">
                                                <strong>
                                                    <asp:Label ID="Label492257" runat="server" Text="<%$ Resources:lang,WeiXinQiYeZhangHao%>"></asp:Label>
                                                </strong>
                                            </td>
                                            <td colspan="2"><strong>
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WeiXinGongZhongZhangHao%>"></asp:Label>
                                            </strong>
                                                <br />
                                                <div style="font-size: x-small; color: red;">
                                                    [<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZSYYWXGZHDFWHBSDYH%>"></asp:Label>]
                                                </div>
                                            </td>
                                            <td colspan="4">
                                                <table width="100%">
                                                    <tr>
                                                        <td align="center"><b>
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DuanXinJieKou%>"></asp:Label>
                                                        </b></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">【<a href="Template/短信服务商设置格式.pdf" target="_blank"> <span style="font-size: x-small;">
                                                            <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,GeShiShiLi%>"></asp:Label>
                                                        </span></a>】 </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <br />
                                                <asp:Label ID="Label18" runat="server" Text="CorpID"></asp:Label>
                                                <asp:TextBox ID="TB_WeChatQYCorpID" runat="server" width="200px"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label492259" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>
                                                <asp:TextBox ID="TB_WeChatQYSecret" runat="server" width="300px"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label492260" runat="server" Text="<%$ Resources:lang,YingYongID%>"></asp:Label>
                                                <asp:TextBox ID="TB_WeChatQYApplicationID" runat="server"></asp:TextBox>
                                            
                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,QiYong%>"></asp:Label>
                                                <asp:DropDownList ID="DL_WeiXinQYHStatus" runat="server">
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <asp:Button ID="BT_WeChatQYSave" runat="server" CssClass="inpu" OnClick="BT_WeChatQYSave_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                            </td>
                                            <td colspan="2">
                                                <br />
                                                <asp:Label ID="Label19" runat="server" Text="AppID"></asp:Label>
                                                <asp:TextBox ID="TB_WeiXinNo" runat="server" width="200px"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label214" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>
                                                <asp:TextBox ID="TB_PassWord" runat="server" width="300px"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,QiYong%>"></asp:Label>
                                                <asp:DropDownList ID="DL_WeiXinGZHStatus" runat="server">
                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                </asp:DropDownList>
                                                <br />
                                                <br />
                                                <asp:Button ID="BT_WeiXinStand" runat="server" CssClass="inpu" OnClick="BT_WeiXinStand_Click" Text="<%$ Resources:lang,BaoCun%>" />

                                            </td>
                                            <td colspan="4">
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="10%"><strong>ID</strong> </td>
                                                                    <td align="center" width="20%"><strong>
                                                                        <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,FuWuShang%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="60%"><strong>
                                                                        <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,JieKou%>"></asp:Label>
                                                                    </strong></td>
                                                                    <td align="center" width="10%"><strong>
                                                                        <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                    </strong></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid20_ItemCommand" PageSize="2" ShowHeader="false" Width="98%">
                                                    <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="ID">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="SPName" HeaderText="服务商">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SPInterface" HeaderText="接口">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="60%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <br />
                                                <asp:Label ID="Label186" runat="server" Text="<%$ Resources:lang,FuWuShang%>"></asp:Label>
                                                <asp:TextBox ID="TB_SPName" runat="server" Width="99%"></asp:TextBox>
                                                <asp:Label ID="LB_SMSInterfaceID" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="Label188" runat="server" Text="<%$ Resources:lang,JieKou%>"></asp:Label>
                                                <asp:TextBox ID="TB_SPInterface" runat="server" Height="60px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                <asp:DropDownList ID="DL_SPInterfaceSTatus" runat="server">
                                                    <asp:ListItem Text="<%$ Resources:lang,HuoDong%>" Value="处理中" />
                                                    <asp:ListItem Text="<%$ Resources:lang,BeiYong%>" Value="备用" />
                                                </asp:DropDownList>
                                                &nbsp;&nbsp;
                                            <br />
                                                <br />
                                                <asp:Button ID="BT_AddSPInterface" runat="server" CssClass="inpu" OnClick="BT_AddSPInterface_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                &nbsp;
                                            <asp:Button ID="BT_DeleteSPInterface" runat="server" CssClass="inpu" OnClick="BT_DeleteSPInterface_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" style="background-color: beige; height: 20px;"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><b>
                                                <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,NeiBuWangDuan%>"></asp:Label>
                                            </b></td>
                                            <td colspan="3">
                                                <strong>
                                                    <asp:Label ID="Label192" runat="server" Text="<%$ Resources:lang,RTXFuWuQi%>"></asp:Label>
                                                    &nbsp;</strong></td>
                                            <td colspan="3"><strong>
                                                <asp:Label ID="Label486" runat="server" Text="<%$ Resources:lang,ShiPinHuiYiURL%>"></asp:Label>
                                            </strong></td>
                                            <tr>
                                                <td colspan="2" rowspan="7">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="16%"><strong>ID</strong> </td>
                                                                        <td align="center" width="42%"><strong>
                                                                            <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,KaiShiWangDuan%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="42%"><strong>
                                                                            <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,JieShuWangDuan%>"></asp:Label>
                                                                        </strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid25" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid25_ItemCommand" PageSize="2" ShowHeader="false" Width="98%">
                                                        <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="ID">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="BeginSegment" HeaderText="开始网段">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="42%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="EndSegment" HeaderText="结束网段">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="42%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                    <asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,KaiShiWangDuan%>"></asp:Label>
                                                    <asp:TextBox ID="TB_BeginNetSegment" runat="server" Width="179px"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="Label191" runat="server" Text="<%$ Resources:lang,JieShuWangDuan%>"></asp:Label>
                                                    <asp:TextBox ID="TB_EndNetSegment" runat="server" Width="179px"></asp:TextBox>
                                                    <br />
                                                    <asp:Label ID="LB_NetSegmentID" runat="server" Visible="false"></asp:Label>
                                                    <br />
                                                    <asp:Button ID="BT_AddNetSegment" runat="server" CssClass="inpu" OnClick="BT_AddNetSegment_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                    &nbsp;<asp:Button ID="BT_DeleteNetSegment" runat="server" CssClass="inpu" OnClick="BT_DeleteNetSegment_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                </td>
                                                <td align="center" colspan="3" rowspan="7">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="15%">&nbsp;</td>
                                                                        <td align="center" width="30%"><strong>ServerIP</strong> </td>
                                                                        <td align="center" width="15%"><strong>
                                                                            <asp:Label ID="Label195" runat="server" Text="<%$ Resources:lang,DuanKou%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="40%"><strong>WebSite</strong> </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid31" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid31_ItemCommand" PageSize="2" ShowHeader="false" Width="98%">
                                                        <FooterStyle BackColor="#57CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="ID">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_ID2" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe%>" />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ServerIP" HeaderText="接口">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="30%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ServerPort" HeaderText="状态">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WebSite" HeaderText="网址">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="40%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                    <table>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="Label198" runat="server" Text="<%$ Resources:lang,FuWuQiIP%>"></asp:Label>：</td>
                                                            <td align="left">
                                                                <asp:TextBox ID="TB_RTXServerIP" runat="server" Text="127...1" Width="350px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="Label199" runat="server" Text="<%$ Resources:lang,DuanKou%>"></asp:Label>：</td>
                                                            <td align="left">
                                                                <asp:TextBox ID="TB_RTXServerPort" runat="server" Text="86" Width="350px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：</td>
                                                            <td align="left">
                                                                <asp:TextBox ID="TB_RTXWebSite" runat="server" Width="350px"></asp:TextBox></td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="2" align="center">
                                                                <br />
                                                                <asp:Button ID="BT_AddRTX0" runat="server" CssClass="inpu" OnClick="BT_AddRTX_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                                <asp:Button ID="BT_DeleteRTX0" runat="server" CssClass="inpu" OnClick="BT_DeleteRTX_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td colspan="3">
                                                    <asp:Label ID="Label487" runat="server" Text="<%$ Resources:lang,ShiPinHuiYiDiZhi%>"></asp:Label>
                                                    <asp:TextBox ID="TXT_MeetingSystemURL" runat="server" Width="350px"></asp:TextBox>
                                                </td>
                                            </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="Label488" runat="server" Text="<%$ Resources:lang,ShiPinXiTongDiZhi%>"></asp:Label>
                                                <asp:TextBox ID="TXT_MeetingURL" runat="server" Width="350px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Label ID="Label489" runat="server" Text="<%$ Resources:lang,ShiPinDianShu%>"></asp:Label>
                                                <br />
                                                <asp:TextBox ID="TXT_MeetingCount" runat="server" Text="3" Width="350px"></asp:TextBox>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <asp:Button ID="BT_MeetingSystem" runat="server" CssClass="inpu" OnClick="BT_MeetingSystem_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">&nbsp;</td>
                                        </tr>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 5%; top: 5%;">
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
