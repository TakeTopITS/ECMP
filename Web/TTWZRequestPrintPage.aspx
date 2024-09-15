<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZRequestPrintPage.aspx.cs" Inherits="TTWZRequestPrintPage" %>

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

        td{border-bottom : thin dashed blue}

    </style>
</head>
<body>
    <form id="form1" runat="server">
        <center>
            <div style="padding: 0 10px 0 10px">
                <asp:Repeater ID="RT_Request" runat="server">
                    <HeaderTemplate>
                        <table width="800px">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr style="height:300px;">
                            <td>
                                <table width="100%">
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="text-align:center;">
                                                        <h1>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZYEJBXQKD%>"></asp:Label></h1>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:30%;"><b>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label>：</b><%# Eval("RequestCode") %></td>
                                                    <td style="width:70%;"><b>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QingKuanRiQi%>"></asp:Label>：</b><%# Eval("RequestTime") %></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%" style="border:solid;" cellpadding="1" cellspacing="0">
                                                <tr>
                                                    <td style="width:15%;text-align:right;"><b>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongHuoDanWei%>"></asp:Label>：</b></td>
                                                    <td style="width:65%;text-align:left;" colspan="3"><%# Eval("SupplierName") %></td>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaJinE%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("ActualMoney") %></td>
                                                </tr>
                                                <tr>
                                                    <td style="width:15%;text-align:right;"><b>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongHao%>"></asp:Label>：</b></td>
                                                    <td style="width:65%;text-align:left;" colspan="3"><%# Eval("CompactCode") %>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <b>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label>：</b><%# Eval("UseWay") %>
                                                    </td>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("ActualMoney") %></td>
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>：</b></td>
                                                    <td style="width:70%;text-align:left;" colspan="3"><%# Eval("OpeningBank") %></td>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("RatioMoney") %></td>
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>：</b></td>
                                                    <td style="width:70%;text-align:left;" colspan="3"><%# Eval("AccountNumber") %></td>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YunFei%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("Freight") %></td>
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</b></td>
                                                    <td style="width:15%;text-align:left;"><%# Eval("RowNumber") %></td>
                                                    <td style="width:25%;"><b>
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShouLiaoDanZhangShu%>"></asp:Label>：</b><%# Eval("RowNumber") %></td>
                                                    <td style="width:20%;"><b>
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：</b><%# Eval("Progress") %></td>
                                                    <td style="width:20%;text-align:right;"><b>
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("OtherObject") %></td>
                                                </tr>
                                                <tr>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,RenMinBiDaXie%>"></asp:Label>：</b></td>
                                                    <td style="width:70%;text-align:left;" colspan="3"><%# Eval("BorrowMoney") %></td>
                                                    <td style="width:10%;text-align:right;"><b>
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JieKuanJinE%>"></asp:Label>：</b></td>
                                                    <td style="width:10%;"><%# Eval("BorrowMoney") %></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <table width="100%">
                                                <tr>
                                                    <td style="width:21%;"><b>
                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CaiWuZhuGuan%>"></asp:Label>：</b><%# Eval("Approver") %></td>
                                                    <td style="width:17%;"><b>
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,KuaiJi%>"></asp:Label>：</b><%--<%# Eval("Approver") %>--%></td>
                                                    <td style="width:17%;"><b>
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiHe%>"></asp:Label>：</b><%--<%# Eval("Approver") %>--%></td>
                                                    <td style="width:25%;"><b>
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JieKuanDanWeiZhuGuan%>"></asp:Label>：</b><%--<%# Eval("Approver") %>--%></td>
                                                    <td style="width:20%;"><b>
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JieKuanRen%>"></asp:Label>：</b><%# Eval("Borrower") %></td>
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
