<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeProjectSAAS.aspx.cs" Inherits="TTMakeProjectSAAS" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>给成员建立和分派项目</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }*/
        .auto-style1 {
            position: absolute;
            left: 35%;
            top: 35%;
            height: 34px;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SetUpProject%>" />
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
                                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="100%" align="left" style="padding: 5px 5px 5px 5px;">
                                                <table width="100%">
                                                    <tr>
                                                        <td width="80%" align="center">
                                                            <table width="700px">
                                                                <tr>
                                                                    <td width="20%" align="right">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuMing%>"></asp:Label>： </td>
                                                                    <td width="25%" align="left">
                                                                        <asp:TextBox ID="TB_FindProjectName" widh="99%" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td width="20%" align="right">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label>：</td>
                                                                    <td width="25%" align="left">
                                                                        <asp:TextBox ID="TB_FindPMName" widh="99%" runat="server"></asp:TextBox></td>
                                                                    <td align="left">
                                                                        <asp:Button ID="BT_Find" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />

                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Lb_DGProjectCode" runat="server" Text="<%$ Resources:lang,ProjectCode%>" /></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGPM" runat="server" Text="<%$ Resources:lang,PM%>" /></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGStatus" runat="server" Text="<%$ Resources:lang,Status%>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
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
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                    OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                    AllowCustomPaging="false" AllowPaging="true" PageSize="25" ShowHeader="False"
                                                    Width="100%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    <ItemStyle CssClass="itemStyle" />
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
                                                        <asp:BoundColumn DataField="ProjectID" HeaderText="项目ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="TTProjectDetailSAAS.aspx?ProjectID={0}"
                                                            DataTextField="ProjectName" HeaderText="项目名称" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="PMName" HeaderText="项目经理">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="TTMakeProjectBudget.aspx?ProjectID={0}"
                                                            Text="<%$ Resources:lang,Budget%>" HeaderText="预算" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>

                                                        <asp:HyperLinkColumn DataNavigateUrlField="ProjectID" DataNavigateUrlFormatString="TTProjectRelatedDoc.aspx?ProjectID={0}"
                                                            Text="<%$ Resources:lang,WenDang%>" HeaderText="文档" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <div>
                                                                    <asp:HyperLink ID="HL_ProjectReport" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ProjectID", "TTProjectReportMain.aspx?ProjectID={0}") %>'
                                                                        Target="_blank"><img src="ImagesSkin/dian.gif" class="noBorder" /></asp:HyperLink>
                                                                </div>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Status" runat="server" Font-Bold="False" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                        </table>
                    </div>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseTree" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="98%" cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td>
                                        <table width="100%" cellpadding="2" cellspacing="0" class="formBgStyle">

                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBParentProject" runat="server" Text="<%$ Resources:lang,ParentProject%>" />:
                                                </td>
                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ParentProject" Width="99%" runat="server"></asp:TextBox>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                        Enabled="True" TargetControlID="TB_ParentProject" PopupControlID="Panel2"
                                                        CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Label ID="LB_ParentProjectID" runat="server" Font-Bold="False" Text="" Visible="false"> </asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label1888" runat="server" Text="<%$ Resources:lang,XiangMuDaiMa%>"></asp:Label>:
                                                </td>
                                                <td style="text-align: left; width: 25%;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ProjectCode" Width="200px" runat="server"></asp:TextBox>
                                                    <asp:HyperLink ID="HL_ProjectTask" Text="<%$ Resources:lang,XiangMuZuoYeRenWu%>" runat="server" Target="_blank" Enabled="false" Visible="false">
                                                    </asp:HyperLink>
                                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                                <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ProjectName" runat="server" Width="98%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBPM" runat="server" Text="<%$ Resources:lang,PM%>" />:
                                                </td>
                                                <td style="width: 25%; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_PMCode" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label ID="LB_PMName"
                                                        runat="server"></asp:Label>
                                                </td>
                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_CustomerPM" runat="server" Text="<%$ Resources:lang,CustomerPM%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_CustomerPMName" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBProjectType" runat="server" Text="<%$ Resources:lang,ProjectType%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_ProjectType" runat="server" DataTextField="Type"
                                                        AutoPostBack="true" OnSelectedIndexChanged=" DL_ProjectType_SelectedIndexChanged"
                                                        DataValueField="Type" CssClass="DDList">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="LB_tbPirority" runat="server" Text="<%$ Resources:lang,Pirority %>"></asp:Label>:</td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority">
                                                        <asp:ListItem Value="COMMON" Text="<%$ Resources:lang,YiBan%>" />
                                                        <asp:ListItem Value="2-H" Text="<%$ Resources:lang,ErGao%>" />
                                                        <asp:ListItem Value="1-H" Text="<%$ Resources:lang,YiGao%>" />
                                                        <asp:ListItem Value="2-M" Text="<%$ Resources:lang,ErZhong%>" />
                                                        <asp:ListItem Value="1-M" Text="<%$ Resources:lang,YiZhong%>" />
                                                        <asp:ListItem Value="1-L" Text="<%$ Resources:lang,YiDi%>" />
                                                        <asp:ListItem Value="2-L" Text="<%$ Resources:lang,ErDi%>" />
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>" />
                                                    :
                                                </td>
                                                <td style="height: 35px; text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="TB_TBEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                        runat="server" TargetControlID="DLC_EndDate">
                                                    </ajaxToolkit:CalendarExtender>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBProjectAmount" runat="server" Text="<%$ Resources:lang,ProjectAmount%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ProjectAmount" runat="server" Width="150px">0.00</NickLee:NumberBox>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBBudget" runat="server" Text="<%$ Resources:lang,Budget%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Budget" runat="server" Width="150px">0.00</NickLee:NumberBox>

                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBManHour" runat="server" Text="<%$ Resources:lang,ManHour%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_ManHour" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                    <asp:Label ID="Label888882" runat="server" Text="<%$ Resources:lang,Tian %>"></asp:Label>

                                                </td>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBManPower" runat="server" Text="<%$ Resources:lang,ManPower%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_ManNubmer" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                    <span
                                                        style="font-size: 10pt">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,Ren%>"></asp:Label></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JieSuanBiBie%>"></asp:Label>:
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBStatus" runat="server" Text="<%$ Resources:lang,Status%>" />
                                                    :
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName"
                                                        OnSelectedIndexChanged="DL_Status_SelectedIndexChanged" AutoPostBack="true" DataValueField="Status"
                                                        CssClass="DDList">
                                                    </asp:DropDownList>

                                                    <asp:DropDownList ID="DL_StatusValue" OnSelectedIndexChanged=" DL_StatusValue_SelectedIndexChanged"
                                                        AutoPostBack="true" runat="server" Visible="false">
                                                        <asp:ListItem Value="通过" Text="<%$ Resources:lang,TongGuo%>" />
                                                        <asp:ListItem Value="进行中" Text="<%$ Resources:lang,JinXingZhong%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td align="right" valign="top" class="formItemBgStyle" style="vertical-align: middle;">
                                                    <asp:Label ID="LB_TBDescription" runat="server" Text="<%$ Resources:lang,Description%>" />
                                                    :
                                                </td>
                                                <td colspan="3" align="left" style="width: 100%;" class="formItemBgStyle">
                                                    <CKEditor:CKEditorControl ID="HE_ProjectDetail" runat="server" Height="100px" Width="90%" Visible="false" />
                                                    <CKEditor:CKEditorControl runat="server" ID="HT_ProjectDetail" Width="90%" Height="100px" Visible="false" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="right" valign="top" class="formItemBgStyle" style="vertical-align: middle;">
                                                    <asp:Label ID="LB_TBAcceptanceStandard" runat="server" Text="<%$ Resources:lang,AcceptanceStandard%>" />
                                                    :
                                                </td>
                                                <td colspan="3" style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                    <CKEditor:CKEditorControl ID="HE_AcceptStandard" runat="server" Height="100" Width="90%" Visible="false" />
                                                    <CKEditor:CKEditorControl runat="server" ID="HT_AcceptStandard" Width="90%" Height="100px" Visible="false" />
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td align="right" valign="top" class="formItemBgStyle"></td>
                                                <td colspan="3" style="text-align: left; width: 100%;" class="formItemBgStyle">

                                                    <asp:HyperLink ID="HL_ProjectCostManageEdit" runat="server" Target="_blank" Enabled="false" Visible="false">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuChengBenKongZhi%>" Visible="false"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>

                                            <tr style="display: none;">
                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YINGXXMJLGXMZT%>"></asp:Label>:
                            
                                                </td>
                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_AllowPMChangeStatus" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JDHGQSHDBDXMJHYH%>"></asp:Label>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DL_ProgressByDetailImpact" runat="server">
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,RWJDYHJHJDYQR%>"></asp:Label>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DL_PlanProgressNeedPlanerConfirm" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,RXZDFQLC%>"></asp:Label>:
                                                </td>
                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_AutoRunWFAfterMakeProject" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XMQDXYZJYHQR%>"></asp:Label>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DL_ProjectStartupNeedSupperConfirm" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td style="display: none;">
                                                                <asp:DropDownList ID="DL_LockStartupedPlan" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>

                                                            </td>
                                                            <td style="display: none;">
                                                                <asp:DropDownList ID="DL_ProjectPlanStartupSatus" runat="server">
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                 <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,XMJHTGGLGZLMB%>"></asp:Label>:
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DL_PlanStartupRelatedWorkflowTemplate" runat="server" DataTextField="TemName" DataValueField="TemName"  Width="150px">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="4" style="width: 100%; text-align: left; padding-left: 10px" class="formItemBgStyle">
                                                    <asp:Label ID="LB_TBNoticeProjectTeamMember" runat="server" Text="<%$ Resources:lang,NoticeProjectTeamMember%>" />:
                                                    <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,SendSMS%>" />
                                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail%>" />
                                                    <asp:TextBox ID="TB_Message" runat="server" Width="300px"></asp:TextBox>
                                                    <asp:Button ID="BT_Send" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Send_Click"
                                                        Text="<%$ Resources:lang,Send%>" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                </ContentTemplate>
            </asp:UpdatePanel>
            <div class="auto-style1">
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
