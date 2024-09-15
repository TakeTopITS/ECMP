<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsScrapeReport.aspx.cs"
    Inherits="TTGoodsScrapeReport" %>

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


        function preview1() {
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
                     <div id="AboveDiv">
                    <table cellpadding="0" cellspacing="0" width="980px">
                        <tr>
                            <td>
                                <table style="width: 98%;">

                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsCode" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsName" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsType" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BaoFeiRen%>"></asp:Label>：</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="TB_OperatorName" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" width="10%">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                        </td>
                                        <td width="30%">

                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3"
                                                runat="server" TargetControlID="DLC_StartTime">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:TextBox ID="DLC_StartTime" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_StartTime">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td style="text-align: right;" width="15%">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：&nbsp;
                                        </td>
                                        <td width="20%">


                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                runat="server" TargetControlID="DLC_EndTime">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:TextBox ID="DLC_EndTime" runat="server" ReadOnly="false"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_EndTime">
                                            </ajaxToolkit:CalendarExtender>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">&nbsp;</td>
                                        <td>&nbsp;</td>

                                        <td colspan="2">
                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            &nbsp;<asp:Button ID="BT_Export" runat="server" CssClass="inpu" OnClick="BT_Export_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                        </td>
                                        <td>
                                            <a href="#" onclick="preview1()">
                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a></td>
                                    </tr>

                                </table>

                                <hr />
                                <!--startprint1-->
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinBaoFeiBaoBiao%>"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="5" style="text-align: left;">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BaoFeiZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                            &nbsp;
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HuiShouZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>

                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100%;">
                                            <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>

                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuanYongHu%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaoZuoZhe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoFeiShuLiang%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HuiShouJinE%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BaoFeiYuanYin%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="12%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BaoFeiHouYongTu%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BaoFeiShiJian%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                ShowHeader="false" Height="1px"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>

                                                    <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsCode={0}"
                                                        DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="OldUserCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="OldUserName" HeaderText="原用户" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="OperatorName" HeaderText="操作者" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="ScrapeNumber" HeaderText="报废数量">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="GetAmount" HeaderText="回收金额">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ScrapeReason" HeaderText="报废原因">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="AfterScrapeUse" HeaderText="报废后用处">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="ScrapeTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="报废时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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
                            </td>
                        </tr>
                    </table>
                         </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_Export" />
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
