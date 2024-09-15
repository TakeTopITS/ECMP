<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReceivablesPayableHandleForBusiness.aspx.cs" Inherits="TTReceivablesPayableHandleForBusiness" %>


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
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
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
                                <td>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShouFuKuanYeWu%>"></asp:Label></td>
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
                                            <td style="padding-top: 5px">
                                                <table width="99%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="height: 20px;" align="left">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                                Width="100%">
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText=" 收款进度" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouKuanJiHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                        width="100%">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShiShouJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FuKuanFang %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="25"
                                                                                        ShowHeader="False" AllowPaging="True" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                        Height="1px">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTConstractReceivablesRecord.aspx?ReceivablesID={0}"
                                                                                                Text="收款" HeaderText="明细" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Account" HeaderText="收费科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceivablesAccount" HeaderText="应收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceivablesTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应收日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiverAccount" HeaderText="实收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNReceiveAmount" HeaderText="未收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
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
                                                                                            <asp:BoundColumn DataField="RelatedType" HeaderText="相关">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="RelatedID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right">
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YingShouZongE %>"></asp:Label>：<asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>&nbsp;
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShiShouZongE %>"></asp:Label>：<asp:Label
                                                                                        ID="LB_ReceiverAmount" runat="server"></asp:Label>&nbsp;
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DaiShouZongE %>"></asp:Label>：<asp:Label ID="LB_UNReceiverAmount" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="付款进度" TabIndex="1">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,FuKuanJiHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong></strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FuKuanKeMu %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YingFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YingFuRiQi %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShiFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,WeiFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShouKuanFang %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="9%"><strong>
                                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="25"
                                                                                        ShowHeader="False" AllowPaging="True" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                        Height="1px">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTConstractPayableRecord.aspx?PayableID={0}"
                                                                                                Text="<%$ Resources:lang,FuKuan %>" HeaderText="付款记录" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Account" HeaderText="付款科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableAccount" HeaderText="应付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应付日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="OutOfPocketAccount" HeaderText="实付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6px" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNPayAmount" HeaderText="未付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Receiver" HeaderText="收款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PreDays" HeaderText="提前">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="RelatedType" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="RelatedID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="OperatorName" HeaderText="登记" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                            </tr><tr>
                                                                                <td></td>
                                                                                <td align="right">
                                                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YingFuZongE %>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShiFuZongE %>"></asp:Label>：<asp:Label
                                                                                        ID="LB_PayAmount" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DaiFuZongE %>"></asp:Label>：<asp:Label ID="LB_UNPayAmount"
                                                                                            runat="server"></asp:Label></td>
                                                                            </tr>

                                                                        </table>
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
