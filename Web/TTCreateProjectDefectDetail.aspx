<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCreateProjectDefectDetail.aspx.cs" Inherits="TTCreateProjectDefectDetail" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>我的需求管理</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1020px;
            width: expression (document.body.clientWidth <= 1020? "1020px" : "auto" ));
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
                                                            <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                                                <tr>
                                                                    <td width="29">
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                    </td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JLHFPXMQX%>"></asp:Label>
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
                                            <td>
                                                <table style="width: 98%; margin-top: 5px">
                                                    <tr>
                                                        <td style="padding: 5px 5px 5px 4px;" align="left">

                                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="98%">
                                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="分派需求">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,XuQiuneirong%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>

                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right; height: 13px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="height: 13px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_DefectID" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                                </td>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td width="100px">
                                                                                                <asp:DropDownList ID="DL_Type" runat="server" CssClass="DDList" DataTextField="Type" DataValueField="Type">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td width="80px" align="right">
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：</td>
                                                                                            <td>
                                                                                                <asp:TextBox ID="TB_DefectName" runat="server" Width="95%"></asp:TextBox></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_DefectDetail" runat="server" Height="55px" TextMode="MultiLine"
                                                                                        Width="90%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_AcceptStandard" runat="server" Height="55px" TextMode="MultiLine"
                                                                                        Width="90%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WanChengRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <table style="width: 80%">
                                                                                        <tr>
                                                                                            <td style="width: 230px;">
                                                                                                <asp:TextBox ID="DLC_DefectFinishedDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_DefectFinishedDate">
                                                                                                </ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                            <td style="width: 57px; text-align: right;">
                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td style="width: 80px;">
                                                                                                <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:HyperLink ID="HL_DefectToTask" runat="server" Target="_blank">---><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label></asp:HyperLink>
                                                                                                &nbsp;
                                                                                    <asp:HyperLink ID="HL_RelatedDoc" runat="server" NavigateUrl="~/TTDefectRelatedDoc.aspx"
                                                                                        Target="_blank" Enabled="False">
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                                    </asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_ApproveRecord" runat="server" Enabled="False" NavigateUrl="~/TTDefectAssignRecord.aspx"
                                                                                                    Target="_blank">
                                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
                                                                                                </asp:HyperLink>

                                                                                                <asp:HyperLink ID="HL_DefectReview" runat="server" Enabled="False" Visible="false" Target="_blank">---&gt;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XuQiuPingShen%>"></asp:Label></asp:HyperLink>
                                                                                                &nbsp;

                                                                    <asp:HyperLink ID="HL_WFTemName" runat="server" Enabled="False" Target="_blank" Visible="false">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBanWeiHu%>"></asp:Label>
                                                                    </asp:HyperLink>
                                                                                                &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedWorkFlowTemplate" runat="server" Enabled="false" Visible="false"
                                                                                                    NavigateUrl="TTProRelatedWFTemplate.aspx" Target="_blank">
                                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuanLianGongZuoLiuMuBan%>"></asp:Label>
                                                                                                </asp:HyperLink>
                                                                                                &nbsp;<asp:HyperLink ID="HL_ActorGroup" runat="server" Enabled="false" Visible="false" NavigateUrl="~/TTProjectRelatedActorGroup.aspx"
                                                                                                    Target="_blank">
                                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JueSeZuSheZhi%>"></asp:Label>
                                                                                                </asp:HyperLink>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td class="formItemBgStyle"></td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>

                                                                                                <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click"   Text="<%$ Resources:lang,BaoCun%>" />

                                                                                            </td>
                                                                                            <td style="padding-left: 20px;">

                                                                                                <asp:Button ID="BT_Close" runat="server" CssClass="inpuClose" ToolTip="<%$ Resources:lang,GuanBi%>" Enabled="False" OnClick="BT_Close_Click" />

                                                                                                            &nbsp;
                                                                                                <asp:Button ID="BT_Open" runat="server" CssClass="inpuActive" ToolTip="<%$ Resources:lang,JiHuo%>" Enabled="False" OnClick="BT_Open_Click" />

                                                                                                            &nbsp;
                                                                                                <asp:Button ID="BT_Delete" runat="server" CssClass="inpuDelete" ToolTip="<%$ Resources:lang,ShanChu%>" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />

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
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,jixufenpai%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>

                                                                        <table style="width: 90%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td valign="top" align="left" class="formItemBgStyle">
                                                                                    <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                        <tr>
                                                                                            <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouLiRenDaiMa%>"></asp:Label>:
                                                                                            </td>
                                                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="TB_ReceiverCode" runat="server" Width="87px"></asp:TextBox>
                                                                                                <asp:Label ID="LB_ReceiverName" runat="server" Visible="False" Width="72px"></asp:Label>
                                                                                                <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZhe %>" CssClass="inpu" OnClick="BT_Select_Click" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                                <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Width="100%" Height="150px" Visible="False" />
                                                                                                <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="100%" Height="150px" Visible="False" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right;" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td style="width: 230px" class="formItemBgStyle">
                                                                                                <asp:TextBox ID="DLC_BeginDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate">
                                                                                                </ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                            <td style="width: 130px; text-align: right" class="formItemBgStyle">
                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                                            </td>
                                                                                            <td class="formItemBgStyle">
                                                                                                <asp:TextBox ID="DLC_EndDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                    runat="server" TargetControlID="DLC_EndDate">
                                                                                                </ajaxToolkit:CalendarExtender>
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: right" class="formItemBgStyle"></td>
                                                                                            <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                                <asp:Button ID="BT_Assign" runat="server" OnClick="BT_Assign_Click" CssClass="inpu"
                                                                                                    Text="分 派" Enabled="False" />
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td style="text-align: left;" colspan="4" class="formItemBgStyle">
                                                                                                <asp:CheckBox ID="CB_SendMsg" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                                                                <asp:CheckBox ID="CB_SendMail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                                                                &nbsp;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen%>"></asp:Label>&nbsp;
                                                                                <asp:TextBox ID="TB_Message" runat="server" Width="45%"></asp:TextBox>
                                                                                                <asp:Button ID="BT_Send" runat="server" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" CssClass="inpu" />
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
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 300px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label22" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td class="formItemBgStyle" style="padding: 5px 5px 0px 5px; text-align: left; vertical-align: top;">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="220px">
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <RootNodeStyle CssClass="rootNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
