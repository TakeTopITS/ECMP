<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRelatedUserSAAS.aspx.cs" Inherits="TTProjectRelatedUserSAAS" %>

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
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="245" align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="right" style="padding: 5px 5px 5px 5px;">
                                    <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td>

                                    <table style="width: 100%; margin-top: 5px">
                                        <tr>
                                            <td colspan="6">
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
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>

                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGUserCode" runat="server" Text="<%$ Resources:lang,UserCode%>" /></strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGUserName" runat="server" Text="<%$ Resources:lang,UserName%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_Department" runat="server" Text="<%$ Resources:lang,Department%>" /></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGActor" runat="server" Text="<%$ Resources:lang,Actor%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGUnitSalary" runat="server" Text="<%$ Resources:lang,UnitSalary%>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KeGaiJiHua%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGJoinTime" runat="server" Text="<%$ Resources:lang,JoinTime%>" /></strong>
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
                                                    ShowHeader="false" OnItemCommand="DataGrid2_ItemCommand" Width="100%"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
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
                                                        <asp:BoundColumn DataField="UnitHourSalary" HeaderText="时薪">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CanUpdatePlan" HeaderText="可改计划">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="JoinDate" HeaderText="加入时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
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

                                            <td colspan="6" style="text-align: center;" class="formItemBgStyle">

                                                <asp:Label ID="LB_Message" runat="server" Text="<%$ Resources:lang,Message%>" />:<asp:TextBox
                                                    ID="TB_SMS" runat="server" Width="60%"></asp:TextBox>
                                                <asp:Label ID="LB_NoticeProjectTeamMember" runat="server" Text="<%$ Resources:lang,NoticeProjectTeamMember%>" />:<asp:CheckBox
                                                    ID="CB_Sms" runat="server" Text="<%$ Resources:lang,SendSMS%>" />

                                                <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,SendEMail%>" />

                                                <asp:Button ID="BT_SendMsg" runat="server" OnClick="BT_SendMsg_Click" Text="<%$ Resources:lang,Send%>"
                                                    CssClass="inpu" />
                                            </td>
                                        </tr>
                                    </table>
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

                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="formItemBgStyle" style="width: 200px; text-align: right">

                                        <div id="Div_TreeView1" style="overflow: auto; height: 500px;">
                                            <table style="display: none;">
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label></td>
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
                                                                        <asp:Label ID="LB_DepartmentMember" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuan %>" /></strong>
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
                                                Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False"
                                                Font-Bold="True">
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
                                        </div>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <table width="100%">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right; width: 15%;">
                                                    <asp:Label ID="LB_tbUserCode" runat="server" Text="<%$ Resources:lang,UserCode %>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:Label ID="LB_RelatedUserCode" runat="server" Style="text-align: left"></asp:Label>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_tbUserName" runat="server" Text="<%$ Resources:lang,UserName %>" />：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_RelatedUserName" runat="server"></asp:Label>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right;"></td>
                                                <td class="formItemBgStyle" style="text-align: Left;"></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_tbWageCalculationWay" runat="server" Text="<%$ Resources:lang,WageCalculationWay %>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_SalaryMethod" runat="server" Height="23px">
                                                        <asp:ListItem Value="提成" />
                                                        <asp:ListItem Value="工时" />
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_tbCommissionRate" runat="server" Text="<%$ Resources:lang,CommissionRate %>" />：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PromissionScale" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_tbUnitSalary" runat="server" Text="<%$ Resources:lang,UnitSalary %>" />：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_UnitHourSalary" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="LB_tbActor" runat="server" Text="<%$ Resources:lang,Actor %>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Actor" Width="99%" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_JoinTime" runat="server" Text="<%$ Resources:lang,JoinTime %>" />：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_JoinDate" Width="100px" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                        runat="server" TargetControlID="DLC_JoinDate" Enabled="True">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LiKaiShiJian %>" />：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_LeaveDate" Width="100px" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                        runat="server" TargetControlID="DLC_LeaveDate" Enabled="True">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="LB_tbWorkDetail" runat="server" Text="<%$ Resources:lang,WorkDetail %>"></asp:Label>：
                                                </td>
                                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_WorkDetail" runat="server" Height="50px" TextMode="MultiLine"
                                                        Width="85%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeGaiJiHua %>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_CanUpdatePlan" runat="server">
                                                        <asp:ListItem>NO</asp:ListItem>
                                                        <asp:ListItem>YES</asp:ListItem>
                                                    </asp:DropDownList>
                                                </td>
                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status %>" />：
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
                                                <td class="formItemBgStyle" align="right">
                                                    <asp:Label ID="LB_tbMessage" runat="server" Text="<%$ Resources:lang,Message %>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="5" style="text-align: left;">
                                                    <asp:TextBox ID="TB_PersonalSMS" runat="server" Width="50%"></asp:TextBox>
                                                    <asp:Label ID="LB_tbNoticeThisMember" runat="server" Text="<%$ Resources:lang,NoticeThisMember %>"></asp:Label>：

                                                    <asp:CheckBox ID="CB_SendSMS" runat="server" Text="<%$ Resources:lang,SendSMS %>" />
                                                    <asp:CheckBox ID="CB_SendEMail" runat="server" Text="<%$ Resources:lang,SendEMail %>" />
                                                    <asp:Button ID="BT_PersonalSMS" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_PersonalSMS_Click" Text="<%$ Resources:lang,Send %>" />
                                                </td>
                                            </tr>
                                            <tr style="display: none;">

                                                <td class="formItemBgStyle" style="text-align: right;">


                                                    <asp:Label ID="LB_tbDepartCode" runat="server" Text="<%$ Resources:lang,DepartCode %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td style="text-align: left;" class="formItemBgStyle">

                                                    <asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                                </td>

                                                <td style="text-align: right;" class="formItemBgStyle">

                                                    <asp:Label ID="LB_tbDepartName" runat="server" Text="<%$ Resources:lang,DepartName %>" />：
                                                </td>

                                                <td colspan="3" class="formItemBgStyle" align="left">

                                                    <asp:Label ID="LB_DepartName" runat="server" Height="16px"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td colspan="6">
                                                    <asp:HyperLink ID="HL_MemberWorkload" runat="server" Target="_blank" Visible="False" Text="<%$ Resources:lang,ChaKanGongZuoFuHe %>">
                                                    </asp:HyperLink><asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_SqlGM" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserDepartString" runat="server" Visible="False"></asp:Label>
                                                    <asp:HyperLink ID="HL_Department" NavigateUrl="~/TTDepartment_ThirtPart.aspx" Target="_blank" Visible="false"
                                                        runat="server" Text="<%$ Resources:lang,SetThirdPartDepartment%>"> </asp:HyperLink>
                                                    <asp:HyperLink ID="HL_UserInfo" NavigateUrl="~/TTUserInfor_ThirtPart.aspx" Target="_blank" Visible="false"
                                                        runat="server" Text="<%$ Resources:lang,SetThirdPartMember%>"></asp:HyperLink>
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
