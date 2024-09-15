<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReceivablesPayableHandleForPlan.aspx.cs" Inherits="TTReceivablesPayableHandleForPlan" %>

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
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShouFuKuanJiHua%>"></asp:Label></td>
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
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreateReceivables" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateReceivables_Click" />
                                                                                </td>
                                                                            </tr>
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
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShiShouJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WeiShouJinE %>"></asp:Label></strong> </td>
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
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                        ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                                        ShowHeader="False" Width="100%">

                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTConstractReceivablesRecord.aspx?ReceivablesID={0}"
                                                                                                Text="<%$ Resources:lang,ShouKuan %>" HeaderText="明细" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiverAccount" HeaderText="实收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNReceiveAmount" HeaderText="未收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
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
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YingShouZongE %>"></asp:Label>：<asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>&nbsp;
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShiShouZongE %>"></asp:Label>：<asp:Label
                                                                                        ID="LB_ReceiverAmount" runat="server"></asp:Label>&nbsp;
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DaiShouZongE %>"></asp:Label>：<asp:Label ID="LB_UNReceiverAmount" runat="server"></asp:Label>

                                                                                    <asp:Label ID="LB_ConstractCode" runat="server" visble="false"></asp:Label>
                                                                                    <asp:Label ID="LB_UserCode" runat="server" visble="false"></asp:Label>
                                                                                    <asp:Label ID="LB_UserName" runat="server" visble="false"></asp:Label>
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
                                                                                <td align="right" style="padding-right: 5px;">
                                                                                    <asp:Button ID="BT_CreatePayable" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreatePayable_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>

                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong></strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,FuKuanKeMu %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YingFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,YingFuRiQi %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShiFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WeiFuJinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ShouKuanFang %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="9%"><strong>
                                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label></strong> </td>

                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                                        OnItemCommand="DataGrid2_ItemCommand" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                        Height="1px" Width="100%">

                                                                                        <Columns>
                                                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:ButtonColumn CommandName="Delete" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTConstractPayableRecord.aspx?PayableID={0}"
                                                                                                Text="<%$ Resources:lang,FuKuan %>" HeaderText="付款记录" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Account" HeaderText="付款科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableAccount" HeaderText="应付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PayableTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="应付日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="OutOfPocketAccount" HeaderText="实付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceAccount" HeaderText="开票金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNPayAmount" HeaderText="未付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CurrencyType" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Receiver" HeaderText="收款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
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

                                                                            <tr>

                                                                                <td align="right">
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,YingFuZongE %>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShiFuZongE %>"></asp:Label>：<asp:Label
                                                                                        ID="LB_PayAmount" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DaiFuZongE %>"></asp:Label>：<asp:Label ID="LB_UNPayAmount"
                                                                                            runat="server"></asp:Label>

                                                                                </td>
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


                    <div class="layui-layer layui-layer-iframe" id="popReceivablesWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="LB_PopWindowTitle" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" align="right" style="width: 15%;">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" width="25%">
                                        <asp:Label ID="LB_ReceivablesID" runat="server"></asp:Label></td>
                                    <td class="formItemBgStyle" align="right" style="width: 15%;"></td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceivablesBillCode" runat="server"></asp:TextBox></td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceiveAccount" runat="server" Width="135px"></asp:TextBox><asp:DropDownList ID="DL_ReceiveAccount" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" Height="25px" OnSelectedIndexChanged="DL_ReceiveAccount_SelectedIndexChanged"
                                            Width="158px">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ReceivablesAccount" runat="server" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" Width="120px" Precision="3">0.000</NickLee:NumberBox></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_ReceiveCurrencyType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_ReceivablesTime" runat="server"></asp:TextBox><cc2:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_ReceivablesTime"></cc2:CalendarExtender>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_ReceivablesPreDays" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FuKuanFang %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Payer" runat="server" Width="220px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Payer" runat="server" AutoPostBack="True" DataTextField="Payer" DataValueField="Payer" Height="25px" OnSelectedIndexChanged="DL_Payer_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DengJiRenYuan %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ReceivablesOperatorCode" runat="server" Enabled="False" Width="55px"></asp:TextBox><asp:Label ID="LB_ReceivablesOperatorName" runat="server"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_ReceivablesStatus" runat="server">
                                            <asp:ListItem Value="计划" />
                                            <asp:ListItem Value="完成" />
                                            <asp:ListItem Value="取消" />
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,jihua %>"></asp:Label>： </td>

                                    <td class="formItemBgStyle" align="left">
                                        <asp:Label ID="LB_ReceivablesRelatedPlanID" runat="server"></asp:Label>
                                        <asp:Label ID="LB_ReceivablesRelatedPlanName" runat="server"></asp:Label>
                                        <asp:Button ID="BT_ReceivablesSelectPJPlan" runat="server" CssClass="inpu" OnClick="BT_ReceivablesSelectPJPlan_Click" Text="计划选择" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_ReceiveComment" runat="server" Height="60px" TextMode="MultiLine"
                                            Width="99%"></asp:TextBox></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_Receivables_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label189" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPayableWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label60" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr style="display: none;">
                                    <td class="formItemBgStyle" align="right" style="width: 15%;">
                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" width="25%">
                                        <asp:Label ID="LB_PayableID" runat="server"></asp:Label></td>
                                    <td class="formItemBgStyle" align="right" style="width: 15%;"></td>
                                    <td class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PayableBillCode" runat="server"></asp:TextBox></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,FuKuanKeMu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PayAccount" runat="server" Width="135px"></asp:TextBox><asp:DropDownList ID="DL_PayAccount" runat="server" AutoPostBack="True" DataTextField="AccountName"
                                            DataValueField="AccountCode" Height="25px" OnSelectedIndexChanged="DL_PayAccount_SelectedIndexChanged">
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,YingFuJinE %>"></asp:Label>: </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PayableAccount" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                            PositiveColor="" Width="120px" Precision="3">0.000</NickLee:NumberBox></td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_PayableCurrencyType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                        <asp:Label ID="lbl_AccountCode1" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YingFuRiQi %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_PayableTime" runat="server"></asp:TextBox><cc2:CalendarExtender ID="CalendarExtender3" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_PayableTime"></cc2:CalendarExtender>
                                    </td>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,TiQianTianShu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_PayablePreDays" runat="server" MaxAmount="1000000000000" MinAmount="1" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShouKuanFang %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Receiver" runat="server" Width="220px"></asp:TextBox>
                                        <asp:DropDownList ID="DL_Receiver" runat="server" AutoPostBack="True" DataTextField="Receiver" DataValueField="Receiver" Height="25px" OnSelectedIndexChanged="DL_Receiver_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,DengJiRenYuan %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PayableOperatorCode" runat="server" Enabled="False" Width="55px"></asp:TextBox><asp:Label ID="LB_PayableOperatorName" runat="server"></asp:Label></td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_PayableStatus" runat="server" AutoPostBack="True">
                                            <asp:ListItem Value="计划" />
                                            <asp:ListItem Value="完成" />
                                            <asp:ListItem Value="取消" />
                                        </asp:DropDownList>
                                    </td>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,jihua %>"></asp:Label>： </td>

                                    <td class="formItemBgStyle" align="left">
                                        <asp:Label ID="LB_PayableRelatedPlanID" runat="server"></asp:Label>
                                        <asp:Label ID="LB_PayableRelatedPlanName" runat="server"></asp:Label>
                                        <asp:Button ID="BT_PayableSelectPJPlan" runat="server" CssClass="inpu" OnClick="BT_PayableSelectPJPlan_Click" Text="计划选择" />

                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" align="right">
                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_PayableComment" runat="server" Height="60px" TextMode="MultiLine"
                                            Width="99%"></asp:TextBox></td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton2" runat="server" class="layui-layer-btn notTab" OnClick="BT_Payable_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPayableSelectPJPlanWindow" name="noConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label273" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <asp:TreeView ID="TreeView_PayablePJPlantTree" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView_PayablePJPlantTree_SelectedNodeChanged"
                                Width="100%" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                <RootNodeStyle CssClass="rootNode" />
                                <NodeStyle CssClass="treeNode" />
                                <LeafNodeStyle CssClass="leafNode" />
                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                            </asp:TreeView>

                        </div>
                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label326" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popReceivablesSelectPJPlanWindow" name="noConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label324" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <asp:TreeView ID="TreeView_ReceivablesPJPlantTree" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView_ReceivablesPJPlantTree_SelectedNodeChanged"
                                Width="100%" ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体">
                                <RootNodeStyle CssClass="rootNode" />
                                <NodeStyle CssClass="treeNode" />
                                <LeafNodeStyle CssClass="leafNode" />
                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                            </asp:TreeView>

                        </div>
                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label327" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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

