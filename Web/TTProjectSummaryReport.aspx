<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectSummaryReport.aspx.cs" Inherits="TTProjectSummaryReport" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
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

    <center>
        <form id="form1" runat="server">
            <br />

            <table cellpadding="0" cellspacing="0" width="980px;" class="bian">
                <tr>
                    <td style="text-align: Right; height: 25px;">
                        <a href="#" onclick="preview1()">
                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                        </a>
                    </td>
                </tr>
            </table>
            <!--startprint1-->

            <table cellpadding="0" cellspacing="0" width="980px;" class="bian">

                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="98%">
                                        <tr>
                                            <td align="center" style="padding: 0px 5px 0px 5px; font-weight: bold; height: 24px;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="text-align: left; height: 25px; text-align: center; font-size: x-large;line-height: 110%;">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：
                                                           <asp:Label ID="LB_Project" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,TongJiBaoBiao%>"></asp:Label><br />
                                                        </td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">

                                                <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                    <tr>
                                                        <td style="text-align: Left;"></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="background: #f0f0f0; text-align: Left;">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiBenQingKongTongJiBaoBiao%>"></asp:Label>
                                                            </strong>

                                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center">

                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                                
                                                                <Columns>

                                                                    <asp:BoundColumn DataField="Title" HeaderText="主题">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SummaryNumber" HeaderText="应收金额">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="60%" />
                                                                    </asp:BoundColumn>

                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="background: #f0f0f0; text-align: Left;">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XMGCGZLBBGCZDY%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>

                                                                                <td align="center" width="25%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GongZuoNiRong%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="25%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuJiGongZuoLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="25%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShiJiGongZuoLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="25%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BaiFenBi%>"></asp:Label></strong>
                                                                                </td>


                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                                
                                                                <Columns>

                                                                    <asp:BoundColumn DataField="Name" HeaderText="计划内容">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ManHourBudget" HeaderText="估计工作量（人日）">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ManHourTrue" HeaderText="估计工作量（人日）">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="HourPercent" HeaderText="百分比">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:BoundColumn>


                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="background: #f0f0f0; text-align: Left;">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,RenYuanShiJiTouRuTongJiBiao%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>

                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,RenYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JinRuShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="15%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LiKaiShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongZuoLiang%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center" width="20%">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZongJiChengBen%>"></asp:Label></strong>
                                                                                </td>

                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                                
                                                                <Columns>

                                                                    <asp:BoundColumn DataField="UserName" HeaderText="人员">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Actor" HeaderText="职位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UnitHourSalary" HeaderText="单价">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="JoinDate" HeaderText="进入时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="LeaveDate" HeaderText="离开时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MemberManHour" HeaderText="估计工作量（人日）">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="TotalCost" HeaderText="总计成本">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>

                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>

                                                        </td>
                                                    </tr>

                                                    <tr style="display: none;">
                                                        <td class="tdTopLine" align="center">
                                                            <table style="width: 800px;">
                                                                <tr>
                                                                    <td align="center">

                                                                        <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                        <%--<asp:Chart ID="Chart1" Width="800px" runat="server">
                                                                            <Series>
                                                                                <asp:Series Name="Series1" ChartType="Column" Label="#VAL">
                                                                                </asp:Series>
                                                                            </Series>
                                                                            <ChartAreas>
                                                                                <asp:ChartArea Name="ChartArea1" AlignmentOrientation="Horizontal">
                                                                                </asp:ChartArea>
                                                                            </ChartAreas>
                                                                            <Titles>
                                                                                <asp:Title Name="标题" Alignment="TopCenter" IsDockedInsideChartArea="false" DockedToChartArea="ChartArea1">
                                                                                </asp:Title>
                                                                            </Titles>
                                                                            <%-- <Legends>
                                                                                        <asp:Legend Name="栏目" IsDockedInsideChartArea="false" DockedToChartArea="NotSet">
                                                                                        </asp:Legend>
                                                                                    </Legends>--%>
                                                                        </asp:Chart>--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>

            <!--endprint1-->
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
