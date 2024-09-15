<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppMyWorkflowDetail.aspx.cs" Inherits="TTAppMyWorkflowDetail" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">

<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>


    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #DivID {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>


    <script type="text/javascript">

        var way;

        function ChangeMenu(way) {

            window.parent.document.getElementById("A_LRArrow").onclick();
        }

        function SaveDIYFormData(operation) {

            if (parent.frames['Left'].document.getElementById('BT_BackupSaveXMLFile') != undefined) {

                parent.frames['Left'].document.getElementById('BT_BackupSaveXMLFile').click();
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

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Literal ID="LIT_AttachUserJSCode" runat="server"></asp:Literal>
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td colspan="2" height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left" width="10%">
                                        <a id="a_return" runat="server" href="TTAppWorkFlow.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';" target="_top">

                                            <table  width="100px" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" />
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                    </td>
                                                    <td width="5">
                                                        <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </a>
                                    </td>
                                    <td style="width: 150px; text-align: right; padding-top: 4px;">
                                        <asp:HyperLink ID="HL_WLRelatedDoc" runat="server" Target="_blank" ToolTip="文档上传">
                                        <img src="ImagesSkin/UploadDoc.png" width= "24" height ="24" class="noBorder" />
                                        </asp:HyperLink>
                                    </td>
                                    <td align="right" onclick="javascript:ChangeMenu(0)" style="width: 50px; padding-top: 4px; padding-right: 5px;">

                                        <asp:Image ID="Image1" ImageUrl="~/Images/UpDnArrow.png" Width="18" Height="24" border="0" alt="隐藏上边栏" runat="server" />

                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td class="formItemBgStyle" style="text-align: left; padding-left: 10px;">
                            <asp:TextBox ID="TB_Content" runat="server" Width="99%"></asp:TextBox>
                        </td>
                    </tr>

                    <tr>
                        <td class="formItemBgStyle" style="text-align: left; padding-left: 15px; border-bottom-style: none">

                            <asp:Button ID="BT_Active" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('Active');" Text="<%$ Resources:lang,JiHuo%>" />

                            &nbsp;&nbsp;
                            <asp:Button ID="BT_Success" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Success_Click" Text="<%$ Resources:lang,ChengGongJieAn%>" />

                            &nbsp;&nbsp;
                                     <asp:Button ID="BT_ConfirmEffectPlanProgress" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QueRenJinDu %>" OnClick="BT_ConfirmEffectPlanProgress_Click" />

                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Height="30px" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: left;" class="formItemBgStyle">
                            <asp:Repeater ID="RP_RelatedModule" runat="server">
                                <ItemTemplate>
                                    <a href='<%# DataBinder.Eval(Container.DataItem,"PageName") %>?RelatedWorkFlowID=<%# DataBinder.Eval(Container.DataItem,"WorkflowID") %>&RelatedWorkflowStepID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepID") %>&RelatedWorkflowStepDetailID=<%# DataBinder.Eval(Container.DataItem,"WorkflowStepDetailID") %>' target="_blank"><%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %></a>&nbsp;
                                </ItemTemplate>
                            </asp:Repeater>
                        </td>
                    </tr>
                    <tr>
                        <td class="formItemBgStyle" style="text-align: left; font-size: xx-small; padding-left: 20px; padding-top: 20px;">1.<asp:CheckBox ID="CB_DIYNextStep" runat="server" Checked="True" Text="<%$ Resources:lang,YunXuXuanZeQianZhiBuZhou %>" />
                            &nbsp; 2.<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XuYaoTongZhiShenQingZhe %>"></asp:Label>
                            ：</span><asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin %>" Checked="true" />
                            <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian %>" Checked="true" />

                            <asp:HyperLink ID="HL_WFChartView" runat="server" Visible="false">
                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,LiuChengTu%>"></asp:Label>
                            </asp:HyperLink>
                        </td>
                    </tr>
                </table>
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td align="left" style="padding-top: 30px; padding-left: 20px;">
                            <div style="width: 100%; overflow-x: auto; display: none;">
                                <table style="width: 120%;">
                                    <tr>
                                        <td align="left">
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
                                        </td>
                                    </tr>
                                </table>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="formItemBgStyle" style="text-align: left; padding-left: 20px;">
                            <div style="width: 100%; overflow: auto;">
                                <table width="120%">
                                    <tr>
                                        <td style="height: 1px">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="步骤列表" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BuZhouLieBiao%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td>
                                                                    <table style="width: 100%; display: none;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                        <tr>
                                                                            <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                                            <td style="width: 70%; height: 25px; padding-right: 1px; text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_WLID" runat="server"></asp:Label>.<asp:Label ID="LB_WFName" runat="server"></asp:Label></td>
                                                                            <td align="right" class="formItemBgStyle" width="80px">
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                                                            <td class="formItemBgStyle" style="text-align: left;">
                                                                                <asp:Label ID="LB_Status" runat="server"></asp:Label></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="width: 80px; text-align: right">
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MiaoShu %>"></asp:Label>：</td>
                                                                            <td colspan="3" class="formItemBgStyle" style="height: 25px; padding-right: 1px; text-align: left">
                                                                                <asp:Label ID="LB_WLDescription" runat="server"></asp:Label></td>
                                                                        </tr>
                                                                    </table>
                                                                    <table style="width: 100%; display: none;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                        <tr>
                                                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>： </td>
                                                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle"></td>
                                                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>： </td>
                                                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_WLType" runat="server"></asp:Label></td>
                                                                            <td style="width: 10%; height: 20px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label>： </td>
                                                                            <td style="width: 20%; height: 20px; text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_CreatorCode" runat="server"></asp:Label>&#160;&#160;<asp:Label ID="LB_CreatorName" runat="server"></asp:Label></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShenQingMingCheng %>"></asp:Label>： </td>
                                                                            <td colspan="5" style="height: 25px; padding-right: 1px; text-align: left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_WLName" runat="server" Enabled="False" Width="100%"></asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="height: 24px; text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu %>"></asp:Label>： </td>
                                                                            <td colspan="5" style="font-weight: bold; height: 24px; text-align: left" class="formItemBgStyle">
                                                                                <asp:TextBox ID="TB_WLDescription" runat="server" Enabled="False" Font-Size="10pt"
                                                                                    Height="43px" TextMode="MultiLine" Width="90%"></asp:TextBox></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,MuBanMingCheng %>"></asp:Label>： </td>
                                                                            <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_TemName" runat="server" Width="203px"></asp:Label></td>
                                                                            <td colspan="3" style="font-size: 10pt; text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_UserName" runat="server" Font-Italic="False" Font-Size="9pt"
                                                                                    Font-Underline="False" Visible="False" Width="3px"></asp:Label>
                                                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>： </td>
                                                                            <td style="width: 100px; text-align: left;" class="formItemBgStyle"></td>
                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JianLiShiJian %>"></asp:Label>： </td>
                                                                            <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                <asp:Label ID="LB_CreateTime" runat="server"></asp:Label></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; height: 12px; text-align: left">(<asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,BKLBZTJDHCGZLHY %>"></asp:Label><asp:Label ID="LB_UNReviewNumber" runat="server" Style="text-decoration: underline"
                                                                    Text="<%$ Resources:lang,Ling %>"></asp:Label>&#160;<asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BYSPNKYD %>"></asp:Label><asp:HyperLink ID="HL_WorkFlowStep" runat="server"><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BuZhouCanKao %>"></asp:Label>
</asp:HyperLink>&#160;<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JinXingChaYue %>"></asp:Label>) </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="width: 100%; height: 1px; text-align: left">
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong></strong></td>
                                                                                        <td align="center" width="6%"><strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label></strong></td>

                                                                                        <td align="center" width="30%"><strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingBuZhouCheng %>"></asp:Label></strong></td>

                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiBeiRenShu %>"></asp:Label></strong></td>

                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
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
                                                                            <asp:TemplateColumn>
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_StepID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"StepID") %>'
                                                                                        CssClass="inpu" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>

                                                                            <asp:BoundColumn DataField="StepName" HeaderText="步骤名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                            </asp:BoundColumn>

                                                                            <asp:BoundColumn DataField="LimitedOperator" HeaderText="必备人数">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: left; font-size: xx-small;">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BuZhou %>"></asp:Label>：<asp:Label ID="LB_StepID" runat="server"></asp:Label><asp:Label ID="LB_StepName" runat="server"></asp:Label><asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShenHeRenLieBiao %>"></asp:Label>： </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 1px; text-align: left">
                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                            <td>
                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                    <tr>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,PiHeRen %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="20%"><strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YaoShenHeDeGongZuo %>"></asp:Label></strong></td>

                                                                                        <td align="center" width="6%"><strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="6%"><strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DongZuo %>"></asp:Label></strong></td>

                                                                                        <td align="center" width="8%"><strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong></td>
                                                                                        <td align="center" width="10%"><strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShiShenPiZhe %>"></asp:Label></strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td align="right" width="7">
                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid4_ItemCommand" OnItemCreated="DataGrid4_ItemCreated" ShowHeader="False" Width="100%">

                                                                        <Columns>
                                                                            <asp:TemplateColumn>
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_ID" runat="server" CommandName="Select" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>

                                                                            <asp:BoundColumn DataField="OperatorName" HeaderText="批核人">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="WorkDetail" HeaderText="要审核的工作">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                            </asp:BoundColumn>

                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Operation" HeaderText="动作">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>

                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                <ItemTemplate>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:TemplateColumn>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="CB_IsOperator" runat="server" AutoPostBack="true"></asp:CheckBox>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:TemplateColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 18px; text-align: left">
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BuZhouXuHao %>"></asp:Label>：<asp:Label ID="LB_ID" runat="server"></asp:Label>&#160;<asp:Label ID="LB_OperatorCode" runat="server"></asp:Label>&#160;<asp:Label ID="LB_OperatorName" runat="server"></asp:Label></td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td style="text-align: left; height: 18px;">

                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShiShenPiZhe %>"></asp:Label>
                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GongZuoLiuWenDang %>"></asp:Label>
                                                                    </asp:HyperLink>&#160;<asp:HyperLink ID="HL_ApproveRecord" runat="server" NavigateUrl="TTWorkflowApproveRecord.aspx"><asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShiShenPiZhe %>"></asp:Label>
<asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,SuoYouShenPiJiLu %>"></asp:Label>
</asp:HyperLink>&#160;&#160;
                                                                        <asp:HyperLink ID="HL_XMLFile" runat="server">
                                                                            ---&gt;<asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShiShenPiZhe %>"></asp:Label>
<asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ChaKanShuJuWenJian %>"></asp:Label>
</asp:HyperLink>&#160;<asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                            Text="<%$ Resources:lang,hlMakeCollaboration %>"></asp:HyperLink></td>
                                                                <td style="text-align: left"><span style="font-size: 11pt"></span></td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td style="height: 12px; text-align: left"
                                                                    class="formItemBgStyle">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WoDeChuLiFangFaHeYiJian %>"></asp:Label>：
                                                                        <asp:HyperLink ID="HL_StepApproveRecord" runat="server" Visible="False"><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenPiJiLu %>"></asp:Label>
</asp:HyperLink></td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td align="left"><span style="font-size: 10pt">
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,TongZhiShenQingZhe %>"></asp:Label><asp:CheckBox ID="CB_SendMsg" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" /></span><asp:CheckBox ID="CB_SendMail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" /><asp:TextBox ID="TB_Message" runat="server" Width="300px"></asp:TextBox><asp:Button ID="BT_Send" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>" /><br />
                                                                    <asp:DataList ID="DataList2" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                                                        Width="100%">

                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <ItemTemplate>
                                                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                <tr>
                                                                                    <td class="formItemBgStyle" align="right" width="80px">
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>
                                                                                    <td class="formItemBgStyle" style="text-align: left; width: 40%;"></td>
                                                                                    <td style="width: 80px; height: 15px; text-align: right;" class="formItemBgStyle">
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                                                                    <td style="width: 20%; height: 15px; text-align: left;" class="formItemBgStyle"></td>
                                                                                    <td class="formItemBgStyle" align="right" width="80px">
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                                                                    <td class="formItemBgStyle" style="width: 80px; text-align: left;"></td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="formItemBgStyle" align="right" width="80px">
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：</td>
                                                                                    <td class="formItemBgStyle" colspan="5" style="text-align: left;"></td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                    </asp:DataList></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText=" 关联项目" TabIndex="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>
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
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,GuanLianXiangMu%>"></asp:Label>：<asp:TextBox ID="TB_ProjectID" runat="server" Width="48px"></asp:TextBox><asp:Button ID="BT_AddProjectID" runat="server" Text="<%$ Resources:lang,GuanLian%>" CssClass="inpu"
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
                                                                                <ItemTemplate>
                                                                                </ItemTemplate>
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
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
                                        </td>
                                    </tr>
                                </table>

                            </div>
                        </td>
                    </tr>
                </table>
                <div style="overflow: hidden; display: none;">

                    <asp:Button ID="BT_ActiveWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Active_Click" Text="<%$ Resources:lang,ShenHeZhong %>" />

                    <asp:Button ID="BT_CloseWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Close_Click" Text="<%$ Resources:lang,HuiQianZhong %>" />

                    <asp:Button ID="BT_UpdatingWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_Updating_Click" Text="<%$ Resources:lang,BoHuiZhongZhi %>" />

                    <asp:Button ID="BT_ReActiveWF" runat="server" Height="30px" CssClass="inpu" OnClick="BT_ReActive_Click" Text="<%$ Resources:lang,FuHeZhong %>" />
                    <asp:Button ID="BT_Close" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('Close');" Text="<%$ Resources:lang,GuanBi%>" />

                    <asp:Button ID="BT_Updating" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('Updating');" Text="<%$ Resources:lang,XiuGaiZhong%>" />

                    <asp:Button ID="BT_ReActive" runat="server" CssClass="inpu" Height="30px" OnClientClick="SaveDIYFormData('ReActive');" Text="<%$ Resources:lang,HuoDong%>" />

                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
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
