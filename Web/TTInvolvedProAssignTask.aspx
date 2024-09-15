<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTInvolvedProAssignTask.aspx.cs" Inherits="TTInvolvedProAssignTask" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
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
                                <td>

                                    <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                        <asp:Label ID="LB_AssignTask" runat="server" Text="<%$ Resources:lang,assignTask%>"></asp:Label>
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
                                                <table style="width: 100%; height: 1px;">
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td>
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
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdTaskID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdTaskType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdTask" runat="server" Text="<%$ Resources:lang,Task%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdPirority" runat="server" Text="<%$ Resources:lang,Pirority%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdExpenseBudget" runat="server" Text="<%$ Resources:lang,ExpenseBudget%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdManpowerBudget" runat="server" Text="<%$ Resources:lang,ManpowerBudget%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="100px" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdProgress" runat="server" Text="<%$ Resources:lang,Progress%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdExpense" runat="server" Text="<%$ Resources:lang,Expense%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdManHour" runat="server" Text="<%$ Resources:lang,ManHour%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_tdStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" PageSize="25"
                                                                OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                ShowHeader="false" Width="100%" Height="1px" CellPadding="4" ForeColor="#333333"
                                                                GridLines="None">
                                                                <Columns>
                                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:ButtonColumn>
                                                                    <asp:TemplateColumn HeaderText="Delete">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:ButtonColumn>
                                                                    <asp:BoundColumn DataField="TaskID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Task" HeaderText="任务">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Budget" HeaderText="费用预算">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ManHour" HeaderText="工时预算">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="RealManHour" HeaderText="工时">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTMakeTaskTestCase.aspx?TaskID={0}"
                                                                        Text="<%$ Resources:lang,TestCase %>" HeaderText="测试用例" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTTaskAssignRecord.aspx?TaskID={0}"
                                                                        Text="<%$ Resources:lang,AssignRecord %>" HeaderText="分派记录" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>

                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?TaskID={0}") %>'
                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>

                                                                            <%-- <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTDocumentTreeView.aspx?RelatedType=ProjectTask&RelatedID={0}") %>'
                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>--%>
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
                                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbID" runat="server" Text="<%$ Resources:lang,ID %>"></asp:Label>: </td>
                                    <td style="width: 20%; text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="LB_TaskNO" runat="server"></asp:Label>
                                        <asp:Label ID="LB_TaskID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbType" runat="server" Text="<%$ Resources:lang,Type %>"></asp:Label>:
                                                                                    <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type">
                                                                                    </asp:DropDownList></td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbPirority" runat="server" Text="<%$ Resources:lang,Pirority %>"></asp:Label>:
                                                                                    <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority">

                                                                                        <asp:ListItem>Normal</asp:ListItem>
                                                                                        <asp:ListItem>High</asp:ListItem>
                                                                                        <asp:ListItem>Low</asp:ListItem>

                                                                                    </asp:DropDownList>

                                    </td>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbExpenseBudget" runat="server" Text="<%$ Resources:lang,ExpenseBudget %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Budget" runat="server" Width="67px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td rowspan="2" style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbTask" runat="server" Text="<%$ Resources:lang,Task %>"></asp:Label>: </td>
                                    <td colspan="3" rowspan="2" style="text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Task" runat="server" Width="95%" Height="49px" TextMode="MultiLine"></asp:TextBox></td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbExpense" runat="server" Text="<%$ Resources:lang,Expense %>"></asp:Label>: </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Expense" runat="server" Enabled="False" Width="67px" OnBlur=""
                                            OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbManhourBudget" runat="server" Text="<%$ Resources:lang,ManhourBudget %>"></asp:Label>: </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" Width="53px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbStartTime" runat="server" Text="<%$ Resources:lang,StartTime %>"></asp:Label>: </td>
                                    <td style="width: 220px; text-align: left" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbEndTime" runat="server" Text="<%$ Resources:lang,EndTime %>"></asp:Label>: </td>
                                    <td style="width: 220px; text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                            runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbManHour" runat="server" Text="<%$ Resources:lang,ManHour %>"></asp:Label>: </td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RealManHour" runat="server" Width="53px" Enabled="False"
                                            OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status %>"></asp:Label>: </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName" DataValueField="Status"
                                            Width="100px">
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbCreateTime" runat="server" Text="<%$ Resources:lang,CreateTime %>"></asp:Label>: </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="LB_MakeDate" runat="server"></asp:Label>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbProgress" runat="server" Text="<%$ Resources:lang,Progress %>"></asp:Label>: </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_FinishPercent" Enabled="false" runat="server" Width="43px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>% </td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="text-align: right; height: 2px;" class="formItemBgStyle"></td>

                                    <td colspan="5" style="text-align: left; height: 2px;" class="formItemBgStyle">
                                        <asp:Button ID="BT_Close" runat="server" OnClick="BT_Close_Click" CssClass="inpu" Visible="false"
                                            Text="<%$ Resources:lang,Close %>" Enabled="False" />&#160;<asp:Button ID="BT_Active" runat="server" OnClick="BT_Active_Click" Text="<%$ Resources:lang,Activate %>" Visible="false"
                                                CssClass="inpu" Enabled="False" />


                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Visible="false"
                                            Target="_blank" Enabled="False" Text="<%$ Resources:lang,WFTemplate %>"></asp:HyperLink>

                                        &nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx" Visible="false"
                                            Target="_blank" Enabled="False" Text="<%$ Resources:lang,RelatedWFTemplate %>"></asp:HyperLink>
                                        &nbsp;<asp:HyperLink ID="HL_ActorGroup" runat="server" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                            Target="_blank" Enabled="False" Text="<%$ Resources:lang,ActorGroup %>" Visible="false"></asp:HyperLink>
                                    </td>
                                    </td>
                                </tr>
                            </table>


                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label4" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAssignType" runat="server" Text="<%$ Resources:lang,Type %>"></asp:Label>
                                        :   </td>
                                    <td style="width: 50%; text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type">
                                        </asp:DropDownList><asp:Label ID="LB_ID" runat="server"></asp:Label></td>
                                    <td style="text-align: right; width: 10%;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbOperator" runat="server" Text="<%$ Resources:lang,Executor %>"></asp:Label>
                                        : </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_OperatorCode" runat="server" DataTextField="UserName" DataValueField="UserCode" AutoPostBack="True" OnSelectedIndexChanged="DL_OperatorCode_SelectedIndexChanged">
                                        </asp:DropDownList>
                                        <asp:HyperLink ID="HL_MemberWorkload" runat="server" Target="_blank">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanGongZuoFuHe%>"></asp:Label></asp:HyperLink>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle">

                                        <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Height="100px" Width="99%" Visible="False" />
                                        <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="99%" Height="150px" Visible="False" />

                                        <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                            DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAssignStartTime" runat="server"
                                            Text="<%$ Resources:lang,StartTime %>"></asp:Label>: </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_TaskBegin" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_TaskBegin" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="LB_tbAssignEndTime" runat="server" Text="<%$ Resources:lang,EndTime %>"></asp:Label>: </td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_TaskEnd" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_TaskEnd" Enabled="True"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">

                                        <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                            Text="<%$ Resources:lang,BaoCun %>" />&#160;<asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False"
                                                OnClick="BT_DeleteAssign_Click" Text="<%$ Resources:lang,Delete %>" OnClientClick="return confirm(getDeleteMsgByLangCode())" />&#160;<asp:Button ID="BT_Assign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Assign_Click"
                                                    Text="<%$ Resources:lang,Assign %>" />

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle"></td>
                                    <td style="height: 19px; text-align: left;" colspan="3" class="formItemBgStyle">

                                        <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,SendSMS %>" /><asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt"
                                            Text="<%$ Resources:lang,SendEMail %>" /><span style="font-size: 10pt"><asp:Label ID="LB_tbNoticeOperator" runat="server" Text="<%$ Resources:lang,NoticeOperator %>"></asp:Label><asp:TextBox ID="TB_Message" runat="server" Width="45%"></asp:TextBox><asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,Send %>" /></span></td>
                                </tr>
                            </table>
                            <br />
                            <strong>
                                <asp:Label ID="LB_TaskName" runat="server" Visible="False"></asp:Label></strong>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="LB_dgAssignID" runat="server" Text="<%$ Resources:lang,AssignID %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgType" runat="server" Text="<%$ Resources:lang,Type %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgTaskID" runat="server" Text="<%$ Resources:lang,TaskID %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgAssignPeople" runat="server" Text="<%$ Resources:lang,AssignPeople %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgOperator" runat="server" Text="<%$ Resources:lang,Operator %>"></asp:Label></strong></td>
                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="LB_dgWorkOperation" runat="server" Text="<%$ Resources:lang,WorkOperation %>"></asp:Label></strong></td>
                                                <td width="12%" align="center"><strong>
                                                    <asp:Label ID="LB_dgStartTime" runat="server" Text="<%$ Resources:lang,StartTime %>"></asp:Label></strong></td>
                                                <td width="12%" align="center"><strong>
                                                    <asp:Label ID="LB_dgEndTime" runat="server" Text="<%$ Resources:lang,EndTime %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgExpense" runat="server" Text="<%$ Resources:lang,Expense %>"></asp:Label></strong></td>
                                                <td width="8%" align="center"><strong>
                                                    <asp:Label ID="LB_dgAssignStatus" runat="server" Text="<%$ Resources:lang,Status %>"></asp:Label></strong></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                ShowHeader="False" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                Width="100%">
                                <Columns>
                                    <asp:TemplateColumn HeaderText="编号">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                CssClass="inpu" />
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:TemplateColumn>
                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="AssignManName" HeaderText="分派人">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Operation" HeaderText="受理人的工作">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="状态">
                                        <ItemTemplate>
                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                    </asp:TemplateColumn>
                                </Columns>
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                <ItemStyle CssClass="itemStyle" />
                            </asp:DataGrid>


                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
