<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPayDetailPrintPage.aspx.cs" Inherits="TTWZPayDetailPrintPage" %>

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
            <div style="padding: 0 10px 0 10px; width:700px;">
                <table width="100%">
                    <tr style="height:60px;">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width:60%;text-align: left;"><asp:Literal ID="LT_ProjectName" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Literal></td>
                        <td style="width:40%;"><asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:lang,NianYueRi%>"></asp:Literal></td>
                    </tr>
                    <tr style="height:100px;">
                        <td>&nbsp;</td>
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_Upder" runat="server" Text="<%$ Resources:lang,DaXie%>"></asp:Literal><br />
                            <asp:Literal ID="LT_Lower" runat="server" Text="<%$ Resources:lang,XiaoXie%>"></asp:Literal>
                        </td>
                    </tr>
                    <tr style="height:100px;">
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_SupplierName" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height:40px;">
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height:40px;">
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_AccountNumber" runat="server" Text="<%$ Resources:lang,ShouKuanRenZhangHao%>"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height:40px;">
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_OpeningBank" runat="server" Text="<%$ Resources:lang,ShouKuanRenKaiHuHang%>"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height:40px;">
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_PlanCode" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr style="height:40px;">
                        <td style="text-align: left;">
                            <asp:Literal ID="LT_CompactCode" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Literal>
                        </td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td><asp:Literal ID="LT_Borrower" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Literal></td>
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
