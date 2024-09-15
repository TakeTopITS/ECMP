<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPMyMemProjectsRunStatus.aspx.cs" Inherits="TTAPPMyMemProjectsRunStatus" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="ZedGraph.Web" Namespace="ZedGraph.Web" TagPrefix="cc1" %>
<%@ Register Assembly="ZedGraph" Namespace="ZedGraph" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1700px;
            width: expression (document.body.clientWidth <= 1700? "1700px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>

    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
<%--    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" src="js/allAHandler.js"></script>--%>
    <script type="text/javascript" language="javascript">
        $(function () {

             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/
        });

        function displayQueryDiv() {

            if (document.getElementById('DIV_GroupChart').style.display == 'block') {

                document.getElementById('DIV_GroupChart').style.display = 'none';

            }
            else {
                document.getElementById('DIV_GroupChart').style.display = 'block';
            }
        }

        function openNewWindow() {

            window.open('TTMyMemProjectsRunStatus.aspx', "_blank");
        }

        function refreshWindow() {

            location.reload();
        }

        //传入URL作为参数
        function popShowByURL(url, title, width, height, parentWindow) {
            var w = 'auto', h = 'auto', t = url.replace('.aspx', '').replace("TT", '');

            ////如果url包含文件名，则不弹窗
            //if (urlLastSixCharsContainDot(url)) {
            //    return;
            //}

            if (title) {
                t = title;
            }
            if (width) {
                w = width + 'px';
            }
            if (height) {
                h = height + 'px';
            }
            layer.open({
                type: 2,
                title: t,
                anim: 0,
                fixed: true,
                resize: true,
                scrollbar: true,
                moveOut: true,
                shade: false,
                shadeClose: false,
                maxmin: true,
                content: url,
                area: ["99%", "99%"]
                ,
                zIndex: layer.zIndex, //重点1
                success: function (layero) {
                    layer.setTop(layero); //重点2
                },
                end: function () {

                    parentUrl = parentWindow.href;

                   

                }
            });
        }


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
                    <div>
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj" width="100%">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                    <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="29">
                                                                <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                            </td>
                                                            <td width="5">
                                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                        </tr>
                                                    </table>
                                                    <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                </a>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="width: 100%; padding-left: 10px; display: none;">
                                    <table>
                                        <tr>
                                            <%--    <td align="center" onclick="displayQueryDiv();">
                                                <img src="ImagesSkin/Find.png" width="24" height="24" style="border: none;" />
                                            </td>--%>
                                            <td align="left" style="padding-left: 10px; display: none;">
                                                <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,ChaXunFanWei%>"></asp:Label>：<asp:Label
                                                    ID="LB_QueryScope" runat="server"></asp:Label>
                                            </td>
                                            <td align="left" style="padding-left: 10px;" onclick="openNewWindow();">

                                                <asp:Image ID="IM_FullScreen" runat="server" ImageUrl="ImagesSkin/FullScreen.png" Width="24" Height="24" Style="border: none;" />

                                            </td>
                                            <%-- <td align="left" style="padding-left: 10px; padding-top: 3px;" onclick="refreshWindow();">

                                                <img src="ImagesSkin/Reflash.png" width="20" height="20" style="border: none;" />
                                            </td>--%>
                                        </tr>
                                    </table>


                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="center" style="border-left: solid 1px #D8D8D8">
                                                <table width="100%" style="margin-top: 5px">
                                                    <tr>
                                                        <td>
                                                            <div class="napbox">
                                                                <div class="npb">
                                                                    <div class="cline"></div>
                                                                    <h3>项目状态</h3>
                                                                </div>

                                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Width="100%" PageSize="30"
                                                                    ShowHeader="false" AllowPaging="True" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目ID" Visible="false">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:TemplateColumn HeaderText="">

                                                                            <ItemTemplate>

                                                                                <div class="npb npbs">
                                                                                    <div class="nplef">
                                                                                        <img src="ImagesSkin/napicon.png" />
                                                                                    </div>
                                                                                    <div class="nprig">
                                                                                        <h4>
                                                                                            <a onclick="javascript:popShowByURL('TTWorkPlanGanttForProjectStandardActivityCompareMain.aspx?ProjectID=<%#DataBinder .Eval (Container .DataItem ,"ProjectID") %>','Project Plan Gantt',800,600,window.location)"><%# Eval("ProjectName") %>  </a>

                                                                                        </h4>
                                                                                        <h5>
                                                                                            <%# Eval("ProjectID").ToString() %><sub></sub></h5>
                                                                                        <h6>
                                                                                            <asp:Label ID="LB_DGProgress" runat="server" Text="<%$ Resources:lang,Progress%>"></asp:Label>


                                                                                            <div><%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>%</div>

                                                                                        </h6>
                                                                                        <h6>
                                                                                            <asp:Label ID="LB_DGStartTime" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>

                                                                                            <asp:Label ID="LB_MoreTime" runat="server" Text="<%$ Resources:lang,ChaoQi%>" Height="15px" Font-Size="XX-Small"
                                                                                                ForeColor="Red"></asp:Label>
                                                                                            <asp:Label ID="LB_Delaydays" runat="server" Height="15px" Font-Size="XX-Small"
                                                                                                ForeColor="Red"></asp:Label>
                                                                                            <asp:Label ID="LB_DayUnit" runat="server" Text="<%$ Resources:lang,Tian%>" Height="15px" Font-Size="XX-Small"
                                                                                                ForeColor="Red"></asp:Label>
                                                                                            <br />
                                                                                            <asp:Label ID="LB_BeginDate" runat="server" Height="20px" Font-Size="XX-Small"
                                                                                                BackColor="Yellow" Text=' <%#DataBinder.Eval (Container .DataItem ,"BeginDate") %>'></asp:Label>
                                                                                            ---
                                                                                                        <asp:Label ID="LB_EndDate" runat="server" Height="20px" Font-Size="XX-Small"
                                                                                                            BackColor="Yellow" Text='<%#DataBinder.Eval (Container .DataItem ,"EndDate") %>'></asp:Label>
                                                                                        </h6>
                                                                                        <h6>Data:2022.03.09</h6>
                                                                                        <label><%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %></label>
                                                                                    </div>

                                                                                </div>


                                                                            </ItemTemplate>

                                                                        </asp:TemplateColumn>

                                                                    </Columns>


                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText=">" PrevPageText="<" CssClass="notTab" />
                                                                </asp:DataGrid>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; height: 12px; text-align: center;" valign="top">
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
                                                                                    <asp:HyperLink ID="HL_SystemAnalystChartRelatedUserSet" runat="server" Text="<%$ Resources:lang,FenXiTuSheZhi %>"></asp:HyperLink>
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

                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td align="center">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td style="width: 170px;">

                                                                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>

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
                                                                                                                <tr>
                                                                                                                    <td style="width: 170px; text-align: center; padding: 5px 0px 5px 0px;">
                                                                                                                        <asp:Button ID="BT_DisplayStatus" runat="server" CssClass="inpuLong" OnClick="BT_DisplayStatus_Click"
                                                                                                                            Text="<%$ Resources:lang,ShowStatus%>" />
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
                                                                                                                            Visible="False" Width="100%">
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
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <table cellpadding="3" cellspacing="0" class="formBgStyle">


                                                                                                    <tr>
                                                                                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle"><span>
                                                                                                            <asp:Label ID="LB_ProjectName" runat="server" Text="<%$ Resources:lang,ProjectName %>"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td style="width: 70%; text-align: left;" class="formItemBgStyle">
                                                                                                            <asp:TextBox ID="TB_ProjectName" runat="server" Width="95%"></asp:TextBox></td>
                                                                                                        <td align="center" class="formItemBgStyle">
                                                                                                            <asp:Button ID="BT_HazyFind" runat="server" OnClick="BT_HazyFind_Click" Text="<%$ Resources:lang,FuzzySearch %>"
                                                                                                                CssClass="inpu" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle"><span>
                                                                                                            <asp:Label ID="LB_ProjectID" runat="server" Text="<%$ Resources:lang,ProjectID %>"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                                                            <asp:TextBox ID="TB_ProjectID" runat="server" Width="95%"></asp:TextBox></td>
                                                                                                        <td align="center" class="formItemBgStyle">
                                                                                                            <asp:Button ID="BT_ProjectIDFind" runat="server" Text="<%$ Resources:lang,Find %>"
                                                                                                                OnClick="BT_ProjectIDFind_Click" CssClass="inpu" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle"><span>
                                                                                                            <asp:Label ID="LB_ProjectCreator" runat="server" Text="<%$ Resources:lang,ProjectCreator %>"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td style="text-align: left" class="formItemBgStyle">
                                                                                                            <asp:TextBox ID="TB_MakeUser" runat="server" Width="95%"></asp:TextBox></td>
                                                                                                        <td style="text-align: center" class="formItemBgStyle">
                                                                                                            <asp:Button ID="BT_MakeUserFind" runat="server" OnClick="BT_MakeUserFind_Click" Text="<%$ Resources:lang,Find %>"
                                                                                                                CssClass="inpu" /></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle"><span>
                                                                                                            <asp:Label ID="LB_StartTime" runat="server" Text="<%$ Resources:lang,StartTime %>"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                                                            <asp:TextBox ID="DLC_BeginDate" runat="server" Width="95%"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                                                        </td>

                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle"><span>
                                                                                                            <asp:Label ID="LB_EndTime" runat="server" Text="<%$ Resources:lang,EndTime %>"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>

                                                                                                        <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                                                            <asp:TextBox ID="DLC_EndDate" runat="server" Width="95%"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                                runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                                                            </ajaxToolkit:CalendarExtender>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td colspan="2" style="vertical-align: middle; text-align: center;" class="formItemBgStyle">
                                                                                                            <asp:Button ID="BT_DateFind" runat="server" OnClick="BT_DateFind_Click" Text="<%$ Resources:lang,Find %>"
                                                                                                                CssClass="inpu" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                        <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                        <asp:Timer ID="Timer_Refresh" runat="server" OnTick="Timer_Refresh_Tick">
                        </asp:Timer>
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
