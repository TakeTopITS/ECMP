<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTArchiveProject.aspx.cs"
    Inherits="TTArchiveProject" %>

<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>整个项目状态</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1700px;
            width: expression (document.body.clientWidth <= 1700? "1700px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ArchiveProject%>"></asp:Label>
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
                                <td align="left" width="100%">
                                    <table width="99%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center" valign="top">
                                                            <table width="99%" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td colspan="4" align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="text-align: left; width: 550px; height: 25px;" colspan="2">
                                                                                    <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                                        ID="LB_QueryScope" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: right; width: 300px; height: 25px;" colspan="2">
                                                                                    <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                                <asp:Label ID="LB_UserCode" runat="server"></asp:Label>

                                                                                    <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>

                                                                    <td style="width: 220px; padding: 0px 5px 5px 5px"
                                                                        valign="top" align="left">
                                                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                            ShowLines="True" Width="230">
                                                                            <RootNodeStyle CssClass="rootNode" />
                                                                            <NodeStyle CssClass="treeNode" />
                                                                            <LeafNodeStyle CssClass="leafNode" />
                                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                        </asp:TreeView>
                                                                    </td>

                                                                    <td valign="top" width="165" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8;">
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td style="width: 100%; text-align: center;">
                                                                                    <asp:Button ID="BT_AllProject" runat="server" CssClass="inpuLong" OnClick="BT_AllProject_Click"
                                                                                        Text="<%$ Resources:lang,AllProjects%>" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: center" valign="top">
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
                                                                                                                <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,DepartmentMember%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="Resources.lang.ZZXMZY">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Style="text-align: center"
                                                                                                        Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                                                    <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Style="text-align: center"
                                                                                                        Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: center">
                                                                                    <asp:Button ID="BT_StatusVisible" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ShowStatus%>"
                                                                                        OnClick="BT_StatusVisible_Click" Visible="False" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td valign="top">
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
                                                                                                                <asp:Label ID="LB_DGProjectStatus" runat="server" Text="<%$ Resources:lang,ProjectStatus%>"></asp:Label></strong>
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
                                                                                        Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                                        ShowHeader="false">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

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
                                                                                    </asp:DataGrid>
                                                                                    <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: left;">
                                                                                    <asp:Label ID="LB_DepartCode" runat="server"
                                                                                        Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_DepartName" runat="server"
                                                                                        Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>

                                                                    <td>
                                                                        <table width="100%" cellpadding="0" border="0">
                                                                            <tr>

                                                                                <td style="width: 100%;">
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
                                                                                                                <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,DGProjectID%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="11%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProjectType" runat="server" Text="<%$ Resources:lang,ProjectType%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DBProjectAmount" runat="server" Text="<%$ Resources:lang,ProjectAmount%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="9%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="9%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="110px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGProgress" runat="server" Text="<%$ Resources:lang,Progress%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGPM" runat="server" Text="<%$ Resources:lang,PM%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGPlan" runat="server" Text="<%$ Resources:lang,Plan%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGArchive" runat="server" Text="<%$ Resources:lang,Archive%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_DGCancelArchive" runat="server" Text="<%$ Resources:lang,CancelArchive%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <strong>&nbsp</strong>
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
                                                                                        OnItemCommand="DataGrid3_ItemCommand" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ProjectID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="TTProjectReportMain.aspx?ProjectID={0}"
                                                                                                DataTextField="ProjectName" HeaderText="项目名称" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="11%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="ProjectType" HeaderText="项目类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ProjectAmount" HeaderText="项目额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="开始时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy-MM-dd}" HeaderText="结束时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                            </asp:BoundColumn>
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
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="PMCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="PMName" HeaderText="项目经理" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <%--  <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:BoundColumn>--%>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <a href='TTWorkPlanViewMain.aspx?ProjectID=<%#DataBinder.Eval (Container .DataItem ,"ProjectID") %>'>
                                                                                                        <img src="ImagesSkin/plan.png" alt="ProjectPlan" width="32px" height="32px" style="border: none;" />
                                                                                                    </a>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="FinishPercent" Visible="False"></asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_Archive" runat="server" Text="<%$ Resources:lang,Archive%>" CssClass="inpu"
                                                                                                        CommandName="Archive" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_CancelArchive" runat="server" Text="<%$ Resources:lang,CancelArchive%>"
                                                                                                        CssClass="inpu" CommandName="CancelArchive" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ProjectID", "TTDocumentTreeView.aspx?RelatedType=Project&RelatedID={0}") %>'
                                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif"  class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
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
                                                                                <td colspan="2" style="width: 100%; height: 12px; text-align: left;" valign="top">
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
                                                                    </td>

                                                                    <%--  <td style="width: 230px; padding: 5px 0px 0px 5px" valign="top" align="left">

                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td width="20%">
                                                                                    <asp:Button ID="BT_PirorProjectList" CssClass="inpuPiror" runat="server" OnClick="BT_PirorProjectList_Click" />
                                                                                </td>
                                                                                <td width="20%">
                                                                                    <asp:Button ID="BT_NextProjectList" CssClass="inpuNext" runat="server" OnClick="BT_NextProjectList_Click" />
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="LB_Scope" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

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
