<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsReturnOrderView.aspx.cs" Inherits="TTGoodsReturnOrderView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            font-family: 微软雅黑,宋体;
            font-size: 1em;
        }
    </style>

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
        <form id="form2" runat="server">
            <div style="position: relative; top: 50px;">
                <table width="100%">
                    <tr>
                        <td width="" align="right">
                            <a href="#" onclick="preview1()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                            </a>
                        </td>
                    </tr>
                </table>
                <!--startprint1-->
                <table style="width: 980px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <table width="100%">
                                <tr>
                                   <td width="200px">
                                        <%--<img src="Logo/FormLogo.png" />--%>
                                         <asp:Image ID="Img_BarCode" runat="server" />
                                    </td>
                                    <td width="550px" style="font-size: xx-large; text-align: center;">
                                        <br />
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,TuiHuoDan%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: center; width: 980px;">
                            <asp:DataList ID="DataList18" runat="server" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">

                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TuiHuoShiJian%>"></asp:Label>
                                                ： <%#DataBinder.Eval(Container.DataItem, "ReturnTime", "{0:yyyy/MM/dd}")%>
                                                <td style="text-align: left">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                    ：<asp:CheckBox ID="CheckBox1" runat="server" />
                                                    <asp:Label ID="Label16" runat="server" Text="作业退料"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox2" runat="server" />
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaiGouTuiHuo%>"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox3" runat="server" />
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KeHuTuiHuo%>"></asp:Label>
                                                    <asp:CheckBox ID="CheckBox4" runat="server" />
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieChuGuiHuan%>"></asp:Label>
                                                </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" colspan="3">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "ReturnName")%>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; width: 70%;">

                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                    </td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>

                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangPinDaiMa%>"></asp:Label></strong>
                                                </td>
                                                <td width="12%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShangPinMingCheng%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                </td>

                                                <td align="center">
                                                    <strong>
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                Height="1px" Width="100%" CellPadding="4"
                                ForeColor="#333333" GridLines="None">
                                <Columns>

                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="ReturnReason" HeaderText="备注">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                    </asp:BoundColumn>
                                </Columns>

                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>

                            <br />
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <table width="80%">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">A：<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LaiLiaoBuLiang%>"></asp:Label></td>

                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">B：<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiaGongBuLiang%>"></asp:Label></td>

                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">C：<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LiangPin%>"></asp:Label></td>

                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">D：<asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <br />
                                        <table width="80%">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BuMenZhuGuan%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,CangGuan%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label>：</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!--endprint1-->
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
