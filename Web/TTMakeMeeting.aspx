<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTMakeMeeting.aspx.cs"
    Inherits="TTMakeMeeting" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }*/
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JianLiHeWeiHuHuiYi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td colspan="2" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td align="right" style="padding-right: 5px;">
                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                 <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,HuiYiShi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">&nbsp;</td>
                                                                    <td width="5%" align="center">&nbsp;</td>
                                                                    <td align="center">&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                                    OnPageIndexChanged="DataGrid2_PageIndexChanged" PageSize="20" Width="100%" ShowHeader="false">
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    <Columns>
                                                        <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:ButtonColumn>
                                                        <asp:TemplateColumn HeaderText="Delete">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Name">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Host">
                                                            <ItemStyle HorizontalAlign="Center" Width="8%" CssClass="itemBorder" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BeginTime" DataFormatString="{0:yyyy/MM/dd HH:mm}">
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="itemBorder" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd HH:mm}">
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="itemBorder" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Organizer">
                                                            <ItemStyle HorizontalAlign="Center" Width="8%" CssClass="itemBorder" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Address">
                                                            <ItemStyle HorizontalAlign="Center" Width="10%" CssClass="itemBorder" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                        </asp:TemplateColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTMakeCollaboration.aspx?RelatedType=MEETING&RelatedID={0}"
                                                            Text="<%$ Resources:lang,XieZuo %>" HeaderText="发协作" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTMeetingToTask.aspx?ProjectID=1&RelatedType=MEETING&MeetingID={0}"
                                                            Text="<%$ Resources:lang,RenWu %>" HeaderText="发任务" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.ID", "TTMeetingDoc.aspx?RelatedID={0}") %>'
                                                                    Target="_blank"><img src="ImagesSkin/Doc.gif" 
                                                                        class="noBorder" /></asp:HyperLink>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" VerticalAlign="Middle" />
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
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="120%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td class="tdMain" align="center" valign="top" style="border-right: solid 1px #D8D8D8;">
                                        <table cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td style="padding-left: 20px; font-weight: bold; height: 24px; text-align: center; color: #000000; background-image: url('ImagesSkin/titleBG.jpg')">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,HuiYiWoTianJiaDeHuiYi%>"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="padding: 5px 5px 5px 5px;" align="left">
                                                    <table width="100%" border="0" class="formBgStyle" cellpadding="2" cellspacing="0">
                                                        <tr style="display:none;">
                                                            <td height="23" align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Name" runat="server" Width="90%" CssClass="shuru"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HuiYiLeiXing%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_MeetingType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                    CssClass="shuru" Width="107px">
                                                                </asp:DropDownList>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuiYiShi%>"></asp:Label>：<asp:TextBox ID="TB_MeetingRoom" runat="server" CssClass="shuru"></asp:TextBox>
                                                                <asp:DropDownList ID="DL_Room" runat="server" DataTextField="RoomName" DataValueField="RoomName"
                                                                    Width="113px" AutoPostBack="True" OnSelectedIndexChanged="DL_Room_SelectedIndexChanged"
                                                                    CssClass="shuru">
                                                                </asp:DropDownList>
                                                                <asp:HyperLink ID="HL_MeetingRoom" runat="server" NavigateUrl="TTMeetingRoomStatus.aspx" Text="<%$ Resources:lang,ChaKanHuiYiShi%>"
                                                                    Target="_blank">
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Host" runat="server" Width="76px" CssClass="shuru"></asp:TextBox>
                                                                &nbsp;<asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label>：<asp:TextBox ID="TB_Organizer" runat="server" Width="80px" CssClass="shuru"></asp:TextBox>
                                                                &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>：<asp:TextBox ID="TB_Recorder" runat="server" Width="74px" CssClass="shuru"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
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
                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_BeginMinute" runat="server" CssClass="shuru">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" style="height: 24px" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>
                                                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_EndTime">
                                                                            </ajaxToolkit:CalendarExtender>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_EndHour" runat="server" CssClass="shuru">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_EndMinute" runat="server" CssClass="shuru">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YuHuiRenYuan%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' Visible="false" />
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HuiYiNeiRong%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <CKEditor:CKEditorControl ID="TB_Content" runat="server" Width="85%" Height="150" Visible="false" />
                                                                <CKEditor:CKEditorControl runat="server" ID="HT_Content" Width="85%" Height="150px" Visible="false" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                            </td>
                                                            <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_Status" runat="server" CssClass="shuru">
                                                                    <asp:ListItem Value="正常" Text="<%$ Resources:lang,ZhengChang%>" />
                                                                    <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr style="display: none;">
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                            <td align="left" style="height: 21px;" class="formItemBgStyle">

                                                                <asp:HyperLink ID="HL_MakeCollaboration" runat="server" Enabled="false" Visible="false" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                    Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration%>"></asp:HyperLink>

                                                                &nbsp;<asp:HyperLink ID="HL_MeetingToTask" runat="server" Enabled="False" Visible="false" NavigateUrl="~/TTMeetingToTask.aspx"
                                                                    Target="_blank">
                                                                    --><asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                                </asp:HyperLink>

                                                                &nbsp;&nbsp;<asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" Visible="false" NavigateUrl="~/TTProjectRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenJian%>"
                                                                    Target="_blank">
                                                                </asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" colspan="2" style="text-align: center" class="formItemBgStyle">
                                                                <asp:CheckBox ID="CB_MSM" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                                <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TongZhiYuHuiRenYuan%>"></asp:Label>
                                                                <asp:TextBox ID="TB_Message" runat="server" Width="300px" CssClass="shuru"></asp:TextBox>
                                                                <asp:Button ID="BT_Send" runat="server" Enabled="False" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>"
                                                                    CssClass="inpu" />
                                                            </td>
                                                        </tr>

                                                    </table>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="180px" class="tdMain" align="center" valign="top">
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
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
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
                                    <td width="220px" class="tdMain" align="left" valign="top">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
