<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractView.aspx.cs"
    Inherits="TTConstractView" %>

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

    <!--pageoffic.js一定要引用-->
  <%--  <script type="text/javascript" src="pageoffice.js"></script>--%>

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
                                                        <td width="50%" align="left">
                                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongNeiRong%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="left" style="padding-top: 5px;">

                                                            <asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 5px;">
                                                <table width="98%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                Width="100%">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="12%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="5%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongE%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="8%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="7%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table cellpadding="4" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center;" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"ConstractCode") %>
                                                                            </td>
                                                                            <td style="width: 12%; text-align: left; padding-left: 5px" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ConstractName") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"ConstractClass") %>
                                                                            </td>
                                                                            <td style="width: 5%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Type") %>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Amount") %>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Currency") %>
                                                                            </td>

                                                                            <td style="width: 7%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Status") %>
                                                                            </td>
                                                                            <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PartA") %>
                                                                            </td>
                                                                            <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem,"PartB") %>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem, "StartDate","{0:yyyy/MM/dd}") %>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="width: 7%; text-align: center" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem, "RecorderName") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="Label16" runat="server" Text="合同内容"></asp:Label>
                                                                            </td>
                                                                            <td colspan="12" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <div onclick="popShowByURL('TTConstractMainContentView.aspx?ConstractID=<%# ShareClass.URLEncode(Eval("ConstractID").ToString()) %>','ContractContent', 600, 500)">
                                                                                                --> 
                                                                                                <asp:Label ID="Label19011" Text="<%$ Resources:lang,LiuLan%>" runat="server"></asp:Label>
                                                                                            </div>
                                                                                        </td>

                                                                                        <%--   <td style="width: 100px; text-align: center;">
                                                                                            <div onclick="popShowByURL('<%# ShareClass.URLEncode(Eval("ConstractMainDocURL").ToString().Trim()) %>','Download', 600, 500)">
                                                                                                <asp:Label ID="Label190" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>
                                                                                            </div>

                                                                                        </td>--%>
                                                                                    </tr>
                                                                                </table>


                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 7%; text-align: center; font-size: 10pt" class="tdLeft">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                            </td>
                                                                            <td colspan="12" style="text-align: left; padding-left: 5px" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem,"Exception") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="11" class="tdTopLine"></td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_ConstractID" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px; text-align: right;">
                                                            <span style="font-size: 10pt">
                                                                <asp:HyperLink ID="HL_RelatedDoc" runat="server" Font-Bold="True" Target="_blank">--&gt;<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HeTongWenDang%>"></asp:Label></asp:HyperLink>
                                                            </span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 20px; text-align: left;">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText=" 收款进度" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShouKuanJiHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td colspan="2">
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                        width="100%">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YuanShiDanHao %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShouFeiKeMu %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YingShouJinE %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YingShouRiQi %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShiShouJinE %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,WeiShouJinE %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="20%"><strong>
                                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,FuKuanFang %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XiangGuan %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,DengJi %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                        ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTConstractReceivablesRecordView.aspx?ReceivablesID=<%# Eval("ID").ToString() %>'>
                                                                                                        <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
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
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNReceiveAmount" HeaderText="未收金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Payer" HeaderText="付款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
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
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>

                                                                                        <EditItemStyle BackColor="#2461BF" />

                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />

                                                                                        <ItemStyle CssClass="itemStyle" />

                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                                <td align="RIGHT">
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YingShouZongE %>"></asp:Label>

                                                                                    ：<asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>

                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShiShouZongE %>"></asp:Label>

                                                                                    ：<asp:Label ID="LB_ReceiverAmount" runat="server"></asp:Label>

                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DaiShouZongE %>"></asp:Label>

                                                                                    ：<asp:Label ID="LB_UNReceiverAmount" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="付款进度" TabIndex="1">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label165" runat="server" Text="<%$ Resources:lang,FuKuanJiHua%>"></asp:Label>
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
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                        <td align="center" width="13%"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,YuanShiDanHao%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FuKuanKeMu%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YingFuJinE%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YingFuRiQi%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ShiFuJinE%>"></asp:Label></strong> </td>

                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,WeiFuJinE%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="20%"><strong>
                                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShouKuanFang%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,TiQian%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="5%"><strong>ID</strong> </td>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,DengJi%>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTConstractPayableRecordView.aspx?PayableID=<%# Eval("ID").ToString() %>'>
                                                                                                        <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
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
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNPayAmount" HeaderText="未付金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Receiver" HeaderText="收款方">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
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
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                                <td align="right">
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YingFuZongE%>"></asp:Label>：
                                                                                    <asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>
                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShiFuZongE%>"></asp:Label>：
                                                                                    <asp:Label ID="LB_PayAmount" runat="server"></asp:Label>
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DaiFuZongE%>"></asp:Label>：
                                                                                    <asp:Label ID="LB_UNPayAmount" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel14" runat="server" HeaderText="开票情况" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,KaiPiaoQingKuang%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
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
                                                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShuiPiaoLeiXing %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="12%"><strong>
                                                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShuiLv %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                        ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        ShowHeader="False" Width="100%">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReceiveOpen" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TaxType" HeaderText="税票">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="InvoiceCode" HeaderText="发票号码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TaxRate" HeaderText="税率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="OpenDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开票日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
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
                                                                                <td align="right" style="padding-right: 280px;">
                                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,KaiPiaoZongE %>"></asp:Label>：<asp:Label ID="LB_TotalInvoiceAmount" runat="server" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel9" runat="server" HeaderText="设备租赁">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,SheBeiZhuLing %>"></asp:Label>

                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="LB_ReceiptConstractCode" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
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
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>

                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YiChuZhu %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,MoChuZhu %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="DeliveredNumber" HeaderText="已发货">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UNDeliveredNumber" HeaderText="未发货 ">
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
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel5" runat="server" HeaderText="租赁收回">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,ZhuLingShouHui %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
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
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>

                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label268" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label269" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>

                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,YiShouHuo %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,WeiShouHuo %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,TiQian %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
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
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel7" runat="server" HeaderText="工程量清单">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,GongChunLiangQinDan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Font-Bold="True" Width="100%"></asp:Label></td>
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
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label175" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label177" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label178" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label270" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label271" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>

                                                                                                        <td width="7%" align="center"><strong>
                                                                                                            <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label179" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label180" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label181" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label182" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="7%"><strong>
                                                                                                            <asp:Label ID="Label183" runat="server" Text="<%$ Resources:lang,ZaiDanLiangXiaoShouDan %>"></asp:Label></strong></td>
                                                                                                        <td align="center"><strong>
                                                                                                            <asp:Label ID="Label184" runat="server" Text="<%$ Resources:lang,ZaiDanLiangCaiGouDan %>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid11" runat="server" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="SaleOrderNumber" HeaderText="在单量（销售单）">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PurchaseOrderNumber" HeaderText="在订单 ">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel19" runat="server" HeaderText="补充协议">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label227" runat="server" Text="<%$ Resources:lang,BuConXieYi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <%-- <td width="6%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                            </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label335" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label336" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="40%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label337" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <%--  <td width="5%" align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
                                                                                            </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label338" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label339" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label340" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid19" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            Width="100%" AllowPaging="True"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <%--  <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>--%>
                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <%--   <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                                                                            <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                                </asp:TemplateColumn>--%>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>

                                                                <cc2:TabPanel ID="TabPanel20" runat="server" HeaderText="合同依据">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label341" runat="server" Text="<%$ Resources:lang,HeTongYiJi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <%-- <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                        </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label342" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label343" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="40%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label344" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <%--  <td width="5%" align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
                                                                                            </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label345" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label346" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label347" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            Width="100%" AllowPaging="True"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <%--  <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>--%>
                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <%--    <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                                                                            <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                                </asp:TemplateColumn>--%>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>

                                                                <cc2:TabPanel ID="TabPanel21" runat="server" HeaderText="项目其他信息">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label348" runat="server" ext="<%$ Resources:lang,XiangMuQiTaXinXi %>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <%-- <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                        </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label349" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label350" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="40%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label351" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <%--    <td width="5%" align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
                                                                                            </td>--%>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label352" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label353" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label354" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid21" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                                            Width="100%" AllowPaging="True"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <%--  <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                </asp:BoundColumn>--%>
                                                                                <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <%--    <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <div onclick="javascript:POBrowser.openWindowModeless('TTOpenWord.aspx?DocID=<%#DataBinder.Eval (Container .DataItem ,"DocID") %>','fullscreen=yes;');">
                                                                                            <asp:Label ID="LB_OpenWord" Text="<%$ Resources:lang,BianJi %>" runat="server"></asp:Label>
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" VerticalAlign="Middle" Width="5%" />
                                                                                </asp:TemplateColumn>--%>
                                                                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>


                                                                <cc2:TabPanel ID="TabPanel13" runat="server" HeaderText="合同报关" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label167" runat="server" Text="<%$ Resources:lang,HeTongBaoGuan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,BaoGuanDanHao %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,YuShenBaoHao %>"></asp:Label></strong> </td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,BiBie %>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,HuiLv %>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,GuanShui %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,ZengZhiShui %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label137" runat="server" Text="<%$ Resources:lang,KouAn %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,JinKouRiQi %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label139" runat="server" Text="<%$ Resources:lang,ShenBaoRiQi %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryCode" HeaderText="单号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="PreEntryCode" HeaderText="预申报编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryTax" HeaderText="关税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="AddedValueTax" HeaderText="增值税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Customs" HeaderText="口岸">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ImportDate" HeaderText="进口日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ReportDate" HeaderText="申报日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="业务人员" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,YeWuRenYuan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,YeWuYuan %>"></asp:Label></strong> </td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label143" runat="server" Text="<%$ Resources:lang,ZhiZe %>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,YongJin %>"></asp:Label></strong> </td>
                                                                                                        <td width="20%" align="center"><strong>
                                                                                                            <asp:Label ID="Label145" runat="server" Text="<%$ Resources:lang,FaFangShiJian %>"></asp:Label></strong> </td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,FaFangZhuangTai %>"></asp:Label></strong> </td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label147" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="SalesName" HeaderText="业务员">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Commission" HeaderText="佣金">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="GiveTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("CommissionStatus").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid></td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="相关协作" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,XiangGuanXieZuo%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center"><strong>
                                                                                                <asp:Label ID="Label149" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                            <td width="45%" align="center"><strong>
                                                                                                <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,XieZuo%>"></asp:Label></strong> </td>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label151" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label></strong> </td>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False"
                                                                            HorizontalAlign="Center" Height="1px"
                                                                            Width="100%" ShowHeader="False" CellPadding="4" ForeColor="#333333"
                                                                            GridLines="None">

                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="CoID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="CoID" DataNavigateUrlFormatString="TTCollaborationDetailView.aspx?CoID={0}"
                                                                                    DataTextField="CollaborationName" HeaderText="协作" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                    DataTextField="CreatorName" HeaderText="创建者" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.CoID", "TTCollaborationRelatedDoc.aspx?RelatedID={0}") %>'
                                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                                                    </ItemTemplate>

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>

                                                                            <EditItemStyle BackColor="#2461BF" />

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <ItemStyle CssClass="itemStyle" />

                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel6" runat="server" HeaderText="可视人员" TabIndex="0">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,KeShiRenYuan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                                                            <td align="center"><strong>
                                                                                                <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,CaoZuoQuanXian%>"></asp:Label></strong> </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid12" runat="server" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                            ShowHeader="False"
                                                                            Width="100%">

                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                                                    DataTextField="UserName" HeaderText="名称" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Authority" HeaderText="操作权限">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel15" runat="server" HeaderText="报关对内数据">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,BaoGuanDuiNeiShuJu%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label159" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label160" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label161" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label></strong> </td>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label163" runat="server" Text="<%$ Resources:lang,GuanShui%>"></asp:Label></strong> </td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label164" runat="server" Text="<%$ Resources:lang,ZengZhiShui%>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid15" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EntryTax" HeaderText="关税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="AddedValueTax" HeaderText="增值税">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                            </cc2:TabContainer>
                                                            <br />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
