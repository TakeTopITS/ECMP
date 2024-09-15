<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRelatedUser_BYJF.aspx.cs" Inherits="TTProjectRelatedUser_BYJF" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1280px;
            width: expression (document.body.clientWidth <= 1280? "1280px" : "auto" ));
        }*/
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView1").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView1.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView1.scrollTop = disPostion;
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

                        <table cellpadding="0" cellspacing="0" width="100%">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <b>
                                                                <asp:Label ID="LB_BuildTeam" runat="server" Text="<%$ Resources:lang,BuildTeam%>" /></b>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="padding-top: 5px; padding-right: 5px;" align="right">
                                                <asp:HyperLink ID="HL_Department" NavigateUrl="~/TTDepartment_ThirtPart.aspx" Target="_blank"
                                                    runat="server" Text="<%$ Resources:lang,SetThirdPartDepartment%>"> </asp:HyperLink>

                                                &nbsp;

                                                 <asp:HyperLink ID="HL_UserInfo" NavigateUrl="~/TTUserInfor_ThirtPart.aspx" Target="_blank"
                                                     runat="server" Text="<%$ Resources:lang,SetThirdPartMember%>"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td align="right" style="padding: 5px 5px 0px 5px;">
                                    <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                        <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">

                                            <HeaderTemplate>

                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChengYuanSheZhi%>"></asp:Label>
                                            </HeaderTemplate>

                                            <ContentTemplate>

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
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao %>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGUserCode" runat="server" Text="员工号" /></strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGUserName" runat="server" Text="<%$ Resources:lang,UserName %>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_Department" runat="server" Text="<%$ Resources:lang,Department %>" /></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGActor" runat="server" Text="<%$ Resources:lang,Actor %>" /></strong>
                                                                    </td>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="工作职责" /></strong>
                                                                    </td>

                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    ShowHeader="False" OnItemCommand="DataGrid2_ItemCommand" Width="100%"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DepartName" HeaderText="部门">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Actor" HeaderText="角色">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="WorkDetail" HeaderText="工作职责">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                        </asp:BoundColumn>

                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                        <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="" TabIndex="0" BorderWidth="0">

                                            <HeaderTemplate>

                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JueSeZu%>"></asp:Label>
                                            </HeaderTemplate>

                                            <ContentTemplate>

                                                <table cellpadding="0" cellspacing="0" width="100%">

                                                    <tr>

                                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">

                                                            <table>

                                                                <tr>

                                                                    <td>

                                                                        <asp:Label ID="LB_tbActorGroupList" runat="server" Text="<%$ Resources:lang,ActorGroupList %>" />: </td>

                                                                    <td>（</td>

                                                                    <td>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JueSeZuMingCheng %>"></asp:Label>：</td>

                                                                    <td>

                                                                        <asp:TextBox ID="TB_ActorGroupName" runat="server" Width="150px"></asp:TextBox></td>

                                                                    <td>

                                                                        <asp:Button ID="BT_FindGroup" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindGroup_Click" />
                                                                    </td>

                                                                    <td>)
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>

                                                    <tr>

                                                        <td align="left">

                                                            <table>

                                                                <tr>

                                                                    <td align="left">

                                                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">

                                                                            <ItemTemplate>

                                                                                <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                                            </ItemTemplate>
                                                                        </asp:Repeater>
                                                                    </td>
                                                                </tr>

                                                                <tr>

                                                                    <td style="height: 10px; text-align: left">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CJJSZBBXMCYGHWJSZCY %>"></asp:Label>：
                                                                    </td>
                                                                </tr>

                                                                <tr>

                                                                    <td style="height: 10px; text-align: left">

                                                                        <asp:TextBox ID="TB_ActorGroup" runat="server" Width="219px"></asp:TextBox>

                                                                        <asp:Button ID="BT_CreateActorGroup" runat="server" CssClass="inpuLong" OnClick="BT_CreateActorGroup_Click"
                                                                            Text="<%$ Resources:lang,CreateActorGroup %>" />

                                                                        <asp:Label ID="LB_AddDelete" runat="server" Text="Add" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_ActorGroup" runat="server" Font-Underline="True"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                    </cc2:TabContainer>
                                </td>
                            </tr>

                            <tr>

                                <td style="text-align: left" class="formItemBgStyle">
                                    <asp:CheckBox
                                        ID="CB_Sms" runat="server" Text="<%$ Resources:lang,SendSMS%>" />

                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail%>" />

                                    <asp:Label ID="LB_NoticeProjectTeamMember" runat="server" Text="<%$ Resources:lang,NoticeProjectTeamMember%>" />::<asp:TextBox
                                        ID="TB_SMS" runat="server" Width="50%"></asp:TextBox>

                                    <asp:Button ID="BT_SendMsg" runat="server" OnClick="BT_SendMsg_Click" Text="<%$ Resources:lang,Send%>"
                                        CssClass="inpu" />
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 550px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label10" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table style="width: 1200px;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                        valign="top" align="left">
                                        <div id="Div_TreeView1" style="overflow: auto; height: 800px;">
                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Width="220px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                        </div>
                                    </td>
                                    <td width="180px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox runat="server" ID="TB_UserNameForFind" Width="60px"></asp:TextBox></td>
                                                <td>
                                                    <asp:Button runat="server" Text="<%$ Resources:lang,Find %>" CssClass="inpu" ID="BT_FindUserName" OnClick="BT_FindUserName_Click"></asp:Button></td>
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
                                                            <td colspan="2" align="Center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,DepartmentMember%>" /></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand"
                                            Width="180" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false"
                                            Font-Bold="true">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                            <Columns>
                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            CssClass="inpu" />
                                                        <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                        </asp:DataGrid>
                                    </td>
                                    <td valign="top">
                                        <table style="width: 96%; margin-top: 5px">
                                            <tr>
                                                <td colspan="6" style="text-align: left;">
                                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                        <tr>

                                                            <td style="width: 15%; height: 5px; text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbUserCode" runat="server" Text="员工号" />:
                                                            </td>

                                                            <td class="formItemBgStyle">

                                                                <asp:Label ID="LB_RelatedUserCode" runat="server" Width="163px" Style="text-align: left"></asp:Label>
                                                            </td>

                                                            <td style="width: 15%; height: 5px; text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbUserName" runat="server" Text="<%$ Resources:lang,UserName %>" />:
                                                            </td>

                                                            <td style="height: 5px; text-align: left;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_RelatedUserName" runat="server"></asp:Label>
                                                            </td>

                                                            <td colspan="2" style="text-align: center;" class="formItemBgStyle">

                                                                <asp:HyperLink ID="HL_MemberWorkload" runat="server" Target="_blank" Text="<%$ Resources:lang,ChaKanGongZuoFuHe %>">
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbDepartCode" runat="server" Text="<%$ Resources:lang,DepartCode %>" />:
                                                            </td>

                                                            <td style="text-align: left;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_DepartCode" runat="server" Width="115px"></asp:Label>
                                                            </td>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbDepartName" runat="server" Text="<%$ Resources:lang,DepartName %>" />:
                                                            </td>

                                                            <td colspan="3" class="formItemBgStyle">

                                                                <asp:Label ID="LB_DepartName" runat="server" Height="16px"></asp:Label>
                                                            </td>
                                                        </tr>

                                                        <tr style="display: none;">

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbWageCalculationWay" runat="server" Text="<%$ Resources:lang,WageCalculationWay %>" />:
                                                            </td>

                                                            <td style="text-align: left;" class="formItemBgStyle">

                                                                <asp:DropDownList ID="DL_SalaryMethod" runat="server">

                                                                    <asp:ListItem Value="提成" />

                                                                    <asp:ListItem Value="工时" />
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td style="text-align: right; height: 5px;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbCommissionRate" runat="server" Text="<%$ Resources:lang,CommissionRate %>" />:
                                                            </td>

                                                            <td class="formItemBgStyle">

                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PromissionScale" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                            </td>

                                                            <td style="width: 15%; text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbUnitSalary" runat="server" Text="<%$ Resources:lang,UnitSalary %>" />:
                                                            </td>

                                                            <td class="formItemBgStyle">

                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UnitHourSalary" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbActor" runat="server" Text="<%$ Resources:lang,Actor %>" />:
                                                            </td>

                                                            <td class="formItemBgStyle">

                                                                <asp:TextBox ID="TB_Actor" Width="99%" runat="server"></asp:TextBox>
                                                            </td>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_JoinTime" runat="server" Text="<%$ Resources:lang,JoinTime %>" />:
                                                            </td>

                                                            <td style="text-align: left" class="formItemBgStyle">

                                                                <asp:TextBox ID="DLC_JoinDate" Width="99%" runat="server" AutoPostBack="true" OnTextChanged="DLC_JoinDate_TextChanged"></asp:TextBox>
                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                                    runat="server" TargetControlID="DLC_JoinDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LiKaiShiJian %>" />:
                                                            </td>

                                                            <td style="text-align: left" class="formItemBgStyle">

                                                                <asp:TextBox ID="DLC_LeaveDate" Width="99%" runat="server" AutoPostBack="true" OnTextChanged="DLC_LeaveDate_TextChanged"></asp:TextBox>

                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                    runat="server" TargetControlID="DLC_LeaveDate" Enabled="True">
                                                                </ajaxToolkit:CalendarExtender>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td style="text-align: right" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbWorkDetail" runat="server" Text="工作职责" />:
                                                            </td>

                                                            <td colspan="5" style="text-align: left;" class="formItemBgStyle">

                                                                <asp:TextBox ID="TB_WorkDetail" runat="server" Height="50px" TextMode="MultiLine"
                                                                    Width="95%"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr style="display: none;">

                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeGaiJiHua %>"></asp:Label>：
                                                            </td>

                                                            <td style="text-align: left;" class="formItemBgStyle">

                                                                <asp:DropDownList ID="DL_CanUpdatePlan" runat="server">

                                                                    <asp:ListItem>NO</asp:ListItem>

                                                                    <asp:ListItem>YES</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td style="text-align: right;" class="formItemBgStyle">

                                                                <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status %>" />:
                                                            </td>

                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">

                                                                <asp:DropDownList ID="DL_Status" runat="server">

                                                                    <asp:ListItem Value="计划" />

                                                                    <asp:ListItem Value="受理" />

                                                                    <asp:ListItem Value="拒绝" />

                                                                    <asp:ListItem Value="处理中" />

                                                                    <asp:ListItem Value="暂停" />

                                                                    <asp:ListItem Value="终止" />
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle">&nbsp;
                                                            </td>
                                                            <td style="text-align: left;" colspan="5" class="formItemBgStyle">
                                                                <br />
                                                                <asp:Button ID="BT_AddMember" CssClass="inpu" runat="server" Text="<%$ Resources:lang,XinZeng %>" OnClick="BT_AddMember_Click" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left;" colspan="6" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbNoticeThisMember" runat="server" Text="<%$ Resources:lang,NoticeThisMember %>" />:
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td style="text-align: left;" colspan="6" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbMessage" runat="server" Text="<%$ Resources:lang,Message %>" />:
                                                                <asp:TextBox ID="TB_PersonalSMS" runat="server" Width="80%"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td colspan="6" style="text-align: left" class="formItemBgStyle">
                                                                <asp:CheckBox ID="CB_SendSMS" runat="server" Text="<%$ Resources:lang,SendSMS %>" /><asp:CheckBox
                                                                    ID="CB_SendEMail" runat="server" Text="<%$ Resources:lang,SendEMail %>" />

                                                                <asp:Button ID="BT_PersonalSMS" runat="server" Text="<%$ Resources:lang,Send %>" Enabled="False"
                                                                    OnClick="BT_PersonalSMS_Click" CssClass="inpu" />
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none;">
                                                            <td colspan="6">
                                                                <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
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

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc; text-align: center;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Label ID="LB_SqlGM" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserDepartString" runat="server" Visible="False"></asp:Label>
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
