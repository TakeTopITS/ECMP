<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectDefectDetail.aspx.cs" Inherits="TTProjectDefectDetail" %>


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
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
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

</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QueXianXiangXiXinXi%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="vertical-align: top;" align="center">
                                            <table style="width: 98%;">
                                                <tr>
                                                    <td colspan="2" style="text-align: left;">

                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QueXianFenPaiJiLuZiLiao%>"></asp:Label>：
                                                    </td>
                                                </tr>
                                                <tr style="display: none;">
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                            Width="100%">
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <ItemTemplate>
                                                                <table cellpadding="4" cellspacing="0" style="width: 100%;">
                                                                    <tr>
                                                                        <td style="text-align: left">
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XuQiuNeiRong%>"></asp:Label>：
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left">
                                                                            <%# DataBinder.Eval(Container.DataItem,"DefectDetail") %>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left;">
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-align: left">
                                                                            <%# DataBinder.Eval(Container.DataItem, "AcceptStandard")%>
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
                                                    <td style="text-align: left;">
                                                        <div style="width: 100%; height: 100px; overflow-y: auto;">
                                                            <asp:DataList ID="DataList2" runat="server" Height="1px" Width="100%" CellPadding="0"
                                                                ForeColor="#333333">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <ItemTemplate>
                                                                    <table style="width: 100%;" cellpadding="4" cellspacing="0">
                                                                        <tr>
                                                                            <td style="width: 12%; text-align: right;">
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiLuBianHao%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="width: 20%" align="left">
                                                                                <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                                            </td>

                                                                            <td style="width: 20%; text-align: right;">
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XuQiu%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="width: 20%;">
                                                                                <a href='TTDefectView.aspx?DefectID=<%# DataBinder.Eval(Container.DataItem,"DefectID") %>'
                                                                                    target="_blank">
                                                                                    <%# DataBinder.Eval(Container.DataItem,"DefectID") %>
                                                                                </a>
                                                                            </td>

                                                                            <td style="height: 20px; text-align: right">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="height: 20px; text-align: left">
                                                                                <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right;">
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WoDeGongZuo%>"></asp:Label>：
                                                                            </td>
                                                                            <td colspan="5" style="text-align: left">
                                                                                <b>
                                                                                    <%# DataBinder.Eval(Container.DataItem,"Operation") %></b>
                                                                            </td>
                                                                        </tr>
                                                                        <tr style="display: none;">
                                                                            <td style="text-align: right;">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                            </td>
                                                                            <td>
                                                                                <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                            </td>
                                                                            <td>
                                                                                <%# DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                                            </td>
                                                                            <td style="text-align: right;">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：
                                                                            </td>
                                                                            <td style="text-align: left;">
                                                                                <%# DataBinder.Eval(Container.DataItem,"AssignManName") %>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td style="text-align: right">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WoDeFanKui%>"></asp:Label>：
                                                                            </td>
                                                                            <td colspan="5" style="text-align: left">
                                                                                <%# DataBinder.Eval(Container.DataItem,"OperatorContent") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" valign="top" align="right" style="padding-top: 5px">
                                                        <table width="100%">
                                                            <tr>
                                                                <td width="30%" align="left">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FenPaiJiLuBianHao%>"></asp:Label>：<asp:Label ID="LB_ApproveID" runat="server"></asp:Label>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FenPaiLuXianBianHao%>"></asp:Label>：<asp:Label ID="LB_RouteNumber" runat="server"></asp:Label>
                                                                </td>
                                                                <td align="left">
                                                                    <asp:HyperLink ID="HL_DefectRelatedDoc" runat="server" NavigateUrl="TTDefectRelatedDoc.aspx"
                                                                        Target="_blank">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                    </asp:HyperLink>
                                                                    &nbsp;&nbsp;
                                                                        <asp:HyperLink ID="HL_ApproveRecord" runat="server" NavigateUrl="TTDefectAssignRecord.aspx"
                                                                            Target="_blank">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
                                                                        </asp:HyperLink>
                                                                    &nbsp;&nbsp;
                                                                        <asp:HyperLink ID="HL_DefectToTask" runat="server" Target="_blank">
                                                                            ---><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                                        </asp:HyperLink>

                                                                    &nbsp;<asp:HyperLink ID="HL_DefectReview" runat="server" Target="_blank" Visible="false">
                                                                        ---&gt;<asp:Label runat="server" Text="<%$ Resources:lang,XuQiuPingShen %>" ID="Label21"></asp:Label>
                                                                    </asp:HyperLink>

                                                                    &nbsp;
                                                                    <asp:HyperLink ID="HL_RelatedMeeting" runat="server" Target="_blank" Visible="false">
                                                                        --->
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HuiYiAnPai%>"></asp:Label>
                                                                    </asp:HyperLink>

                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" valign="top" align="left" style="padding-top: 5px">

                                                        <table width="80%">
                                                            <tr>
                                                                <td colspan="2" align="left">
                                                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="工作总结">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,gongzuozongjie%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ContentTemplate>
                                                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                    <tr>
                                                                                        <td class="formItemBgStyle">
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,WDCLFSJGHYJ %>"></asp:Label>：<asp:Label ID="LB_AssignID"
                                                                                                runat="server" Visible="false"></asp:Label>

                                                                                              <asp:Button ID="BT_Finish" runat="server" CssClass="inpu" OnClick="BT_Finish_Click"
                                                                                                  Text="<%$ Resources:lang,WangCheng %>" />
                                                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                                                                            <asp:Button ID="BT_StartupBusinessForm" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XiangGuanYeWuDan %>" OnClick="BT_StartupBusinessForm_Click" />

                                                                                            &nbsp;&nbsp; &nbsp;&nbsp;  
                                                                                            <asp:Button runat="server" Text="<%$ Resources:lang,ZhuanChengXiangMu %>" CssClass="inpu" ID="BT_PopTranferProjectWindow" OnClick="BT_PopTranferProjectWindow_Click"></asp:Button>


                                                                                            <asp:Button ID="BT_Approve" runat="server" CssClass="inpu" OnClick="BT_Approve_Click" Visible="false"
                                                                                                Text="<%$ Resources:lang,ShouLi %>" />&#160;


                                                                                            <asp:Button ID="BT_Refuse" runat="server" CssClass="inpu" OnClick="BT_Refuse_Click" Visible="false"
                                                                                                Text="<%$ Resources:lang,JuJue %>" />&#160;
                                                                                            <asp:Button ID="BT_Activity" runat="server" CssClass="inpu" OnClick="BT_Activity_Click" Visible="false"
                                                                                                Text="<%$ Resources:lang,HuoDong %>" />&#160;
                                                                                            <asp:Button ID="BT_TBD" runat="server" CssClass="inpu" OnClick="BT_TBD_Click" Visible="false" Text="<%$ Resources:lang,GuaQi %>" />

                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td class="formItemBgStyle">
                                                                                            <table width="100%">
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" style="text-align: right" width="10%">
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YiJian %>"></asp:Label>：
                                                                                                    </td>
                                                                                                    <td align="left" class="formItemBgStyle">
                                                                                                        <asp:TextBox ID="TB_Content" runat="server" Height="60px" TextMode="MultiLine"
                                                                                                            Width="99%"></asp:TextBox>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" style="text-align: right"></td>
                                                                                                    <td class="formItemBgStyle" align="left">
                                                                                                        <table>
                                                                                                            <tr>
                                                                                                                <td>
                                                                                                                    <asp:Button runat="server" Text="<%$ Resources:lang,baocun %>" CssClass="inpu" ID="BT_Save" OnClick="BT_Save_Click"></asp:Button>

                                                                                                                </td>
                                                                                                                <td style="padding-left: 20px;">
                                                                                                                    <asp:Button ID="BT_CloseDefect" runat="server" CssClass="inpuClose" Enabled="False"
                                                                                                                        OnClick="BT_CloseDefect_Click" />
                                                                                                                    &#160;
                                                                                                          <asp:Button ID="BT_ActiveDefect" runat="server" CssClass="inpuActive" Enabled="False"
                                                                                                              OnClick="BT_ActiveDefect_Click" />&#160;
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                        </table>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" colspan="2">
                                                                                                        <asp:CheckBox ID="CB_ReturnMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" />
                                                                                                        <asp:CheckBox ID="CB_ReturnMail" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" />
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,TongZhiFenPaiRen %>"></asp:Label>
                                                                                                        <asp:TextBox ID="TB_Message" runat="server" Width="375px"></asp:TextBox>
                                                                                                        <asp:Button ID="BT_Send" runat="server" CssClass="inpu" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong %>" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ContentTemplate>
                                                                        </cc1:TabPanel>
                                                                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="分派需求">
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,jixufenpai%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ContentTemplate>

                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td class="formItemBgStyle" style="text-align: left;">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,RYJXFPXQQSRNDYQ %>"></asp:Label>：</strong><asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                                        </td>
                                                                                        <td class="formItemBgStyle" style="text-align: left;">&nbsp;</td>
                                                                                    </tr>

                                                                                    <tr>
                                                                                        <td align="left">
                                                                                            <table width="700px">
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                                                                        ：
                                                                                                    </td>
                                                                                                    <td style="width: 30%" class="formItemBgStyle">
                                                                                                        <asp:Label ID="LB_Type" runat="server"></asp:Label>
                                                                                                    </td>
                                                                                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShouLiRenDaiMa %>"></asp:Label>：
                                                                                                    </td>
                                                                                                    <td style="width: 45%" class="formItemBgStyle">
                                                                                                        <asp:TextBox ID="TB_ReceiverCode" runat="server" Width="80px"></asp:TextBox><asp:Label
                                                                                                            ID="LB_ReceiverName" runat="server"></asp:Label>
                                                                                                        <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZhe %>" CssClass="inpu" OnClick="BT_Select_Click" />
                                                                                                    </td>

                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu %>"></asp:Label>：
                                                                                                    </td>
                                                                                                    <td colspan="3" class="formItemBgStyle">
                                                                                                        <CKEditor:CKEditorControl ID="HE_Operation" runat="server" Width="" Height="150px" Visible="False" />
                                                                                                        <CKEditor:CKEditorControl runat="server" ID="HT_Operation" Width="100%" Height="150px" Visible="False" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>：
                                                                                                    </td>
                                                                                                    <td class="formItemBgStyle">
                                                                                                        <asp:TextBox ID="DLC_BeginDate" runat="server"></asp:TextBox>
                                                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BeginDate" Enabled="True">
                                                                                                        </ajaxToolkit:CalendarExtender>
                                                                                                    </td>
                                                                                                    <td style="text-align: right;" class="formItemBgStyle">
                                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label>：
                                                                                                    </td>
                                                                                                    <td class="formItemBgStyle">
                                                                                                        <asp:TextBox ID="DLC_EndDate" runat="server"></asp:TextBox>
                                                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                                                            runat="server" TargetControlID="DLC_EndDate" Enabled="True">
                                                                                                        </ajaxToolkit:CalendarExtender>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" s></td>
                                                                                                    <td colspan="3" class="formItemBgStyle">
                                                                                                        <asp:Button ID="BT_UpdateAssign" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateAssign_Click"
                                                                                                            Text="修  改" />&nbsp;<asp:Button ID="BT_DeleteAssign" runat="server" CssClass="inpu"
                                                                                                                Enabled="False" OnClick="BT_DeleteAssign_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" />&#160;&#160;<asp:Button
                                                                                                                    ID="BT_Assign" runat="server" CssClass="inpu" OnClick="BT_Assign_Click" Text="<%$ Resources:lang,FenPai %>" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" colspan="4" style="text-align: left;">
                                                                                                        <asp:CheckBox ID="CB_SendMsg" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi %>" /><asp:CheckBox
                                                                                                            ID="CB_SendMail" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" /><asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,TongZhiShouLiRen %>"></asp:Label><asp:TextBox
                                                                                                                ID="TB_AssignMessage" runat="server" Width="375px"></asp:TextBox><asp:Button ID="BT_SendAssignMsg"
                                                                                                                    runat="server" CssClass="inpu" OnClick="BT_SendAssignMsg_Click" Text="<%$ Resources:lang,FaSong %>" />
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td class="formItemBgStyle" colspan="4" style="text-align: left;">
                                                                                                        <table width="100%">
                                                                                                            <tr>
                                                                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CFPJLDZJL %>"></asp:Label>（<span style="font-size: 9pt"><asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XuanZeKeZaiShangMianXiuGai %>"></asp:Label>）：</span></strong>
                                                                                                                </td>
                                                                                                            </tr>
                                                                                                            <tr>
                                                                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                                                        <tr>
                                                                                                                            <td width="7">
                                                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                                                            </td>
                                                                                                                            <td>
                                                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                                                    <tr>
                                                                                                                                        <td width="6%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="7%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="8%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShouLiRen %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="22%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShouLiRenDeGongZuo %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="15%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="15%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="7%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LuXian %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="7%" align="center">
                                                                                                                                            <strong>
                                                                                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                                                                        </td>
                                                                                                                                        <td width="5%" align="center">
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
                                                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                                                                        ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="False" OnItemCommand="DataGrid1_ItemCommand"
                                                                                                                        Width="100%">
                                                                                                                        <Columns>
                                                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="OperatorName" HeaderText="受理人">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="Operation" HeaderText="受理人的工作">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="22%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:BoundColumn DataField="RouteNumber" HeaderText="路线">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                                                            </asp:BoundColumn>
                                                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                                                <ItemTemplate>
                                                                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                                                </ItemTemplate>
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                                                            </asp:TemplateColumn>
                                                                                                                            <asp:ButtonColumn ButtonType="PushButton" CommandName="Select" Text="<%$ Resources:lang,XuanZe %>">
                                                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                                                            </asp:ButtonColumn>
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
                            </td>
                        </tr>
                    </table>

                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 300px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table>
                            <tr>
                                <td class="formItemBgStyle" style="padding: 5px 5px 0px 5px; text-align: left; vertical-align: top;">
                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True" Width="220px">
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


                <div class="layui-layer layui-layer-iframe" id="popProjectTreeWindow" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 300px; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                            ShowLines="True" Width="220px">
                            <RootNodeStyle CssClass="rootNode" />
                            <NodeStyle CssClass="treeNode" />
                            <LeafNodeStyle CssClass="leafNode" />
                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                        </asp:TreeView>

                    </div>

                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popTranferProjectWindow" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhuanChengXiangMu%>"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table cellpadding="3" cellspacing="0" width="100%">
                            <tr>
                                <td>
                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,RYZJZCXMQXZFXMHXMJLBSRNDYJ %>"></asp:Label>：
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <table width="100%" cellpadding="4" cellspacing="0" class="bian">
                                        <tr>
                                            <td align="left" style="width: 100%; vertical-align: top; padding: 5px 5px 5px 5px;">
                                                <table width="500px" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,FuXiangMu %>"></asp:Label>：
                                                            <asp:Label ID="LB_ParentProjectID" runat="server"></asp:Label><asp:Label ID="LB_ParentProjectName" runat="server"></asp:Label>
                                                            <asp:Button ID="BT_SelectProject" runat="server" CssClass="inpu" OnClick="BT_SelectProject_Click" Text="<%$ Resources:lang,XuanZe %>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                                 <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XiangMuDaiMa %>"></asp:Label>：<asp:TextBox ID="TB_ProjectCode" runat="server"></asp:TextBox>
                                    <br />
                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,XiangMuJingLi %>"></asp:Label>：<asp:DropDownList ID="DL_Member" runat="server" Height="25px" 
                                                                DataTextField="UserName" DataValueField="UserCode">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng %>"></asp:Label>：
                                                            <br />
                                                            <asp:TextBox ID="TB_TransferProject" runat="server" Height="63px" TextMode="MultiLine" Width="328px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Button ID="BT_TransferProject" runat="server" OnClick="BT_TransferProject_Click" CssClass="inpu" Text="<%$ Resources:lang,ZhuanChengXiangMu %>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 11px">
                                    <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,FaXinXi %>" /><asp:CheckBox
                                        ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian %>" /><asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,TongZhiZhiXingRen %>"></asp:Label>
                                    <asp:TextBox ID="TB_TransferProjectMsg" runat="server" Width="375px"></asp:TextBox><asp:Button
                                        ID="BT_TransferProjectMsg" runat="server" OnClick="BT_TransferProjectMsg_Click"
                                        CssClass="inpu" Text="<%$ Resources:lang,FaSong %>" />
                                </td>
                            </tr>
                        </table>

                    </div>

                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>


                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>


            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="ImagesSkin/Processing.gif" alt="请稍候，处理中..." />
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
