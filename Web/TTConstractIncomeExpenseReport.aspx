<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractIncomeExpenseReport.aspx.cs" Inherits="TTConstractIncomeExpenseReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
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
            top: 200px;
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
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

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
                    <%--   <div id="topNav">--%>

                    <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 800px;">
                        <tr>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">
                                <asp:TextBox ID="TB_ConstractCode" runat="server" Width="200px"></asp:TextBox>
                            </td>
                            <td class="formItemBgStyle" align="right">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiaFang%>"></asp:Label>：</td>
                            <td class="formItemBgStyle" align="left" colspan="3">
                                <asp:TextBox ID="TB_PartA" runat="server" Width="99%"></asp:TextBox>

                            </td>

                        </tr>
                        <tr>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HeTongQianDingShiJianCong%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">
                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="200px"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                </ajaxToolkit:CalendarExtender>

                            </td>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left" colspan="2">

                                <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td class="formItemBgStyle" align="left" colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                        </td>
                                        <td style="padding-left: 10px;">
                                            <a href="#" onclick="preview()">
                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                            </a>
                                        </td>
                                        <td>&nbsp;<asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoChuDaoExcel%>" OnClick="BT_ExportToExcel_Click" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <!--startprint1-->
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td colspan="2" align="center" style="height: 80px; font-size: xx-large;">
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongShouZhiBaoBiao%>"></asp:Label>
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td align="left" width="85%" style="padding-left: 10px; font-weight: 800;">
                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YingShouJinE%>"></asp:Label>:
                                <asp:Label ID="LB_ReceivablesAmount" runat="server"></asp:Label>

                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShiShouZongE%>"></asp:Label>:
                                <asp:Label ID="LB_TotalReceiverAmount" runat="server"></asp:Label>

                                &nbsp;&nbsp;

                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YingFuJinE%>"></asp:Label>:
                                <asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>

                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShiFuZongE%>"></asp:Label>:
                                <asp:Label ID="LB_TotalOutOfPocketAmount" runat="server"></asp:Label>

                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,SFZEBB%>"></asp:Label>:
                                <asp:Label ID="LB_TotalOutOfPocketAmountHome" runat="server"></asp:Label>

                            </td>
                            <td align="right" style="padding-right: 5px;">

                                <asp:Label ID="LB_PrintTime" runat="server"></asp:Label>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiaFang%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YingShouJinE%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShiShouZongE%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KaiFaPiaoZongE%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YingFuJinE%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShiFuZongE%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,SFZEBB%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShouFaPiaoZongE%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuanShui%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZengZhiShui%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="8%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CanKaoJingLiRun%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="6%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HeTongBiBie%>"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>

                    <%--      </div>
                    <br />
                    <div id="bottomNav">--%>
                    <table width="1200px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                    Height="1px" Width="1200px" ShowHeader="false"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundColumn DataField="SignDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="签订日期" >
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PartA" HeaderText="甲方">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="ReceivablesAmount" HeaderText="应收总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalReceiverAmount" HeaderText="实收总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalRecInvoiceAmount" HeaderText="开发票总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="PayableAmount" HeaderText="应付总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalOutOfPocketAmount" HeaderText="实付总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalOutOfPocketAmountHOme" HeaderText="实付总额(本币)">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalPayInvoiceAmount" HeaderText="收发票总额">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalEntryTax" HeaderText="关税">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="TotalAddedValueTax" HeaderText="增值税">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="Profits" HeaderText="参考净利润">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                        </asp:BoundColumn>

                                        <asp:BoundColumn DataField="Currency" HeaderText="合同币别">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
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

                    <table width="1000px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 1000px; text-align: left;">
                                <%--<asp:Label runat="server" Text="<%$ Resources:lang,ShouRuZongE%>"></asp:Label>：<asp:Label ID="LB_ReciverAmount" runat="server"></asp:Label>
                                    &nbsp; <asp:Label runat="server" Text="<%$ Resources:lang,ZhiChuZongE%>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>
                                    &nbsp; <asp:Label runat="server" Text="<%$ Resources:lang,XianJinYuEZongE%>"></asp:Label>：<asp:Label ID="LB_BalanceAmount" runat="server"></asp:Label>--%>
                                <asp:Label ID="LB_UserCode" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_UserName" runat="server"
                                    Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                            </td>
                        </tr>
                    </table>

                    <!--endprint1-->
                    <%--   </div>--%>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
                </Triggers>
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
