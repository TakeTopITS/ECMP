<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTaskManagement.aspx.cs" Inherits="TTTaskManagement" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
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
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WoDeRenWu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" style="padding-top: 5px;">
                                                <asp:Button ID="BT_CreateTask" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChuangJianRenWu%>" OnClick="BT_CreateTask_Click" />
                                             <%--   &nbsp;&nbsp;
                                                <asp:Button ID="BT_DragTask" runat="server" CssClass="inpu" Text="拖拽" OnClick="BT_DragTask_Click"  />--%>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" width="100%">
                                                <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 5px;">
                                                    <tr>
                                                        <td align="left" style="padding-left: 20px; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td colspan="2" style="width: 510px; text-align: left;">
                                                                        <span style="font-size: 9pt">
                                                                            <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                                ID="LB_QueryScope" runat="server"></asp:Label>
                                                                        </span>
                                                                    </td>
                                                                    <td colspan="2" style="text-align: right; width: 300px;">
                                                                        <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />:
                                                                    <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="vertical-align: top;">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="left" style="width: 100%; padding: 5px 5px 5px 5px;">
                                                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                            <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="我要处理的任务：">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WoYaoChuLiDeRenWu%>" ToolTip="<%$ Resources:lang,WoYaoChuLiDeRenWu%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                                        <tr>
                                                                                            <td style="width: 100%; padding-top: 3px;" align="center">

                                                                                                <table>
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,JiLiDaoQuTianShu %>"></asp:Label>：
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_EndDays" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Amount="2">2</NickLee:NumberBox>
                                                                                                        </td>
                                                                                                        <td>
                                                                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_Find_Click" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="width: 100%; text-align: Left;">
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                    <tr>
                                                                                                        <td width="7">
                                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="6%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                                                    <td width="23%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WoDeGongZuo %>"></asp:Label></strong></td>
                                                                                                                    <td width="5%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong></td>
                                                                                                                    <td width="12%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong></td>
                                                                                                                    <td width="12%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong></td>
                                                                                                                    <td width="100px" align="center"><strong>
                                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong></td>
                                                                                                                    <td width="6%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,RenWuHao %>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FenPaiRen %>"></asp:Label></strong></td>
                                                                                                                    <td width="4%" align="center"><strong></strong></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                    CellPadding="4" Font-Bold="False" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                                    ShowHeader="False" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5"
                                                                                                    Width="100%">
                                                                                                    <Columns>
                                                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                                                            DataTextField="Operation" HeaderText="受理人的工作" Target="_blank">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="23%" />
                                                                                                        </asp:HyperLinkColumn>
                                                                                                        <asp:TemplateColumn HeaderText="优先级">
                                                                                                            <ItemTemplate></ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <div class="MYgreen"></div>
                                                                                                                <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                                                            <ItemTemplate></ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="AssignManName" HeaderText="分派人">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTDocumentTreeView.aspx?RelatedType=ProjectTask&RelatedID={0}") %>'
                                                                                                                    Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>
                                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                </asp:DataGrid><asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_TotalNumber1" runat="server"></asp:Label></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                            <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="已处理但没分派的任务">
                                                                                <HeaderTemplate>
                                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YCLDMFPDRW%>" ToolTip="<%$ Resources:lang,YCLDMFPDRW%>"></asp:Label>
                                                                                </HeaderTemplate>
                                                                                <ContentTemplate>
                                                                                    <table style="width: 100%;">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                    <tr>
                                                                                                        <td width="7">
                                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                        <td>
                                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                <tr>
                                                                                                                    <td width="6%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                                                                                    <td width="23%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WoDeGongZuo%>"></asp:Label></strong></td>
                                                                                                                    <td width="5%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong></td>
                                                                                                                    <td width="12%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong></td>
                                                                                                                    <td width="12%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong></td>
                                                                                                                    <td width="100px" align="center"><strong>
                                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong></td>
                                                                                                                    <td width="6%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,RenWuHao%>"></asp:Label></strong></td>
                                                                                                                    <td width="8%" align="center"><strong>
                                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label></strong></td>
                                                                                                                    <td width="4%" align="center"><strong></strong></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                        </td>
                                                                                                        <td width="6" align="right">
                                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                    ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                                    OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="5" Width="100%">
                                                                                                    <Columns>
                                                                                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                                                            DataTextField="Operation" HeaderText="受理人的工作" Target="_blank">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="23%" />
                                                                                                        </asp:HyperLinkColumn>
                                                                                                        <asp:TemplateColumn HeaderText="优先级">
                                                                                                            <ItemTemplate></ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <div class="MYgreen"></div>
                                                                                                                <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                                                            <ItemTemplate></ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                        <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:BoundColumn DataField="AssignManName" HeaderText="分派人">
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                        </asp:BoundColumn>
                                                                                                        <asp:TemplateColumn>
                                                                                                            <ItemTemplate>
                                                                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?RelatedType=Task&TaskID={0}") %>'
                                                                                                                    Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                            </ItemTemplate>
                                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                        </asp:TemplateColumn>
                                                                                                    </Columns>
                                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                </asp:DataGrid><asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_TotalNumber2" runat="server"></asp:Label></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </ContentTemplate>
                                                                            </cc2:TabPanel>
                                                                        </cc2:TabContainer>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; text-align: left;">
                                                                        <br />
                                                                        <span style="font-size: 10pt;">
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WoFenPaiGuoDeRenWu%>"></asp:Label>： </span>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; padding: 5px 5px 5px 5px;">
                                                                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td style="width: 100%; text-align: Left;">
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
                                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="23%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YaoChuLiDeGongZuo%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">

                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong>
                                                                                                        </td>

                                                                                                        <td width="12%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="12%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                                        </td>

                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhiXingRen%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="100px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,RenWuHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="4%" align="center">
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
                                                                                        ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="5" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                                                DataTextField="Operation" HeaderText="我的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="23%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn HeaderText="优先级">
                                                                                                <ItemTemplate>
                                                                                                    <%# GetTaskPriority(Eval("TaskID").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                                DataTextField="OperatorName" HeaderText="执行者" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <div class="MYgreen"></div>
                                                                                                    <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <%--  <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>--%>

                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByTaskStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?RelatedType&TaskID={0}") %>'
                                                                                                        Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid>
                                                                                    <asp:Label ID="LB_Sql3" Visible="false" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_TotalNumber3" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,WoYiChuLiBingYiFenPaiDeRenWu%>"></asp:Label>：
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100%; text-align: Left;">
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
                                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="23%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,WoDeGongZuo%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">

                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="12%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="12%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="100px" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,RenWuHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="4%" align="center">
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
                                                                                    <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        CellPadding="4" Font-Bold="False" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        ShowHeader="False" OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="5"
                                                                                        Width="100%">

                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                                                DataTextField="Operation" HeaderText="受理人的工作" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="23%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:TemplateColumn HeaderText="优先级">
                                                                                                <ItemTemplate>
                                                                                                    <%# GetTaskPriority(Eval("TaskID").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <div class="MYgreen"></div>
                                                                                                    <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                            </asp:TemplateColumn>
                                                                                            <%--  <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>--%>

                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByTaskStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="TaskID" HeaderText="任务号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="AssignManName" HeaderText="分派人">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTDocumentTreeView.aspx?RelatedType=ProjectTask&RelatedID={0}") %>'
                                                                                                        Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
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
                                                                                    <asp:Label ID="LB_Sql5" Visible="false" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_TotalNumber5" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100%; text-align: left;">
                                                                                    <span style="font-size: 10pt;">
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,WoJianLiDeRenWu%>"></asp:Label>： </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100%;">
                                                                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                                                                        <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="我建立的任务：">
                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,WoJianLiDeRenWu%>"></asp:Label>
                                                                                            </HeaderTemplate>
                                                                                            <ContentTemplate>
                                                                                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td style="width: 100%; text-align: Left;">
                                                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                                <tr>
                                                                                                                    <td width="7">
                                                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                                    <td>
                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                                                                <td width="18%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,RenWuNeiRong %>"></asp:Label></strong></td>
                                                                                                                                <td width="8%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong></td>
                                                                                                                                <td width="100px" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong></td>
                                                                                                                                <td width="7%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan %>"></asp:Label></strong></td>
                                                                                                                                <td width="7%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,GongShiYuSuan %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,GongShi2 %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td width="6" align="right">
                                                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                                OnPageIndexChanged="DataGrid4_PageIndexChanged" ShowHeader="False" Width="100%"
                                                                                                                Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                                                <Columns>
                                                                                                                    <asp:BoundColumn DataField="TaskID" HeaderText="编号">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTCreateProjectTaskDetail.aspx?TaskID={0}"
                                                                                                                        DataTextField="Task" HeaderText="任务内容" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate>
                                                                                                                            <div class="MYgreen"></div>
                                                                                                                            <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:BoundColumn DataField="Budget" HeaderText="费用预算">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="ManHour" HeaderText="工时预算">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate><a href='TTProExpenseView.aspx?TaskID=<%#DataBinder .Eval (Container .DataItem ,"TaskID") %>'><%#DataBinder .Eval (Container .DataItem ,"Expense") %></a></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:BoundColumn DataField="RealManHour" HeaderText="工时">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                                                        <ItemTemplate></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                                                        <ItemTemplate></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTMakeTaskTestCase.aspx?TaskID={0}"
                                                                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/TestCase.jpg border=0 alt='用例' /&gt;&lt;/div&gt;" HeaderText="测试用例" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTTaskAssignRecord.aspx?TaskID={0}"
                                                                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/JiLu.png border=0 alt='分派记录' width=24 height=24 /&gt;&lt;/div&gt;" HeaderText="分派记录" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?TaskID={0}") %>'
                                                                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                </Columns>
                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                                            </asp:DataGrid><asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_TotalNumber4" runat="server"></asp:Label></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                                <br />
                                                                                            </ContentTemplate>
                                                                                        </cc2:TabPanel>
                                                                                        <cc2:TabPanel ID="TabPanel4" runat="server" HeaderText="建立但没分派的任务：">
                                                                                            <HeaderTemplate>
                                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,JLDWFPDRW%>"></asp:Label>
                                                                                            </HeaderTemplate>
                                                                                            <ContentTemplate>
                                                                                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                                                                    <tr>
                                                                                                        <td style="width: 100%; text-align: Left;">
                                                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                                <tr>
                                                                                                                    <td width="7">
                                                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                                                    <td>
                                                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                            <tr>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                                                                <td width="18%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,RenWuNeiRong %>"></asp:Label></strong></td>
                                                                                                                                <td width="8%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,YouXianJi %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong></td>
                                                                                                                                <td width="100px" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong></td>
                                                                                                                                <td width="7%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan %>"></asp:Label></strong></td>
                                                                                                                                <td width="7%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,GongShiYuSuan %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,GongShi2 %>"></asp:Label></strong></td>
                                                                                                                                <td width="5%" align="center"><strong>
                                                                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                                <td align="center"><strong></strong></td>
                                                                                                                            </tr>
                                                                                                                        </table>
                                                                                                                    </td>
                                                                                                                    <td width="6" align="right">
                                                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                                                </tr>
                                                                                                            </table>
                                                                                                            <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                                                OnPageIndexChanged="DataGrid6_PageIndexChanged" ShowHeader="False" Width="100%"
                                                                                                                Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                                                <Columns>
                                                                                                                    <asp:BoundColumn DataField="TaskID" HeaderText="编号">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTCreateProjectTaskDetail.aspx?TaskID={0}"
                                                                                                                        DataTextField="Task" HeaderText="任务内容" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate>
                                                                                                                            <div class="MYgreen"></div>
                                                                                                                            <asp:Label ID="LB_FinishPercent" runat="server" BackColor="YellowGreen" Width="30px" Text='<%#DataBinder .Eval (Container .DataItem ,"FinishPercent") %>'></asp:Label>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="100px" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:BoundColumn DataField="Budget" HeaderText="费用预算">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:BoundColumn DataField="ManHour" HeaderText="工时预算">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate><a href='TTProExpenseView.aspx?TaskID=<%#DataBinder .Eval (Container .DataItem ,"TaskID") %>'><%#DataBinder .Eval (Container .DataItem ,"Expense") %></a></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:BoundColumn DataField="RealManHour" HeaderText="工时">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                    </asp:BoundColumn>
                                                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                                                        <ItemTemplate></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                                                                        <ItemTemplate></ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTMakeTaskTestCase.aspx?TaskID={0}"
                                                                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/TestCase.jpg border=0 alt='用例' /&gt;&lt;/div&gt;" HeaderText="测试用例" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="TaskID" DataNavigateUrlFormatString="TTTaskAssignRecord.aspx?TaskID={0}"
                                                                                                                        Text="&lt;div&gt;&lt;img src=ImagesSkin/JiLu.png border=0 alt='分派记录' width=24 height=24 /&gt;&lt;/div&gt;" HeaderText="分派记录" Target="_blank">
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                                    </asp:HyperLinkColumn>
                                                                                                                    <asp:TemplateColumn>
                                                                                                                        <ItemTemplate>
                                                                                                                            <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.TaskID", "TTProTaskRelatedDoc.aspx?TaskID={0}") %>'
                                                                                                                                Target="_blank"><img src ="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                                                                        </ItemTemplate>
                                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                                    </asp:TemplateColumn>
                                                                                                                </Columns>
                                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                                            </asp:DataGrid><asp:Label ID="LB_Sql6" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_TotalNumber6" runat="server" Visible="False"></asp:Label></td>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
