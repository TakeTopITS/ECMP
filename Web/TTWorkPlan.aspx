<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlan.aspx.cs" Inherits="TTWorkPlan" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>ÏîÄ¿¹¤×÷¼Æ»®</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #AboveDiv {
            min-width: 950px;
            width: expression (document.body.clientWidth <= 950? "950px" : "auto" ));
        }
    </style>

    <script type="text/javascript">
        var preFrameW = '950,*';
        var FrameHide = 0;

        var i = 950;
        var j = 50;

        var decreaseTimer;
        var creaseTimer;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").cols;

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").cols;

                if (preFrameW != '50,*') {

                    //window.parent.document.getElementById("bodyFrame").cols = '150,*';

                    decreaseTimer = setInterval(decreaseLeftWidth, 1);
                    i = 950;

                    FrameHide = 0;
                    return;
                }
                else {

                    creaseTimer = setInterval(creaseLeftWidth, 1);
                    j = 50;
                    FrameHide = 0;

                    return;
                }
            } else {

                creaseTimer = setInterval(creaseLeftWidth, 1);
                j = 50;

                FrameHide = 1;
                return;
            }

        }

        function decreaseLeftWidth() {
            i = i - 50;
            if (i >= 50) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {

            j = j + 50;
            if (j <= 950) {

                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";

                if (j == 950) {

                    var varProjectID = getUrlParam("ProjectID");
                    window.document.location = "TTWorkPlan.aspx?ProjectID=" + varProjectID;

                }
            }

        }

        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);
            return null;
        }
    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = PlanTreeDivID.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            PlanTreeDivID.scrollTop = disPostion;
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function displayIMWaiting() {
            this.document.getElementById("IMG_Waiting").style.display = "block";
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td align="left" height="31" class="page_topbj" style="padding-top: 1px;">
                                <table width="950" border="0" align="left" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="29" style="padding-left: 10px; padding-top: 5px; vertical-align: middle;" rowspan="2">
                                            <a href="javascript:ChangeMenu(0)">
                                                <img src="Images/LeftRightArrow.png" width="18" height="24" border="0">
                                            </a>
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                        <td style="padding-top: 5px;" width="2px" align="right">(
                                        </td>
                                        <td align="center" style="padding-top: 5px;" background="ImagesSkin/main_top_bj.jpg">
                                            <asp:Label ID="LB_AddNewVersion" runat="server" Text="<%$ Resources:lang,AddNewVersion%>"></asp:Label>
                                            <asp:Label ID="LB_VersionID" runat="server" Text="<%$ Resources:lang,VersionID%>"></asp:Label>:
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_NewVerID" runat="server" MinAmount="1" Precision="0" Width="30px"
                                                Amount="1">
                                                                 1
                                            </NickLee:NumberBox>
                                        </td>
                                        <td style="padding-top: 5px;">&nbsp;<asp:Label ID="LB_Type" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:DropDownList ID="DL_VersionType" runat="server">
                                                <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                            </asp:DropDownList>
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:Button ID="BT_NewVersion" runat="server" CssClass="inpu" OnClick="BT_NewVersion_Click" Text="<%$ Resources:lang,New%>" />
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:Button ID="BT_DeleteVersion" runat="server" CssClass="inpu" OnClick="BT_DeleteVersion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                Text="<%$ Resources:lang,Delete%>" />
                                        </td>
                                        <td style="padding-top: 5px;">(<asp:Label ID="LB_CopyVersion" runat="server" Text="<%$ Resources:lang,CopyVersion%>" />
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:Label ID="LB_From" runat="server" Text="<%$ Resources:lang,From%>" />
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:DropDownList ID="DL_OldVersionID" runat="server" DataTextField="VerID" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:Label ID="LB_To" runat="server" Text="<%$ Resources:lang,To%>" />
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:DropDownList ID="DL_NewVersionID" runat="server" DataTextField="VerID" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SynchronizingFiles%>" />
                                        </td>
                                        <td style="padding-top: 5px;">
                                            <asp:DropDownList ID="DL_PlanDocCopy" runat="server">
                                                <asp:ListItem Text="<%$ Resources:lang,Shi%>" Value="是" />
                                                <asp:ListItem Text="<%$ Resources:lang,Fou%>" Value="否" />
                                            </asp:DropDownList>
                                        </td>
                                        <td style="padding-top: 6px;">
                                            <asp:Button ID="BT_CopyVersion" runat="server" CssClass="inpu" OnClick="BT_CopyVersion_Click" OnClientClick="return confirm(getCopyProjectPlanMsgByLangCode())"
                                                Text="<%$ Resources:lang,Copy%>" />
                                        </td>

                                        <td style="padding-top: 5px;" width="5">
                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="14" style="padding-left: 10px; padding-bottom: 5px; text-align: left;">
                                            <asp:HyperLink ID="HL_CopyFromOtherProjectPlan" runat="server" Target="_blank" Text="<%$ Resources:lang,hlCopyFromTemplate%>"></asp:HyperLink>
                                            &nbsp; &nbsp;
                                            <asp:HyperLink ID="HL_ProjectPlanReviewWL" runat="server" Target="_blank" Text="<%$ Resources:lang,hlReviewProjectPlan%>"></asp:HyperLink>
                                            &nbsp; &nbsp;
                                            <asp:HyperLink ID="HL_ProPlanGanttNew" runat="server" Target="_blank" Text="<%$ Resources:lang,hlGanttChart%>"></asp:HyperLink>
                                            <br>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td valign="top" style="width: 400px; padding: 5px 5px 0px 5px; text-align: left; border-right: solid 1px #D8D8D8">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_SelectVersion" runat="server" Text="<%$ Resources:lang,BanBen%>" />
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_VersionID" runat="server" DataTextField="VerID" DataValueField="ID"
                                                                        OnSelectedIndexChanged="DL_Version_SelectedIndexChanged" Height="21px"
                                                                        AutoPostBack="True">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbType" runat="server" Text="<%$ Resources:lang,Type%>" />:</td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ChangeVersionType" runat="server" OnSelectedIndexChanged="DL_ChangeVersionType_SelectedIndexChanged"
                                                                        Width="50px" Height="21px" AutoPostBack="True">
                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>"> </asp:ListItem>
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>"> </asp:ListItem>
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,jiZhun%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ExpandType" runat="server" Height="21px" AutoPostBack="True"
                                                                        OnSelectedIndexChanged="DL_ExpandType_SelectedIndexChanged">
                                                                        <asp:ListItem Value="展开所有" Text="<%$ Resources:lang,ZhanKaiSuoYou%>" />
                                                                        <asp:ListItem Value="展开参与" Text="<%$ Resources:lang,ZhanKaiCanYu%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_StartUp" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QiDong%>" OnClick="BT_StartUp_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <hr />
                                                        <div id="PlanTreeDivID" style="width: 300px; height: 600px; overflow: auto; vertical-align: top;">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Font-Bold="False" Font-Names="ËÎÌå" Style="width: 300px; height: 100%;">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </div>
                                                        <hr />
                                                        <span style="font-size: x-small; text-align: center;">
                                                            <asp:Label ID="LB_Red" runat="server" Text="<%$ Resources:lang,Red%>" />:
                                                                        <asp:Label ID="LB_Delay" runat="server" Text="<%$ Resources:lang,Delay%>" />,
                                                                        <asp:Label ID="LB_Bold" runat="server" Text="<%$ Resources:lang,Bold%>" />:
                                                                        <asp:Label ID="LB_Involved" runat="server" Text="<%$ Resources:lang,Involved%>" />,
                                                                        <asp:Label ID="LB_Black" runat="server" Text="<%$ Resources:lang,Black%>" />:
                                                                        <asp:Label ID="LB_Normal" runat="server" Text="<%$ Resources:lang,Normal%>" />
                                                        </span>
                                                        <hr />
                                                    </td>
                                                </tr>
                                                <tr id="TR_UploadProjectPlan" runat="server">
                                                    <td>
                                                        <table class="FullBorderTable" style="width: 100%">
                                                            <tr>
                                                                <td style="width: 100%; height: 21px; text-align: left;">
                                                                    <span><strong>
                                                                        <asp:Label ID="LB_Import" runat="server" Text="<%$ Resources:lang,Import%>" />:MS
                                                                                     Project<asp:Label ID="LB_PlanFile" runat="server" Text="<%$ Resources:lang,PlanFile%>" />:</strong>
                                                                    </span>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; height: 25px; text-align: left;">
                                                                    <asp:Label ID="LB_DocType" runat="server" Text="<%$ Resources:lang,Type%>" />:
                                                                               <asp:Label ID="LB_DocTypeID" runat="server"></asp:Label>
                                                                    <asp:TextBox ID="TB_DocType" runat="server" Width="65px"></asp:TextBox>
                                                                    <cc1:ModalPopupExtender ID="TB_DocType_ModalPopupExtender" runat="server"
                                                                        Enabled="True" TargetControlID="TB_DocType" PopupControlID="Panel3"
                                                                        CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                    </cc1:ModalPopupExtender>
                                                                    <asp:Label ID="LB_Authority" runat="server" Text="<%$ Resources:lang,Authority%>" />:<asp:DropDownList
                                                                        ID="DL_Visible" runat="server" CssClass="DDList" DataTextField="HomeName"
                                                                        DataValueField="GroupName">
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="LB_Author" runat="server" Text="<%$ Resources:lang,Author%>" Visible="false" /><asp:TextBox
                                                                        ID="TB_Author" runat="server" Visible="false"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2" style="width: 100%; text-align: left;">
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <div>
                                                                                <Upload:InputFile ID="AttachFile" runat="server" Style="height: 22px" Width="300px" />
                                                                                <br />
                                                                                <center>
                                                                                    <img id="IMG_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." style="text-align: center; display: none;" />
                                                                                    <asp:Button ID="BtnUP" runat="server" OnClientClick="javascript: displayIMWaiting();" OnClick="BtnUP_Click" Text="<%$ Resources:lang,Import%>" />
                                                                                </center>
                                                                                <br />
                                                                                <div id="ProgressBar">
                                                                                    <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                                    </Upload:ProgressBar>
                                                                                </div>
                                                                            </div>
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:PostBackTrigger ControlID="BtnUP" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; text-align: left;">
                                                                    <asp:Label ID="LB_ProjectFile" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 100%;" align="left" valign="top">
                                            <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td style="text-align: left; padding-right: 30px;" class="formItemBgStyle" colspan="4">

                                                        <asp:Repeater ID="Repeater1" runat="server">
                                                            <ItemTemplate>
                                                                <a href='<%# DataBinder.Eval(Container.DataItem,"ModulePage") %>' target="iframe">
                                                                    <strong></strong>--> <%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> </strong>&nbsp;
                                                                </a>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                        <br />
                                                        <div style="width: 90%; text-align: right;">
                                                            <asp:HyperLink ID="HL_DocumentForProjectPlanTemplate" runat="server" Text="<%$ Resources:lang,BCWDMB%>" Target="_blank" Visible="false"></asp:HyperLink>
                                                            &nbsp;
                                                            --><asp:HyperLink ID="HL_WorkSchedule" runat="server" Text="<%$ Resources:lang,JiaoFuJingDu%>"></asp:HyperLink>&nbsp;
                                                            --><asp:HyperLink ID="HL_MemberWorkload" Text="<%$ Resources:lang,GongZuoWuHu%>" runat="server" Target="_blank"></asp:HyperLink>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbPlanType" runat="server" Text="<%$ Resources:lang,Type%>" />:
                                                    </td>
                                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                        <table width="100%">
                                                            <tr>
                                                                <td style="text-align: left;">
                                                                    <asp:DropDownList ID="DL_PlanType" runat="server" CssClass="DDList">
                                                                        <asp:ListItem Value="计划" Text="<%$ Resources:lang,JiHua%>" />
                                                                        <asp:ListItem Value="里程碑" Text="<%$ Resources:lang,LiChengBei%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="width: 15%; text-align: right;">
                                                                    <asp:Label runat="server" ID="Label13" Text="<%$ Resources:lang,BuMen%>"></asp:Label></td>
                                                                <td style="text-align: left;">

                                                                    <asp:Label ID="LB_BelongDepartCode" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_BelongDepartName" runat="server"></asp:Label>

                                                                </td>
                                                                <td style="text-align: left;">
                                                                    <asp:Button ID="BT_BelongDepartment" runat="server" Text="<%$ Resources:lang,XuanZhe%>" />
                                                                    <cc1:ModalPopupExtender ID="BT_BelongDepartment_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseTree2" DynamicServicePath="" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_BelongDepartment" Y="150">
                                                                    </cc1:ModalPopupExtender>
                                                                </td>
                                                                <td style="text-align: right;">
                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,FuZeRen %>"></asp:Label></td>
                                                                <td style="text-align: left;">
                                                                    <asp:DropDownList ID="DL_LeaderCode" runat="server" DataTextField="UserName" DataValueField="UserCode" AutoPostBack="true" OnSelectedIndexChanged="DL_LeaderCode_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbPlanDetail" runat="server" Text="<%$ Resources:lang,PlanDetail%>" />
                                                    </td>
                                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_PlanDetail" runat="server" Width="90%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_BeginDate">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>" /></td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndDate">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BaseStartTime%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:TextBox ID="DLC_BaseBeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5" runat="server" TargetControlID="DLC_BaseBeginDate">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BaseEndTime%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:TextBox ID="DLC_BaseEndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender6" runat="server" TargetControlID="DLC_BaseEndDate">
                                                        </ajaxToolkit:CalendarExtender>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbBudget" runat="server" Text="<%$ Resources:lang,Budget%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="TB_PlanBudget" runat="server" Width="60px" MinAmount="0">
                                                                      0 0.00
                                                        </NickLee:NumberBox>

                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">&nbsp;<asp:Label ID="LB_tbBudget1" runat="server" Text="<%$ Resources:lang,GongShi2%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox ID="NB_PlanWorkhour" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="60px">
                                                                             0 0.00
                                                        </NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label8" runat="server" Text="交付进度" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">

                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_RequireNumber" runat="server" Width="79px" MinAmount="0">
                                                                      0 0.00
                                                        </NickLee:NumberBox>
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,DanJia%>" />
                                                        <NickLee:NumberBox ID="NB_Price" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" Precision="2" Width="60px">
                                                                     0 0.00
                                                        </NickLee:NumberBox>

                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WanChengShuLiang%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox ID="NB_FinishedNumber" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" Precision="2" Width="60px">
                                                                     0 0.00
                                                        </NickLee:NumberBox>

                                                        <%--  <asp:Label ID="Label12" runat="server" Text="µ¥Î»" />£º--%>
                                                        <asp:DropDownList ID="DL_UnitName" runat="server" DataTextField="UnitName" DataValueField="UnitName" CssClass="DDList">
                                                        </asp:DropDownList>

                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox ID="NB_Percent_Done" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="60px" Precision="0">
                                                                             0 0.00
                                                                    0</NickLee:NumberBox>
                                                        %
                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">

                                                        <asp:Label ID="LB_SortNumber" runat="server" Text="<%$ Resources:lang,ShunXuHao%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">


                                                        <NickLee:NumberBox ID="NB_SortNumber" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="40px">
                                                                             0 0.00
                                                                    01</NickLee:NumberBox>

                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QianBuZhou%>" Visible="false"></asp:Label>

                                                        <NickLee:NumberBox ID="NB_PriorID" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="50px" Visible="false">
                                                                          0
                                                        </NickLee:NumberBox>
                                                        &nbsp;&nbsp;
                                                        
                                                        <asp:Label ID="LB_DurationUnit" runat="server" Visible="false"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhanXiangMuZhengTiJingDuYuGu%>"></asp:Label>
                                                    </td>
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <NickLee:NumberBox ID="NB_DefaultSchedule" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                                             0 0.00
                                                        </NickLee:NumberBox>
                                                        % </td>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhanXiangMuZhenTiChengBenYuGu%>"></asp:Label>
                                                    </td>
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <NickLee:NumberBox ID="NB_DefaultCost" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                                      0 0.00
                                                        </NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbResource" runat="server" Text="<%$ Resources:lang,BeiZhu%>" />
                                                    </td>
                                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_Remark" runat="server" Width="90%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status%>" />
                                                    </td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_Status" runat="server" CssClass="DDList" DataTextField="HomeName"
                                                            DataValueField="Status" class="formItemBgStyle">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_tbLockStatus" runat="server" Text="<%$ Resources:lang,LockStatus%>" /></td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_LockStatus" runat="server" Enabled="false" AutoPostBack="true"
                                                            OnSelectedIndexChanged="DL_LockStatus_SelectedIndexChanged">
                                                            <asp:ListItem>No</asp:ListItem>
                                                            <asp:ListItem>Yes</asp:ListItem>
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: left;" class="formItemBgStyle">&nbsp;
                                                    </td>
                                                    <td colspan="3" style="text-align: left; padding-top: 20px;" class="formItemBgStyle">
                                                        <asp:Button ID="BT_New" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_New_Click" Text="<%$ Resources:lang,AddChildPlan%>" />

                                                        &nbsp; &nbsp; &nbsp; &nbsp; 
                                                        <asp:Button ID="BT_Update" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Update_Click"
                                                            Text="<%$ Resources:lang,BaoCun%>" />
                                                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="BT_Delete" runat="server" Enabled="False" OnClick="BT_Delete_Click"
                                                            CssClass="inpu" Text="<%$ Resources:lang,Delete%>" OnClientClick="return confirm(getDeleteMsgByLangCode())" />

                                                    </td>
                                                </tr>

                                                <tr>
                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="LB_NoticePlanMember" runat="server" Text="<%$ Resources:lang,NoticePlanMember%>" />:
                                                    </td>
                                                    <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                        <asp:CheckBox ID="CB_SendMsg" runat="server" Text="<%$ Resources:lang,SendSMS%>" />
                                                        <asp:CheckBox ID="CB_SendMail" runat="server" Text="<%$ Resources:lang,SendEMail%>" />
                                                        &nbsp;
                                                        <asp:TextBox ID="TB_Message" runat="server" Width="30%"></asp:TextBox>
                                                        <asp:Button ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,Send%>" CssClass="inpu" />
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td colspan="4" style="text-align: left" class="formItemBgStyle">
                                                        <asp:HyperLink ID="HL_ProPlanRelatedDocByPush" runat="server" Enabled="False" NavigateUrl="TTProPlanRelatedDoc_YYUP.aspx" Visible="false"
                                                            Target="_blank" Text="<%$ Resources:lang,ShiShiWenDangTuiSong%>"></asp:HyperLink>
                                                        &nbsp;
                                                         <asp:HyperLink ID="HL_RunProjectPlanByWF" runat="server" Enabled="False" Target="_blank" Visible="false"
                                                             Text="<%$ Resources:lang,hlRunProjectPlanByWF%>">£©</asp:HyperLink>
                                                        &nbsp;
                                                          <asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Target="_blank" Visible="false"
                                                              Enabled="false" Text="<%$ Resources:lang,RelatedWFTemplate%>"></asp:HyperLink>
                                                        &nbsp;
                                                          <asp:HyperLink ID="HL_WLTem" runat="server" Enabled="False" Target="_blank" Text="<%$ Resources:lang,WFTemplate%>" Visible="false">---&gt;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongZuoLiuMoBanWeiHu%>"></asp:Label></asp:HyperLink>

                                                        <asp:Label ID="LB_PlanID" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="LB_PlanDetail" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="LB_BackupID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_ParentID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_SelectID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_MakeTime" runat="server"></asp:Label>
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
                <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                    <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                        <table>
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
                    <div class="modalPopup-text" style="width: 420px; height: 400px; overflow: auto;">
                        <table>
                            <tr>
                                <td style="width: 360px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                    <asp:ImageButton ID="IMBT_CloseTree2" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                </td>
                            </tr>
                        </table>
                    </div>
                </asp:Panel>

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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
