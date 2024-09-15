<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeProMeeting.aspx.cs"
    Inherits="TTMakeProMeeting" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                            <asp:Label ID="LB_ProjectMeeting" runat="server" Text="<%$ Resources:lang,ProjectMeeting%>"></asp:Label>
                                                            (<asp:HyperLink ID="HL_ManageMeeting" runat="server" Font-Size="10pt" NavigateUrl="~/TTMakeMeetingRoom.aspx"
                                                                Target="_blank" Text="<%$ Resources:lang,MeetingRoom%>"></asp:HyperLink>
                                                            )
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
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="width: 100%; padding: 5px 5px 5px 5px;">

                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td align="right" style="padding-right: 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
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
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                 
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,BianHao%>" /></strong>
                                                                                </td>
                                                                                <td width="17%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgMeetingName" runat="server" Text="<%$ Resources:lang,MeetingName%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgHost" runat="server" Text="<%$ Resources:lang,Host%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgOrganizer" runat="server" Text="<%$ Resources:lang,Organizer%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgMeetingRoom" runat="server" Text="<%$ Resources:lang,MeetingRoom%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="LB_dgStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ShowHeader="false"
                                                                ForeColor="#333333" GridLines="None">

                                                                <ItemStyle CssClass="itemStyle" />
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
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Name" HeaderText="会议名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Host" HeaderText="主持人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BeginTime" DataFormatString="{0:yyyy/MM/dd hh:mm}" HeaderText="开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd hh:mm}" HeaderText="结束时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Organizer" HeaderText="召集人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Address" HeaderText="会议室">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
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
                                            </td>

                                        </tr>
                                    </table>
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

                            <table style="width: 100%; padding-top: 5px">
                                <tr>
                                    <td align="center" colspan="2" style="padding: 5px 0px 5px 5px;">
                                        <table cellpadding="0" cellspacing="0" width="95%">
                                            <tr>
                                                <td style="padding-left: 20px; font-weight: bold; text-align: center; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                    <asp:Label ID="LB_tbMyProjectMeeting" runat="server" Text="<%$ Resources:lang,MyProjectMeeting%>"></asp:Label>
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td>
                                                    <table width="100%" cellpadding="2" cellspacing="0" class="formBgStyle" style="margin-top: 5px;">
                                                        <tr style="display:none;">
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbMeetingID" runat="server" Text="<%$ Resources:lang,MeetingID%>"></asp:Label>
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:Label ID="LB_MeetingID" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbMeetingName" runat="server" Text="<%$ Resources:lang,MeetingName%>"></asp:Label>
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Name" runat="server" Width="90%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px; height: 13px" class="formItemBgStyle">
                                                                <asp:Label ID="LB_Type" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_MeetingType" runat="server"  DataTextField="Type"
                                                                    DataValueField="Type">
                                                                </asp:DropDownList>
                                                                <asp:Label ID="LB_tbMeetingRoom" runat="server" Text="<%$ Resources:lang,MeetingRoom%>"></asp:Label><asp:TextBox
                                                                    ID="TB_MeetingRoom" runat="server" Width="167px"></asp:TextBox>
                                                                <asp:DropDownList ID="DL_Room" runat="server" DataTextField="RoomName" DataValueField="RoomName"
                                                                    Width="113px" AutoPostBack="True" OnSelectedIndexChanged="DL_Room_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:HyperLink ID="HL_MeetingRoom" runat="server" Font-Size="10pt" NavigateUrl="TTMeetingRoomStatus.aspx"
                                                                    Target="_blank" Text="<%$ Resources:lang,MeetingRoomStatus%>"></asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbHost" runat="server" Text="<%$ Resources:lang,Host%>"></asp:Label>
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Host" runat="server" Width="76px"></asp:TextBox>&nbsp;
                                                                            <asp:Label ID="LB_tbOrganizer" runat="server" Text="<%$ Resources:lang,Organizer%>"></asp:Label>:<asp:TextBox
                                                                                ID="TB_Organizer" runat="server" Width="80px"></asp:TextBox>&nbsp;<asp:Label ID="LB_tbRecorder"
                                                                                    runat="server" Text="<%$ Resources:lang,Recorder%>"></asp:Label>:<asp:TextBox ID="TB_Recorder"
                                                                                        runat="server" Width="74px"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbStartTime" runat="server" Text="<%$ Resources:lang,StartTime%>"></asp:Label>:
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>

                                                                            <asp:TextBox ID="DLC_BeginTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_BeginTime">
                                                                            </ajaxToolkit:CalendarExtender>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_BeginHour" runat="server">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LB_tbHour" runat="server" Text="<%$ Resources:lang,Hour%>"></asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_BeginMinute" runat="server">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LB_tbMinute" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbEndTime" runat="server" Text="<%$ Resources:lang,EndTime%>"></asp:Label>:
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <table>
                                                                    <tr>
                                                                        <td>

                                                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EndTime">
                                                                            </ajaxToolkit:CalendarExtender>

                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_EndHour" runat="server">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LB_tbEndHour" runat="server" Text="<%$ Resources:lang,Hour%>"></asp:Label>:
                                                                        </td>
                                                                        <td>
                                                                            <asp:DropDownList ID="DL_EndMinute" runat="server">
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td>
                                                                            <asp:Label ID="LB_tbEndMinute" runat="server" Text="<%$ Resources:lang,Minute%>"></asp:Label>:
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbParticipants" runat="server" Text="<%$ Resources:lang,Participants%>"></asp:Label>:
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpuLongRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' Visible="false" />
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbMeetingContent" runat="server" Text="<%$ Resources:lang,MeetingContent%>"></asp:Label>:
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TB_Content" runat="server" Height="96px" TextMode="MultiLine" Width="85%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px; height: 21px;" class="formItemBgStyle">
                                                                <asp:Label ID="LB_tbStatus" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label>:
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_Status" runat="server">
                                                                    <asp:ListItem Value="正常" Text="<%$ Resources:lang,ZhengChang%>" />
                                                                    <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" style="width: 120px;" class="formItemBgStyle">&nbsp;
                                                            </td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:HyperLink ID="HL_MeetingToTask" runat="server" Enabled="False" NavigateUrl="~/TTMeetingToTask.aspx"
                                                                    Target="_blank">
                                                                    --><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                                </asp:HyperLink>
                                                                &nbsp;<asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                    Enabled="false" Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration%>"></asp:HyperLink>
                                                                &nbsp;<asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTProjectRelatedDoc.aspx"
                                                                    Target="_blank" Text="<%$ Resources:lang,RelatedDoc%>"></asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td align="right" colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                <asp:CheckBox ID="CB_MSM" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,SendSMS%>" /><asp:CheckBox
                                                                    ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,SendEMail%>" />
                                                                <asp:Label ID="LB_NoticeMeetingMember" runat="server" Text="<%$ Resources:lang,NoticeMeetingMember%>"></asp:Label>
                                                                <asp:TextBox ID="TB_Message" runat="server" Width="50%"></asp:TextBox>
                                                                <asp:Button ID="BT_Send" runat="server" Text="<%$ Resources:lang,Send%>" CssClass="inpu"
                                                                    Enabled="False" OnClick="BT_Send_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left;"></td>
                                            </tr>
                                        </table>

                                    </td>

                                    <td width="200px" style="padding: 5px 5px 0px 5px; vertical-align: top; text-align: left;">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                        <br />
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
