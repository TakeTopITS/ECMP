<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractManagement.aspx.cs"
    Inherits="TTConstractManagement" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1800px;
            width: expression (document.body.clientWidth <= 1800? "1800px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

            //隐藏没有数据的分析图
            hideIframesForNoDataAnalystChart(function () {
                console.log('所有 iframe 处理完成');
            });

        });
    </script>
</head>
<body ms_positioning="GridLayout" leftmargin="0">
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" colspan="2" style="padding-top: 5px; height: 25px;">
                                    <asp:RadioButtonList ID="RBL_ConstractClass" RepeatDirection="Horizontal"
                                        runat="server" AutoPostBack="True" DataTextField="BigType" DataValueField="BigType"
                                        OnSelectedIndexChanged="RBL_ConstractClass_SelectedIndexChanged">
                                    </asp:RadioButtonList>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 5px 5px 5px 5px;">

                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>

                                            <td align="left" colspan="2">
                                                <asp:DropDownList ID="DL_ConstractType" runat="server" DataTextField="Type"
                                                    DataValueField="Type" Height="25px" Width="100px">
                                                </asp:DropDownList>
                                                &nbsp;<asp:Label ID="Label13534" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label>：
                                                                <asp:TextBox ID="TB_ConstractCode" runat="server" Width="60px"></asp:TextBox>
                                                &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：
                                                                <asp:TextBox ID="TB_ConstractName" runat="server" Width="80px"></asp:TextBox>
                                                &nbsp;
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YiFangFuZeRen%>"></asp:Label>：
                                                                        <asp:TextBox ID="TB_PartBOperator" runat="server" Width="60px"></asp:TextBox>
                                                &nbsp;
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiaFangFuZeRen%>"></asp:Label>：
                                                                        <asp:TextBox ID="TB_PartAOperator" runat="server" Width="60px"></asp:TextBox>
                                                &nbsp;<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label>：
                                                                <asp:TextBox ID="TB_PartA" runat="server" Width="70px"></asp:TextBox>
                                                &nbsp;<asp:Button ID="BT_Find" runat="server" CssClass="inpu "
                                                    OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left; padding: 5px 0px 5px 0px;">
                                                <asp:Label ID="LB_ConstractOwner" runat="server"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server"
                                                    Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server"
                                                    Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td >
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JieZhiRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FuZeRen%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <div style="border: 0px; margin: 0px; overflow: auto; width: 100%; _height: 800px; min-height: 800px;">
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="false"
                                                        Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="20" Width="100%"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                                        <Columns>
                                                            <asp:BoundColumn DataField="ConstractCode" HeaderText="<%$ Resources:lang,HeTongDaiMa%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractDetail.aspx?ConstractCode={0}"
                                                                DataTextField="ConstractName" HeaderText="<%$ Resources:lang,HeTongMingCheng%>" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="ConstractClass" HeaderText="<%$ Resources:lang,DaLei%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Type" HeaderText="<%$ Resources:lang,LeiXing%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Status" HeaderText="<%$ Resources:lang,ZhuangTai%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SignDate" HeaderText="<%$ Resources:lang,QianDingRiQi%>" DataFormatString="{0:yyyy/MM/dd}">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Amount" HeaderText="<%$ Resources:lang,JinE%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Currency" HeaderText="<%$ Resources:lang,BiZhong%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StartDate" HeaderText="<%$ Resources:lang,KaiShiRiQi%>" DataFormatString="{0:yyyy/MM/dd}">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="EndDate" HeaderText="<%$ Resources:lang,JieZhiRiQi%>" DataFormatString="{0:yyyy/MM/dd}">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PartA" HeaderText="<%$ Resources:lang,JiaFangDanWei%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PartAOperator" HeaderText="<%$ Resources:lang,FuZeRen%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PartB" HeaderText="<%$ Resources:lang,YiFangDanWei%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PartBOperator" HeaderText="<%$ Resources:lang,FuZeRen%>">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                        </Columns>

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    <br />
                                                    <br />
                                                    <table>
                                                        <tr>
                                                            <td>

                                                                <iframe runat="server" id="IFrame_Chart_ConstractType" src="TTTakeTopAnalystChartSet.aspx" style="width: 300px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>



                                                                <%-- <asp:Chart ID="Chart_ConstractType" runat="server" Width="400px">
                                                                    <Series>
                                                                        <asp:Series ChartArea="ChartArea1" ChartType="Pie" Legend="Legend1" Name="Series1">
                                                                        </asp:Series>
                                                                    </Series>
                                                                    <ChartAreas>
                                                                        <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                                        </asp:ChartArea>
                                                                    </ChartAreas>
                                                                    <Legends>
                                                                        <asp:Legend Name="Legend1">
                                                                            <CellColumns>
                                                                                <asp:LegendCellColumn Name="Column2">
                                                                                    <Margins Left="15" Right="15" />
                                                                                </asp:LegendCellColumn>
                                                                                <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column3">
                                                                                    <Margins Left="15" Right="15" />
                                                                                </asp:LegendCellColumn>
                                                                            </CellColumns>
                                                                        </asp:Legend>
                                                                    </Legends>
                                                                    <Titles>
                                                                        <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="标题">
                                                                        </asp:Title>
                                                                    </Titles>
                                                                </asp:Chart>--%>

                                                            </td>
                                                            <td>

                                                                <iframe runat="server" id="IFrame_Chart_ConstractStatus" src="TTTakeTopAnalystChartSet.aspx" style="width: 300px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>

                                                                <%--  <asp:Chart ID="Chart_ConstractStatus" runat="server" Width="400px">
                                                                    <Series>
                                                                        <asp:Series ChartArea="ChartArea1" ChartType="Pie" Legend="Legend1" Name="Series1">
                                                                        </asp:Series>
                                                                    </Series>
                                                                    <ChartAreas>
                                                                        <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                                        </asp:ChartArea>
                                                                    </ChartAreas>
                                                                    <Legends>
                                                                        <asp:Legend Name="Legend1">
                                                                            <CellColumns>
                                                                                <asp:LegendCellColumn Name="Column2">
                                                                                    <Margins Left="15" Right="15" />
                                                                                </asp:LegendCellColumn>
                                                                                <asp:LegendCellColumn ColumnType="SeriesSymbol" Name="Column3">
                                                                                    <Margins Left="15" Right="15" />
                                                                                </asp:LegendCellColumn>
                                                                            </CellColumns>
                                                                        </asp:Legend>
                                                                    </Legends>
                                                                    <Titles>
                                                                        <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="False" Name="标题">
                                                                        </asp:Title>
                                                                    </Titles>
                                                                </asp:Chart>--%>

                                                            </td>
                                                            <td>

                                                                <iframe runat="server" id="IFrame_Chart_ConstractAmountTendency" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                <%--<asp:Chart ID="Chart_ConstractAmountTendency" runat="server" ImageType="Png" Width="800px">

                                                                    <Legends>
                                                                        <asp:Legend Enabled="False" Font="Trebuchet MS, 8.25pt, style=Bold" IsTextAutoFit="False" Name="Default">
                                                                        </asp:Legend>
                                                                    </Legends>
                                                                    <BorderSkin SkinStyle="Emboss" />
                                                                    <Series>
                                                                        <asp:Series BorderColor="180, 26, 59, 105" BorderWidth="3" ChartType="Line" Color="220, 65, 140, 240" MarkerSize="8" MarkerStyle="Circle" Name="Series1" ShadowColor="Black" ShadowOffset="2" XValueType="Double" YValueType="Double">
                                                                        </asp:Series>
                                                                    </Series>
                                                                    <ChartAreas>
                                                                        <asp:ChartArea Name="ChartArea1">
                                                                            <AxisY LineColor="64, 64, 64, 64">
                                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                                                            </AxisY>
                                                                            <AxisX LineColor="64, 64, 64, 64">
                                                                                <LabelStyle Font="Trebuchet MS, 8.25pt, style=Bold" />
                                                                                <MajorGrid LineColor="64, 64, 64, 64" />
                                                                            </AxisX>
                                                                        </asp:ChartArea>
                                                                    </ChartAreas>
                                                                </asp:Chart>--%>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                            <td valign="top" width="170px" align="right" style="border-left: solid 1px #D8D8D8">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" HorizontalAlign="Center" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="直接成员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"
                                                                    Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"
                                                                    Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>



                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
