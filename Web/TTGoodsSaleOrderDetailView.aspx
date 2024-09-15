<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsSaleOrderDetailView.aspx.cs" Inherits="TTGoodsSaleOrderDetailView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinXiaoShouShenQing%>"></asp:Label>
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
                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                        width="100%">

                                        <tr>

                                            <td width="7">

                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                            </td>

                                            <td>

                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                    <tr>

                                                        <td align="center" width="5%">

                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="8%">

                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="12%">

                                                            <strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="10%">

                                                            <strong>
                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="12%">

                                                            <strong>
                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                          <td align="center" width="8%">

                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                            </strong>
                                                        </td>


                                                        <td align="center" width="8%">

                                                            <strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="8%">

                                                            <strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="5%">

                                                            <strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                            </strong>
                                                        </td>


                                                        <td align="center" width="7%">

                                                            <strong>
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label>
                                                            </strong>
                                                        </td>

                                                        <td align="center" width="7%">

                                                            <strong>
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YiFaHuo %>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td align="right" width="6">

                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                            </td>
                                        </tr>
                                    </table>

                                    <asp:DataGrid ID="DataGrid1" runat="server"  AutoGenerateColumns="False"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" 
                                        PageSize="5" ShowHeader="False"
                                        Width="100%">
                                        
                                        <Columns>
                                              <asp:BoundColumn DataField="ID" HeaderText="代码">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                            </asp:BoundColumn>
                                             <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                    
                                            <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="DeliveryNumber" HeaderText="已送货">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                        </Columns>

                                        <EditItemStyle BackColor="#2461BF" />

                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                        <ItemStyle CssClass="itemStyle" />

                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataGrid>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left"></td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

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
