<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWLManage.aspx.cs" Inherits="TTWLManage" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
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
                                            <td align="left" style="padding-bottom: 5px; padding-top: 10px;">
                                                <table>
                                                    <tr>
                                                        <td align="center" style="width: 100px;" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShengChanZuoYeDan%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></td>
                                                        <td>
                                                            <NickLee:NumberBox ID="NB_WFID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Precision="0" Width="53px">0</NickLee:NumberBox>

                                                            <asp:Button ID="BT_FindWFID" runat="server" CssClass="inpu" OnClick="BT_FindWFID_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>

                                                        <td>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_WLType" runat="server" AutoPostBack="True" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DL_WLType_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>

                                                        <td>&nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MoBan%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_WFTemName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_WLTem" runat="server" AutoPostBack="True" DataTextField="TemName" DataValueField="TemName" OnSelectedIndexChanged="DL_WLTem_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                        </td>
                                                        <td colspan="4">
                                                            <asp:TextBox ID="TB_WFName" runat="server" Width="99%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td></td>
                                                        <td>
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FaQiRen%>"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_WFCreatorName" Width="100px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>
                                                        </td>
                                                        <td style="width: 120px;" align="left">
                                                            <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server" Width="99%"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_StartTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td align="center">
                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,Dao%>"></asp:Label>
                                                        </td>
                                                        <td style="width: 120px;" align="left">
                                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server" Width="99%"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click"
                                                                Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>

                                                        <td style="text-align: right;">
                                                            <asp:Label ID="LB_SetAgent" runat="server" Text="<%$ Resources:lang,DaiLiRen%>" />
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <asp:DropDownList ID="DL_MemberAgency" runat="server" DataTextField="UserName"
                                                                DataValueField="UserCode" AutoPostBack="True" OnSelectedIndexChanged="DL_MemberAgency_SelectedIndexChanged">
                                                            </asp:DropDownList>

                                                        </td>
                                                        <td align="right">
                                                            <asp:Button ID="BT_Refresh" runat="server" CssClass="inpu" OnClick="BT_Refresh_Click"
                                                                Text="<%$ Resources:lang,Refresh%>" />
                                                        </td>
                                                        <td align="right">
                                                            <asp:HyperLink ID="HL_MyWorkFlowBackup" runat="server" NavigateUrl="TTMyWorkFlowBackup.aspx" Text="<%$ Resources:lang,ChaKanYuBeiFengDeGongZuoLiu%>"></asp:HyperLink>
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
                                            <td>
                                                <table style="width: 100%; margin-top: 5px" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td colspan="2" style="width: 500px; text-align: left">
                                                                        <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                            ID="LB_QueryScope" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td colspan="2" style="width: 310px; text-align: right">
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
                                                        <td style="padding: 5px 5px 5px 5px;">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td style="width: 100%; height: 1px;" align="left">
                                                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                                            Width="100%">
                                                                            <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WoYaoPiHeDeGongZuoLiu%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="5%"><strong>
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="25%"><strong>
                                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,QianBuShenQingRen %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoShenHeDegongZuoLiu %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="6%"><strong>
                                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,JianLiShiJian %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td align="center" width="4%"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="5" Width="100%">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WLName" HeaderText="要审核的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                                            </asp:HyperLinkColumn>

                                                                                            <asp:TemplateColumn HeaderText="前步审批人">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label58" runat="server" ToolTip='<%# ShareClass.GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()) %>'>
                                                                                                        <%# ShareClass.StringCutByRequire(ShareClass. GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()),18) %>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WorkDetail" HeaderText="要审核的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CheckingTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" HeaderText="审核时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:HyperLinkColumn>

                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTDocumentTreeView.aspx?RelatedType=WorkFlow&RelatedID={0}") %>'
                                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>

                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>

                                                                                        <EditItemStyle BackColor="#2461BF" />

                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                                        <ItemStyle CssClass="itemStyle" />

                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>

                                                                                    <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                            <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="要批核的代理工作流">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,YaoPiHeDeDaiLiGongZuoLiu%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>


                                                                                                        <td width="25%" align="center"><strong>

                                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,QianBuShenQingRen %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="6%" align="center"><strong>
                                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></strong></td>
                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ShiJian %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label></strong></td>

                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td width="4%" align="center"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="5" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WLName" HeaderText="工作流名称" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="16%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn HeaderText="前步审批人">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label21" runat="server" ToolTip='<%# ShareClass. GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()) %>'>
                                                                                                        <%# ShareClass.StringCutByRequire(ShareClass. GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()),18) %>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WorkDetail" HeaderText="要审核的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CheckingTime" DataFormatString="{0:yyyy/MM/dd HH:mm:ss}" HeaderText="审核时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:HyperLinkColumn>

                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTDocumentTreeView.aspx?RelatedType=WorkFlow&RelatedID={0}") %>'
                                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid><asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                        </cc2:TabContainer>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 15px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0"
                                                                            Width="100%">
                                                                            <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,WoYiPiHeDeGongZuoLiu%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td width="20%" align="center"><strong>
                                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="6%" align="center"><strong>
                                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></strong></td>
                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="11%" align="center"><strong>
                                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShenHeShiJian %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,XiaBuShengPiRen %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td width="4%" align="center"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        ShowHeader="False" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                                        PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WorkDetail" HeaderText="已审核的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CheckingTime" HeaderText="审核时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="WLName" HeaderText="工作流名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn HeaderText="下步审批人">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label31" runat="server" ToolTip='<%# ShareClass. GetNextStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()) %>'>
                                                                                                        <%# ShareClass.StringCutByRequire(ShareClass. GetNextStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()),18) %>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetWorkflowStepStatusByAuto(Eval("StepID").ToString()) %><%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?RelatedType=WorkFlow&WLID={0}") %>'
                                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" alt ="Fold Logo"  class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>

                                                                                    <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                            <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="已批核的代理工作流">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YiPiHeDeDaiLiGongZuoLiu%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center"><strong>
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                        <td width="20%" align="center"><strong>
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="6%" align="center"><strong>
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></strong></td>
                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="11%" align="center"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShenHeShiJian %>"></asp:Label></strong></td>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng %>"></asp:Label></strong></td>

                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label></strong></td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,XiaBuShengPiRen %>"></asp:Label>
                                                                                                        </strong></td>

                                                                                                        <td width="8%" align="center"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                        <td width="4%" align="center"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        Height="1px" OnPageIndexChanged="DataGrid6_PageIndexChanged" PageSize="5" Width="100%"
                                                                                        ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTWorkFlowDetailMain.aspx?ID={0}"
                                                                                                DataTextField="WorkDetail" HeaderText="已审核的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="CheckingTime" HeaderText="审核时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="WLName" HeaderText="工作流名称">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn HeaderText="下步审批人">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Label ID="Label40" runat="server" ToolTip='<%# ShareClass. GetNextStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()) %>'>
                                                                                                        <%# ShareClass.StringCutByRequire(ShareClass. GetNextStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()),18) %>
                                                                                                    </asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetWorkflowStepStatusByAuto(Eval("StepID").ToString()) %><%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?RelatedType=WorkFlow&WLID={0}") %>'
                                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" alt ="Fold Logo"  class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid><asp:Label ID="LB_Sql6" runat="server" Visible="False"></asp:Label>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                        </cc2:TabContainer>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 15px">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%;" align="left">

                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,WoDeGongZuoLiu%>"></asp:Label>
                                                                                </td>
                                                                                <td>(</td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="IMB_Yellow" ImageUrl="~/Images/lamp_yellow.png" runat="server" /></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShenPiZhong%>"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="IMB_refuse" ImageUrl="~/Images/lamp_refuse.png" runat="server" /></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BoHui%>"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="IMB_Green" ImageUrl="~/Images/lamp_green.png" runat="server" /></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,TongGuo%>"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:ImageButton ID="IMB_Red" ImageUrl="~/Images/lamp_ok.png" runat="server" /></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,JieAn%>"></asp:Label>
                                                                                </td>
                                                                                <td>)</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="22%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GongZuo%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>&nbsp;
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,LastestReviewer%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,MoBan%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,FaQiShiJian%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td  align="center">
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
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                                            PageSize="5" Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <Columns>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:ImageButton ID="IMB_Lamp" ImageUrl="~/Images/lamp_yellow.png" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}&RelatedType=Null"
                                                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="22%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWFChartViewJS.aspx?WLID={0}"
                                                                                    HeaderText="工作流" Target="_blank" Text="<%$ Resources:lang,JinDu%>">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:HyperLinkColumn>

                                                                                <asp:TemplateColumn HeaderText=" 最新审核者">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass.GetLastestStepLastestOperator(Eval("WLID").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TemName" HeaderText="模板">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <a href='TTProExpenseView.aspx?WorkflowID=<%#DataBinder .Eval (Container .DataItem ,"WLID") %>'><%#DataBinder .Eval (Container .DataItem ,"Expense") %>  </a>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetWorkflowStatusByAuto(Eval("WLID").ToString()) %><%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?RelatedType=WorkFlow&WLID={0}") %>'
                                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" alt ="Folder Icon"  class="noBorder" /></asp:HyperLink>
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
                                                                        <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="170px" style="padding: 5px 5px 0px 5px; border-left: solid 1px #D8D8D8"
                                                valign="top">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 170px; text-align: center">
                                                            <asp:Button ID="BT_AllWL" runat="server" CssClass="inpuLong" OnClick="BT_AllWL_Click"
                                                                Text="<%$ Resources:lang,AnZhuangTaiFengLei%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 170px; text-align: center">
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
                                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,AnZhuangTaiFengLei%>"></asp:Label>
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
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                                ShowHeader="false" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="按状态分类：">
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
                    <asp:Label ID="LB_Timer" runat="server" Style="display: none;"></asp:Label>

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
