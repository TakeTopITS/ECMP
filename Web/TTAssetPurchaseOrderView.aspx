<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAssetPurchaseOrderView.aspx.cs" Inherits="TTAssetPurchaseOrderView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

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
                <table style="width: 1080px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <table width="100%">
                                <tr>
                                    <td width="200px">
                                        <img src="Logo/FormLogo.png" /></td>
                                    <td style="font-size: xx-large; text-align: center;">
                                        <br />
                                        <b>
                                            <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,ZiChanCaiGouDan%>"></asp:Label>
                                        </b>
                                        <br />
                                    </td>
                                    <td width="200px">&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: large; text-align: center; width: 100%;">
                            <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                cellspacing="0">
                                <tr>
                                    <td style="font-size: large; text-align: center; width: 70%;">
                                        <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" CellSpacing="0">
                                            <ItemTemplate>
                                                <table class="bian" cellpadding="4" cellspacing="0" style="border-collapse: collapse; margin: 0px auto; width: 700px;">
                                                    <tr>
                                                        <td style="width: 100px; text-align: left">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouDanHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "POID")%>
                                                        </td>
                                                        <td style="width: 100px; text-align: left;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "POName")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "PurTime", "{0:yyyy/MM/dd}")%>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaoHuoShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "ArrivalTime", "{0:yyyy/MM/dd}")%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "Amount")%>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouYuan%>"></asp:Label>：
                                                        </td>
                                                        <td style="height: 18px; text-align: left">
                                                            <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"PurManCode") %>'
                                                                target="DetailArea">
                                                                <%#DataBinder.Eval(Container.DataItem, "PurManName")%></a>
                                                        </td>

                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                        </td>
                                                        <td style="height: 18px; text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "Comment")%>
                                                        </td>
                                                        <td style="text-align: left">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                        </td>
                                                    </tr>

                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                    <td align="right" valign="top" style="font-size: large;">
                                        <table width="380" cellpadding="3" cellspacing="0" class="formBgStyle">
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
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: large; text-align: center; width: 100%;">
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
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                </td>
                                                <td width="10%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                </td>
                                                <td width="8%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                </td>
                                                <td width="28%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GouMaiLiYou%>"></asp:Label></strong>
                                                </td>
                                                <%--  <td width="6%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                </td>--%>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid runat="server" AutoGenerateColumns="False" GridLines="None"
                                ShowHeader="false" Height="1px" Width="100%" ID="DataGrid1">
                                <Columns>
                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="8%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="AssetName" HeaderText="名称">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Price" HeaderText="单价">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                        DataTextField="ApplicantName" Target="_blank" HeaderText="申请人">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="8%"></ItemStyle>
                                    </asp:HyperLinkColumn>
                                    <asp:BoundColumn DataField="PurReason" HeaderText="购买理由">
                                        <ItemStyle HorizontalAlign="Left" CssClass="itemBorder" Width="28%"></ItemStyle>
                                    </asp:BoundColumn>
                                    <%--  <asp:BoundColumn DataField="Status" HeaderText="状态">
                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="6%"></ItemStyle>
                                    </asp:BoundColumn>--%>
                                </Columns>
                                <ItemStyle CssClass="itemStyle"></ItemStyle>
                                <PagerStyle HorizontalAlign="Center"></PagerStyle>
                            </asp:DataGrid>
                        </td>
                    </tr>
                </table>
                <!--endprint1-->
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>

