<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSendPrintPage.aspx.cs" Inherits="TTWZSendPrintPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript">
        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print();
            CloseLayer();
        }
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
                <asp:Repeater ID="RT_Send" runat="server" OnItemDataBound="RT_Send_ItemDataBound">
                    <HeaderTemplate>
                        <table width="700px">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="height:300px;">
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:30%;"><%--库别--%><%# Eval("StoreRoom") %></td>
                                                    <td style="width:40%;"><%--发料方式--%><%# Eval("SendMethod") %></td>
                                                    <td style="width:30%;"><%--货位号--%><%# Eval("GoodsCode") %></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:30%;"><%--领料单位--%><%# Eval("PickingUnit") %></td>
                                                    <td style="width:40%;"><%--发料日期--%><%# Eval("SendTime") %></td>
                                                    <td style="width:30%;"><%--No<%# Eval("StoreRoom") %>--%>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:40%;"><%--材料名称--%><%# Eval("ObjectName") %></td>
                                                    <td style="width:40%;"><%--规格型号--%><%# Eval("Model") %></td>
                                                    <td style="width:10%;"><%--标准--%><%# Eval("Criterion") %></td>
                                                    <td style="width:10%;"><%--级别--%><%# Eval("Grade") %></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:10%;"><%--应发数量--%><%# Eval("PlanNumber") %></td>
                                                    <td style="width:10%;"><%--实发数量--%><%# Eval("ActualNumber") %></td>
                                                    <td style="width:10%;"><%--单位--%><%# Eval("UnitName") %></td>
                                                    <td style="width:10%;"><%--计划单价--%><%# Eval("PlanPrice") %></td>
                                                    <td style="width:10%;"><%--计划金额--%><%# Eval("PlanMoney") %></td>
                                                    <td style="width:10%;"><%--销售单价--%><%# Eval("SalePrice") %></td>
                                                    <td style="width:10%;"><%--销售金额--%><%# Eval("SaleMoney") %></td>
                                                    <td style="width:10%;"><%--管理费率--%><%# Eval("ManageRate") %></td>
                                                    <td style="width:10%;"><%--管理费--%><%# Eval("ManageMoney") %></td>
                                                    <td style="width:10%;"><%--合计金额--%><%# Eval("TotalMoney") %></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td  style="width:40%;"><%--工程编码--%><%# Eval("ProjectCode") %></td>
                                                    <td  style="width:58%;"><%--材检号--%><%# Eval("CheckCode") %></td>
                                                    <td  style="width:1%;">&nbsp;</td>
                                                    <td  style="width:1%;">&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td  style="width:80%;"><%--用途<%# Eval("SupplierCode") %>--%>&nbsp;</td>
                                                    <td  style="width:10%;"><%--跌价比例<%# Eval("SupplierCode") %>--%>&nbsp;</td>
                                                    <td  style="width:20%;"><%--跌价金额<%# Eval("SupplierCode") %>--%>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:20%;"><%--领料主管--%><%# Eval("UpLeaderName") %></td>
                                                    <td style="width:20%;"><%--材检员--%><%# Eval("CheckerName") %></td>
                                                    <td style="width:20%;"><%--领料人--%><%# Eval("SafekeeperName") %></td>
                                                    <td style="width:20%;"><%--发料--%><%# Eval("PurchaseEngineerName") %></td>
                                                    <td style="width:20%;"><%--制单--%><asp:Literal ID="LT_Marker" runat="server"></asp:Literal></td>
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
