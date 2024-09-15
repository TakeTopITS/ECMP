<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractBankReport.aspx.cs" Inherits="TTConstractBankReport" %>

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
            top: 250px;
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
                    <%--    <div id="topNav">--%>
                    <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 800px;">
                        <tr>
                            <td class="formItemBgStyle" align="right">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label>：</td>
                            <td class="formItemBgStyle" align="left">
                                <asp:TextBox ID="TB_Bank" runat="server" Width="50%"></asp:TextBox>
                                <asp:DropDownList ID="DL_Bank" runat="server" DataTextField="BankName" DataValueField="BankName" AutoPostBack="True" OnSelectedIndexChanged="DL_Bank_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left" colspan="2">
                                <asp:TextBox ID="TB_ConstractCode" runat="server" Width="98%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DanWeiMingCheng%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left" colspan="4">
                                <asp:TextBox ID="TXT_UnitName" runat="server" Width="99%"></asp:TextBox>

                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">
                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_StartTime">
                                </ajaxToolkit:CalendarExtender>

                            </td>
                            <td style="text-align: right;" class="formItemBgStyle">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                            </td>
                            <td class="formItemBgStyle" align="left">

                                <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                </ajaxToolkit:CalendarExtender>
                            </td>
                            <td class="formItemBgStyle" align="left">
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
                    <table style="width: 1000px;">
                        <tr>
                            <td colspan="5" align="center" style="height: 80px; font-size: xx-large;">
                                <br />
                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YinHangBaoBiao%>"></asp:Label>
                                <br />
                            </td>
                        </tr>

                    </table>
                    <br />
                    <table width="1000px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td style="width: 800px; text-align: left;">
                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShouRuZongE%>"></asp:Label>：<asp:Label ID="LB_ReciverAmount" runat="server"></asp:Label>
                                &nbsp;
                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhiChuZongE%>"></asp:Label>：<asp:Label ID="LB_PayableAmount" runat="server"></asp:Label>

                                &nbsp;
                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XianJinYuEZongE%>"></asp:Label>：<asp:Label ID="LB_BalanceAmount" runat="server"></asp:Label>

                                &nbsp;
                               （
                                <asp:Label ID="LB_CurrencyType" runat="server"></asp:Label>）
                            
                            </td>
                            <td style="width: 200px; text-align: right;">
                                <asp:Label ID="LB_PrintTime" runat="server"></asp:Label>

                            </td>
                        </tr>
                    </table>
                    <table width="1000px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>

                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YinHang%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="15%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YuanShiDanHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="15%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouFuKuanDanWei%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouRu%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhiChu%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShouXuFei%>"></asp:Label></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MeiRiXianJinJinE%>"></asp:Label></strong>
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

                    <%--                    </div>
                    <br />
                    <div id="bottomNav">--%>
                    <table width="1000px" cellpadding="0" cellspacing="0">
                        <tr>
                            <td>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                    Height="1px" Width="1000px" ShowHeader="false"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>
                                        <asp:BoundColumn DataField="OperateTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="时间">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Bank" HeaderText="银行">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="BillCode" HeaderText="原始单号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="UnitName" HeaderText="收付款单位">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="ReciverAmount" HeaderText="收入">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="PayableAmount" HeaderText="支出">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Currency" HeaderText="币别">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="HandlingCharge" HeaderText="手续费">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Balance" HeaderText="余额">
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
                    <%--  </div>--%>
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
