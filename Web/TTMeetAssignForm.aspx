<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMeetAssignForm.aspx.cs" Inherits="TTMeetAssignForm" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
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
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>
</head>
<body style="text-align: left;">
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
                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShiPinHuiYi%>"></asp:Label>
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
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="width: 65%; padding: 10px 5px 5px 5px; border-right: solid 1px #D8D8D8; border-bottom: solid 1px #D8D8D8;">
                                                <table width="100%" border="0" class="formBgStyle" cellpadding="2" cellspacing="0">
                                                    <tr>
                                                        <td height="23" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenQingDanHao%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ApplyFormID" runat="server" Precision="0" Width="60px">0</NickLee:NumberBox>
                                                            <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZe%>" />
                                                            <cc1:ModalPopupExtender ID="TB_Select_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                CancelControlID="IMBT_CloseApplyForm" Enabled="True" PopupControlID="Panel2"
                                                                TargetControlID="BT_Select">
                                                            </cc1:ModalPopupExtender>
                                                        </td>
                                                    </tr>
                                                    <tr style="display:none;">
                                                        <td height="23" align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HuiYiBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Name" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HuiYiLeiXing%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_MeetingType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                CssClass="shuru" Width="107px">
                                                            </asp:DropDownList>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HuiYiDiDian%>"></asp:Label>：<asp:TextBox ID="TB_MeetingRoom" runat="server" CssClass="shuru"></asp:TextBox>
                                                            <asp:DropDownList ID="DL_Room" runat="server" DataTextField="RoomName" DataValueField="RoomName"
                                                                Width="113px" AutoPostBack="True" OnSelectedIndexChanged="DL_Room_SelectedIndexChanged"
                                                                CssClass="shuru">
                                                            </asp:DropDownList>
                                                            <asp:HyperLink ID="HL_MeetingRoom" runat="server" Font-Size="10pt" NavigateUrl="TTMeetingRoomStatus.aspx" Text="<%$ Resources:lang,ChaKanHuiYiShi%>"
                                                                Target="_blank">
                                                            </asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Host" runat="server" Width="76px" CssClass="shuru"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label>：<asp:TextBox ID="TB_Organizer" runat="server" Width="80px" CssClass="shuru"></asp:TextBox>
                                                            &nbsp;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>：<asp:TextBox ID="TB_Recorder" runat="server" Width="74px" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table>
                                                                <tr>
                                                                    <td>


                                                                        <asp:TextBox ID="DLC_BeginTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_BeginTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_BeginHour" runat="server" CssClass="shuru">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_BeginMinute" runat="server" CssClass="shuru">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" style="height: 24px" class="formItemBgStyle">
                                                            <table>
                                                                <tr>
                                                                    <td>

                                                                        <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_EndHour" runat="server" CssClass="shuru">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_EndMinute" runat="server" CssClass="shuru">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                        <asp:Button ID="BT_SelectMeeting" CssClass="inpuLong" runat="server" Text="<%$ Resources:lang,CKYYSPDS%>" OnClick="BT_SelectMeeting_Click" /><font rolor="red">总共<asp:Literal ID="LT_MeetingCount" runat="server"></asp:Literal>个点</font>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuHuiRenYuan%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                                <ItemTemplate>
                                                                    <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HuiYiNeiRong%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <CKEditor:CKEditorControl ID="TB_Content" runat="server" Width="85%" Height="140" Visible="false" />
                                                            <CKEditor:CKEditorControl runat="server" ID="HT_Content" Width="85%" Height="140px" Visible="false" />
                                                        </td>
                                                    </tr>
                                                    <tr style="display: none;">
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Status" runat="server" CssClass="shuru">
                                                                <asp:ListItem Value="正常" Text="<%$ Resources:lang,ZhengChang%>" />
                                                                <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuXiMiMa%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_MainPass" runat="server" Width="76px" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,HuiYiDengLuMiMa%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Password" runat="server" Width="76px" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label22221" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZeng%>" CssClass="inpu" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_Update" runat="server" Enabled="False" OnClick="BT_Update_Click"
                                                                        CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" Visible="false" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_Delete" runat="server" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp; &nbsp;&nbsp;
                                                                    <asp:HyperLink ID="HL_MakeCollaboration" runat="server" Enabled="false" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                        Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration%>"></asp:HyperLink>

                                                            &nbsp;<asp:HyperLink ID="HL_MeetingToTask" runat="server" Enabled="False" NavigateUrl="~/TTMeetingToTask.aspx"
                                                                Target="_blank">
                                                                --><asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                            </asp:HyperLink>

                                                            &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTProjectRelatedDoc.aspx"
                                                                Target="_blank">
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
                                                            </asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" colspan="2" style="text-align: center" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CB_MSM" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                            <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,TongZhiYuHuiRenYuan%>"></asp:Label>
                                                            <asp:TextBox ID="TB_Message" runat="server" Width="300px" CssClass="shuru"></asp:TextBox>
                                                            <asp:Button ID="BT_Send" runat="server" Enabled="False" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>"
                                                                CssClass="inpu" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top" style="width: 35%; padding: 10px 5px 5px 5px; border-bottom: solid 1px #D8D8D8;">
                                                <div id="mess_box" style="width: 100%; height: 410px; overflow: auto;">
                                                    <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                                        <tr>
                                                            <td class="formItemBgStyle" style="width: 175px; padding: 5px 5px 5px 5px; text-align: center; vertical-align: top;">
                                                                <table class="formBgStyle" width="100%" border="0" cellpadding="0" cellspacing="0"
                                                                    background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="100%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
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
                                                                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false"
                                                                    Font-Bold="True">
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <Columns>
                                                                        <asp:TemplateColumn HeaderText="">
                                                                            <ItemTemplate>
                                                                                <table width="100%">
                                                                                    <tr>
                                                                                        <td align="left" width="50%">
                                                                                            <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                                CssClass="inpu" />

                                                                                        </td>
                                                                                        <td align="left">
                                                                                            <a href='TTMemberWorkload.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'><%# DataBinder.Eval(Container.DataItem,"UserName") %> </a>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" HorizontalAlign="Left" ForeColor="White" />
                                                                </asp:DataGrid>
                                                            </td>
                                                            <td class="formItemBgStyle" style="padding: 5px 5px 5px 5px;" valign="top"
                                                                align="left">
                                                                <asp:TreeView ID="TreeView2" runat="server" BorderColor="Transparent" NodeWrap="True"
                                                                    OnSelectedNodeChanged="TreeView2_SelectedNodeChanged" ShowLines="True" Width="190px">
                                                                    <RootNodeStyle CssClass="rootNode" />
                                                                    <NodeStyle CssClass="treeNode" />
                                                                    <LeafNodeStyle CssClass="leafNode" />
                                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                </asp:TreeView>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" valign="top" style="padding: 10px 5px 5px 5px;">
                                                <br />
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="2" style="height: 15px" align="left">
                                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="项目会议列表">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XiangMuHuiYiLieBiao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center">
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="11%"><strong>
                                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="20%"><strong>
                                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuChiRen %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhaoJiRen %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="15%"><strong>
                                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,HuiYiShi %>"></asp:Label></strong> </td>
                                                                                                        <td align="center" width="8%"><strong>
                                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="8" ShowHeader="False" Width="100%">

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="11%" />
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                                </ItemTemplate>
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="Name">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Host">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="BeginTime" DataFormatString="{0:yyyy/MM/dd HH:mm}">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm}">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Organizer">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Address">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                    </ContentTemplate>
                                                                </cc1:TabPanel>
                                                                <cc1:TabPanel ID="TabPanel2" runat="server">
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,GongZuoLiuDingYi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ContentTemplate>
                                                                        <table cellpadding="4" cellspacing="0" width="98%">
                                                                            <tr>
                                                                                <td align="center" colspan="2" style="height: 22px; text-align: left;">
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>： </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" colspan="2">
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> &nbsp; </td>
                                                                                                        <td align="center" width="50%"><strong>
                                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong> &nbsp; </td>
                                                                                                        <td align="center" width="20%"><strong>
                                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong> &nbsp; </td>
                                                                                                        <td align="center" width="10%"><strong>
                                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> &nbsp; </td>
                                                                                                        <td align="center" width="10%"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td align="right" width="6">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}" DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder"/></asp:HyperLink>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                    </asp:DataGrid>
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

                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 900px; height: 400px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 100%; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="14%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="14%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="17%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="17%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,HuiYiShi%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                            Height="1px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="Name" HeaderText="会议名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Host" HeaderText="主持人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="BeginTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="开始时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm}" HeaderText="结束时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Organizer" HeaderText="召集人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Address" HeaderText="会议室">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseApplyForm" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
