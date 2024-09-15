<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectCostOperationView.aspx.cs" Inherits="TTProjectCostOperationView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            
        });
    </script>
    <style type="text/css">
        .auto-style1
        {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 285px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuChengBen%>"></asp:Label></td>
                                                    <td width="5">
                                                        <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="center" style="padding-top: 5px;">
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                    <tr>
                                        <td align="center" class="formItemBgStyle">
                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DingEXiangMu%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongChengLiangYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongChengLiangShiJi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DanJiaYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DanJiaShiJi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="9%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZongJiaYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="9%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZongJiaShiJi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZongJiaBiShiJiYuSuan%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" Width="98%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Code" HeaderText="编码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Name" HeaderText="定额项目">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Quantities" HeaderText="工程量(预算)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="QuantitiesRea" HeaderText="工程量(实际)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Price" HeaderText="单价(预算)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="PriceRea" HeaderText="单价(实际)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Total" HeaderText="总价(预算)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TotalRea" HeaderText="总价(实际)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="TotalBL" HeaderText="总价比(实际/预算)">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
