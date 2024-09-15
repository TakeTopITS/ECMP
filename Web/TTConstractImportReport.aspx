<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractImportReport.aspx.cs" Inherits="TTConstractImportReport" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
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
                    <div id="topNav">
                        <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 1000px;">
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongLeiXing%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:DropDownList ID="DDL_ConstractClass" runat="server">
                                        <asp:ListItem Text="" Value="" />
                                        <asp:ListItem Text="<%$ Resources:lang,CaiGouLei%>" Value="采购类" />
                                        <asp:ListItem Text="<%$ Resources:lang,XiaoShouLei%>" Value="销售类" />
                                    </asp:DropDownList>

                                </td>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="TB_ConstractCode" runat="server" Width="139px"></asp:TextBox>
                                </td>
                                <td class="formItemBgStyle" align="right">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JinKouKouAn%>"></asp:Label>：</td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="TB_Customs" runat="server" Width="139px"></asp:TextBox>
                                </td>
                                <td class="formItemBgStyle" align="right">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BaoGuanDanHao%>"></asp:Label>：</td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="TB_EntryCode" runat="server" Width="139px"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenBaoKaiShiShiJian%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">
                                    <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="139px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                    </ajaxToolkit:CalendarExtender>

                                </td>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenBaoJieShuShiJian%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">

                                    <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="139px"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                    </ajaxToolkit:CalendarExtender>

                                </td>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                </td>
                                <td class="formItemBgStyle" align="left">

                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList></td>

                                </td>
                                <td class="formItemBgStyle" align="center" colspan="2">
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
                                <td colspan="5" align="center" style="height: 80px; font-size: xx-large;">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongJinKouYiLanBiao%>"></asp:Label>
                                    <br />
                                </td>
                            </tr>

                        </table>
                        <br />
                        <table width="1200px" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 1000px; text-align: left; padding-left: 5px;">
                                    <asp:Label ID="Label19" runat="server" Text="进口总额"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuanShuiZongE%>"></asp:Label>：<asp:Label ID="LB_TotalEntryTaxAmount" runat="server"></asp:Label>

                                    &nbsp;
                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZengZhiShuiZongE%>"></asp:Label>：<asp:Label ID="LB_TotalAddedTaxAmount" runat="server"></asp:Label>

                                    &nbsp;
                               （
                                    <asp:Label ID="LB_CurrencyType" runat="server"></asp:Label>）

                                    &nbsp;
                                    <asp:Label ID="Label22" runat="server" Text="合同数量"></asp:Label>：
                                    <asp:Label ID="LB_ConstractNumber" runat="server" Text="0"></asp:Label>

                                </td>
                                <td style="width: 200px; text-align: right;">
                                    <asp:Label ID="LB_PrintTime" runat="server"></asp:Label>

                                </td>
                            </tr>
                        </table>
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
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenBaoJinE%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JinKouRiQi%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JinKouKouAn%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShenBaoRiQi%>"></asp:Label></strong>
                                                        </td>


                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BaoGuanDanHao%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuLuBianHao%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuanShui%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZengZhiShui%>"></asp:Label></strong>
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

                        <%--  </div>
                    <br />
                    <div id="bottomNav">--%>
                        <table width="1200px" cellpadding="0" cellspacing="0" style="word-wrap: break-word; overflow: hidden;">
                            <tr>
                                <td>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        Height="1px" Width="1200px" ShowHeader="false"
                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="TotalAmount" HeaderText="申报金额">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="ImportDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="进口日期">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="Customs" HeaderText="进口口岸">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="ReportDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="申报日期">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="EntryCode" HeaderText="报关单号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="PreEntryCode" HeaderText="预录单号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="TotalEntryTax" HeaderText="关税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="TotalAddedValueTax" HeaderText="增值税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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

                        <!--endprint1-->

                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                        <%-- </div>--%>
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
