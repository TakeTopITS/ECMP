<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMyMemProject.aspx.cs" Inherits="TTMyMemProject"
    EnableEventValidation="true" %>

<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>下属项目列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="layCss" href="js/layer-v3.0.1/layer/skin/default/layer.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1700px;
            width: expression (document.body.clientWidth <= 1700? "1700px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" src="js/allAHandler.js"></script>


    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MyMemberProject%>"></asp:Label>
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
                                <td align="center" colspan="4" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <table width="100%">
                                        <tr>
                                            <td width="40%" align="left">
                                                <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:
                                                <asp:Label ID="LB_QueryScope" runat="server"></asp:Label>
                                            </td>
                                            <td style="text-align: right;">
                                                <asp:Label ID="LB_TBProjectType" runat="server" Text="<%$ Resources:lang,ProjectType %>" />: 
                                            </td>
                                            <td align="left">
                                                <asp:DropDownList ID="DL_ProjectType" runat="server" DataTextField="Type"
                                                    AutoPostBack="True" OnSelectedIndexChanged="DL_ProjectType_SelectedIndexChanged"
                                                    DataValueField="Type" CssClass="DDList">
                                                </asp:DropDownList>
                                            </td>

                                            <td style="text-align: right; width: 30%;" colspan="3">
                                                <span style="font-size: 9pt">
                                                    <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                </span>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>

                                                <asp:Label ID="LB_UserName" runat="server" Font-Size="9pt"
                                                    Style="text-align: center"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" width="100%">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px; overflow: auto;" onmousemove="document.getElementById('TreeView1').style.width = '170px'"
                                                onmouseout="document.getElementById('TreeView1').style.width = '10px'" valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="10">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" width="165" style="padding: 5px 5px 0px 5px; border-left: solid 1px #D8D8D8">
                                                <table width="100%">
                                                    <tr>
                                                        <td style="width: 100%; text-align: center;">
                                                            <asp:Button ID="BT_AllProject" runat="server" CssClass="inpuLong" OnClick="BT_AllProject_Click"
                                                                Text="<%$ Resources:lang,MyMemberProject%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 165;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="10%">
                                                                                    <strong><strong>
                                                                                        <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,DepartmentMember%>"></asp:Label>
                                                                                    </strong></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" BorderColor="#394f66"
                                                                CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid1_ItemCommand"
                                                                ShowHeader="false" Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="直接成员：">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UnderlingCode" runat="server" CssClass="inpu"
                                                                                Style="text-align: right" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                            <asp:Button ID="BT_UnderlingName" runat="server" CssClass="inpu"
                                                                                Style="text-align: left" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>
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
                                                    <tr style="display: none;">
                                                        <td style="width: 170px; text-align: center; padding: 5px 0px 5px 0px;">
                                                            <asp:Button ID="BT_DisplayStatus" runat="server" CssClass="inpuLong" OnClick="BT_DisplayStatus_Click"
                                                                Text="隐去项目状态" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="10%">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_DGProjectStatus" runat="server" Text="<%$ Resources:lang,ProjectStatus%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="false"
                                                                Width="100%">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="项目状态：">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Status" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>'
                                                                                CssClass="inpu" Visible="false" />
                                                                            <asp:Button ID="BT_HomeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>'
                                                                                CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Underling" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top">
                                                <table width="100%" cellpadding="0" cellspacing="0" style="margin-top: 5px">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" style="border-left: solid 1px #D8D8D8">
                                                                        <table cellpadding="0" cellspacing="0" width="99%" style="padding: 5px 5px 5px 5px;">
                                                                            <tr>
                                                                                <td style="width: 100%; vertical-align: top;">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,DGProjectID%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ProjectCode%>"></asp:Label>
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                        <td width="18%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="9%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProjectType" runat="server" Text="<%$ Resources:lang,ProjectType%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGPM" runat="server" Text="<%$ Resources:lang,PM%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="100px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGStartTime" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="110px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProgress" runat="server" Text="<%$ Resources:lang,Progress%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="110px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="50px" align="right">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongShi2%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="55px" align="right">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label8881" runat="server" Text="<%$ Resources:lang,FengXian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="55px" align="right">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QueXian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="55px" align="right">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenDang%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                                        </td>

                                                                                                        <td align="center">
                                                                                                            <strong>
                                                                                                                <%--<asp:Label ID="LB_DGPlan" runat="server" Text="<%$ Resources:lang,Plan%>"></asp:Label></strong>--%>
                                                                                                        </td>
                                                                                                        <td align="center">
                                                                                                            <strong>&nbsp;
                                                                                                            </strong>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Width="100%"
                                                                                        ShowHeader="false" AllowPaging="True" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ProjectID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="TTProjectReportMain.aspx?ProjectID={0}"
                                                                                                DataTextField="ProjectName" HeaderText="项目名称" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="ProjectType" HeaderText="项目类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="PMCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="PMName" HeaderText="项目经理" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="LB_MoreTime" runat="server" Text="<%$ Resources:lang,ChaoQi%>" Height="15px" Font-Size="XX-Small" ToolTip=' <%#DataBinder.Eval (Container .DataItem ,"BeginDate") + "---" + DataBinder.Eval (Container .DataItem ,"EndDate") %>'
                                                                                                        ForeColor="Red"></asp:Label>
                                                                                                    <asp:Label ID="LB_Delaydays" runat="server" Height="15px" Font-Size="XX-Small" ToolTip=' <%#DataBinder.Eval (Container .DataItem ,"BeginDate") + "---" + DataBinder.Eval (Container .DataItem ,"EndDate") %>'
                                                                                                        ForeColor="Red"></asp:Label>
                                                                                                    <asp:Label ID="LB_DayUnit" runat="server" Text="<%$ Resources:lang,Tian%>" Height="15px" Font-Size="XX-Small" ToolTip=' <%#DataBinder.Eval (Container .DataItem ,"BeginDate") + "---" + DataBinder.Eval (Container .DataItem ,"EndDate") %>'
                                                                                                        ForeColor="Red"></asp:Label>

                                                                                                    <asp:Label ID="LB_BeginDate" runat="server" Height="15px" Font-Size="XX-Small" Visible="false"
                                                                                                        BackColor="Yellow" Text=' <%#DataBinder.Eval (Container .DataItem ,"BeginDate") %>'></asp:Label>

                                                                                                    <asp:Label ID="LB_EndDate" runat="server" Height="15px" Font-Size="XX-Small" Visible="false"
                                                                                                        BackColor="Yellow" Text='<%#DataBinder.Eval (Container .DataItem ,"EndDate") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTWorkPlanGanttForProjectStandardActivityCompareMain.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">
                                                                                                        <div class="green" style="text-align: left;">
                                                                                                            <asp:Label ID="LB_FinishPercent" runat="server" Height="20px" Font-Size="XX-Small"
                                                                                                                BackColor="YellowGreen" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                        </div>
                                                                                                        <div class="yellow" style="text-align: right;">
                                                                                                            <asp:Label ID="LB_DefaultPercent" runat="server" Height="20px" Width="15px" Font-Size="XX-Small"
                                                                                                                BackColor="Yellow"></asp:Label>
                                                                                                        </div>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTProjectBudgetReport.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">
                                                                                                        <div class="green" style="text-align: left;">
                                                                                                            <asp:Label ID="LB_RealChargePercent" runat="server" Height="20px" Font-Size="XX-Small"
                                                                                                                BackColor="YellowGreen"></asp:Label>
                                                                                                        </div>
                                                                                                        <div class="yellow" style="text-align: right;">
                                                                                                            <asp:Label ID="LB_BudgetPercent" runat="server" Height="20px" Font-Size="XX-Small"
                                                                                                                BackColor="Yellow"></asp:Label>
                                                                                                        </div>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTProjectMemberManHourSummaryReportForAlone.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">

                                                                                                        <asp:Label ID="LB_WorkhourNumber" runat="server" Text='<%# ShareClass.GetProjectTotalConfirmWorkHour(Eval("ProjectID").ToString()) %>' Width="50px" Height="20px" Font-Size="XX-Small"
                                                                                                            BackColor="YellowGreen"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" VerticalAlign="Middle" Width="50px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTProRelatedRiskView.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">

                                                                                                        <asp:Label ID="LB_RiskNumber" runat="server" Text='<%# ShareClass.GetProjectRiskUnFinishAndFinishNumber(Eval("ProjectID").ToString()) %>' Width="50px" Height="20px" Font-Size="XX-Small"
                                                                                                            BackColor="YellowGreen"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" VerticalAlign="Middle" Width="50px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTProRelatedDefectSummary.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">

                                                                                                        <asp:Label ID="LB_DefectNumber" runat="server" Text='<%# ShareClass.GetProjectDefectUnFinishAndFinishNumber(Eval("ProjectID").ToString()) %>' Width="50px" Height="20px" Font-Size="XX-Small"
                                                                                                            BackColor="YellowGreen"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" VerticalAlign="Middle" Width="50px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href="TTNoTitleDocumentTreeView.aspx?RelatedType=Project&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>"
                                                                                                        target="_blank">

                                                                                                        <asp:Label ID="LB_DocumentNumber" runat="server" Text='<%# ShareClass.GetProjectDocumentNumber(Eval("ProjectID").ToString()) +",  " + ShareClass.GetProjectDocmentNumberAndRequiseDocument(Eval("ProjectID").ToString())  %>' Width="50px" Height="20px" Font-Size="XX-Small"
                                                                                                            BackColor="YellowGreen"></asp:Label>
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" VerticalAlign="Middle" Width="50px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTWorkPlanViewMain.aspx?ProjectID=<%#DataBinder.Eval (Container .DataItem ,"ProjectID") %>' target="_blank">

                                                                                                        <img src="ImagesSkin/plan.png" alt="ProjectPlan" width="32px" height="32px" style="border: none;" />
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <div onclick="popShowByURLForFixedSize('TTProLeaderReview.aspx?ProjectID=<%#DataBinder.Eval (Container .DataItem ,"ProjectID") %>','信息',800,600)">
                                                                                                        <img src="ImagesSkin/AMPLeader.png" alt="ProjectPlan" width="32px" height="32px" style="border: none;" />
                                                                                                    </div>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid>
                                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100%; height: 12px; text-align: left;" valign="top">
                                                                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" Width="100%" runat="server" ActiveTabIndex="0">
                                                                                        <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="项目状态">

                                                                                            <HeaderTemplate>

                                                                                                <asp:Label ID="LB_ProjectStatusChart" runat="server" Text="<%$ Resources:lang,ProjectStatusChart%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table width="100%">

                                                                                                    <tr>

                                                                                                        <td>

                                                                                                            <div class="renyList">

                                                                                                                <asp:Repeater ID="RP_ChartList" runat="server">
                                                                                                                    <ItemTemplate>
                                                                                                                        <asp:Label ID="LB_ChartName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartName") %>' Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="LB_ChartType" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ChartType") %>' Visible="false"></asp:Label>
                                                                                                                        <asp:Label ID="LB_SqlCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SqlCode") %>' Visible="false"></asp:Label>
                                                                                                                        
                                                                                                                        <iframe src="TTTakeTopAnalystChartSet.aspx?FormType=<%# DataBinder.Eval(Container.DataItem,"FormType") %>&ChartType=<%# DataBinder.Eval(Container.DataItem,"ChartType") %>&ChartName=<%# DataBinder.Eval(Container.DataItem,"ChartName") %>" style="width: 300px; height: 295px; border: 1px solid white; text-align: center; overflow: hidden;"></iframe>
                                                                                                                    </ItemTemplate>
                                                                                                                </asp:Repeater>
                                                                                                                <br />
                                                                                                                <br />
                                                                                                            </div>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="center" style="vertical-align: bottom;">
                                                                                                            <asp:HyperLink ID="HL_SystemAnalystChartRelatedUserSet" runat="server" Text="<%$ Resources:lang,FenXiTuSheZhi%>"></asp:HyperLink>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="项目费用">

                                                                                            <HeaderTemplate>

                                                                                                <asp:Label ID="LB_ProjectExpense" runat="server" Text="<%$ Resources:lang,ProjectExpense%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table>

                                                                                                    <tr>

                                                                                                        <td style="width: 30px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer1" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost1" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer1" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg1"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg1" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer2" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost2" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer2" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg2"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg2" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer3" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost3" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer3" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg3"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg3" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer4" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost4" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer4" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg4"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg4" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer5" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost5" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer5" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg5"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg5" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer6" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost6" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer6" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg6"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg6" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer7" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost7" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer7" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg7"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg7" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer8" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost8" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer8" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg8"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg8" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer9" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost9" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer9" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton ID="IMB_ProBdg9"
                                                                                                                            runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg" Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg9" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>

                                                                                                        <td style="width: 60px; text-align: center; vertical-align: bottom; height: 164px;">

                                                                                                            <table>

                                                                                                                <tr>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_CostPer10" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProCost10" runat="server" ImageUrl="~/Images/FinishPercentCost.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>

                                                                                                                    <td style="width: 30px; text-align: center; vertical-align: bottom;">

                                                                                                                        <asp:Label ID="LB_BdgPer10" runat="server" Text="1"></asp:Label><br />
                                                                                                                        <asp:ImageButton
                                                                                                                            ID="IMB_ProBdg10" runat="server" ImageUrl="~/Images/FinishPercentBudget.jpg"
                                                                                                                            Width="30px" />
                                                                                                                    </td>
                                                                                                                </tr>

                                                                                                                <tr>

                                                                                                                    <td colspan="2">

                                                                                                                        <asp:Label ID="LB_ProBdg10" runat="server"></asp:Label>
                                                                                                                    </td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="综合查询">

                                                                                            <HeaderTemplate>

                                                                                                <asp:Label ID="LB_IntegratedQuery" runat="server" Text="<%$ Resources:lang,IntegratedQuery%>"></asp:Label>
                                                                                            </HeaderTemplate>

                                                                                            <ContentTemplate>

                                                                                                <table style="width: 80%;" cellpadding="3" cellspacing="0" class="formBgStyle">

                                                                                                    <tr>

                                                                                                        <td style="width: 15%; text-align: right;" class="formItemBgStyle">

                                                                                                            <span>

                                                                                                                <asp:Label ID="LB_ProjectName" runat="server" Text="<%$ Resources:lang,ProjectName %>"></asp:Label>:</span>
                                                                                                        </td>

                                                                                                        <td style="width: 35%; text-align: left;" class="formItemBgStyle">

                                                                                                            <asp:TextBox ID="TB_ProjectName" runat="server" Width="95%" Font-Size="10pt"></asp:TextBox>
                                                                                                        </td>

                                                                                                        <td style="width: 15%;" align="center" class="formItemBgStyle">

                                                                                                            <asp:Button ID="BT_HazyFind" runat="server" OnClick="BT_HazyFind_Click" Text="<%$ Resources:lang,FuzzySearch %>"
                                                                                                                Font-Size="10pt" CssClass="inpuLong" />
                                                                                                        </td>

                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td style="text-align: right" class="formItemBgStyle">

                                                                                                            <span>

                                                                                                                <asp:Label ID="LB_ProjectID" runat="server" Text="<%$ Resources:lang,ProjectID %>"></asp:Label>:</span>
                                                                                                        </td>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">

                                                                                                            <asp:TextBox ID="TB_ProjectID" runat="server"></asp:TextBox>
                                                                                                        </td>

                                                                                                        <td align="center" class="formItemBgStyle">

                                                                                                            <asp:Button ID="BT_ProjectIDFind" runat="server" Text="<%$ Resources:lang,Find %>"
                                                                                                                OnClick="BT_ProjectIDFind_Click" CssClass="inpuLong" />
                                                                                                        </td>

                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td style="text-align: right;" class="formItemBgStyle">

                                                                                                            <span>

                                                                                                                <asp:Label ID="LB_ProjectCreator" runat="server" Text="<%$ Resources:lang,ProjectCreator %>"></asp:Label>:</span>
                                                                                                        </td>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">

                                                                                                            <asp:TextBox ID="TB_MakeUser" runat="server" Width="95%"></asp:TextBox>
                                                                                                        </td>

                                                                                                        <td style="text-align: center" class="formItemBgStyle">

                                                                                                            <asp:Button ID="BT_MakeUserFind" runat="server" OnClick="BT_MakeUserFind_Click" Text="<%$ Resources:lang,Find %>"
                                                                                                                CssClass="inpuLong" />
                                                                                                        </td>

                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td style="text-align: right" class="formItemBgStyle">

                                                                                                            <asp:Label ID="LB_StartTime" runat="server" Text="<%$ Resources:lang,StartTime %>"></asp:Label>:<br />
                                                                                                        </td>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">

                                                                                                            <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox>

                                                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True">
                                                                                                            </ajaxToolkit:CalendarExtender>
                                                                                                        </td>

                                                                                                        <td rowspan="2" style="vertical-align: middle; text-align: center;" class="formItemBgStyle">

                                                                                                            <asp:Button ID="BT_DateFind" runat="server" OnClick="BT_DateFind_Click" Text="<%$ Resources:lang,Find %>"
                                                                                                                CssClass="inpuLong" />
                                                                                                        </td>

                                                                                                    </tr>

                                                                                                    <tr>

                                                                                                        <td style="text-align: right" class="formItemBgStyle">

                                                                                                            <asp:Label ID="LB_EndTime" runat="server" Text="<%$ Resources:lang,EndTime %>"></asp:Label>:
                                                                                                        </td>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">

                                                                                                            <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox>

                                                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                                runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                                                            </ajaxToolkit:CalendarExtender>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>

                                                                                                <br />
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                    </cc2:TabContainer>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <%--  <td style="width: 230px; padding: 5px 0px 0px 5px; border-left: solid 1px #D8D8D8" valign="top" align="left">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                    ShowLines="True" Width="230">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>--%>
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
