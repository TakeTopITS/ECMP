<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPlanDetail.aspx.cs" Inherits="TTPlanDetail" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

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

                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiHuaChuLi%>"></asp:Label>
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
                            <td style="padding-top: 5px">
                                <table width="98%">
                                    <tr>
                                        <td style="text-align: Right;">
                                            <asp:DataList ID="DataList2" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                Width="100%">
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderTemplate>
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
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="30%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShangJiPingFen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiXingRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </HeaderTemplate>
                                                <ItemTemplate>
                                                    <table border="0" cellpadding="4" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem ,"PlanID") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 5%; padding-left: 5px; text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem,"PlanType") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 30%; text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem,"PlanName") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                <%#DataBinder.Eval(Container.DataItem, "StartTime", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                <%#DataBinder.Eval(Container.DataItem, "EndTime", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem,"Progress") %>%
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem,"ScoringBySelf") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem,"ScoringByLeader") %>
                                                            </td>
                                                            <td class="tdLeft" style="width: 8%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                            </td>
                                                            <td class="tdRight" style="width: 6%; text-align: center;">
                                                                <%#DataBinder .Eval (Container .DataItem, "UserName") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="tdLeft" style="width: 5%; text-align: center; font-size: 10pt;">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>
                                                            </td>
                                                            <td class="tdRight" colspan="9" style="width: 95%; text-align: left; padding-left: 5px">
                                                                <span style="font-size: 9pt"></span>
                                                                <%#DataBinder .Eval (Container .DataItem,"PlanDetail") %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataList>
                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                <tr>
                                                    <td colspan="11" class="tdTopLine"></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" style="font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_ScoringBySelf" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                            PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                    </td>
                                                    <td>
                                                        <asp:Button ID="BT_UpdateScoringBySelf" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>"
                                                            OnClick="BT_UpdateScoringBySelf_Click" />
                                                    </td>
                                                    <td></td>
                                                    <td>
                                                        <asp:Button ID="BT_Finish" runat="server" CssClass="inpu" OnClick="BT_Finish_Click"
                                                            Text="<%$ Resources:lang,JiHuaWanCheng%>" />
                                                    </td>
                                                    <td></td>
                                                    <td width="90px">&nbsp;</td>

                                                    <td>
                                                        <asp:Button ID="BT_SubmitApprove" runat="server" CssClass="inpu" Enabled="False"
                                                            Text="<%$ Resources:lang,TiJiaoShenHe%>" OnClick="BT_SubmitApprove_Click" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                            <table width="100%">
                                                <tr>
                                                    <td width="120px" style="padding-top: 5px;"><b>
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiHuaRiZhi%>"></asp:Label>：</b></td>
                                                    <td width="150px" align="left">
                                                        <asp:Button ID="BT_ImportSamePeriodSchedule" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,CTQRCZDR%>" OnClick="BT_ImportSamePeriodSchedule_Click" />
                                                    </td>
                                                    <td align="left" style="padding-top: 5px;">
                                                        <asp:HyperLink ID="HL_RelatedDoc" runat="server" Enabled="False" NavigateUrl="~/TTPlanRelatedDoc.aspx" Target="_blank"><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label></asp:HyperLink>
                                                    </td>
                                                    <td>&nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" valign="top">
                                            <table width="100%">
                                                <tr>
                                                    <td width="65%">


                                                        <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                            <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="执行日志" TabIndex="0">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhiXingRiZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ContentTemplate>

                                                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                                                        <tr>
                                                                            <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                                <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                            </td>
                                                                        </tr>

                                                                        <tr>
                                                                            <td align="center" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                                <asp:DataList ID="DataList3" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                                    OnItemCommand="DataList3_ItemCommand" Width="100%">
                                                                                    <HeaderTemplate>
                                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                            width="100%">
                                                                                            <tr>
                                                                                                <td width="7">
                                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                                <td>
                                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                        <tr>
                                                                                                            <td align="center" width="5%"><strong>&nbsp;</strong></td>
                                                                                                            <td align="center" width="5%"><strong>&nbsp;</strong></td>

                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>

                                                                                                            <td align="center" width="50%"><strong>
                                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RiZhiNeiRong%>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="10%"><strong>
                                                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong></td>
                                                                                                            <td align="center" width="20%"><strong>
                                                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong></td>
                                                                                                        </tr>
                                                                                                    </table>
                                                                                                </td>
                                                                                                <td align="right" width="6">
                                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <table cellpadding="4" cellspacing="0" width="100%">
                                                                                            <tr>
                                                                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                    <asp:Button ID="BT_Update" runat="server" CommandName="Update" CssClass="inpuUpdate" />
                                                                                                </td>
                                                                                                <td class="tdLeft" style="width: 5%; text-align: center;">
                                                                                                    <asp:Button ID="BT_Delete" runat="server" CommandName="Delete" CssClass="inpuDelete" OnClientClick="return confirm(getDeleteMsgByLangCode())" />

                                                                                                </td>
                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">
                                                                                                    <asp:Label ID="LB_ID" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ID") %>'></asp:Label>
                                                                                                </td>

                                                                                                <td class="tdLeft" style="width: 50%; text-align: left;">

                                                                                                    <%#DataBinder.Eval(Container.DataItem, "LogDetail")%>
                                                                                                </td>

                                                                                                <td class="tdLeft" style="width: 10%; text-align: center;">

                                                                                                    <%#DataBinder.Eval(Container.DataItem, "Progress")%>%
                                                                                                </td>

                                                                                                <td class="tdLeft" style="width: 20%; text-align: center;">

                                                                                                    <%#DataBinder.Eval(Container.DataItem, "WorkTime")%>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </ItemTemplate>
                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                </asp:DataList>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ContentTemplate>
                                                            </cc2:TabPanel>
                                                            <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="关键目标" TabIndex="1">
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,GuanJianMuBiao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ContentTemplate>
                                                                    <table style="width: 98%; text-align: left;">
                                                                        <tr>
                                                                            <td>
                                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                    width="100%">
                                                                                    <tr>
                                                                                        <td width="7">
                                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                        <td>
                                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td align="center" width="10%"><strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                                    <td align="center" width="70%"><strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MuBiao %>"></asp:Label></strong></td>
                                                                                                    <td align="center" width="20%"><strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JinDu %>"></asp:Label></strong></td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td align="right" width="6">
                                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                    OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" Width="100%">
                                                                                    <Columns>
                                                                                         <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="Target" HeaderText="目标">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="70%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:TemplateColumn HeaderText="进度">
                                                                                            <ItemTemplate>
                                                                                                <asp:TextBox ID="NB_TargetProgress" Text='<%# DataBinder.Eval(Container.DataItem,"Progress")%>' Width="50px" runat="server"></asp:TextBox>%
                                                                                                
                                                                                                <asp:Button ID="BT_UpdateTarget" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />

                                                                                            </ItemTemplate>
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
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
                                                                </ContentTemplate>
                                                            </cc2:TabPanel>
                                                        </cc2:TabContainer>
                                                    </td>
                                                    <td width="35%" valign="top">
                                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                            <tr>
                                                                <td align="left">
                                                                    <i>
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,LingDaoPingHe%>"></asp:Label>：</i>
                                                                    <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Height="1px"
                                                                        Width="100%">
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <HeaderTemplate>
                                                                        </HeaderTemplate>
                                                                        <ItemTemplate>
                                                                            <table cellpadding="4" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td class="tdLeft" align="left" style="color: Blue; font-style: italic;">
                                                                                        <%#DataBinder.Eval(Container.DataItem, "LeaderName")%>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,PingFen%>"></asp:Label>：
                                                                                    <%#DataBinder.Eval(Container.DataItem, "Scoring")%>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                                                    <%#DataBinder.Eval(Container.DataItem, "ReviewTime","{0:yyyy/MM/dd hh:MM:ss}")%>
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td class="tdRight" style="text-align: left;">
                                                                                        <%#DataBinder.Eval(Container.DataItem, "Review")%>
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
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label33" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0"  style="width: 100%;">

                                <tr>
                                    <td class="formItemBgStyle" style="width: 90px; text-align: right;">
                                        <asp:Label ID="LB_ID" runat="server" Visible ="false"></asp:Label>
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <CKEditor:CKEditorControl ID="HE_LogDetail" runat="server" Width="100%" Height="200px" Visible="false" /><CKEditor:CKEditorControl runat="server" ID="HT_LogDetail" Width="100%" Height="200px" Visible="False" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 90px; text-align: right;">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_PlanProgress" runat="server" MaxAmount="100" MinAmount="0"
                                            OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="50px">0</NickLee:NumberBox>% </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
