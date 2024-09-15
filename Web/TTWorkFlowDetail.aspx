<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowDetail.aspx.cs"
    Inherits="TTWorkFlowDetail" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <style type="text/css">
        #AboveDiv {
            min-width: 850px;
            width: expression (document.body.clientWidth <= 850? "850px" : "auto" ));
        }
    </style>

    <script type="text/javascript">
        var preFrameW = '850,*';
        var FrameHide = 0;

        var decreaseTimer;
        var creaseTimer;

        var way;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").rows;

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").rows;

                if (preFrameW != '175,*') {

                    window.parent.document.getElementById("bodyFrame").rows = '175,*';

                    FrameHide = 1;
                    return;
                }
                else {

                    window.parent.document.getElementById("bodyFrame").rows = '*,175';

                    FrameHide = 1;
                    return;
                }
            } else {

                window.parent.document.getElementById("bodyFrame").rows = preFrameW;

                FrameHide = 0;
                return;
            }
        }

        var i = 850;
        var j = 150;

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 150) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 850) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }
        }
    </script>

    <script type="text/javascript" language="javascript">

        function SaveDIYFormData(operation) {

            if (operation == "Agree") {

                try {
                    if (BeforeAgree()) {

                        setTimeout("this.document.getElementById('BT_AgreeWF').click();", 1000);
                    }
                }
                catch (e) {
                    /*  alert(e.toString());*/
                    setTimeout("this.document.getElementById('BT_AgreeWF').click();", 1000);
                }
            }

            if (operation == "BackPirorStep") {

                try {
                    if (BeforeBackPirorStep()) {

                        setTimeout("this.document.getElementById('BT_BackPirorStepWF').click();", 1000);
                    }
                }
                catch (e) {
                    /* alert(e.toString());*/
                    setTimeout("this.document.getElementById('BT_BackPirorStepWF').click();", 1000);
                }
            }

            if (operation == "Refuse") {

                try {
                    if (BeforeRefuseAgree()) {

                        setTimeout("this.document.getElementById('BT_RefuseWF').click();", 1000);
                    }
                }
                catch (e) {
                    /*alert(e.toString());*/
                    setTimeout("this.document.getElementById('BT_RefuseWF').click();", 1000);
                }
            }

            if (operation == "Cancel") {

                try {
                    if (BeforeCancelAgree()) {

                        setTimeout("this.document.getElementById('BT_CancelWF').click();", 1000);
                    }
                }
                catch (e) {
                    /* alert(e.toString());*/
                    setTimeout("this.document.getElementById('BT_CancelWF').click();", 1000);
                }
            }

            if (operation == "Checking") {

                setTimeout("this.document.getElementById('BT_CheckingWF').click();", 1000);
            }

            if (operation == "Signing") {
                setTimeout("this.document.getElementById('BT_SigningWF').click();", 1000);
            }

            if (operation == "Review") {
                setTimeout("this.document.getElementById('BT_ReviewWF').click();", 1000);
            }

            if (parent.frames['right'].document.getElementById('BT_BackupSaveXMLFile') != undefined) {
                parent.frames['right'].document.getElementById('BT_BackupSaveXMLFile').click();
            }
        }


        //同步审批意见到表单的审批意见栏
        function reviewCommentTextChange() {

            setFormCommentControlValue(this.document.getElementById("TB_Content").value);

        }

    </script>


    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        //显示意见栏
        function setTBContendVisible() {

            //alert(this.document.getElementById("divContent").style.display);
            if (this.document.getElementById("divContent").style.display === "none") {

                this.document.getElementById("divContent").style.display = 'block';
                this.document.getElementById("divScale").innerHTML = "—";
            }
            else {

                this.document.getElementById("divContent").style.display = 'none';
                this.document.getElementById("divScale").innerHTML = "+";
            }

        }

    </script>

    <asp:Literal ID="LIT_AttachUserWFStepJSCode" runat="server"></asp:Literal>
