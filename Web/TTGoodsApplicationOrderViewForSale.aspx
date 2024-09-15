<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsApplicationOrderViewForSale.aspx.cs" Inherits="TTGoodsApplicationOrderViewForSale" %>


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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); } if (top.location != self.location) { } else { CloseWebPage(); }



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
                                    <td width="550px" style="font-size: xx-large; text-align: center;" class="auto-style1">
                                        <br />
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,XiaoShouLingYongShenQing%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: center; width: 980px;">
                            <asp:DataList ID="DataList1" runat="server" Height="1px" Width="980px" CellPadding="0"
                                CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>：
                                            <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ApplyTime")).ToString("yyyy/MM/dd")%>
                                            </td>

                                            <td style="text-align: left">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "GAAName")%>
                                            </td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                </td>
                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="20%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                </td>
                                                 <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong>
                                                </td>

                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>
                            <asp:DataGrid runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                Height="30px" Width="100%" ID="DataGrid1">
                                <Columns>
                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>

                                </Columns>
                                <ItemStyle CssClass="itemStyle"></ItemStyle>
                                <PagerStyle HorizontalAlign="Center"></PagerStyle>
                            </asp:DataGrid>

                            <br />
                            <table width="80%">
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiBiao%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;"></td>
                                    <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhiXing%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;"></td>
                                    <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,PiZhun%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;"></td>
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
