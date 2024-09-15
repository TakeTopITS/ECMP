<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCollectPrintPag.aspx.cs" Inherits="TTWZCollectPrintPag" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print();
            CloseLayer();
        }

        $(function () {

        });
    </script>


    <style type="text/css" media="print">
        .noprint {
            display: none;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div style="padding: 0 10px 0 10px">
                <asp:Repeater ID="RT_Collect" runat="server" OnItemDataBound="RT_Collect_ItemDataBound">
                    <HeaderTemplate>
                        <table width="1080px" cellpadding="0" cellspacing="0" class="bian">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="height: 300px;">
                            <td style="padding-top: 100px;">
                                <table width="100%">
                                    <tr>
                                        <td style="text-align: center; font-size: 36px;">中石油第二建设公司收料单
                                            <br />
                                            <br />
                                            <br />
                                        </td>
                                    </tr>
                                    <tr style="height: 300px;">
                                        <td>
                                            <table width="100%" cellpadding="0" cellspacing="0" border="1">
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 30%;">收料仓库：<%# Eval("StoreRoom") %></td>
                                                                <td style="width: 20%;">收料方式：<%# Eval("CollectMethod") %></td>
                                                                <td style="width: 30%;">收料日期：<%#  DateTime .Parse ( Eval("CollectTime").ToString ()).ToString ("yyyy-MM-dd") %></td>
                                                                <td style="width: 20%;">货位号：<%# Eval("GoodsCode") %>
                                                                    <br />
                                                                    No：<%# Eval("CollectCode") %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 30%;">材检号：<%# Eval("CheckCode") %></td>
                                                                <td style="width: 20%;">合同号：<%# Eval("CompactCode") %></td>
                                                                <td style="width: 50%;">备注：<%# Eval("StoreRoom") %>：&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 30%;">材料名称：<%# Eval("ObjectName") %></td>
                                                                <td style="width: 20%;">计量单位：<%# Eval("UnitName") %></td>
                                                                <td style="width: 20%;">标准：<%# Eval("Criterion") %></td>
                                                                <td style="width: 30%;">级别：<%# Eval("Grade") %></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 30%;">规格型号：<%# Eval("Model") %></td>
                                                                <td style="width: 20%;">发票号码：<%# Eval("TicketNumber") %></td>
                                                                <td style="width: 20%;">运费：<%# Eval("Freight") %></td>
                                                                <td style="width: 30%;">其它：<%# Eval("OtherObject") %></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 30%;">供货单位：<%# Eval("SupplierName") %></td>
                                                                <td style="width: 20%;">&nbsp;</td>
                                                                <td style="width: 20%;">&nbsp;</td>
                                                                <td style="width: 30%;">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 15%;">应收数量：<%# Eval("CollectNumber") %></td>
                                                                <td style="width: 15%;">实收数量：<%# Eval("ActualNumber") %></td>
                                                                <td style="width: 15%;">计划单价<%# Eval("ActualNumber") %>：&nbsp;</td>
                                                                <td style="width: 15%;">计划金额<%# Eval("ActualNumber") %>：&nbsp;</td>
                                                                <td style="width: 15%;">实购单价：<%# Eval("ActualPrice") %></td>
                                                                <td style="width: 15%;">实购金额：<%# Eval("ActualMoney") %></td>
                                                                <td style="width: 10%;">税金：<%# Eval("RatioMoney") %></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="width: 25%;">供应主管：<%# Eval("DelegateAgentName") %></td>
                                                                <td style="width: 25%;">材检员：<%# Eval("CheckerName") %></td>
                                                                <td style="width: 25%;">保管员：<%# Eval("SafekeeperName") %></td>
                                                                <td style="width: 25%;">制单：<%# Eval("ContacterName") %></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>

            </div>
            <div id="divOver" style="text-align: center">
                <br />
                <p class="noprint">
                    <input id="print" type="button" class="btn" value="确认打印" onclick="printpage();" />
                    <input id="print0" type="button" value="关闭" onclick="CloseLayer();" class="btn" />
                </p>
            </div>
        </center>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
