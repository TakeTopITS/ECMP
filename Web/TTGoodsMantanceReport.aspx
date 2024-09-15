<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsMantanceReport.aspx.cs"
    Inherits="TTGoodsMantanceReport" %>

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
                                <table style="width: 90%;">
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsCode" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                        </td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsName" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td>&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                        <td>
                                            <asp:TextBox ID="TB_GoodsType" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WeiHuRen%>"></asp:Label>：</td>
                                        <td colspan="2">
                                            <asp:TextBox ID="TB_MTManName" runat="server" Width="190px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                        </td>
                                        <td>

                                            <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                runat="server" TargetControlID="DLC_StartTime">
                                            </ajaxToolkit:CalendarExtender>

                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                        </td>
                                        <td>


                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                runat="server" TargetControlID="DLC_EndTime">
                                            </ajaxToolkit:CalendarExtender>
                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            &nbsp;<asp:Button ID="BT_Export" runat="server" CssClass="inpu" OnClick="BT_Export_Click" Text="<%$ Resources:lang,DaoChu%>" />


                                        </td>
                                        <td align="center">
                                            <a href="#" onclick="preview1()">
                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                            </a>
                                        </td>
                                    </tr>

                                </table>
                                <hr />
                                <!--startprint1-->
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                            <br />
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinWeiHuBaoBiao%>"></asp:Label>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Left;" colspan="4">&nbsp;<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server"
                                                Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td align="center">&nbsp;</td>
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
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShangPinMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WeiHuRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="27%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WeiHuNeiRong%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="16%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WeiXiuShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
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
                                                ShowHeader="false"
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="ID" HeaderText=" 序号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>

                                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:BoundColumn>

                                                    <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsCode={0}"
                                                        DataTextField="GoodsName" HeaderText="物料名称" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:HyperLinkColumn>

                                                    <asp:HyperLinkColumn DataNavigateUrlField="MTManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="MTManName" HeaderText="用户" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="description" HeaderText="维护内容">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="27%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="MTTime" HeaderText="维修时间" DataFormatString="{0:yyyy/MM/dd}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Cost" HeaderText="费用">
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
