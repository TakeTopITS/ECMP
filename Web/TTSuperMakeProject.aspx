<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTSuperMakeProject.aspx.cs"
    Inherits="TTSuperMakeProject" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>给成员建立和分派项目</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1280px;
            width: expression (document.body.clientWidth <= 1280? "1280px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>

    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { }
            else {
                CloseWebPage();
            }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QuanJuXiangMuDingYi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td class="titlezi">
                                                <asp:Label ID="LB_ErrorMsg" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>

                                            <td style="width: 165px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px"
                                                valign="top" align="center">
                                                <table style="width: 100%; height: 50px;">
                                                    <tr>
                                                        <td style="text-align: center;">
                                                            <asp:Button ID="BT_AllProject" runat="server" OnClick="BT_AllProject_Click" Text="<%$ Resources:lang,ZJCYDSYXM%>"
                                                                CssClass="inpuLong" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="padding-top: 5px" valign="top">
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
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenChengYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                ShowHeader="false" Width="100%" ForeColor="#333333" GridLines="None">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="部门成员：">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UnderlingCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                Style="text-align: center" CssClass="inpu" />
                                                                            <asp:Button ID="BT_UnderlingName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                Style="text-align: center" CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">

                                                <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px" NodeWrap="True">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>

                                            <td style="text-align: left; border-right: solid 1px #D8D8D8;" valign="top">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td colspan="4" style="text-align: right; padding-right: 25px;" class="formItemBgStyle">

                                                                        <asp:Button ID="BT_Upate" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Update_Click"
                                                                            Enabled="False" />
                                                                        &nbsp; &nbsp; &nbsp; &nbsp;
                                                                        <asp:Button ID="BT_SetTemProject" runat="server" Text="<%$ Resources:lang,SheWeiMuBanXiangMu%>" CssClass="inpuLong"
                                                                            OnClick="BT_SetTemProject_Click" Enabled="False" />
                                                                        &nbsp;
                                                                        <asp:Button ID="BT_SetCommonProject" runat="server" Text="<%$ Resources:lang,SheWeiChangGuiXiangMu%>" CssClass="inpuLong"
                                                                            OnClick="BT_SetCommonProject_Click" Enabled="False" />
                                                                        &nbsp;
                                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                            Text="<%$ Resources:lang,ShanChu%>" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" align="right" style="padding-right: 22px;" class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,XinXiangMuJingLi%>"></asp:Label>：</td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_NewPMName" runat="server"
                                                                                        DataTextField="UserName" DataValueField="UserCode" CssClass="DDList">
                                                                                    </asp:DropDownList></td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_DirectDepartment" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ZhiShuBuMen%>" />
                                                                                    <cc1:ModalPopupExtender ID="BT_DirectDepartment_ModalPopupExtender" runat="server"
                                                                                        Enabled="True" TargetControlID="BT_DirectDepartment" PopupControlID="Panel1"
                                                                                        CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                                    </cc1:ModalPopupExtender>
                                                                                    &nbsp;
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Button ID="BT_TransferProject" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ZhuanShou%>" OnClick="BT_TransferProject_Click"
                                                                                        Enabled="False" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" align="right" style="padding-right: 22px;" class="formItemBgStyle">
                                                                        <table width="100%">

                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">

                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,SDYJDDJH%>"></asp:Label>:
                            
                                                                                </td>
                                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_LockStartupedPlan" runat="server">
                                                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                                </asp:DropDownList>

                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YINGXXMJLGXMZT%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_AllowPMChangeStatus" runat="server">
                                                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>


                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,JDHGQSHDBDXMJHYH%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_ProgressByDetailImpact" runat="server">
                                                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>

                                                                                            <td style="text-align: right">
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,RWJDYHJHJDYQR%>"></asp:Label>:
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
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,RXZDFQLC%>"></asp:Label>:
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
                                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,XMQDXYZJYHQR%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_ProjectStartupNeedSupperConfirm" runat="server">
                                                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,XMJHYQD%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_ProjectPlanStartupSatus" runat="server">
                                                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,XMJHTGGLGZLMB%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:DropDownList ID="DL_PlanStartupRelatedWorkflowTemplate" runat="server" DataTextField="TemName" DataValueField="TemName" Width="150px">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuJiXiangMu%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td colspan="3" style="height: 26px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_ParentProjectID" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                                        Text="" Visible="True"></asp:Label>
                                                                                    <asp:TextBox ID="TB_ParentProject" Width="90%" runat="server"></asp:TextBox>
                                                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                                        Enabled="True" TargetControlID="TB_ParentProject" PopupControlID="Panel2"
                                                                                        CancelControlID="IMBT_CloseTree" BackgroundCssClass="modalBackground" Y="150">
                                                                                    </cc1:ModalPopupExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; height: 26px; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td colspan="3" style="height: 26px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                                                    <asp:TextBox ID="TB_ProjectName" runat="server" Width="90%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right; height: 26px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left; height: 26px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_PMCode" runat="server"></asp:Label>&nbsp;&nbsp;<asp:Label
                                                                                        ID="LB_PMName" runat="server" Font-Size="10pt" Width="92px"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 15%; text-align: right; height: 26px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeHuJingLi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left; height: 26px;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_CustomerPMName" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right; height: 26px;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangMuLeiXing%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left; height: 26px;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_ProjectType" runat="server" DataTextField="Type"
                                                                                        AutoPostBack="true" OnSelectedIndexChanged=" DL_ProjectType_SelectedIndexChanged"
                                                                                        DataValueField="Type" CssClass="DDList" Width="260px">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="formItemBgStyle" align="right">
                                                                                    <asp:Label ID="LB_tbPirority" runat="server" Text="<%$ Resources:lang,Pirority %>"></asp:Label>:</td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority"
                                                                                        Width="77px">
                                                                                        <asp:ListItem Value="COMMON" Text="<%$ Resources:lang,YiBan%>" />
                                                                                        <asp:ListItem Value="2-H" Text="<%$ Resources:lang,ErGao%>" />
                                                                                        <asp:ListItem Value="1-H" Text="<%$ Resources:lang,YiGao%>" />
                                                                                        <asp:ListItem Value="2-M" Text="<%$ Resources:lang,ErZhong%>" />
                                                                                        <asp:ListItem Value="1-M" Text="<%$ Resources:lang,YiZhong%>" />

                                                                                        <asp:ListItem Value="1-L" Text="<%$ Resources:lang,YiDi%>" />
                                                                                        <asp:ListItem Value="2-L" Text="<%$ Resources:lang,ErDi%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                        runat="server" TargetControlID="DLC_EndDate">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangMuE%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left;" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ProjectAmount" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                                                </td>
                                                                                <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left;" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Budget" runat="server" Width="80px">0.00</NickLee:NumberBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YaoQiuGongShi%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" Width="53px">0.00</NickLee:NumberBox>
                                                                                </td>
                                                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,RenLi%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td style="width: 35%; text-align: left" class="formItemBgStyle">
                                                                                    <%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManNubmer" runat="server" Width="53px">0.00</NickLee:NumberBox><span
                                                                                        style="font-size: 10pt"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Ren%>"></asp:Label></span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</span>
                                                                                </td>
                                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName"
                                                                                        OnSelectedIndexChanged="DL_Status_SelectedIndexChanged" AutoPostBack="true" DataValueField="Status"
                                                                                        CssClass="DDList">
                                                                                    </asp:DropDownList>
                                                                                    &nbsp;&nbsp;
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTaiZhi%>"></asp:Label>：<asp:DropDownList ID="DL_StatusValue" OnSelectedIndexChanged=" DL_StatusValue_SelectedIndexChanged"
                                                                                        AutoPostBack="true" runat="server" Width="80px">
                                                                                        <asp:ListItem Value="进行中" Text="<%$ Resources:lang,JinXingZhong%>" />
                                                                                        <asp:ListItem Value="通过" Text="<%$ Resources:lang,TongGuo%>" />
                                                                                    </asp:DropDownList>

                                                                                    <asp:HyperLink ID="HL_StatusReview" Enabled="false" runat="server"
                                                                                        Target="_blank" Visible="false">
                                                                                        ---><asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiangMuZhuangTaiPingShen%>"></asp:Label>
                                                                                    </asp:HyperLink>

                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%; text-align: left;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XiangXiShuoMing%>"></asp:Label>：<asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                            Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                            Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%;" class="formItemBgStyle">
                                                                        <CKEditor:CKEditorControl ID="HE_ProjectDetail" runat="server" Height="150px" Width="95%" Visible="false" />
                                                                        <CKEditor:CKEditorControl runat="server" ID="HT_ProjectDetail" Width="95%" Height="150px" Visible="false" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%; text-align: left;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                        <CKEditor:CKEditorControl ID="HE_AcceptStandard" runat="server" Height="150" Width="95%" Visible="false" />
                                                                        <CKEditor:CKEditorControl runat="server" ID="HT_AcceptStandard" Width="95%" Height="150px" Visible="false" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            <table cellpadding="3" cellspacing="0" width="100%" class="formBgStyle">
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%; text-align: Left; height: 1px;" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>
                                                                        <asp:HyperLink ID="HL_ProjectRelatedUser" runat="server" Font-Size="10pt" NavigateUrl="TTProjectRelatedUser.aspx"
                                                                            Target="_blank" Enabled="False">
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuChengYuan%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_ProjectRelatedReq" runat="server" Font-Size="10pt" NavigateUrl="TTProjectRelatedReq.aspx"
                                                                            Target="_blank" Enabled="False">
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XiangMuXuQiu%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_RelatedConstract" runat="server" Font-Size="10pt" NavigateUrl="TTProjectRelatedConstract.aspx"
                                                                            Target="_blank" Enabled="False">
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiangMuHeTong%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_ProjectRelatedDoc" runat="server" Font-Size="10pt" NavigateUrl="TTProjectRelatedDoc.aspx"
                                                                            Target="_blank" Enabled="False">
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_ProjectRelatedRisk" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="TTProRelatedRisk.aspx" Target="_blank">
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiangMuFengXian%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_DailyWork" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="~/TTProjectSummaryAnalystChart.aspx" Target="_blank">
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GongZuoZongJie%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_Expense" runat="server" Enabled="False" Font-Size="10pt" NavigateUrl="~/TTProjectExpenseReport.aspx"
                                                                            Target="_blank">
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangMuFeiYong%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_StatusChangeRecord" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="~/TTProStatusChangeRecord.aspx" Target="_blank">
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhuangTaiBianGengJiLu%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_TransferProject" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="~/TTTransferProjectRecord.aspx" Target="_blank">
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,XiangMuJingLiBianGengJiLu%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%; text-align: Left; height: 1px;" class="formItemBgStyle">
                                                                        <asp:HyperLink ID="HL_CustomerInfo" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="~/TTCustomerInfo.aspx" Target="_blank">
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,KeHuZiLiao%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        <asp:HyperLink ID="HL_VendorInfo" runat="server" Enabled="False" Font-Size="10pt"
                                                                            NavigateUrl="~/TTVendorInfo.aspx" Target="_blank">
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GongYingShangZiLiao%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_MakePlan" runat="server" NavigateUrl="TTWorkPlan.aspx"
                                                                            Target="_blank" Enabled="false">
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XiangMuJiHua%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        &nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx"
                                                                            Target="_blank" Enabled="false">
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                        &nbsp; &nbsp;
                                                                    <asp:HyperLink ID="HL_ProjectReviewWL" Enabled="False" Target="_blank" runat="server">---><asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XiangMuPingShen%>"></asp:Label></asp:HyperLink>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" style="width: 100%; text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GBNRSTZXMZCY%>"></asp:Label>：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                                        <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                                        <asp:TextBox ID="TB_Message" runat="server" Width="250px"></asp:TextBox>
                                                                        <asp:Button ID="BT_Send" runat="server" Enabled="False" OnClick="BT_Send_Click" CssClass="inpu"
                                                                            Text="<%$ Resources:lang,FaSong%>" />
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
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 310px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="center">

                                        <asp:Button ID="BT_MyMember" runat="server" CssClass="inpuLongest" OnClick="BT_MyMember_Click"
                                            Text="<%$ Resources:lang,MyMember%>" />
                                    </td>
                                </tr>

                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
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
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView4" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
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
                            <asp:Label ID="Label43" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0" width="98%">
                                <tr>
                                    <td colspan="4" style="width: 100%; text-align: left;">
                                        <asp:Label ID="LB_ProjectList" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ProjectClass" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4">
                                        <table width="99%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="33%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="13%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="13%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="13%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,LiXiangRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,WanCheng%>"></asp:Label></strong>
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
                                            Width="99%" ShowHeader="false" GridLines="None" Visible="False">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ProjectID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="33%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="立项日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="完成">
                                                    <ItemTemplate>
                                                        <asp:Label ID="LB_FinishPercent" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FinishPercent")%> '></asp:Label>%
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
