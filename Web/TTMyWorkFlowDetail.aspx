<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMyWorkFlowDetail.aspx.cs"
    Inherits="TTMyWorkFlowDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        #AboveDiv {
            min-width: 850px;
            width: expression (document.body.clientWidth <= 850? "850px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function SaveDIYFormData(operation) {

            if (parent.frames['rightFrame'].document.getElementById('BT_BackupSaveXMLFile') != undefined) {

                parent.frames['rightFrame'].document.getElementById('BT_BackupSaveXMLFile').click();
            }

            if (operation == "Active") {
                setTimeout("this.document.getElementById('BT_ActiveWF').click();", 1000);
            }

            if (operation == "Close") {
                setTimeout("this.document.getElementById('BT_CloseWF').click();", 1000);
            }

            if (operation == "Updating") {
                setTimeout("this.document.getElementById('BT_UpdatingWF').click();", 1000);
            }

            if (operation == "ReActive") {
                setTimeout("this.document.getElementById('BT_ReActiveWF').click();", 1000);
            }

        }


    </script>

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
</head>
<body onload="autoClickActiveButton();">

    <script type="text/javascript">


        //取得链接传入参数的值
        function getUrlParam(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);

            if (r != null)
                return unescape(r[2]);
            return null;
        }


        function autoClickActiveButton() {

            var autoActive = '<%= Session["AutoActiveWorkflow"].ToString() %>';
            if (autoActive == 'YES') {

                /*    alert(getUrlParam("RelatedType"));*/

                if (getUrlParam("RelatedType") == "Other") {

                    if (document.getElementById("BT_Active").disabled != "true")

                        document.getElementById("BT_Active").click();
                }
            }
        }
    </script>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv" style="padding-left: 2px; border: 3px solid yellow;">

                        <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                            <tr>
                                <td style="width: 100px; text-align: left; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WoDeChuLiFangFaHeYiJian%>"></asp:Label>
                                </td>

                                <td style="width: 500px; text-align: left; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">

                                    <asp:TextBox ID="TB_Content" TextMode="MultiLine" runat="server" Width="99%" Height="60px"></asp:TextBox>
                                </td>

                                <td style="width: 100px; text-align: center; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <asp:HyperLink ID="HL_WLRelatedDoc" runat="server" Target="_blank" ToolTip="文档上传"><img src="ImagesSkin/UploadDoc.png" width= "24" height ="24" class="noBorder" />
                                    </asp:HyperLink>
                                </td>
                                <td style="width: 100px; text-align: center; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <asp:HyperLink ID="HL_WFChartView" runat="server" Target="_blank" ToolTip="流程状态">
                                     <img src="ImagesSkin/WorkFlow.png" width= "24" height ="24" class="noBorder" />
                                    </asp:HyperLink>
                                </td>
                                <td style="width: 100px; text-align: center; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <a href="javascript:ChangeMenu(0)">
                                        <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18px" Height="24px" border="0" alt="隐藏右边栏" runat="server" ToolTip="放大缩小" /></a>
                                    <asp:Label ID="Label13" runat="server" Style="display: none;"></asp:Label>
                                </td>
                                <td style="text-align: left; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                    <asp:HyperLink ID="HL_ApproveRecord" runat="server" NavigateUrl="TTWorkflowApproveRecord.aspx" Target="_blank" ToolTip="审批记录">
                                         <img src="ImagesSkin/ApproveRecord.png" width= "24" height ="24" class="noBorder" />
                                    </asp:HyperLink>
                                </td>

                                <%--  <td onclick="openPopWindowByContent('divWFStep');" style="text-align: left; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">

                                         <img src="ImagesSkin/daibanshixiang.png" width= "24" height ="24" class="noBorder" />
                                </td>--%>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: left" class="formItemBgStyle">1.<asp:CheckBox ID="CB_DIYNextStep" runat="server" Checked="true" Text="<%$ Resources:lang,YunXuXuanZeQianZhiBuZhou%>" />

                                    <asp:CheckBox ID="CB_IsPlanMainWorkflow" runat="server" AutoPostBack="true" OnCheckedChanged="CB_IsPlanMainWorkflow_CheckedChanged" Text="<%$ Resources:lang,ShiFouJiHuaZhuLiuCheng%>" Visible="false" />

                                    2.<asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XuYaoTongZhiShenQingZhe%>"></asp:Label>
                                    ：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" Checked="true" />
                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian%>" Checked="true" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="5" style="text-align: left;" class="formItemBgStyle">
                                    <asp:Button ID="BT_Close" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('Close');" Text="<%$ Resources:lang,GuanBi%>" />
                                    &nbsp;
                                    <asp:Button ID="BT_Updating" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('Updating');" Text="<%$ Resources:lang,XiuGaiZhong%>" />
                                    &nbsp;
                                    <asp:Button ID="BT_ReActive" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('ReActive');" Text="<%$ Resources:lang,JinXingZhong%>" />
                                    &nbsp;&nbsp;
                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                    &nbsp;  &nbsp;  &nbsp;  &nbsp; 
                                      <asp:Button ID="BT_Active" runat="server" CssClass="inpu" Style="border: 1px solid red" Height="30px" OnClientClick="SaveDIYFormData('Active');" Text="<%$ Resources:lang,JiHuo%>" />

                                    &nbsp;  &nbsp; 
                                    <asp:Button ID="BT_Success" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Success_Click" Text="<%$ Resources:lang,ChengGongJieAn%>" />

                                    &nbsp;&nbsp;
                                     <asp:Button ID="BT_ConfirmEffectPlanProgress" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QueRenJinDu %>" OnClick="BT_ConfirmEffectPlanProgress_Click" />

                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Repeater ID="RP_RelatedModule" runat="server">
                                        <ItemTemplate>
                                            <a href='<%# DataBinder.Eval(Container.DataItem,"PageName") %>&MainTableCanAdd=<%# DataBinder.Eval(Container.DataItem,"MainTableCanAdd").ToString().Trim() %>&DetailTableCanAdd=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanAdd").ToString().Trim() %>&MainTableCanEdit=<%# DataBinder.Eval(Container.DataItem,"MainTableCanEdit").ToString().Trim() %>&MainTableCanDelete=<%# DataBinder.Eval(Container.DataItem,"MainTableCanDelete").ToString().Trim() %>&DetailTableCanEdit=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanEdit").ToString().Trim() %>&&DetailTableCanDelete=<%# DataBinder.Eval(Container.DataItem,"DetailTableCanDelete").ToString().Trim() %>&RelatedWorkFlowID=<%# DataBinder.Eval(Container.DataItem,"WorkflowID").ToString().Trim() %>&RelatedWorkflowStepID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepID") %>&RelatedWorkflowStepDetailID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepDetailID") %>' target="_blank"><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: left;" class="formItemBgStyle">
                                    <br />
                                    <asp:HyperLink ID="HL_StepApproveRecord" runat="server" Target="_blank" Text="<%$ Resources:lang,ShenPiJiLu%>">
                                    </asp:HyperLink>

                                    <asp:HyperLink ID="HL_XMLFile" runat="server" Target="_blank">---&gt;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChaKanShuJuWenJian%>"></asp:Label></asp:HyperLink>

                                    <asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx" Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration %>"></asp:HyperLink>

                                    <asp:HyperLink ID="HL_Expense" runat="server" NavigateUrl="TTProExpense.aspx" Target="_blank" Text="<%$ Resources:lang,FeiYongMingXi %>" Visible="False"></asp:HyperLink>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" align="left" class="formItemBgStyle">
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GongZuoLiuMingCheng%>"></asp:Label>：
                                    <br />
                                    <asp:DataList ID="DataList2" runat="server" Style="border: 1px solid yellow;" CellPadding="0" ForeColor="#333333"
                                        Width="900px">
                                        <ItemTemplate>
                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
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
                        </table>
                        <br />
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td>
                                    <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                        Width="100%">
                                        <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="步骤列表" TabIndex="0">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BuZhouLieBiao%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%; height: 12px; text-align: left"><strong></strong>(<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BKLBZTJDHCGZLHY %>"></asp:Label><asp:Label ID="LB_UNReviewNumber" runat="server" Style="text-decoration: underline"
                                                            Text="<%$ Resources:lang,Ling %>"></asp:Label>&#160;<asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BYSPNKYD %>"></asp:Label><asp:HyperLink ID="HL_WorkFlowStep" runat="server" Target="_blank">
                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BuZhouCanKao %>"></asp:Label>
                                                            </asp:HyperLink>&#160;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JinXingChaYue %>"></asp:Label>)&#160;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="width: 100%; height: 1px; text-align: left; border: 1px solid red;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="6%"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label></strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,MingBuZhouCheng %>"></asp:Label></strong></td>
                                                                                <td align="center" width="14%"><strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShiJian %>"></asp:Label><span style="font-size: xx-small;">（<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,FenZhong %>"></asp:Label>）</span></strong> </td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BiBeiRenShu %>"></asp:Label></strong></td>
                                                                                <td align="center" width="20%"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiHuoShiJian %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                <td align="center" width="10%"><strong></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                Width="100%" OnItemCommand="DataGrid2_ItemCommand" CellPadding="4" ForeColor="#333333"
                                                                ShowHeader="False" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="StepID" HeaderText="ID" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="StepName" HeaderText="步骤名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(分钟)">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LimitedOperator" HeaderText="必备人数">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ActiveTime" HeaderText="激活时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_StepID" runat="server" Text="<%$ Resources:lang,GengDuXinXi %>"
                                                                                CssClass="inpu" OnClientClick="window.parent.document.getElementById('bodyFrame').rows = '175,*';" />
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
                                                </table>
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                        <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText=" 关联项目" TabIndex="0">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>
                                            </HeaderTemplate>
                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td style="width: 200px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                            valign="top" align="left">
                                                            <asp:TreeView ID="TreeView1" runat="server" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px" NodeWrap="True">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                        <td valign="top" align="left">
                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>：<asp:TextBox ID="TB_ProjectID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddProjectID" runat="server" Text="关联" CssClass="inpu"
                                                                OnClick="BT_AddProjectID_Click" /><br />
                                                            <table width="99%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                <td width="25%" align="center"><strong>
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,LiXiangRiQi%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong>
                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong></td>
                                                                                <td width="10%" align="center"><strong></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                GridLines="None" OnItemCommand="DataGrid1_ItemCommand" Width="99%">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ProjectID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="立项日期">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="完成程度">
                                                                        <ItemTemplate>
                                                                            <asp:Label ID="LB_FinishPercent" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"FinishPercent")%> '></asp:Label>%
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_DeleteProject" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                    Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>
                                            </ContentTemplate>
                                        </cc2:TabPanel>
                                    </cc2:TabContainer>
                                </td>
                            </tr>
                            <tr style="display: none;">
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <a href="TTAppWorkFlow.aspx" target="_parent">
                                                    <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                        <tr>
                                                            <td width="29">
                                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                            </td>
                                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WoDeGongZuoLiuXinXi%>"></asp:Label>
                                                            </td>
                                                            <td width="5">
                                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </a>
                                            </td>
                                        </tr>
                                    </table>

                                    <table style="width: 100%; display: none;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                        <tr>
                                            <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                            </td>
                                            <td style="width: 70%; height: 25px; padding-right: 1px; text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_WLID" runat="server"></asp:Label>.<asp:Label ID="LB_WFName" runat="server"></asp:Label>
                                            </td>
                                            <td align="right" class="formItemBgStyle" width="80px">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                            <td class="formItemBgStyle" style="text-align: left;">
                                                <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="width: 80px; text-align: right">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：</td>
                                            <td colspan="3" class="formItemBgStyle" style="height: 25px; padding-right: 1px; text-align: left">
                                                <asp:Label ID="LB_WLDescription" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                    <table style="width: 100%; display: none;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                        <tr>
                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                            </td>
                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle"></td>
                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                            </td>
                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_WLType" runat="server"></asp:Label>
                                            </td>
                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                            </td>
                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_CreatorCode" runat="server"></asp:Label>

                                                <asp:Label ID="LB_CreatorName" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng%>"></asp:Label>：
                                            </td>
                                            <td colspan="5" style="height: 25px; padding-right: 1px; text-align: left" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_WLName" runat="server" Enabled="False" Width="100%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="height: 24px; text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu%>"></asp:Label>：
                                            </td>
                                            <td colspan="5" style="font-weight: bold; height: 24px; text-align: left" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_WLDescription" runat="server" Enabled="False" Font-Size="10pt"
                                                    Height="43px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MuBanMingCheng%>"></asp:Label>：
                                            </td>
                                            <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_TemName" runat="server" Width="203px"></asp:Label>
                                            </td>
                                            <td colspan="3" style="font-size: 10pt; text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_UserName" runat="server" Font-Italic="False" Font-Size="9pt"
                                                    Font-Underline="False" Visible="False" Width="3px"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                            </td>
                                            <td style="width: 100px; text-align: left;" class="formItemBgStyle"></td>
                                            <td style="text-align: right" class="formItemBgStyle">
                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JianLiShiJian%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                <asp:Label ID="LB_CreateTime" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <br />
                        <br />
                        <div id="divWFStep" style="width: 99%; text-align: left; overflow-x: auto; display: none;">
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
                            <div style="overflow: hidden; width: 1px; height: 1px;">

                                <asp:Button ID="BT_ActiveWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Active_Click" Text="<%$ Resources:lang,ShenHeZhong %>" />

                                <asp:Button ID="BT_CloseWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Close_Click" Text="<%$ Resources:lang,HuiQianZhong %>" />

                                &#160;&#160;<asp:Button ID="BT_UpdatingWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Updating_Click" Text="<%$ Resources:lang,BoHuiZhongZhi %>" />

                                &#160;&#160;<asp:Button ID="BT_ReActiveWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_ReActive_Click" Text="<%$ Resources:lang,FuHeZhong %>" />
                            </div>
                        </div>

                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowAddApprover" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 800px; height: 400px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label43" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
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
                                    <td width="240px" class="formItemBgStyle" valign="top" align="left">
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
                                    <td width="170px" class="formItemBgStyle" valign="top">
                                        <asp:TextBox ID="TB_FindApproverName" runat="server" Width="80px"></asp:TextBox>
                                        <asp:Button ID="BT_FindApprover" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindApprover_Click" />
                                        <table width="170px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="6%" align="center"><strong>
                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,BuMenRenYuan %>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid8_ItemCommand"
                                            Width="170px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="False">
                                            <Columns>
                                                <asp:TemplateColumn>
                                                    <ItemTemplate>
                                                        <table>
                                                            <tr>
                                                                <td>
                                                                    <asp:CheckBox ID="CB_IsMust" runat="server" Checked="false" /></td>
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
                        style="z-index: 9999; width: 820px; height: 430px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label45" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">

                                <tr>
                                    <td style="text-align: left">
                                        <table style="width: 100%;">
                                            <tr>
                                                <td width="40%" align="left"><strong>
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BuZhou %>"></asp:Label>：<asp:Label ID="LB_StepID" runat="server"></asp:Label>&#160;<asp:Label ID="LB_StepName" runat="server"></asp:Label><asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShenHeRenLieBiao %>"></asp:Label>：</strong> </td>
                                                <td width="10%" align="right"><strong>
                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label>：
                                                </td>
                                                <td width="10%" align="left"><strong>
                                                    <asp:TextBox ID="TB_WFOperatorName" runat="server" Width="99%"></asp:TextBox></strong> </td>
                                                <td width="15%" align="center"><strong>
                                                    <asp:Button ID="BT_FindWFOperator" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindWFOperator_Click" /></td>
                                                <td align="center">
                                                    <asp:Button ID="BT_SaveOperatorSelect" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun %>" OnClick="BT_SaveOperatorSelect_Click" /></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 1px; text-align: left;">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong></td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,PiHeRen %>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShiJian %>"></asp:Label><span style="font-size: xx-small;">（<asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FenZhong %>"></asp:Label>）</span></strong> </td>
                                                            <td align="center" width="6%"><strong>
                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>
                                                            <td align="center" width="16%"><strong>
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZuiHouShenHeShiJian %>"></asp:Label></strong></td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
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
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCreated="DataGrid4_ItemCreated" OnItemCommand="DataGrid4_ItemCommand" ShowHeader="False" Width="100%">
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
                                                        <asp:CheckBox ID="CB_IsOperator" runat="server" AutoPostBack="true"></asp:CheckBox>
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
                                    <td style="height: 18px; text-align: left">
                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BuZhouXuHao %>"></asp:Label>：<asp:Label ID="LB_ID" runat="server" Style="font-weight: 700"></asp:Label>&#160;<asp:Label ID="LB_OperatorCode" runat="server" Style="font-weight: 700"></asp:Label>&#160;<asp:Label ID="LB_OperatorName" runat="server" Style="font-weight: 700"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td align="left"><span style="font-size: 10pt">
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,BuZhouXuHao %>"></asp:Label><asp:CheckBox ID="CB_SendMsg" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" /></span><asp:CheckBox ID="CB_SendMail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" /><asp:TextBox ID="TB_Message" runat="server" Width="300px"></asp:TextBox><asp:Button ID="BT_Send" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>" /><br />
                                    </td>
                                </tr>
                                <tr>
                                    <td valign="top" style="padding: 5px 5px 5px 5px;" align="left">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZiGongZuoLiuLieBiao %>"></asp:Label><table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                            <td align="center" width="35%"><strong>
                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong></td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong></td>
                                                            <td align="center" width="20%"><strong>
                                                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong></td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
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
                                        </asp:DataGrid></td>
                                </tr>
                            </table>

                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <%--                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>--%>
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
