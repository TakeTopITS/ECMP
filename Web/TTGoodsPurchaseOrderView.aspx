<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsPurchaseOrderView.aspx.cs" Inherits="TTGoodsPurchaseOrderView" %>

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

        .auto-style1 {
            /*border-bottom:dotted  1px #C6CFD4;
        height: 19px;
        line-height: 18px;*/
            background-color: #fff;
            background-repeat: no-repeat;
            padding-top: 10px;
            width: 100%;
        }

        .auto-style2 {
            height: 32px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function ()
        {
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
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,ShangPinCaiGouDan%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td style="vertical-align:middle;">
                                       
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center; width: 70%;">
                            <asp:DataList ID="DataList18" runat="server" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td width="200px" style="text-align: left;">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "Supplier")%></td>

                                            <td style="text-align: left;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                 <%#DataBinder.Eval(Container.DataItem, "GPOName")%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "SupplierContacts")%>
                                            </td>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "SupplierPhone")%>
                                            </td>
                                            <td rowspan="3" align="right" valign="top">
                                                <table width="500" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" align="center">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiBiao%>"></asp:Label></td>
                                                        <td class="formItemBgStyle" align="center">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label></td>
                                                        <td class="formItemBgStyle" align="center">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,PiZhun%>"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" height="50px"></td>
                                                        <td class="formItemBgStyle" height="50px"></td>
                                                        <td class="formItemBgStyle" height="50px"></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" class="auto-style2">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieSuanFangShi%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "ClearingForm")%></td>
                                            <td style="text-align: left;" class="auto-style2">

                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：<%#DataBinder.Eval(Container.DataItem, "SupplierFax")%></td>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>：
                                            <%#DataBinder.Eval(Container.DataItem, "PurTime", "{0:yyyy/MM/dd}")%>
                                            </td>

                                            <td style="text-align: left">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaoHuoShiJian%>"></asp:Label>
                                                ：

                                            <%#DataBinder.Eval(Container.DataItem, "ArrivalTime", "{0:yyyy/MM/dd}")%>
                                            </td>
                                            <tr>
                                                <td colspan="3" style="text-align: left;">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                    ： <%#DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                            </tr>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left; width: 70%;">

                            <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td align="right">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>

                                                            <td align="center" width="9%"><strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong> </td>
                                                            <td align="center" width="15%"><strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong> </td>

                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>
                                                           
                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>
                                                            <td align="center" width="9%"><strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HanShuiDanJia%>"></asp:Label></strong> </td>
                                                            
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong> </td>

                                                            <td align="center" ><strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="Both" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">

                                            <Columns>
                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>
                                                 <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TaxPrice" HeaderText="含税单价">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="TaxAmount" HeaderText="含税金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: left;" width="40%">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang, ShenPiZhuangTai%>"></asp:Label>:

                                                     <asp:Label ID="LB_WorkFlowStatus" runat="server"></asp:Label>
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,zonge%>"></asp:Label>:</td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="40%">
                                                    <asp:Label ID="LB_TotalAmount" runat="server"></asp:Label></td>
                                            </tr>
                                            <tr>

                                                <td class="auto-style1" style="font-size: 1em; text-align: left;" width="60%" colspan="3">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,SHQFS%>"></asp:Label>&nbsp;<asp:CheckBox ID="CheckBox4" runat="server" Text="<%$ Resources:lang,GuiGeShu%>" />
                                                    &nbsp;<asp:CheckBox ID="CheckBox5" runat="server" Text="<%$ Resources:lang,CHJNBG%>" />
                                                    &nbsp;<asp:CheckBox ID="CheckBox6" runat="server" Text="<%$ Resources:lang,SCSBG%>" />
                                                    &nbsp;&nbsp;<asp:CheckBox ID="CheckBox8" runat="server" Text="<%$ Resources:lang,QiTa%>" />
                                                </td>
                                            </tr>
                                        </table>

                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td class="formItemBgStyle" style="font-size: 1em; text-align: left;" width="60%">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                               <br />
                                                    1.
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,CLJXFHOMROSHBZ%>"></asp:Label><br />
                                                    2.
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,QZSDCGDSEXSNQRBQDHCRSEXSMYHQDDZSWJQ%>"></asp:Label><br />
                                                    3.
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,QZSHDSZMCGDHPMGGSLJBPSL%>"></asp:Label><br />
                                                    4.
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,RSJWDPZGGSLJHQDBFHCGDGDGYSYFZYQYCFSZSS%>"></asp:Label><br />
                                                    5.
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,QFSBFZWBPBZSHDSBZBPSL%>"></asp:Label><br />
                                                    6.
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,QTYQ%>"></asp:Label><br />
                                                </td>
                                                <td class="formItemBgStyle" style="font-size: inherit; text-align: left;">
                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,GongYingShangHuiQian%>"></asp:Label>：</td>
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
