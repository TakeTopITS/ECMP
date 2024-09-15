<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectWorkFlowManage.aspx.cs" Inherits="TTProjectWorkFlowManage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1080px;
            width: expression (document.body.clientWidth <= 1080? "1080px" : "auto" ));
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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuYeWuLiuCheng%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 5px 5px 5px 5px;">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td>
                                                <table style="width: 100%; margin-top: 5px" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td colspan="2" style="width: 500px; text-align: left">
                                                                        <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label ID="LB_QueryScope" runat="server"></asp:Label>

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
                                                        <td style="padding: 5px 5px 5px 5px">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr style="font-size: 10pt">
                                                                    <td style="text-align: left;">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WoYaoPiHeDeGongZuoLiu %>"></asp:Label>：
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; height: 1px">
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
                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng %>"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,QianBuShenQingRen %>"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoShenHeDegongZuoLiu %>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="6%"><strong>
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label>
                                                                                            </strong></td>
                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,JianLiShiJian %>"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="10%"><strong>
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label>
                                                                                            </strong></td>

                                                                                            <td align="center" width="8%"><strong>
                                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
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
                                                                                        <asp:Label ID="Label21" runat="server" ToolTip='<%# ShareClass. GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()) %>'>
                                                                                                        <%# ShareClass.StringCutByRequire(ShareClass. GetPriorStepLastestOperator(Eval("WLID").ToString(),Eval("StepID").ToString(),Eval("ID").ToString()),18) %>
                                                                                        </asp:Label>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
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
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 15px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; height: 3px; text-align: left">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,WoYiPiHeDeGongZuoLiu %>"></asp:Label>：
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center"><strong>
                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
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
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="height: 15px"></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; height: 1px; text-align: left">
                                                                        <span style="font-size: 10pt">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WoDeGongZuoLiu %>"></asp:Label>：</span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="22%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong>
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
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="16%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,MuBan %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="5" Width="100%" ShowHeader="false"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
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
                                                                                            Target="_blank"><img src="ImagesSkin/Doc.gif" alt ="Folder Icon"  class="noBorder"/></asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"/>
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
