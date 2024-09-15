<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTVendorList.aspx.cs" Inherits="TTVendorList" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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
                                        <table width="1080" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShanfLieBie%>"></asp:Label>
                                                </td>
                                                <td width="5">
                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                </td>
                                                <td align="left">
                                                    <asp:Label ID="Label1116" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TB_VenCode" runat="server" Width="120px"></asp:TextBox>
                                                </td>

                                                <td align="left">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TB_VenName" runat="server" Width="120px"></asp:TextBox>
                                                </td>

                                                <td align="left">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                </td>
                                                  <td>
                                                    <asp:TextBox ID="TB_IndustryTypeFind" runat="server" Width="120px"></asp:TextBox>
                                                    <asp:DropDownList ID="DL_IndustryTypeFind" runat="server" AutoPostBack="True" DataTextField="Type"
                                                        DataValueField="Type" OnSelectedIndexChanged="DL_IndustryTypeFind_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                   
                                                </td>
                                                <td style="text-align: right;">

                                                    <asp:Label ID="Label84" runat="server" Text="设备名称"></asp:Label>：
                                                </td>

                                                <td style="text-align: left;">

                                                    <asp:TextBox ID="TB_DeviceNameFind" runat="server" Width="200px"></asp:TextBox>
                                                </td>
                                              
                                                <td>
                                                     &nbsp;<asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                </td>
                                                <td></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 5px 5px 5px 5px;">
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>EMail</strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <table>
                                                                        <tr>
                                                                            <td>
                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label></td>
                                                                            <td>
                                                                                <asp:Button ID="BT_SortByAreaAddress" CssClass="inpuUpDown" runat="server" OnClick="BT_SortByAreaAddress_Click" />
                                                                                <asp:Label ID="LB_UpDown" runat="server" Text="UP" Visible="false"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <%--<td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>
                                                                </strong>
                                                            </td>--%>

                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label85" runat="server" Text="设备名称"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                            ShowHeader="false" Width="100%" PageSize="5" GridLines="None" CellPadding="4"
                                            ForeColor="#333333">
                                            <Columns>
                                                <asp:BoundColumn DataField="VendorCode" HeaderText="代码">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="VendorCode" DataNavigateUrlFormatString="TTVendorInfoView.aspx?VendorCode={0}"
                                                    DataTextField="VendorName" HeaderText="供应商名称" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="ContactName" HeaderText="联系人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Tel1" HeaderText="电话">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EmailAddress" HeaderText="EMail">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="AreaAddress" HeaderText="区域">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="RegistrationAddressCN" HeaderText="地址">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>
                                                <%--   <asp:BoundColumn DataField="CreateDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="建立日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>--%>

                                                <asp:BoundColumn DataField="DeviceName" HeaderText="设备名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>

                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                            <br />
                        </td>
                    </tr>
                </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
