<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTProModuleAuthority.aspx.cs"
    Inherits="TTProModuleAuthority" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView.scrollTop = disPostion;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YongHuQuanXianGuanLi%>"></asp:Label>
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
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 230px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <div id="Div_TreeView" style="overflow: auto; height: 800px;">
                                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                        ShowLines="True" Width="220" Style="height: 183px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                            <td width="165px" valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="height: 14px; text-align: center">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="100%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenChengYuan%>"></asp:Label>
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
                                                            <table width="100%" valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8">
                                                                <tr>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_FindUserName" runat="server" Width="70px"></asp:TextBox>
                                                                        <asp:Button ID="BT_FindUserName" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_FindUserName_Click" Width="60px" runat="server" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="Resources.lang.ZZXMZY">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                            <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <%--  <td style="width: 230px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" 
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                </asp:TreeView>
                                            </td>--%>
                                            <td align="left" style="padding: 5px 5px 0px 5px;">

                                                <table width="100%">
                                                    <tr>
                                                        <td background="ImagesSkin/main_n_bj.jpg">

                                                            <asp:RadioButtonList ID="RB_OperationType" RepeatDirection="Horizontal" runat="server">
                                                                <asp:ListItem Value="0" Selected="True" Text="<%$ Resources:lang,QuanXianSheZhi%>" />
                                                                <asp:ListItem Value="1" Text="<%$ Resources:lang,LiWaiYongHuSheZhi%>" />
                                                            </asp:RadioButtonList>

                                                        </td>
                                                        <td background="ImagesSkin/main_n_bj.jpg">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LB_Find" Text="<%$ Resources:lang,XiTongMoZu%>" runat="server"></asp:Label>
                                                                        :</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TB_ModuleFind" runat="server"></asp:TextBox></td>
                                                                    <td>
                                                                        <asp:Button ID="BT_ModuleFind" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_ModuleFind_Click" CssClass="inpu" runat="server" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LB_SelectedUserCode" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_SelectedDepartCode" runat="server" Visible="false"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="2">
                                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" Width="100%" runat="server" ActiveTabIndex="0">
                                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="员工模组权限">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,YuanGongMoZuQuanXian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table style="width: 98%;">
                                                                            <tr>
                                                                                <td style="width: 100%">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="30%" align="center"><strong>
                                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="30%" align="center"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,YongHu %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False"
                                                                                        Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="编号">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_ParentID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                                                        CssClass="inpu" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ModuleName" HeaderText="模块类型">
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    HorizontalAlign="Center" Width="30%" />
                                                                                            </asp:BoundColumn>

                                                                                            <asp:TemplateColumn HeaderText="用户">
                                                                                                <ItemTemplate>
                                                                                                    <%# Eval("UserCode").ToString() %>  <%# ShareClass. GetUserName(Eval("UserCode").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:TemplateColumn HeaderText="可用">
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="CB_ParentVisible" runat="server" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    Width="10%"
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td align="center">
                                                                                    <br />
                                                                                    <asp:Button ID="BT_UserAuthoritySave" runat="server" CssClass="inpu" OnClick="BT_UserAuthoritySave_Click"
                                                                                        Text="<%$ Resources:lang,BaoCun %>" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td class="tdBottom">
                                                                                                <table style="width: 98%; margin-top: 5px; padding: 3px 0px 3px 0px;"
                                                                                                    cellpadding="0" cellspacing="0">
                                                                                                    <tr style="display: none;">
                                                                                                        <td style="height: 20px; text-align: right; background-color: #EFF3FB" class="tdLeft3">
                                                                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                                                            <asp:Label ID="LB_Index" runat="server" Visible="False"></asp:Label>
                                                                                                            <asp:Label ID="LB_AuthorityUserCode" runat="server"></asp:Label>
                                                                                                            <asp:Label ID="LB_AuthorityUserName" runat="server"></asp:Label>
                                                                                                        </td>
                                                                                                    </tr>

                                                                                                    <tr>
                                                                                                        <td style="text-align: left; padding-left: 5px"><strong><span style="font-size: 11pt;">
                                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QuanXianFuZhi %>"></asp:Label>：</strong> </td>
                                                                                                    </tr>
                                                                                                    <tr style="font-size: 12pt; padding-left: 5px">
                                                                                                        <td style="text-align: left">
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaiMaWei %>"></asp:Label>
                                                                                                            <asp:TextBox ID="TB_UserCode1" runat="server" Width="65px"></asp:TextBox>
                                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DYHDQXSJFZDDMW %>"></asp:Label>
                                                                                                            <asp:TextBox ID="TB_UserCode2" runat="server" Width="62px" Font-Bold="True"></asp:TextBox>
                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DeYongHu %>"></asp:Label>
                                                                                                            <asp:Button ID="BT_UserAuthorityCopy" runat="server" CssClass="inpu" OnClick="BT_UserAuthorityCopy_Click"
                                                                                                                Text="<%$ Resources:lang,FuZhi %>" />
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
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="员工其它权限">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YuanGongQiTaQuanXian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table style="width: 98%;">
                                                                            <tr>
                                                                                <td style="text-align: Right; width: 20%;">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YuanGong%>"></asp:Label>
                                                                                    ： </td>
                                                                                <td style="width: 80%">
                                                                                    <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table style="width: 98%;" cellpadding="0" cellspacing="0" class="bian">
                                                                            <tr>
                                                                                <td style="text-align: Right; width: 20%;">
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YouXiang%>"></asp:Label>
                                                                                    ： </td>
                                                                                <td style="width: 80%">
                                                                                    <asp:CheckBox ID="CB_PasswordSet" runat="server" Text="<%$ Resources:lang,MiMaZiShe%>" />
                                                                                    <asp:CheckBox ID="CB_DeleteOperate" runat="server" Text="<%$ Resources:lang,ShanChuCaoZuo%>" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 20%"></td>
                                                                                <td style="width: 80%">
                                                                                    <asp:Button ID="BT_MailBoxSet" runat="server" OnClick="BT_MailBoxSet_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                                                    <asp:HyperLink ID="HL_MailProfile" runat="server" Target="_blank">
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShiZhiCiYongHuYouXiangCanShu%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </ContentTemplate>
                                                                </cc2:TabPanel>
                                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="部门权限">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMenMoZuQuanXian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td style="width: 100%">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="30%" align="center"><strong>
                                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="30%" align="center"><strong>
                                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                                        ShowHeader="False" Height="1px" Width="100%" CellPadding="4" ForeColor="#333333"
                                                                                        GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="编号">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_ParentID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                                                        CssClass="inpu" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                                                                <ItemStyle CssClass="itemBorder" Width="30%" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="部门">
                                                                                                <ItemTemplate>
                                                                                                    <%# Eval("DepartCode").ToString()%>    <%# ShareClass.GetDepartName(Eval("DepartCode").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                            </asp:TemplateColumn>

                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:CheckBox ID="CB_ParentVisible" runat="server" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                                                                <ItemStyle CssClass="itemBorder"
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td valign="top">
                                                                                                <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 100%;">
                                                                                                    <tr style="display: none;">
                                                                                                        <td class="formItemBgStyle" style="height: 20px; text-align: right;">&nbsp;<asp:Label ID="LB_DepartModuleIndex" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_DepartModuleID" runat="server"></asp:Label><asp:Label ID="LB_DepartCode" runat="server"></asp:Label><asp:Label ID="LB_DepartName" runat="server"></asp:Label><asp:Label ID="LB_DepartModuleName" runat="server"></asp:Label></td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td align="center" class="formItemBgStyle">
                                                                                                            <asp:Button ID="BT_DepartAuthoritySave" runat="server" CssClass="inpu" OnClick="BT_DepartAuthoritySave_Click" Text="<%$ Resources:lang,BaoCun %>" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                    <tr>
                                                                                                        <td class="formItemBgStyle" style="text-align: left;"><strong><span style="font-size: 11pt;">
                                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,QuanXianFuZhi %>"></asp:Label>
                                                                                                            ：</span></strong> </td>
                                                                                                    </tr>
                                                                                                    <tr style="font-size: 12pt;">
                                                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DaiMaWei %>"></asp:Label>
                                                                                                            <asp:TextBox ID="TB_FromDepartCode" runat="server" Width="65px"></asp:TextBox>
                                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DBMDQXSJFZDDMW %>"></asp:Label>
                                                                                                            <asp:TextBox ID="TB_ToDepartCode" runat="server" Font-Bold="True" Width="62px"></asp:TextBox>
                                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DeBuMen %>"></asp:Label>
                                                                                                            <asp:Button ID="BT_DepartAuthorityCopy" runat="server" CssClass="inpu" OnClick="BT_DepartAuthorityCopy_Click" Text="<%$ Resources:lang,FuZhi %>" />
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
                                                                            <tr>
                                                                                <td align="left" class="tdFullBorder" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>
                                                                                    ：<asp:Label ID="LB_RelatedDepartCode" runat="server"></asp:Label><asp:Label ID="LB_RelatedDepartName" runat="server"></asp:Label><asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DeLiWaiYongHu %>"></asp:Label></td>
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
                                                                                                        <td width="20%" align="center"><strong>
                                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianMa %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="35%" align="center"><strong>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="35%" align="center"><strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShanChu %>"></asp:Label>
                                                                                                        </strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        OnItemCommand="DataGrid6_ItemCommand" GridLines="None" ShowHeader="False" Width="100%">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" Width="20%" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                                <ItemStyle CssClass="itemBorder" Width="35%" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                                                                <ItemStyle CssClass="itemBorder" Width="35%" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:ButtonColumn ButtonType="PushButton" CommandName="Delete" Text="<%$ Resources:lang,ShanChu %>">
                                                                                                <ItemStyle CssClass="itemBorder" Width="10%" HorizontalAlign="Center" />
                                                                                            </asp:ButtonColumn>
                                                                                        </Columns>
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Button ID="BT_EffactSameDepartUser" CssClass="inpuLongest" runat="server" Text="<%$ Resources:lang,YYQXYZJBMHCY %>"
                                                                                        OnClick="BT_EffactSameDepartUser_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 980px; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="LB_ParentModuleID" runat="server"></asp:Label>
                                        <asp:Label ID="LB_ParentHomeModule" runat="server" Style="font-weight: 700"></asp:Label>
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZiMoZuLieBiao %>"></asp:Label>
                                        ：
                                    <asp:Label ID="LB_ParentUserType" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ParentModule" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,YongHu %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="False"
                                            Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ChildID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="30%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="用户">
                                                    <ItemTemplate>
                                                        <%# Eval("UserCode").ToString() %>  <%# ShareClass. GetUserName(Eval("UserCode").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="可用">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_ChildVisible" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 850px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label11233" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="LB_ChildModuleID" runat="server"></asp:Label>
                                        <asp:Label ID="LB_ChildHomeModule" runat="server" Style="font-weight: 700"></asp:Label>
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ZiMoZuLieBiao %>"></asp:Label>
                                        ：
                                    <asp:Label ID="LB_ChildUserType" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ChildModule" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ChildModuleName" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,YongHu %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" ShowHeader="False" OnItemCommand="DataGrid7_ItemCommand"
                                            Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="30%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="用户">
                                                    <ItemTemplate>
                                                        <%# Eval("UserCode").ToString() %>  <%# ShareClass. GetUserName(Eval("UserCode").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="可用">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_ChildVisible" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewDetail" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewDetail_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowDepartment"
                        style="z-index: 9999; width: 980px; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label49" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="LB_ParentHomeDepartModule" runat="server" Style="font-weight: 700"></asp:Label>
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZiMoZuLieBiao %>"></asp:Label>
                                        ：
                                    <asp:Label ID="LB_DepartUserType" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ParentDepartModule" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid5_ItemCommand"
                                            ShowHeader="False" Height="1px" Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ChildID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                    <ItemStyle CssClass="itemBorder" Width="30%" HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="部门">
                                                    <ItemTemplate>
                                                        <%# Eval("DepartCode").ToString()%>    <%# ShareClass.GetDepartName(Eval("DepartCode").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_ChildVisible" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMainDepartment_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,GuanBi%>" />
                            </a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popDetailWindowDepartment" name="fixedDiv"
                        style="z-index: 9999; width: 850px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label59" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="LB_ChildHomeDepartModule" runat="server" Style="font-weight: 700"></asp:Label>
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZiMoZuLieBiao %>"></asp:Label>
                                        ：
                                   <asp:Label ID="LB_ChildDepartModule" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,KeYong %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,MoZuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,YongHuLeiXing %>"></asp:Label>
                                                            </strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid8_ItemCommand"
                                            ShowHeader="False" Height="1px" Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" Width="10%" HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                    <ItemStyle CssClass="itemBorder" Width="30%" HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="部门">
                                                    <ItemTemplate>
                                                        <%# Eval("DepartCode").ToString()%>    <%# ShareClass.GetDepartName(Eval("DepartCode").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_ChildVisible" runat="server" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ModuleType" HeaderText="模组类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UserType" HeaderText="用户类型">
                                                    <ItemStyle CssClass="itemBorder"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton2" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewDetailDepartment_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
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

