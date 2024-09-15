<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractToTimeTitle.aspx.cs" Inherits="TTConstractToTimeTitle" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongDaoQiTiXing%>"></asp:Label>
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

                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td align="right" style="width: 80px; padding-top: 5px;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>： </td>
                                                        <td align="left" style="width: 120px;">
                                                            <asp:TextBox ID="TB_ReceiverSalesName" runat="server" Width="120px"></asp:TextBox></td>
                                                        <td align="right" style="width: 80px; padding-top: 5px;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YiFangFuZeRen%>"></asp:Label>： </td>
                                                        <td style="width: 120px;">
                                                            <asp:TextBox ID="TB_PartBOperator" runat="server" Width="120px"></asp:TextBox></td>
                                                        <td align="right" style="width: 100px;">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuKuanFang%>"></asp:Label>： </td>
                                                        <td align="left" style="width: 220px;">
                                                            <asp:TextBox ID="TB_Payer" runat="server" Width="220px"></asp:TextBox></td>
                                                        <td align="left" style="width: 80px; padding-left: 5px;">
                                                            <asp:Button ID="BT_ReceiverFind" runat="server" CssClass="inpu "
                                                                OnClick="BT_FindReceiverFind_Click" Text="<%$ Resources:lang,ChaXun%>" /></td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="5%" align="center"><strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                    <td width="11%" align="center"><strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YuanShiDanHao%>"></asp:Label></strong> </td>
                                                                    <td width="11%" align="center"><strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YingShouJinE%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YingShouRiQi%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShiShouJinE%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiShouRiQi%>"></asp:Label></strong> </td>
                                                                    <td width="6%" align="center"><strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label></strong> </td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WeiShouJinE%>"></asp:Label></strong> </td>
                                                                    <td width="14%" align="center"><strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,FuKuanFang%>"></asp:Label></strong> </td>
                                                                    <td width="5%" align="center"><strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,TiQian%>"></asp:Label></strong> </td>
                                                                    <td width="5%" align="center"><strong>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                    <td width="7%" align="center"><strong>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DengJiRen%>"></asp:Label></strong> </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" Width="100%">

                                                    <Columns>
                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                            DataTextField="ConstractCode" HeaderText="合同号" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="Account" HeaderText="收费科目">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReceivablesAccount" HeaderText="应收金额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReceivablesTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应收日期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReceiverAccount" HeaderText="实收金额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ReceiverTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="实收日期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UNReceiveAmount" HeaderText="未收金额">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PreDays" HeaderText="提前">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                            DataTextField="OperatorName" HeaderText="登记人" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:HyperLinkColumn>

                                                    </Columns>
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataGrid><br />

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
