<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZRequestDetailPrintPage.aspx.cs" Inherits="TTWZRequestDetailPrintPage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script language="javascript">
        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print()
            CloseLayer();
        }
    </script>


    <style type="text/css" media="print">
        .noprint {
            display: none;
        }

        td {
            border-bottom: thin dashed blue;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div style="padding: 0 10px 0 10px">
                <table width="1200px">
                    <tr style="height: 300px;">
                        <td>
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="text-align: center;">
                                                    <h1>
                                                        <asp:Literal ID="LT_RequestCode" runat="server"></asp:Literal>&nbsp;&nbsp;
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BXQKDMXB%>"></asp:Label></h1>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 7%; text-align:right;"><b>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongHuoDanWei%>"></asp:Label>：</b></td>
                                                <td style="width: 18%;"><asp:Literal ID="LT_SupplierName" runat="server"></asp:Literal></td>
                                                <td style="width: 10%; text-align:right;"><b>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>：</b></td>
                                                <td style="width: 20%;"><asp:Literal ID="LT_OpeningBank" runat="server"></asp:Literal></td>
                                                <td style="width: 10%; text-align:right;"><b>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QingKuanRiQi%>"></asp:Label>：</b></td>
                                                <td style="width: 15%;"><asp:Literal ID="LT_RequestTime" runat="server"></asp:Literal></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 7%; text-align:right;"><b>
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：</b></td>
                                                <td style="width: 18%;"><asp:Literal ID="LT_CompactCode" runat="server"></asp:Literal></td>
                                                <td style="width: 10%; text-align:right;"><b>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>：</b></td>
                                                <td style="width: 20%;"><asp:Literal ID="LT_AccountNumber" runat="server"></asp:Literal></td>
                                                <td style="width: 10%; text-align:right;"><b>
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoBiaoRiQi%>"></asp:Label>：</b></td>
                                                <td style="width: 15%;"><asp:Literal ID="LT_CurrentTime" runat="server"></asp:Literal></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Repeater ID="RT_Request" runat="server">
                                            <HeaderTemplate>
                                                <table width="100%">
                                                    <tr>
                                                        <th style="width: 8%;">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa%>"></asp:Label></th>
                                                        <th style="width: 8%;">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShouLiaoDanHao%>"></asp:Label></th>
                                                        <th style="width: 6%;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></th>
                                                        <th style="width: 5%;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></th>
                                                        <th style="width: 10%;">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaiLiaoMingCheng%>"></asp:Label></th>
                                                        <th style="width: 15%;">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></th>
                                                        <th style="width: 5%;">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></th>
                                                        <th style="width: 8%;">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShiShouShuLiang%>"></asp:Label></th>
                                                        <th style="width: 8%;">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label></th>
                                                        <th style="width: 5%;">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label></th>
                                                        <th style="width: 5%;">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YunFei%>"></asp:Label></th>
                                                        <th style="width: 5%;">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></th>
                                                        <th style="width: 8%;">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiHuaJinE%>"></asp:Label></th>
                                                    </tr>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("TicketNumber") %></td>
                                                    <td><%# Eval("CollectCode") %></td>
                                                    <td><%# Eval("StoreRoom") %></td>
                                                    <td><%# Eval("DLCode") %></td>
                                                    <td><%# Eval("ObjectName") %></td>
                                                    <td><%# Eval("Model") %></td>
                                                    <td><%# Eval("UnitName") %></td>
                                                    <td><%# Eval("ActualNumber") %></td>
                                                    <td><%# Eval("ActualMoney") %></td>
                                                    <td><%# Eval("RatioMoney") %></td>
                                                    <td><%# Eval("Freight") %></td>
                                                    <td><%# Eval("OtherObject") %></td>
                                                    <td><%# Eval("PlanCost") %></td>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <hr />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%">
                                            <tr>
                                                <td style="width: 8%;"><b>
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：</b><asp:Literal ID="LT_Progress" runat="server"></asp:Literal></td>
                                                <td style="width: 15%;"><b>
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JieKuanRen%>"></asp:Label>：</b><asp:Literal ID="LT_Borrower" runat="server"></asp:Literal></td>
                                                <td style="width: 15%;"><b>
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiHe%>"></asp:Label>：</b><asp:Literal ID="LT_Approver" runat="server"></asp:Literal></td>
                                                <td style="width: 17%;"><b>
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JieKuanJinEHeJi%>"></asp:Label>：</b></td>
                                                <td style="width: 8%;"><asp:Literal ID="LT_TotalActualNumber" runat="server"></asp:Literal></td>
                                                <td style="width: 8%;"><asp:Literal ID="LT_TotalActualMoney" runat="server"></asp:Literal></td>
                                                <td style="width: 5%;"><asp:Literal ID="LT_TotalRatioMoney" runat="server"></asp:Literal></td>
                                                <td style="width: 5%;"><asp:Literal ID="LT_TotalFreight" runat="server"></asp:Literal></td>
                                                <td style="width: 5%;"><asp:Literal ID="LT_TotalOtherObject" runat="server"></asp:Literal></td>
                                                <td style="width: 5%;"><asp:Literal ID="LT_TotalPlanCost" runat="server"></asp:Literal></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
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
