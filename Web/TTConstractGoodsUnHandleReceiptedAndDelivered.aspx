<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractGoodsUnHandleReceiptedAndDelivered.aspx.cs" Inherits="TTConstractGoodsUnHandleReceiptedAndDelivered" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }

        #topNav {
            /*background-color:#096;*/
            z-index: 999;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
        }

        #bottomNav {
            /*background-color:#096;*/
            z-index: -2;
            position: relative;
            top: 205px;
            left: 0;
            width: 100%;
            /*_position: absolute; /* for IE6 */ */
            /*_top: expression(documentElement.scrollTop + documentElement.clientHeight-this.offsetHeight); /* for IE6 */
            overflow: visible;
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" style="padding: 0px 5px 5px 5px;">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongShouFaHuoYuJing%>"></asp:Label>
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
                                <td valign="top" style="padding: 0px 5px 5px 5px;">
                                    <table width="98%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="height: 20px; text-align: left;">
                                                <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                    <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="收货预警" TabIndex="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouHuoYuJing%>"></asp:Label></HeaderTemplate>
                                                        <ContentTemplate>
                                                            <br />
                                                           &nbsp;&nbsp;  
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YingShouShuLiang %>"></asp:Label>：<asp:Label ID="LB_ReceiptNumber" runat="server"></asp:Label>&#160;<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiShouShuLiang %>"></asp:Label>：<asp:Label ID="LB_ReceiptedNumber" runat="server"></asp:Label>&#160;<asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WeiShouShuLiang %>"></asp:Label>：<asp:Label ID="LB_UNReceiveNumber" runat="server"></asp:Label>
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td align="right" style="width: 80px; padding-top: 5px;">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label>： </td>
                                                                    <td align="left" style="width: 120px;">
                                                                        <asp:TextBox ID="TB_ReceiptedSalesName" runat="server" Width="120px"></asp:TextBox></td>
                                                                    <td align="right" style="width: 80px; padding-top: 5px;">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YiFangFuZeRen %>"></asp:Label>： </td>
                                                                    <td style="width: 120px;">
                                                                        <asp:TextBox ID="TB_PartBOperator" runat="server" Width="120px"></asp:TextBox></td>


                                                                    <td align="left" style="width: 80px; padding-left: 5px;">
                                                                        <asp:Button ID="BT_ReceiptedFind" runat="server" CssClass="inpu "
                                                                            OnClick="BT_FindReceiptedFind_Click" Text="<%$ Resources:lang,ChaXun %>" /></td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>

                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongHao %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="19%"><strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YiShouHuo %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WeiShouHuo %>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                ShowHeader="False"
                                                                Width="100%">
                                                                
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                        DataTextField="ConstractCode" HeaderText="合同号" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:HyperLinkColumn>

                                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ReceiptedNumber" HeaderText="已收货">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UNReceiptedNumber" HeaderText="未收货 ">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PreDay" HeaderText="提前">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                            <br />
                                                          
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                    <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="发货预警" TabIndex="1">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,FaHuoYuJing%>"></asp:Label></HeaderTemplate>
                                                        <ContentTemplate>
                                                            <br />
                                                            &nbsp;&nbsp;<asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YingFaShuLiang%>"></asp:Label>：<asp:Label ID="LB_DeliveryNumber" runat="server"></asp:Label>&#160;<asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShiFaShuLiang%>"></asp:Label>：<asp:Label ID="LB_DeliveredNumber" runat="server"></asp:Label>&#160;<asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WeiFaShuLiang%>"></asp:Label>：<asp:Label ID="LB_UNDeliveredNumber" runat="server"></asp:Label>

                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td align="right" style="width: 80px; padding-top: 5px;">
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>： </td>
                                                                    <td style="width: 120px;">
                                                                        <asp:TextBox ID="TB_PayerSalesName" runat="server" Width="120px"></asp:TextBox></td>
                                                                    <td align="right" style="width: 80px; padding-top: 5px;">
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiaFangFuZeRen%>"></asp:Label>： </td>
                                                                    <td style="width: 120px;">
                                                                        <asp:TextBox ID="TB_PartAOperator" runat="server" Width="120px"></asp:TextBox></td>

                                                                    <td align="left" style="width: 80px; padding-left: 5px;">
                                                                        <asp:Button ID="Button1" runat="server" CssClass="inpu "
                                                                            OnClick="BT_FindPayerFind_Click" Text="<%$ Resources:lang,ChaXun%>" /></td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="5%"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="19%"><strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="8%"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,YiShouHuo%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WeiShouHuo%>"></asp:Label></strong> </td>
                                                                                <td align="center" width="7%"><strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TiQian%>"></asp:Label></strong> </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                ShowHeader="False"
                                                                Width="100%">
                                                                
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                        DataTextField="ConstractCode" HeaderText="合同号" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="19%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Amount" HeaderText="数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="DeliveredNumber" HeaderText="已收货">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UNDeliveredNumber" HeaderText="未收货 ">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PreDay" HeaderText="提前">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                            <br />
                                                        </ContentTemplate>
                                                    </cc2:TabPanel>
                                                </cc2:TabContainer>
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
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
