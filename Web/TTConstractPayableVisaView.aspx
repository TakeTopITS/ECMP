<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractPayableVisaView.aspx.cs" Inherits="TTConstractPayableVisaView" %>


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
                                        <img src="Logo/FormLogo.png" /></td>
                                    <td width="550px" style="font-size: xx-large; text-align: center;">
                                        <br />
                                        <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,HeTongQiaZhen%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="font-size: large; text-align: center; width: 70%;">
                            <asp:DataList ID="DataList35" runat="server" Width="980px" CellPadding="0" CellSpacing="0" DataKeyField="ID">
                                <ItemTemplate>
                                    <table style="width: 980px;">
                                        <tr>
                                            <td style="text-align: center; width: 980px;">
                                                <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left" width="15%">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 35%; text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "ID")%>&nbsp;&nbsp; <%#DataBinder.Eval(Container.DataItem, "VisaName")%>
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,QianZengRen%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "VisaSignMan")%>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td class="formItemBgStyle" style="width: 15%; text-align: left">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                            <%#DataBinder.Eval(Container.DataItem, "VisaSignTime", "{0:yyyy/MM/dd}")%>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,jinE%>"></asp:Label>： </td>
                                                        <td class="formItemBgStyle" align="left">
                                                            <%#DataBinder.Eval(Container.DataItem, "VisaAmount")%>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>： </td>
                                                        <td class="formItemBgStyle" colspan="3" align="left">
                                                            <%#DataBinder.Eval(Container.DataItem, "CurrencyType")%>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label1112212" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：</td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left">

                                                            <%#DataBinder.Eval(Container.DataItem, "Comment")%></td>
                                                    </tr>

                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                                        <td class="formItemBgStyle" colspan="3" align="left">
                                                            <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                            <%#DataBinder.Eval(Container.DataItem, "ProjectID")%>
                                                            <asp:Label ID="LB_ProjectName" runat="server"></asp:Label>
                                                            &nbsp;&nbsp;
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuanLianHeTongYingFuJiHua%>"></asp:Label>：
                                                            <%#DataBinder.Eval(Container.DataItem, "ConstractPayableID")%>
                                                            <asp:Label ID="LB_ConstractPayablePlanName" runat="server"></asp:Label>
                                                        </td>
                                                     
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,XiangGuanYingXiang%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                            <%#DataBinder.Eval(Container.DataItem, "RelatedImpact")%>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="Label245" runat="server" Text="<%$ Resources:lang,ChuLiJieRen%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                            <%#DataBinder.Eval(Container.DataItem, "RelatedResult")%>
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle" style="width: 100px; height: 30px">
                                                            <asp:Label ID="Label240" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" align="left">
                                                            <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
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

                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                            <td align="center" width="12%"><strong>
                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>

                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>
                                                            <td align="center" width="9%"><strong>
                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                            ShowHeader="False"
                                            Width="100%">
                                            <Columns>

                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="VisaDetailName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="VisaNumber" HeaderText="数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="VisaPrice" HeaderText="单价">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="VisaAmount" HeaderText="金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
                <!--endprint1-->
                <br />
                <br />
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
