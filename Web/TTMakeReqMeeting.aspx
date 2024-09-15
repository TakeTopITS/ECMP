<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeReqMeeting.aspx.cs"
    Inherits="TTMakeReqMeeting" %>

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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }



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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HuiYiAnPai%>"></asp:Label>
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
                            <td style="padding: 5px 5px 5px 5px;">

                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td align="right" style="padding-bottom: 5px;">
                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                        </td>
                                    </tr>

                                    <tr>
                                        <td align="center" colspan="2">
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
                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
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
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,HuiYiShi%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="17%" />
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

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 1000px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius:10px;">
                        <div class="layui-layer-title"  style="background:#e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label7" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding :0px 5px 0px 5px;">


                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                        <table width="98%">
                                            <tr>
                                                <td align="center">
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                                                    <tr>
                                                                        <td colspan="2" style="font-weight: bold; height: 24px; text-align: center; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')"
                                                                            class="formItemBgStyle">
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XQHYWTJDXQHY%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="display:none;">
                                                                        <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HuiYiHao%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HuiYiMingCheng%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_Name" runat="server" Width="90%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="color: #000000">
                                                                        <td align="right" style="width: 120px; height: 13px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuiYiLeiXing%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" style="height: 13px" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_MeetingType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                                Width="107px">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HuiYiShi%>"></asp:Label>：<asp:TextBox ID="TB_MeetingRoom" runat="server" AutoPostBack="True"></asp:TextBox>
                                                                            <asp:DropDownList ID="DL_Room" runat="server" DataTextField="RoomName" DataValueField="RoomName"
                                                                                Width="113px" AutoPostBack="True" OnSelectedIndexChanged="DL_Room_SelectedIndexChanged">
                                                                            </asp:DropDownList>
                                                                            <asp:HyperLink ID="HL_MeetingRoom" runat="server" Font-Size="10pt" NavigateUrl="TTMeetingRoomStatus.aspx" Text="<%$ Resources:lang,ChaKanHuiYiShi%>"
                                                                                Target="_blank">
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="color: #000000">
                                                                        <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuChiRen%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_Host" runat="server" Width="76px"></asp:TextBox>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhaoJiRen%>"></asp:Label>：<asp:TextBox ID="TB_Organizer" runat="server" Width="80px"></asp:TextBox>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiLuRen%>"></asp:Label>：<asp:TextBox ID="TB_Recorder" runat="server" Width="74px"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="color: #000000">
                                                                        <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_BeginYear" runat="server" Style="font-weight: normal; color: black">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label><asp:DropDownList ID="DL_BeginMonth" runat="server" EnableTheming="True" Style="font-weight: normal; color: black">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label><asp:DropDownList ID="DL_BeginDay" runat="server" Style="font-weight: normal">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Ri%>"></asp:Label>
                                                                            <asp:DropDownList ID="DL_BeginHour" runat="server">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>&nbsp;
                                                                            <asp:DropDownList ID="DL_BeginMinute" runat="server">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="color: #000000">
                                                                        <td align="right" style="width: 120px; height: 24px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" style="height: 24px" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_EndYear" runat="server" Style="font-weight: normal; color: black">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label><asp:DropDownList ID="DL_EndMonth" runat="server" EnableTheming="True" Style="font-weight: normal; color: black">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label><asp:DropDownList ID="DL_EndDay" runat="server" Style="font-weight: normal">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Ri%>"></asp:Label>
                                                                            <asp:DropDownList ID="DL_EndHour" runat="server">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Shi%>"></asp:Label>&nbsp;
                                                                            <asp:DropDownList ID="DL_EndMinute" runat="server">
                                                                            </asp:DropDownList>
                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                        </td>
                                                                    </tr>
                                                                    <tr style="color: #000000">
                                                                        <td align="right" style="width: 120px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YuHuiRenYuan%>"></asp:Label>：
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
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HuiYiNeiRong%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" class="formItemBgStyle">
                                                                            <asp:TextBox ID="TB_Content" runat="server" Height="96px" TextMode="MultiLine" Width="85%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="width: 120px; height: 21px" class="formItemBgStyle">
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                        </td>
                                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                                            <asp:DropDownList ID="DL_Status" runat="server">
                                                                                <asp:ListItem Value="正常" Text="<%$ Resources:lang,ZhengChang%>" />
                                                                                <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right" style="width: 120px; height: 21px" class="formItemBgStyle">
                                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                        </td>
                                                                        <td align="left" style="height: 21px;" class="formItemBgStyle">
                                                                            <asp:HyperLink ID="HL_MeetingToTask" runat="server" Enabled="False" NavigateUrl="~/TTMeetingToTask.aspx"
                                                                                Target="_blank">
                                                                                --><asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhuanChengRenWu%>"></asp:Label>
                                                                            </asp:HyperLink>
                                                                            &nbsp;
                                                                                <asp:HyperLink ID="HL_MakeCollaboration" runat="server" NavigateUrl="~/TTMakeCollaboration.aspx"
                                                                                    Enabled="false" Target="_blank" Text="<%$ Resources:lang,hlMakeCollaboration%>"></asp:HyperLink>
                                                                            &nbsp;<asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTProjectRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenJian%>"
                                                                                Target="_blank">
                                                                            </asp:HyperLink>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="2" style="height: 21px;" class="formItemBgStyle">
                                                                            <asp:CheckBox ID="CB_MSM" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaXinXi%>" /><asp:CheckBox
                                                                                ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,FaYouJian%>" /><asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,TongZhiYuHuiRenYuan%>"></asp:Label>
                                                                            <asp:TextBox ID="TB_Message" runat="server" Width="50%"></asp:TextBox>
                                                                            <asp:Button ID="BT_Send" runat="server" Enabled="False" OnClick="BT_Send_Click" CssClass="inpu"
                                                                                Text="<%$ Resources:lang,FaSong%>" />
                                                                        </td>
                                                                    </tr>
                                                                </table>

                                                                <br />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td width="165" style="padding: 10px 5px 5px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
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
                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
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
                                            ShowHeader="false" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                    <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Style="text-align: center"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Style="text-align: center"
                                                            Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                    <td width="200" style="padding: 10px 5px 5px 5px" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="200">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
