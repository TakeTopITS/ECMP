<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsSaleQuotationOrderView.aspx.cs" Inherits="TTGoodsSaleQuotationOrderView" %>

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

    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }

        .auto-style1 {
            height: 18px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



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
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,ShangPinBaoJiaDan%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: Left; width: 980px;">
                            <asp:DataList ID="DataList20" runat="server" Height="1px" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" width="100%" style="border-collapse: collapse; margin: 0px auto;" cellpadding="4" cellspacing="0">
                                        <tr>
                                            <td style="text-align: left" colspan="2">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "QOName")%>
                                            </td>


                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                            <a href='TTCustomerInfoView.aspx?CustomerCode=<%#DataBinder .Eval (Container .DataItem ,"CustomerCode") %>' target="DetailArea"><%#DataBinder.Eval(Container.DataItem, "CustomerName")%></a>
                                            </td>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BaoJiaShiJian%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "QuotationTime", "{0:yyyy/MM/dd}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                            <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"SalesCode") %>' target="DetailArea"><%#DataBinder.Eval(Container.DataItem, "SalesName")%></a>
                                            </td>
                                            <td style="text-align: left" class="auto-style1">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "Amount")%><%#DataBinder.Eval(Container.DataItem, "CurrencyType")%></td>

                                        </tr>

                                    </table>
                                </ItemTemplate>
                            </asp:DataList>

                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td width="7">
                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>

                                                <td align="center" width="8%">
                                                    <strong>
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="15%">
                                                    <strong>
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td align="center" width="15%">
                                                    <strong>
                                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                    </strong>
                                                </td>
                                                 <td align="center" width="9%">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                    </strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="5%">
                                                    <strong>
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="8%">
                                                    <strong>
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="Both" Height="1px"
                                ShowHeader="False"
                                Width="100%">

                                <Columns>

                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Amount" HeaderText="金额">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                </Columns>

                                <EditItemStyle BackColor="#2461BF" />

                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                <ItemStyle CssClass="itemStyle" />

                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataGrid>
                            <br />
                            <br />
                            <table width="80%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left;" width="150px">&nbsp;
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhiBiao%>"></asp:Label>：</td>
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
