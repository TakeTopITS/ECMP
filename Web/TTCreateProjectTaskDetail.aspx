<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCreateProjectTaskDetail.aspx.cs"
    Inherits="TTCreateProjectTaskDetail" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenWuFenPai%>"></asp:Label>
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
                                            <td valign="top" style="padding: 0px 5px 5px 5px;" align="left">
                                                <table style="width: 100%; height: 1px;">

                                                    <tr>
                                                        <td style="text-align: left;">
                                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">
                                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="分派需求">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,gongzuozongjie%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <br />
                                                                        <table class="formBgStyle" style="width: 98%;" cellpadding="3" cellspacing="0">
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right; height: 28px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="width: 20%; text-align: left; height: 28px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_TaskNO" runat="server" Width="60px" Enabled="False"></asp:Label>
                                                                                </td>
                                                                                <td style="width: 20%; text-align: right; height: 28px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                                     <asp:DropDownList ID="DL_Type" runat="server" DataTextField="Type" DataValueField="Type">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="text-align: right; height: 28px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label>：<asp:DropDownList ID="DL_Priority" runat="server" DataTextField="Priority" DataValueField="Priority">

                                                                                        <asp:ListItem>Normal</asp:ListItem>
                                                                                        <asp:ListItem>High</asp:ListItem>
                                                                                        <asp:ListItem>Low</asp:ListItem>

                                                                                    </asp:DropDownList>
                                                                                </td>


                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_FinishPercent" Enabled="false" runat="server" Width="60px" OnBlur="" OnFocus=""
                                                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                                                    %
                                                                                 </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td rowspan="2" style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>：
                                                                                 </td>
                                                                                <td colspan="3" rowspan="2" style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_Task" runat="server" Width="90%" Height="50px" TextMode="MultiLine"></asp:TextBox>
                                                                                </td>
                                                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="height: 28px; text-align: left" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" Width="80px" OnBlur="" OnFocus=""
                                                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShiJiGongShi%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RealManHour" runat="server" Width="80px" Enabled="False"
                                                                                        OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="width: 170px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="width: 170px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                        runat="server" TargetControlID="DLC_EndDate">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>


                                                                                <td style="width: 10%; text-align: right; height: 28px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FeiYongYuSuan%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left; height: 28px;" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Budget" runat="server" Width="80px" OnBlur="" OnFocus=""
                                                                                        OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                                                </td>


                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left; width: 170px;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server" DataTextField="HomeName" DataValueField="Status">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="width: 170px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_MakeDate" runat="server" Font-Size="10pt" Width="188px"></asp:Label>
                                                                                </td>


                                                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShiJiFeiYong%>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="height: 28px; text-align: left" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Expense" runat="server" Enabled="False" Width="80px" OnBlur=""
                                                                                        OnFocus="" OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right; height: 2px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_Status" runat="server" Visible="False"></asp:Label>

                                                                                </td>
                                                                                <td colspan="5" style="text-align: left; height: 2px;" class="formItemBgStyle">&nbsp;
                                                                                        <table>
                                                                                           <tr>
                                                                                               <td>
                                                                                                   <asp:Button ID="BT_Update" runat="server" Enabled="False" OnClick="BT_Update_Click"
                                                                                                       CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />
                                                                                  
                                                                                                   &nbsp; &nbsp;
                                                                                                </td>
                                                                                               <td style="padding-left: 20px;">
                                                                                                   <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" Enabled="False" OnClick="BT_Close_Click" />
                                                                                                   &nbsp;
                                                                                      <asp:Button ID="BT_Active" runat="server" CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" Enabled="False" OnClick="BT_Active_Click" />
                                                                                                   &nbsp;
                                                                                                      <asp:Button ID="BT_Delete" runat="server" Enabled="False" ToolTip="<%$ Resources:lang,shanchu%>" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                       CssClass="inpuDelete" />
                                                                                               </td>
                                                                                </td>
                                                                                <td style="padding-left: 20px;">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                                                    <asp:HyperLink ID="HL_TestCase" runat="server" Enabled="False" NavigateUrl="TTMakeTaskTestCase.aspx"
                                                                                       Target="_blank">
                                                                                       <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CeShiYongLi%>"></asp:Label>
                                                                                   </asp:HyperLink>
                                                                                    &nbsp;&nbsp;
                                                                                     <asp:HyperLink ID="HL_TaskRelatedDoc" runat="server" Enabled="False" NavigateUrl="TTProTaskRelatedDoc.aspx"
                                                                                        Target="_blank">
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                    &nbsp;
                                                                  
                                                                                     <asp:HyperLink ID="HL_RunTaskByWF" runat="server" Enabled="False" Visible="false" Target="_blank">---&gt;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,RenWuChuLiLiuChengMoShi%>"></asp:Label></asp:HyperLink>
                                                                                    <asp:HyperLink ID="HL_TaskReview" runat="server" Enabled="False" Visible="false" Target="_blank">---&gt;<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,RenWuPingShen%>"></asp:Label></asp:HyperLink>
                                                                                    <asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" NavigateUrl="TTProRelatedWFTemplate.aspx" Visible="false"
                                                                                        Target="_blank" Enabled="False">
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                    <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Visible="false"
                                                                                        Target="_blank" Enabled="False">
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                    <asp:HyperLink ID="HL_ActorGroup" runat="server" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                                                                        Target="_blank" Enabled="False" Visible="false">
                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                                                    </asp:HyperLink>

                                                                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_TaskID" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        </td>
                                                                            </tr>
                                                                        </table>

                                                                    </ContentTemplate>
                                                                </cc1:TabPanel>

                                                                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="继续分派">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,jixufenpai%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>

                                                                        <table class="formBgStyle" style="width: 80%" cellpadding="3" cellspacing="0">
                                                                            <tr>
                                                                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FPXMRWGXMZCY %>"></asp:Label>：</strong>
                                                                                 </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right; width: 100px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShouLiRen %>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left; width: 20%;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_OperatorCode" runat="server" DataTextField="UserName" DataValueField="UserCode"
                                                                                        Width="119px">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="text-align: right; width: 15%;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,LeiXingShi %>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left;" colspan="2" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_RecordType" runat="server" DataTextField="Type" DataValueField="Type">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu %>"></asp:Label>：
                                                                                 </td>
                                                                                <td align="left" colspan="4" class="formItemBgStyle">
                                                                                    <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Height="150px" Width="99%" Visible="False" />
                                                                                    <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="99%" Height="150px" Visible="False" />
                                                                                    <asp:DropDownList ID="DL_WorkRequest" runat="server" AutoPostBack="True" DataTextField="Operation"
                                                                                        DataValueField="Operation" OnSelectedIndexChanged="DL_WorkRequest_SelectedIndexChanged"
                                                                                        Width="140px">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">

                                                                                    <asp:TextBox ID="DLC_TaskBegin" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3"
                                                                                        runat="server" TargetControlID="DLC_TaskBegin" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>

                                                                                </td>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label>：
                                                                                 </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle" colspan="2">

                                                                                    <asp:TextBox ID="DLC_TaskEnd" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                                                        runat="server" TargetControlID="DLC_TaskEnd" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>


                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle"></td>
                                                                                <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                                                                        Text="<%$ Resources:lang,BaoCun %>" />
                                                                                    &nbsp;<asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu" Enabled="False" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                        OnClick="BT_DeleteAssign_Click" Text="<%$ Resources:lang,ShanChu %>" />
                                                                                    &nbsp;<asp:Button ID="BT_Assign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Assign_Click"
                                                                                        Text="<%$ Resources:lang,FenPai %>" />
                                                                                </td>
                                                                                <td style="text-align: center" class="formItemBgStyle"></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="height: 19px; text-align: right" class="formItemBgStyle"></td>
                                                                                <td colspan="4" style="height: 19px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" />
                                                                                    <asp:CheckBox ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt"
                                                                                        Text="<%$ Resources:lang,FaYouJian %>" />
                                                                                    <span style="font-size: 10pt">
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen %>"></asp:Label><asp:TextBox ID="TB_Message" runat="server" Width="383px"></asp:TextBox>
                                                                                        <asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>" />
                                                                                    </span>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="5" style="height: 19px; text-align: left;" class="formItemBgStyle">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                                        <asp:Label ID="LB_TaskName" runat="server" Visible="False"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                </td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,RenWuHao %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FenPaiRen %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShouLiRen %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShouLiRenDeGongZuo %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="12%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
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
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                            ShowHeader="False" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                                                            Width="98%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
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
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
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
                                                                                <asp:ButtonColumn ButtonType="PushButton" CommandName="Select" Text="选择">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                </asp:ButtonColumn>
                                                                            </Columns>
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                        </asp:DataGrid>

                                                                    </ContentTemplate>
                                                                </cc1:TabPanel>
                                                            </cc1:TabContainer>
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

