<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPlanCopyToOtherMembers.aspx.cs" Inherits="TTPlanCopyToOtherMembers" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>制定计划</title>
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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiDingJiHua%>"></asp:Label>
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
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="left" valign="top" style="width: 60%; padding: 5px 5px 5px 5px;">
                                                <cc1:tabcontainer cssclass="ajax_tab_menu" id="TabContainer1" width="100%" runat="server" activetabindex="0">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="计划内容">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                                <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"  cellspacing="0">
                                                                          
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="width: 90px; text-align: right">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuJiHua %>"></asp:Label>： </td>
                                                                        <td class="formItemBgStyle" colspan="3">
                                                                            <asp:TextBox ID="TB_ParentPlanName" runat="server" Width="90%"></asp:TextBox><cc1:ModalPopupExtender
                                                                                ID="TB_ParentPlanName_ModalPopupExtender" runat="server" Enabled="True" TargetControlID="TB_ParentPlanName"
                                                                                PopupControlID="Panel1" CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150"
                                                                                DynamicServicePath="">
                                                                            </cc1:ModalPopupExtender>
                                                                            <asp:Label ID="LB_ParentPlanID" runat="server" Visible="False"></asp:Label>

                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaLeiXing %>"></asp:Label>： </td>
                                                                        <td class="formItemBgStyle" colspan="3">
                                                                            <asp:DropDownList ID="DL_PlanType" runat="server" Width="200px" DataTextField="Type"
                                                                                DataValueField="Type">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="LB_SelectedPlanID" runat="server" Visible="False"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="height: 28px; text-align: right">
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng %>"></asp:Label>： </td>
                                                                        <td class="formItemBgStyle" colspan="3">
                                                                            <asp:TextBox ID="TB_PlanName" runat="server" Width="90%"></asp:TextBox><asp:Label
                                                                                ID="LB_PlanID" runat="server"></asp:Label></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right; height: 23px;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong %>"></asp:Label>： </td>
                                                                        <td class="formItemBgStyle" colspan="3">
                                                                            <CKEditor:CKEditorControl ID="HE_PlanDetail" runat="server" Height="180px" Width="90%" Visible="False" /><CKEditor:CKEditorControl runat="server" ID="HT_PlanDetail" Width="90%" Height="180px" Visible="False" />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>： </td>
                                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                                            <asp:TextBox ID="DLC_StartTime" runat="server"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                                                runat="server" TargetControlID="DLC_StartTime" Enabled="True">
                                                                            </ajaxToolkit:CalendarExtender>
                                                                        </td>
                                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label>： </td>
                                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                                            <asp:TextBox ID="DLC_EndTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                runat="server" TargetControlID="DLC_EndTime" Enabled="True">
                                                                            </ajaxToolkit:CalendarExtender>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_Status" runat="server" Enabled="False">
                                                                                <asp:ListItem Value="新建" />
                                                                                <asp:ListItem Value="待审核" />
                                                                                <asp:ListItem Value="批准" />
                                                                                <asp:ListItem Value="完成" />
                                                                            </asp:DropDownList>

                                                                            <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTPlanRelatedDoc.aspx"
                                                                                Target="_blank">
                                                                                --><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang %>"></asp:Label>
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian %>"></asp:Label>：
                                                                        </td>
                                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                                            <asp:Label ID="LB_SubmitTime" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan ="4" class="formItemBgStyle">
                                                                            <br />
                                                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng %>" />&nbsp;<asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                                                                Text="<%$ Resources:lang,BaoCun %>" Enabled="False" />&nbsp;<asp:Button ID="BT_Delete" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                    Text="<%$ Resources:lang,ShanChu %>" />&nbsp;&nbsp;&nbsp;
                                                                            <asp:Button ID="BT_SubmitApprove" runat="server" CssClass="inpu" Enabled="False"
                                                                                Text="<%$ Resources:lang,TiJiaoShenHe %>" OnClick="BT_SubmitApprove_Click" />

                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            <br />
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label><br />
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:tabpanel id="TabPanel5" runat="server" headertext="关键目标">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GuanJianMuBiao%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                            <td width="70%" align="center"><strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MuBiao %>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong> </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                            OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" Width="100%">

                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_TargetID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="Target" HeaderText="目标">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="进度">
                                                                                    <ItemTemplate>
                                                                                        <asp:Label ID="LB_TargetProgress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Progress")%> '></asp:Label>%
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                           
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                  <asp:Label ID="LB_TargetID" runat="server"></asp:Label>  <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,MuBiao %>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_Target" runat="server" Width="45%"></asp:TextBox><asp:DropDownList ID="DL_UserKPI" runat="server"  AutoPostBack="True"
                                                                                        DataTextField="KPI" DataValueField="KPI" OnSelectedIndexChanged="DL_UserKPI_SelectedIndexChanged">
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Progress" runat="server" Precision="0" Width="50px" OnBlur=""
                                                                                        OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>% </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle"></td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_AddTarget" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng %>" Enabled="False"
                                                                                        OnClick="BT_AddTarget_Click" />&#160;<asp:Button ID="BT_UpdateTarget" runat="server"
                                                                                            CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_UpdateTarget_Click" />&#160;<asp:Button
                                                                                                ID="BT_DeleteTarget" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu %>"
                                                                                                OnClick="BT_DeleteTarget_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:tabpanel>
                                                    <cc1:tabpanel id="TabPanel7" runat="server" headertext="相关领导">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangGuanLingDao%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td style="padding: 5px 2px 3px 4px;">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,LingDaoDaiMa %>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LingDaoMingCheng %>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JueSe %>"></asp:Label></strong> </td>
                                                                                            <td width="20%" align="center"><strong>
                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiaRuRiQi %>"></asp:Label></strong> </td>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                            OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">

                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_LeaderID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="LeaderCode" HeaderText="领导代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="LeaderName" HeaderText="领导名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Actor" HeaderText="角色">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="JoinTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="加入日期">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table style="width: 95%;">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">                                                      
                                                                                        <tr>
                                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                               <asp:Label ID="LB_LeaderID" runat="server"></asp:Label> <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LingDao %>"></asp:Label>： </td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:Label ID="LB_LeaderCode" runat="server"></asp:Label><asp:Label ID="LB_LeaderName"
                                                                                                    runat="server"></asp:Label>

                                                                                                <asp:Button ID="BT_SelectLeader" runat="server" CssClass="inpuLong" OnClick="BT_SelectLeader_Click" Text="选择领导" />

                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JueSe %>"></asp:Label>： </td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:TextBox ID="TB_Actor" runat="server" Width="60%"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,JiaRuShiJian %>"></asp:Label>： </td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:TextBox ID="DLC_JoinTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                                                                                    runat="server" TargetControlID="DLC_JoinTime" Enabled="True">
                                                                                                </ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:Label ID="LB_LeaderStatus" runat="server"></asp:Label></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right" class="formItemBgStyle"></td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:Button ID="BT_AddLeader" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng %>" Enabled="False"
                                                                                                    OnClick="BT_AddLeader_Click" />&#160;<asp:Button ID="BT_UpdateLeader" runat="server"
                                                                                                        CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_UpdateLeader_Click" />&#160;<asp:Button
                                                                                                            ID="BT_DeleteLeader" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu %>"
                                                                                                            OnClick="BT_DeleteLeader_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>

                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:tabpanel>
                                                 </cc1:tabcontainer>
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <table>
                                                    <tr>
                                                        <td style="color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <asp:Button ID="BT_CopyPlanToAllSystemUserTest" runat="server" Enabled="false" CssClass="inpuLongest" Text="<%$ Resources:lang,ZZJCSFYCFJH%>" OnClick="BT_CopyPlanToAllSystemUserTest_Click" />
                                                        </td>
                                                        <td style="color: #394f66; background-image: url('ImagesSkin/titleBG.jpg'); padding-top: 5px;">
                                                            <asp:Button ID="BT_DeletePlanToAllSystemUser" runat="server" Enabled="false" CssClass="inpuLong" Text="<%$ Resources:lang,SCSXCYDJH%>" OnClick="BT_DeletePlanToAllSystemUser_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                            <asp:Button ID="BT_CopyPlanToAllSystemUser" runat="server" Enabled="false" CssClass="inpuLongest" Text="<%$ Resources:lang,BJHFZGSXCY%>" OnClick="BT_CopyPlanToAllSystemUser_Click" />
                                                        </td>
                                                        <td style="color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')"></td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="RP_Attendant_ItemCommand">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' Visible="false" />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                                <br />
                                                <br />
                                                <br />
                                                <asp:Button ID="BT_SelectMember" runat="server" CssClass="inpuLong" OnClick="BT_SelectMember_Click" Text="选择成员" />
                                                &nbsp;&nbsp;
                                                <asp:Button ID="BT_SelectActorMember" runat="server" CssClass="inpuLong" OnClick="BT_SelectActorGroup_Click" Text="选择角色组" />
                                                <br />
                                                <br />
                                                <br />
                                                <br />
                                            </td>
                                        </tr>
                                    </table>
                                    <br />
                                </td>
                            </tr>
                        </table>
                     
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <div class="layui-layer layui-layer-iframe" id="popwindowPlanMember" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">
                                <tr>
                                    <td align="left" style="width: 190px; padding: 0px 5px 0px 5px" valign="top">
                                        <asp:TreeView ID="TreeView4" runat="server" BorderColor="Transparent" NodeWrap="True"
                                            OnSelectedNodeChanged="TreeView4_SelectedNodeChanged" ShowLines="True" Width="190px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 170px; padding: 5px 5px 5px 5px; text-align: center; vertical-align: top; border-right: solid 1px #D8D8D8">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="100%">
                                                                <strong>
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            Font-Bold="True" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid4_ItemCommand"
                                            ShowHeader="false" Width="100%">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu"  Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                        </asp:DataGrid>
                                    </td>

                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowActorGroup" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label37" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,QDJSHDJSZZJCY%>"></asp:Label>：
                             <br />
                            <asp:Repeater ID="RT_ActorGroup" runat="server" OnItemCommand="RT_ActorGroup_ItemCommand">
                                <ItemTemplate>
                                    <asp:Button ID="BT_GroupName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                </ItemTemplate>
                            </asp:Repeater>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowLeader" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label39" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 220px; border-right: solid 1px #D8D8D8;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 170px; border-right: solid 1px #D8D8D8;" align="center">
                                        <table width="170px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                            Width="170px" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                            ShowHeader="False">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