</head>
<body>

    <form id="form1" runat="server">

        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv" style="padding-left: 2px; border: 3px solid yellow;">
                    <table cellpadding="0" cellspacing="0" class="bian" width="100%">
                        <tr>
                            <td style="text-align: left; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                <table>
                                    <tr>
                                        <td style="width: 500px; text-align: left;" rowspan="2">
                                            <table width="100%">
                                                <tr>
                                                    <td style="width: 15%;">
                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ShenPiYiJian %>"></asp:Label>:
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <asp:RadioButtonList ID="RB_WorkflowOperation" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" OnSelectedIndexChanged="RB_WorkflowOperation_SelectedIndexChanged">
                                                            <asp:ListItem Text="<%$ Resources:lang,TongYi %>" Value="<%$ Resources:lang,TongYi %>"></asp:ListItem>
                                                            <asp:ListItem Text="<%$ Resources:lang,BuTongYi %>" Value="<%$ Resources:lang,BuTongYi %>"></asp:ListItem>
                                                        </asp:RadioButtonList>
                                                    </td>
                                                    <td id="divScale" style="text-align: right; font-size: x-large;" onclick="javascript:setTBContendVisible();">
                                                        <%--   + --%>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="3">
                                                        <%--      <div id="divContent" style="width: 100%; text-align: right; display: none;">--%>
                                                        <asp:TextBox ID="TB_Content" onchange="reviewCommentTextChange()" TextMode="MultiLine" runat="server" Width="99%" Height="40"></asp:TextBox>
                                                        <%--  </div>--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>


                                        <td style="width: 60px; text-align: center; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <asp:HyperLink ID="HL_WLRelatedDoc" runat="server" Target="_blank" ToolTip="上传文档"><img src="ImagesSkin/UploadDoc.png" width= "24" height ="24" class="noBorder" />
                                            </asp:HyperLink>
                                        </td>
                                        <td style="width: 60px; text-align: center; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <asp:HyperLink ID="HL_WFChartView" runat="server" Target="_blank" ToolTip="流程图">
                                                <img src="ImagesSkin/WorkFlow.png" width= "24" height ="24" class="noBorder" />
                                            </asp:HyperLink>
                                        </td>
                                        <td style="width: 100px; text-align: center;">
                                            <a href="javascript:ChangeMenu(0)">
                                                <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18px" Height="24px" border="0" alt="放大缩小" runat="server" ToolTip="放大缩小" /></a>
                                        </td>
                                        <td style="width: 60px; text-align: center;">
                                            <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Target="_blank">
                                                 <img src="ImagesSkin/ExpenseMgt.png" width= "24" height ="24" class="noBorder" />
                                            </asp:HyperLink>
                                        </td>
                                        <td style="width: 60px; text-align: center;">

                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,HaoFeiGongShi %>"></asp:Label>:
                                        </td>
                                        <td style="width: 60px; text-align: center;">

                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ManHour" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                PositiveColor="" Width="60px">0.00</NickLee:NumberBox>
                                        </td>

                                        <td style="text-align: left; padding-top: 1px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <asp:ImageButton ID="BT_SaveWFRelatedData" ImageUrl="Images/Save.gif"  Width="24" Height="24" runat="server" OnClick="BT_SaveWFRelatedData_Click" />
                                        </td>
                                        <td style="text-align: left; padding-left: 10px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <asp:HyperLink ID="HL_ApproveRecord" runat="server" NavigateUrl="TTWorkflowApproveRecord.aspx" Target="_blank" ToolTip="审批记录">
                                               <img src="ImagesSkin/ApproveRecord.png" width= "24" height ="24" class="noBorder" />
                                            </asp:HyperLink>
                                        </td>
                                        <td style="width: 60px; text-align: center;">
                                            <asp:ImageButton ID="BT_GetRelatedData" runat="server" ImageUrl="Images/Query.gif" OnClick="BT_GetRelatedData_Click" ToolTip="<%$ Resources:lang,ChaKanXiangGanShuJi %>" />
                                        </td>
                                        <td style="width: 80px; text-align: right;">
                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,QianMingRiQi %>"></asp:Label>
                                        </td>
                                        <td style="width: 100px; text-align: left;">
                                            <asp:TextBox ID="DLC_SignDate" Width="99%" runat="server"></asp:TextBox>
                                            <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_SignDate"></cc1:CalendarExtender>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" colspan="11">
                                            <asp:Panel ID="Panel_DIYStep" runat="server">
                                                <div style="padding-top: 10px;">
                                                    <table>
                                                        <tr>
                                                            <td align="right" style="padding-top: 2px;">
                                                                <asp:Label ID="LB_DIYStep" runat="server" Text="<%$ Resources:lang,FanHuiQianMianBuZhou %>"></asp:Label>
                                                            </td>
                                                            <td style="padding-left: 10px;">
                                                                <asp:DropDownList ID="DL_NextStep" runat="server" AutoPostBack="True" DataTextField="StepValue"
                                                                    DataValueField="SortNumber" Height="25px" Width="300px">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left" style="padding-top: 3px;">
                                                                <asp:Button ID="BT_BackPirorStep" runat="server" CssClass="inpu" OnClientClick="SaveDIYFormData('BackPirorStep');"
                                                                    Text="<%$ Resources:lang,FanHui %>" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td style="width: 60%; padding-top: 10px; padding-left: 10px;">
                                            <asp:Button ID="BT_Refuse" runat="server" Height="30px" CssClass="inpu" OnClientClick="SaveDIYFormData('Refuse');" Text="<%$ Resources:lang,BoHui %>" />
                                            &#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;
                                            <asp:Button ID="BT_AddApprover" runat="server" Text="<%$ Resources:lang,JiaJian %>" Height="30px" CssClass="inpu" OnClientClick="window.parent.document.getElementById('bodyFrame').rows = '175,*';" OnClick="BT_AddApprover_Click" />


                                            &#160;&#160;&#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;
                                            <asp:Button ID="BT_Agree" runat="server" CssClass="inpu" Height="30px" Style="border: 1px solid red" OnClientClick="SaveDIYFormData('Agree');" Text="<%$ Resources:lang,WanChengTongGuo %>" />


                                            &#160;&#160;&#160;&#160;  &#160;&#160;&#160;&#160; &#160;&#160;&#160;&#160;&#160;&#160;&#160;&#160;  &#160;&#160;&#160;&#160;
                                            <asp:Button ID="BT_Cancel" runat="server" CssClass="inpu" Height="30px" Enabled="False" OnClientClick="SaveDIYFormData('Cancel');" Text="<%$ Resources:lang,CheXiao %>" />
                                        </td>
                                        <td style="text-align: left; padding-top: 10px;">
                                            <asp:Repeater ID="RP_RelatedModule" runat="server">
                                                <ItemTemplate>
                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"PageName") %>&MainTableCanAdd=<%# DataBinder.Eval(Container.DataItem,"MainTableCanAdd").ToString().Trim() %>&DetailTableCanAdd=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanAdd").ToString().Trim() %>&MainTableCanEdit=<%# DataBinder.Eval(Container.DataItem,"MainTableCanEdit").ToString().Trim() %>&MainTableCanDelete=<%# DataBinder.Eval(Container.DataItem,"MainTableCanDelete").ToString().Trim() %>&DetailTableCanEdit=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanEdit").ToString().Trim() %>&&DetailTableCanDelete=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanDelete").ToString().Trim() %>&RelatedWorkFlowID=<%# DataBinder.Eval(Container.DataItem,"WorkflowID").ToString().Trim() %>&RelatedWorkflowStepID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepID") %>&RelatedWorkflowStepDetailID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepDetailID") %>' target="_blank"><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %> </a>
                                                    &nbsp;
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>
                        <tr>
                            <td class="formItemBgStyle" align="left">
                                <table>
                                    <tr>
                                        <td class="formItemBgStyle" style="text-align: left;">
                                            <asp:Panel ID="Panel_ChildWF" runat="server" Style="border: 1px solid red;" Visible="False">
                                                <div>
                                                    <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                                        <tr>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZiLiuCheng %>"></asp:Label></td>
                                                            <td class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_RelatedWFTemplate" runat="server" AutoPostBack="True" DataTextField="RelatedWFTemName" DataValueField="RelatedWFTemName" OnSelectedIndexChanged="DL_RelatedWFTemplate_SelectedIndexChanged"></asp:DropDownList></td>
                                                            <td class="formItemBgStyle">
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="LB_ChildWFRequisite" runat="server"></asp:Label></td>
                                                            <td class="formItemBgStyle">
                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,GuiShuBuXu %>"></asp:Label></td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="LB_BelongStepSortNumber" runat="server"></asp:Label></td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YaoQiuTongGuo %>"></asp:Label></td>
                                                            <td class="formItemBgStyle">
                                                                <asp:Label ID="LB_BelongIsPassed" runat="server"></asp:Label></td>
                                                            <td class="formItemBgStyle">
                                                                <asp:HyperLink ID="HL_ChildWF" runat="server" Target="_blank">
                                                                    <b><span style="color: red;">
                                                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,QiDong %>"></asp:Label>
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                            <asp:Panel ID="Panel_BelongChildWF" runat="server" Style="border: 2px solid red;" Visible="False">
                                                <div>
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhunJieGuiShuChiBuDeGongZuoLiu %>"></asp:Label><table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td width="7">
                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="8%"><strong>
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                        <td align="center" width="30%"><strong>
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GongZuo %>"></asp:Label></strong></td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                        <td align="center" width="12%"><strong>
                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ChuangJianZhe %>"></asp:Label></strong></td>
                                                                        <td align="center" width="12%"><strong>
                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,QiDongBuXu %>"></asp:Label></strong></td>
                                                                        <td align="center" width="16%"><strong>
                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BiXuTongGuo %>"></asp:Label></strong></td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZhuagTai %>"></asp:Label></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                        <Columns>
                                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMain.aspx?WLID={0}" DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:HyperLinkColumn>
                                                            <asp:BoundColumn DataField="BelongStepSortNumber" HeaderText="启动步序">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="BelongIsMustPassed" HeaderText="必须">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <PagerStyle HorizontalAlign="Center" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 15px; text-align: left;">
                                            <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,FaXinXi %>" Checked="True" /><asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian %>" Checked="True" /><span style="font-size: 10pt"><asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TongZhiShenQingRen %>"></asp:Label><asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,Huo %>"></asp:Label><asp:HyperLink ID="HL_BusinessMember" runat="server" Target="_blank" Text="<%$ Resources:lang,QiTaChengYuan %>"></asp:HyperLink><asp:TextBox ID="TB_Message" runat="server" Width="380px"></asp:TextBox>&#160;&#160;<asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>" /></span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="height: 15px; text-align: left;">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng%>"></asp:Label>：
                                            <asp:DataList ID="DataList2" runat="server" Style="border: 1px solid yellow;" CellPadding="0" ForeColor="#333333"
                                                Width="900px">
                                                <ItemTemplate>
                                                    <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle">
                                                                <%#DataBinder .Eval (Container .DataItem,"WLID") %>  <%#DataBinder .Eval (Container .DataItem,"WLName") %>
                                                            </td>
                                                            <td style="height: 15px; text-align: right;" class="formItemBgStyle">
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FaQiRen%>"></asp:Label>
                                                            </td>
                                                            <td style="height: 15px; text-align: left;" class="formItemBgStyle">
                                                                <%#DataBinder .Eval (Container .DataItem,"CreatorCode") %>
                                                                <%#DataBinder .Eval (Container .DataItem,"CreatorName") %>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MoBan%>"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem,"TemName") %>
                                                            </td>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label></td>
                                                            <td class="formItemBgStyle" colspan="7" style="text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem,"Description") %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="text-align: left;">
                                            <asp:Panel ID="Panel_NextStep" runat="server" Style="width: 110%; border: 2px solid red;" Visible="False">
                                                <div>
                                                    <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                                        <tr>
                                                            <td style="height: 1px; text-align: left; font-weight: 700;">
                                                                <table width="100%">
                                                                    <tr>
                                                                        <td width="60%" align="left">
                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XuanZheXiaYiBu %>">

                                                                            </asp:Label><asp:Label ID="LB_NextSortNumber" runat="server" Style="font-weight: 700"></asp:Label>
                                                                            &#160;
                                                                            <asp:Label ID="LB_NextStepID" runat="server" Style="font-weight: 700" Visible="False"></asp:Label>
                                                                            <asp:Label ID="LB_NextStepName" runat="server" Style="font-weight: 700"></asp:Label>
                                                                        </td>
                                                                        <td width="8%" align="right">
                                                                            <asp:Label ID="Label23" Text="<%$ Resources:lang,ChuLiRen%>" runat="server" Style="font-weight: 700"></asp:Label>：
                                                                        </td>
                                                                        <td width="15%" align="left">
                                                                            <asp:TextBox ID="TB_OperatorName" runat="server" Width="99%"></asp:TextBox>
                                                                        </td>
                                                                        <td width="13%" align="center">
                                                                            <asp:Button ID="BT_FindOperator" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindOperator_Click" />
                                                                        </td>
                                                                        <td align="center">
                                                                            <asp:Button ID="BT_SaveOperatorSelect" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_SaveOperatorSelect_Click" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: left; height: 1px;">
                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ChuLiRen %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShiJian %>"></asp:Label><span style="font-size: xx-small;"><asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,FengZhong %>"></asp:Label></span></strong></td>
                                                                                    <td align="center" width="6%"><strong>
                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="16%"><strong>
                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZuiHouShenHeShiJian %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                    <td align="center" width="10%">
                                                                                        <asp:CheckBox ID="CB_AllOperator" runat="server" AutoPostBack="True" Text="<%$ Resources:lang,ShiShenPiZhe %>" OnCheckedChanged="CB_AllOperator_CheckedChanged" /><strong></strong></td>
                                                                                    <td align="center" width="10%">
                                                                                        <asp:CheckBox ID="CB_AllMust" runat="server" AutoPostBack="True" Text="<%$ Resources:lang,BiXu %>" OnCheckedChanged="CB_AllMust_CheckedChanged" /><strong></strong></td>
                                                                                    <td align="center" width="10%">&nbsp;
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="7">
                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCreated="DataGrid5_ItemCreated" OnItemCommand="DataGrid5_ItemCommand" ShowHeader="False" Width="100%">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_ID" runat="server" CommandName="Select" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="OperatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="OperatorName" HeaderText="批核人" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="WorkDetail" HeaderText="要审核的工作">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="FinishedTime" HeaderText="时间(分钟)">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CheckingTime" HeaderText="最后审核时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="16%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="CB_IsOperator" runat="server" AutoPostBack="true" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:CheckBox ID="CB_IsMust" runat="server" AutoPostBack="true" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:Button ID="BT_AddApprover" CommandName="AddApprover" CssClass="inpu" Width="40px" runat="server" Text="+" />
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <PagerStyle HorizontalAlign="Center" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                </asp:DataGrid></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left; height: 18px; background-color: buttonface;">
                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BuZouXuHao %>"></asp:Label><asp:Label ID="LB_OperatorID" runat="server" Style="font-weight: 700"></asp:Label>&#160;<asp:Label ID="LB_OperatorCode" runat="server" Style="font-weight: 700"></asp:Label>&#160;<asp:Label ID="LB_OperatorName" runat="server" Style="font-weight: 700"></asp:Label></td>
                                                        </tr>
                                                        <tr>
                                                            <td align="left"><span style="font-size: 10pt">
                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,TongZhiCaoZuoZhe %>"></asp:Label><asp:CheckBox ID="CB_SendMsg" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" /></span><asp:CheckBox ID="CB_SendMail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" /><asp:TextBox ID="TB_SendMsg" runat="server" Width="300px"></asp:TextBox><asp:Button ID="BT_SendMsg" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_SendMsg_Click" Text="<%$ Resources:lang,FaSong %>" /></td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </asp:Panel>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table style="width: 100%;">
                                    <tr>
                                        <td align="left">
                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="我的工作内容">
                                                    <HeaderTemplate>
                                                        <asp:Label runat="server" Text="<%$ Resources:lang,GongZuoNeiRong%>"></asp:Label>

                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; text-align: left;">
                                                            <tr>
                                                                <td style="text-align: left; height: 1px;">
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="6%"><strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="25%"><strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YaoChuLiDeGongZuo %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChenDanJueSe %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="12%"><strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShiJIanXiaoShi %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="6%"><strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="15%"><strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZuiHouShenHeShiJian %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center"><strong>
                                                                                            <asp:Label ID="Label52" runat="server" Text="StepID"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                        ShowHeader="False" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="WorkDetail" HeaderText="要审核的工作">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Actor" HeaderText="承担角色">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="FinishedTime" HeaderText="时间(小时)">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="CheckingTime" HeaderText="最后审核时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="StepId" HeaderText="步骤ID">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                        </Columns>

                                                                        <EditItemStyle BackColor="#2461BF" />

                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                        <ItemStyle CssClass="itemStyle" />

                                                                        <PagerStyle HorizontalAlign="Center" />

                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid>
                                                                </td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td>
                                                                    <table style="width: 100%; display: none;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                        <tr>
                                                                            <td align="right" width="80px" class="formItemBgStyle">
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingChen %>"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; width: 40%;" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_WLID" runat="server"></asp:Label>
                                                                                .<asp:Label ID="LB_WFName" runat="server" />
                                                                            </td>
                                                                            <td style="width: 80px; height: 15px; text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaQiRen %>"></asp:Label>
                                                                            </td>
                                                                            <td style="width: 20%; height: 15px; text-align: left;" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_CreatorCode" runat="server"></asp:Label>
                                                                                &#160;<asp:Label
                                                                                    ID="LB_CreatorName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td align="right" class="formItemBgStyle" width="80px">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                                <asp:Label ID="LB_Status" runat="server" Font-Bold="False" Font-Size="10pt" Font-Underline="False" ForeColor="#FF0033"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="formItemBgStyle" width="80px">
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MiaoShu %>"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left;">
                                                                                <asp:Label ID="LB_WLDescription" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <table style="width: 100%; display: none;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                        <tr>
                                                                            <td style="width: 10%; height: 15px; text-align: right;" class="formItemBgStyle">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="width: 20%; height: 15px; text-align: left"></td>
                                                                            <td style="width: 10%; height: 15px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LeiXin %>"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; width: 20%;" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_WLType" runat="server" Font-Size="10pt"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" align="right" width="80px">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShenQingMingChen %>"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: left; width: 40%;" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_WLName" runat="server" Enabled="False" Width="99%"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu %>"></asp:Label>
                                                                            </td>
                                                                            <td colspan="5" style="height: 24px; text-align: left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_WLDescription" runat="server"
                                                                                    Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MoBanMingChen %>"></asp:Label>
                                                                            </td>
                                                                            <td align="left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_TemName" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td style="text-align: right" class="formItemBgStyle"></td>
                                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_CreateTime" runat="server" Font-Size="10pt" Width="185px"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td valign="top" style="padding: 5px 5px 5px 5px; text-align: left;">
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ZiGongZuoLiuLieBiao %>"></asp:Label>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="35%"><strong>
                                                                                            <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="20%"><strong>
                                                                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td align="center" width="5%"><strong></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False"
                                                                        ShowHeader="False" Height="1px"
                                                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMain.aspx?WLID={0}"
                                                                                DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                                DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:HyperLinkColumn>
                                                                            <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:TemplateColumn>
                                                                                <ItemTemplate>
                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?RelatedType=WorkFlow&WLID={0}") %>'
                                                                                        Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>

                                                                                </ItemTemplate>

                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            </asp:TemplateColumn>
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
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="审批记录">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,ShenPiJiLu%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <div id="mess_box" style="width: 100%; height: 450px; overflow: auto;">
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td style="text-align: left; height: 1px;">
                                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="98%">
                                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                                            <ItemTemplate>
                                                                                <table style="width: 100%; table-layout: fixed;">
                                                                                    <tr>
                                                                                        <td align="left" style="color: Blue; font-style: italic; text-decoration: none;"><a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' target="_blank" style="text-decoration: none;"><%# DataBinder.Eval(Container.DataItem,"UserName") %></a></td>
                                                                                        <td><%# DataBinder.Eval(Container.DataItem,"ApproveTime") %></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                                                            <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataList></td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="关联步骤">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuanLianBuZhou%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; text-align: left;">
                                                            <tr>
                                                                <td style="text-align: left; height: 1px;">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                        width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="35%"><strong>
                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,BuZhouMingChen %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="15%"><strong>
                                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi %>"></asp:Label>（小时）</strong> </td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,BiBeiRenShu %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="20%"><strong>
                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,JiHuoSHiJian %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="6">
                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                        ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="StepName" HeaderText="步骤名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="LimitedOperator" HeaderText="必备人数">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ActiveTime" HeaderText="激活时间">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="background-color: buttonface; text-align: left; height: 12px;"><strong>
                                                                    <asp:Label ID="LB_StepID" runat="server" Font-Bold="False" Visible="False"></asp:Label></strong><asp:HyperLink ID="HL_StepApproveRecord" runat="server" Target="_blank">审批记录</asp:HyperLink></td>
                                                            </tr>
                                                        </table>
                                                        <br />
                                                        <table cellpadding="0" cellspacing="0" class="bian" width="97%">
                                                            <tr>
                                                                <td class="page_topbj" height="31">
                                                                    <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                                                        <tr>
                                                                            <td align="left">
                                                                                <table align="left" border="0" cellpadding="0" cellspacing="0" width="145">
                                                                                    <tr>
                                                                                        <td width="29"></td>
                                                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,MoBanBuZhouCanKao %>"></asp:Label></td>
                                                                                        <td width="5"></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdBottom">
                                                                    <table style="width: 100%">
                                                                        <tr>
                                                                            <td>
                                                                                <table style="width: 98%">
                                                                                    <tr>
                                                                                        <td style="text-align: left">
                                                                                            <asp:Label ID="LB_WorkFlow" runat="server" Font-Size="10pt"></asp:Label><asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BuZhouLieBiao %>"></asp:Label><asp:Label ID="LB_ProjectID" runat="server" Font-Size="10pt" Visible="False"></asp:Label><asp:Label ID="Label1" runat="server" Visible="False"></asp:Label><asp:Label ID="Label2" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_MakeUserCode" runat="server" Visible="False"></asp:Label></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td width="7">
                                                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                                    <td>
                                                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                            <tr>
                                                                                                                <td align="center" width="7%"><strong>
                                                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="32%"><strong>
                                                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,MingChen %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="10%"><strong>
                                                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,ZuiShaoRenShu %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="13%"><strong>
                                                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="7%"><strong>
                                                                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,TiaoJian %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="10%"><strong>
                                                                                                                    <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BuMenXiangGuan %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="10%"><strong>
                                                                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,XiaYiBu %>"></asp:Label></strong></td>
                                                                                                                <td align="center" width="10%"><strong>&#160;</strong> </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                    <td align="right" width="6">
                                                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="20" ShowHeader="False" Width="100%">
                                                                                                <Columns>
                                                                                                    <asp:BoundColumn DataField="StepID" HeaderText="ID" Visible="false">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:BoundColumn DataField="StepName" HeaderText="名称">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="32%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:BoundColumn DataField="limitedOperator" HeaderText="最少人数">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:HyperLinkColumn DataNavigateUrlField="StepID" DataNavigateUrlFormatString="TTWorkFlowStepConditionView.aspx?StepID={0}" Target="_blank" Text="条件">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                    </asp:HyperLinkColumn>
                                                                                                    <asp:BoundColumn DataField="DepartRelated" HeaderText="部门相关">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                    </asp:BoundColumn>
                                                                                                    <asp:TemplateColumn>
                                                                                                        <ItemTemplate>
                                                                                                            <asp:Button ID="BT_StepID" runat="server" CssClass="inpu" Text="<%$ Resources:lang,GengDuXinXi %>" OnClientClick="window.parent.document.getElementById('bodyFrame').rows = '175,*';" />
                                                                                                        </ItemTemplate>
                                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                    </asp:TemplateColumn>
                                                                                                </Columns>
                                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                                <ItemStyle CssClass="ite" />
                                                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                            </asp:DataGrid><asp:Label ID="LB_SqlWL" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_RelatedUserCode" runat="server" Visible="False"></asp:Label></td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="height: 20px; text-align: left"></td>
                                                                                    </tr>

                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                            </cc1:TabContainer>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td style="text-align: left;" colspan="3">
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_OperationID" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_ItemID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_FinishPercent" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_IsPlanMainWorkflow" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_TemStepID" runat="server" Visible="False"></asp:Label>

                                            &nbsp; &nbsp; &nbsp; &nbsp;
                                            <asp:HyperLink ID="HL_RelatedMeeting" runat="server" Target="_blank" Text="<%$ Resources:lang,hlMakeMeeting %>"></asp:HyperLink>
                                            &nbsp;<asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx" Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration %>"></asp:HyperLink>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <div style="width: 100%; text-align: left; overflow-x: auto; display: none;">
                        <table>
                            <tr>
                                <asp:Repeater ID="Repeater1" runat="server">
                                    <ItemTemplate>
                                        <td>
                                            <table>
                                                <tr>
                                                    <td align="center" style="padding: 5px 5px 5px 5px;">
                                                        <asp:ImageButton ID="IBT_WFStep" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SortNumber") %>' /></td>
                                                </tr>
                                                <tr>
                                                    <td align="center" style="padding: 5px 5px 5px 5px;">

                                                        <%# DataBinder.Eval(Container.DataItem,"SortNumber") %> . <%# DataBinder.Eval(Container.DataItem,"StepName").ToString().Trim() %>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tr>
                        </table>
                    </div>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                    style="z-index: 9999; width: 300px; height: 230px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                        <table width="300px" cellpadding="3" cellspacing="0" class="formBgStyle">
                            <tr>
                                <td class="formItemBgStyle" style="text-align: center;" width="40%">
                                    <asp:Button ID="BT_OK" runat="server" Text="OK" />
                                </td>
                                <td class="formItemBgStyle" style="width: 20%; text-align: left">&nbsp;
                                </td>
                                <td class="formItemBgStyle" style="width: 40%; text-align: left;">
                                    <asp:Button ID="BT_CloseCurrentPate" runat="server" Text="关闭当前页" OnClick="BT_CloseCurrentPate_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindowAddApprover" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 800px; height: 400px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td class="formItemBgStyle" colspan="3">
                                    <table width="100%">
                                        <tr>
                                            <td class="formItemBgStyle" style="width: 10%; padding: 5px 5px 5px 5px; text-align: right;">
                                                <asp:Label ID="Label5323" runat="server" Text="<%$ Resources:lang,WorkDetail %>"></asp:Label>
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:TextBox ID="TB_ApproverComment" runat="server" Width="100%"></asp:TextBox>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td width="240px" class="formItemBgStyle" align="left" valign="top">
                                    <div id="PlanTreeDivID" style="width: 230px; height: 300px; overflow: auto; vertical-align: top;">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </div>
                                </td>
                                <td width="200px" class="formItemBgStyle" align="center" valign="top">
                                    <asp:TextBox ID="TB_FindApproverName" runat="server" Width="80px"></asp:TextBox><asp:Button ID="BT_FindApprover" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindApprover_Click" />
                                    <table width="200px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="30%" align="center"><strong>
                                                            <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ShiFouBiXu %>"></asp:Label></strong> </td>
                                                        <td width="70%" align="center"><strong>
                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid8_ItemCommand"
                                        Width="200px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:CheckBox ID="CB_IsMust" runat="server" Checked="true" /></td>
                                                            <td>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" /></td>
                                                            <td>
                                                                <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                    CssClass="inpu" /></td>
                                                        </tr>
                                                    </table>
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
                                <td>
                                    <table width="300px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="75%" align="center"><strong>
                                                            <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,CaoZuoYuan %>"></asp:Label></strong> </td>
                                                        <td width="25%" align="center"><strong>
                                                            <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,ShiFouBiXu %>"></asp:Label></strong> </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid9_ItemCommand"
                                        Width="300px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                        <Columns>
                                            <asp:TemplateColumn>
                                                <ItemTemplate>
                                                    <table>
                                                        <tr>

                                                            <td>
                                                                <asp:Button ID="BT_OperatorCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>'
                                                                    CssClass="inpu" /></td>
                                                            <td>
                                                                <asp:Button ID="BT_peratorName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"OperatorName") %>'
                                                                    CssClass="inpu" /></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="Requisite" HeaderText="是否必须">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <EditItemStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle CssClass="itemStyle" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataGrid>

                                    <asp:Repeater ID="RP_AdditionApprover" runat="server" OnItemCommand="RP_AdditionApprover_ItemCommand">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_OperatorCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>' Width="70px" />
                                            <asp:Button ID="BT_OperatorName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"OperatorName") %>' Width="70px" />
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_AddApproverType" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_NextStepDetailID" runat="server" Visible="False"></asp:Label>


                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindowWFTStepDetail" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 700px; height: 330px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label88" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="text-align: left">
                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label>：<asp:Label ID="LB_SortNumber" runat="server"></asp:Label>&#160;
                                                                                            <asp:Label ID="LB_StepName" runat="server"></asp:Label><asp:Label ID="LB_WFTemStepID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,MingXi %>"></asp:Label>： </td>
                                <td style="width: 200px; text-align: left">
                                    <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label></td>
                            </tr>
                            <tr>
                                <td colspan="2" style="text-align: center;">
                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="7">
                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="center" width="25%"><strong>
                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,CanYuJueSeZhu %>"></asp:Label></strong></td>
                                                        <td align="center" width="25%"><strong>
                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,GongZuo %>"></asp:Label></strong></td>
                                                        <td align="center" width="20%"><strong>
                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,ChenDanJueSe %>"></asp:Label></strong></td>
                                                        <td align="center" width="15%"><strong>
                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,ShiFouBiXu %>"></asp:Label></strong></td>
                                                        <td align="center" width="15%"><strong>
                                                            <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi %>"></asp:Label></strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" width="6">
                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" Width="100%">
                                        <Columns>
                                            <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTActorGroupMemberView.aspx?IdentifyString={0}" DataTextField="ActorGroup" HeaderText="参与角色组" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="WorkDetail" HeaderText="工作">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Actor" HeaderText="承担角色">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Requisite" HeaderText="是否必需">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <EditItemStyle BackColor="#2461BF" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemStyle CssClass="itemStyle" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataGrid><asp:Label ID="LB_DetailID" runat="server" Visible="False"></asp:Label></td>
                            </tr>

                        </table>

                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>



                <%-- <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>--%>

                <div style="overflow: hidden; width: 1px; height: 1px;">

                    <asp:Button ID="BT_AgreeWF" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Agree_Click" Text="<%$ Resources:lang,PiZhunTongGuo %>" />
                    &#160;&#160;<asp:Button ID="BT_CheckingWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Checking_Click" Text="<%$ Resources:lang,ShenHeZhong %>" />
                    &nbsp;&nbsp;<asp:Button ID="BT_SigningWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Signing_Click" Text="<%$ Resources:lang,HuiQianZhong %>" />
                    &#160;&#160;<asp:Button ID="BT_RefuseWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Refuse_Click" Text="<%$ Resources:lang,BoHuiZhongZhi %>" />
                    &#160;&#160;<asp:Button ID="BT_ReviewWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Review_Click" Text="<%$ Resources:lang,FuHeZhong %>" />
                    &#160;&#160;<asp:Button ID="BT_CancelWF" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Cancel_Click" Text="<%$ Resources:lang,CheXiaoPiZhun %>" />

                    &#160;&#160;
                    <asp:Button ID="BT_Review" runat="server" Height="30px" CssClass="inpu" OnClientClick="SaveDIYFormData('Review');" Text="<%$ Resources:lang,FuHeZhong %>" />
                    <asp:Button ID="BT_Checking" runat="server" Height="30px" CssClass="inpu" OnClientClick="SaveDIYFormData('Checking');" Text="<%$ Resources:lang,ShenHeZhong %>" />
                    <asp:Button ID="BT_Signing" runat="server" Height="30px" CssClass="inpu" OnClientClick="SaveDIYFormData('Signing');" Text="<%$ Resources:lang,HuiQianZhong %>" />
                    <asp:Button ID="BT_BackPirorStepWF" runat="server" CssClass="inpu" Height="30px" OnClick="BT_BackPirorStep_Click" Text="<%$ Resources:lang,PiZhunFanHui %>" />

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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
