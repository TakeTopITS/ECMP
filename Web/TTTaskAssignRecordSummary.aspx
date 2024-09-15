<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTaskAssignRecordSummary.aspx.cs"
    Inherits="TTTaskAssignRecordSummary" %>

<%@ Register Assembly="System.Web.DataVisualization, Version=4.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35"
    Namespace="System.Web.UI.DataVisualization.Charting" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>

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
        <form id="form1" runat="server">
            <div id="AboveDiv">
                <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="210" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenWuJiLuHuiZong%>"></asp:Label>
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
                        <td>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td width="200" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top; text-align: left;">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                        <br />
                                    </td>
                                    <td width="100px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="100px" align="center" style="padding: 5px 5px 5px 5px;">
                                                    <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                        Text="<%$ Resources:lang,SuoYouChengYuanRenWu%>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                        ShowHeader="false" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                        Font-Bold="true">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_Status" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>' /><br />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="center" />
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <table style="width: 100%; margin-top: 5px">
                                            <tr>
                                                <td>
                                                    <table cellpadding="0" cellspacing="0" width="98%">
                                                        <tr>
                                                            <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                <table style="width: 100%">
                                                                    <tr>
                                                                        <td style="background: #f0f0f0; text-align: left; width: 500px;" colspan="2">
                                                                            <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                                ID="LB_QueryScope" runat="server"></asp:Label>
                                                                        </td>
                                                                        <td style="background: #f0f0f0; text-align: right; width: 300px;" colspan="2">
                                                                            <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                        <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                            &nbsp;
                                                                        <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="height: 16px; padding: 5px 5px 5px 5px;" align="right">
                                                                <a href="#" onclick="preview1()">
                                                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                                </a></td>
                                                        </tr>

                                                        <tr>
                                                            <td>
                                                                <!--startprint1-->
                                                                <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 5px">
                                                                    <tr>
                                                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                                            <br />
                                                                            <strong>
                                                                                <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                                                            </strong>
                                                                            <br />
                                                                            <br />
                                                                            <br />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 16px; padding: 5px 5px 5px 5px;" align="center">
                                                                              <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                                            <%--<asp:Chart ID="Chart1" Width="800px" runat="server">
                                                                                <Series>
                                                                                    <asp:Series Name="Series1" ChartType="Pie" ChartArea="ChartArea1" Legend="Legend1"></asp:Series>
                                                                                </Series>
                                                                                <ChartAreas>
                                                                                    <asp:ChartArea Name="ChartArea1" AlignmentOrientation="Horizontal"></asp:ChartArea>
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
                                                                                    <asp:Title Name="标题" Alignment="TopCenter" IsDockedInsideChartArea="False" DockedToChartArea="ChartArea1"></asp:Title>
                                                                                </Titles>
                                                                            </asp:Chart>--%>
                                                                            <table style="width: 100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                <tr>
                                                                                    <td class="formItemBgStyle">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,RenWuFeiYongHuiZong%>"></asp:Label>:</strong>
                                                                                        <asp:Label ID="LB_Member1" runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td class="formItemBgStyle">
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FaShengFeiYong%>"></asp:Label>:
                                                                                    <asp:Label ID="LB_Amount" runat="server" Font-Bold="True"></asp:Label>
                                                                                    </td>
                                                                                    <td class="formItemBgStyle">(<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiangMuFeiYongZongYuSuan%>"></asp:Label>:&nbsp;
                                                                                    <asp:Label ID="LB_ProExpenseBudget" runat="server" Font-Bold="True"></asp:Label>)
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="formItemBgStyle">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,RenWuRenLiHuiZong%>"></asp:Label>: </strong>
                                                                                        <asp:Label ID="LB_Member2" runat="server"></asp:Label>
                                                                                    </td>
                                                                                    <td class="formItemBgStyle">
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiJiRenLi%>"></asp:Label>:
                                                                                    <asp:Label ID="LB_ManHour" runat="server" Font-Bold="True"></asp:Label>
                                                                                    </td>
                                                                                    <td class="formItemBgStyle">(<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuRenLiZongYuSuan%>"></asp:Label>:
                                                                                    <asp:Label ID="LB_ProManHourBudget" runat="server" Font-Bold="True"></asp:Label>
                                                                                        )
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="padding: 5px 5px 5px 5px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="16%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,RenWuMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="7%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="100px" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>&nbsp;</strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False"
                                                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                Width="100%">
                                                                                <Columns>
                                                                                    <asp:BoundColumn DataField="TaskID" HeaderText="编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTTaskAssignRecord.aspx?TaskID={0}"
                                                                                        DataTextField="Task" HeaderText="任务名称" Target="_blank">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                                    </asp:HyperLinkColumn>
                                                                                    <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Budget" HeaderText="费用预算">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ManHour" HeaderText="工时预算">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemTemplate>
                                                                                            <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="RealManHour" HeaderText="工时">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemTemplate>
                                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTDocumentTreeView.aspx?RelatedType=ProjectTask&RelatedID={0}") %>'
                                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                        </ItemTemplate>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:TemplateColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                <ItemStyle CssClass="itemStyle" />
                                                                            </asp:DataGrid>
                                                                        </td>
                                                                    </tr>

                                                                </table>

                                                                <!--endprint1-->
                                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label><asp:Label
                                                                    ID="LB_Sql" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_OperatorCode" runat="server" Text="All" Visible="False"></asp:Label>
                                                                <br />
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
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
