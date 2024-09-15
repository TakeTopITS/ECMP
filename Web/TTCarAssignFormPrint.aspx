<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCarAssignFormPrint.aspx.cs"
    Inherits="TTCarAssignFormPrint" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <form id="form1" runat="server">
        <center>
            <table width="100%">
                <tr>
                    <td width="" align="right">
                        <a href="#" onclick="preview1()">
                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                        </a>
                    </td>
                </tr>
                <tr>
                    <td align="center">
                        <!--startprint1-->
                        <div>
                            <br />
                            <br />
                            <br />
                            <table width="100%">
                                <tr>
                                    <td style="text-align: center; font-size: xx-large;">
                                        <b>
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PaiCheDan%>"></asp:Label>
                                        </b>
                                    </td>
                                </tr>
                            </table>

                            <br />

                            <br />
                            <br />
                            <asp:DataList ID="DataList1" runat="server" Height="1px" Width="800px" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table border="1" style="width: 800px; border-collapse: collapse; margin: 0px auto;"
                                        cellpadding="4" cellspacing="0">
                                        <tr>
                                            <td style="width: 15%; text-align: right">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                            </td>
                                            <td style="width: 35%; text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "ID")%>
                                            </td>
                                            <td style="width: 15%; text-align: right">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChePaiHaoMa%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "CarCode")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingBuMen%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "DepartName")%>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "ApplicantName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,SiJi%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "DriverName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongCheShiJian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "DepartTime", "{0:yyyy/MM/dd HH:MM}")%>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HuanCheShiJian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "BackTime", "{0:yyyy/MM/dd HH:MM}")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangCheDiDian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "BoardingSite")%>
                                            </td>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MuDiDi%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "Destination")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,SuiCheRen%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 18px; text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "Attendant")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 60px; text-align: right">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuCheYuanYin%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 60px; text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 60px; text-align: right">
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PaiCheRenQianZi%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 60px; text-align: left">
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center" colspan="4">
                                                <b>
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChuCheZhuangKuangMWTXHJHSJ%>"></asp:Label></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ChuFaShiJian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left"></td>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouCheShiJian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 60px; text-align: right">
                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MenWeiQianZi%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 60px; text-align: left"></td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: center" colspan="4">
                                                <b>
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LCFYQKSJTXHJHPCR%>"></asp:Label></b>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 30px; text-align: right;">
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,SiJiTianXie%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 30px; text-align: left">
                                                <table width="100%">
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZongLiCheng%>"></asp:Label>：
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuoLuFei%>"></asp:Label>：
                                                        </td>
                                                        <td></td>
                                                        <td>
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,TingCheFei%>"></asp:Label>：
                                                        </td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiaYou%>"></asp:Label>：</td>
                                                        <td>&nbsp;</td>
                                                        <td>
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiaYouFei%>"></asp:Label>：</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 60px; text-align: right">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,SiJiQianZi%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="height: 60px; text-align: left"></td>
                                        </tr>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>

                        <!--endprint1-->
                    </td>
                </tr>
            </table>

        </center>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
