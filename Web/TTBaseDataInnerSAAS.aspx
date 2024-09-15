<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBaseDataInnerSAAS.aspx.cs" Inherits="TTBaseDataInnerSAAS" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>

    <style type="text/css">
        style1 {
            color: red;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" align="left" class="page_topbj">
                                    <table width="98%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" style="padding-top: 5px;">
                                                <table width="665" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiChuShuJu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                        <td style="text-align: left;">
                                                            <table>
                                                                <tr>
                                                                    <td>(
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="ddlLangSwitcher" runat="server" AutoPostBack="true" DataTextField="Language" DataValueField="LangCode" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td style="padding-top: 3px;">
                                                                        <asp:Button ID="BT_CopyForHomeLanguage" runat="server" CssClass="inpuLong" OnClick="BT_CopyForHomeLanguage_Click" Text="<%$ Resources:lang,CopyFromHomeLanguage%>" />
                                                                    </td>
                                                                    <td>)
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>

                                    <b>------&gt;<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuYiDai%>"></asp:Label><span style="color: red;">*</span><asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XKNBCXNZZNXZBNSCHXG%>"></asp:Label></b></td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 98%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="100%" style="padding: 5px 0px 0px 5px;" valign="top">
                                                <table style="width: 100%; height: 53px">
                                                    <tr>
                                                        <td style="width: 50%; height: 22px;" valign="top">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="30%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuanJianCi%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%-- <td width="14%" align="center">
                                                                                      <strong>
                                                                                          <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuJingLiKeGaiZhuangTai%>"></asp:Label></strong>
                                                                                  </td>
                                                                                  <td width="14%" align="center">
                                                                                      <strong>
                                                                                          <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,LXHZDFQLC%>"></asp:Label></strong>
                                                                                  </td>
                                                                                  <td width="14%" align="center">
                                                                                      <strong>
                                                                                          <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,XMJDSHDBJHYX%>"></asp:Label></strong>
                                                                                  </td>
                                                                                  <td width="14%" align="center">
                                                                                      <strong>
                                                                                          <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YXJHJDYJHYQR%>"></asp:Label></strong>
                                                                                  </td>--%>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,MuBan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid20" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                ShowHeader="false" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid20_ItemCommand"
                                                                PageSize="20" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="类型">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_ProjectType" runat="server" CssClass="inpu" Width="150px" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>' ToolTip='<%# DataBinder.Eval(Container.DataItem,"Type") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="KeyWord" HeaderText="关键词">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <%-- <asp:BoundColumn DataField="AllowPMChangeStatus" HeaderText="项目经理可改状态">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                      </asp:BoundColumn>
                                                                      <asp:BoundColumn DataField="AutoRunWFAfterMakeProject" HeaderText="立项后自动发起流程">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                      </asp:BoundColumn>
                                                                      <asp:BoundColumn DataField="ProgressByDetailImpact" HeaderText="进度受细节影响">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                      </asp:BoundColumn>

                                                                      <asp:BoundColumn DataField="PlanProgressNeedPlanerConfirm" HeaderText="影响计划进度要计划员确认">
                                                                          <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                      </asp:BoundColumn>--%>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                   <%-- <td>
                                                                                        <asp:HyperLink ID="HL_WorkflowWFTemplate" Text="<%$ Resources:lang,LiuCheng%>" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Type", "TTAttachWorkFlowTemplate.aspx?RelatedType=ProjectType&RelatedName={0}") %>'
                                                                                            Target="_blank"></asp:HyperLink></td>--%>
                                                                                    <td>
                                                                                        <asp:HyperLink ID="HL_DocumentTemplate" Text="<%$ Resources:lang,WenDang%>" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.Type", "TTProjectTypeRelatedDoc.aspx?RelatedType=ProjectType&RelatedName={0}") %>'
                                                                                            Target="_blank"></asp:HyperLink></td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td style="width: 50%; height: 22px; text-align: left; background-image: url('ImagesSkin/titleBG.jpg');">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="LB_SelectedProjectType" runat="server"></asp:Label>&nbsp;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DeZhuangTaiLieBiao%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    (Home) </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KongZhiDian%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center"><strong>
                                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" PageSize="20" ShowHeader="false" Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="编号">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_StatusID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Status" HeaderText="状态">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_HomeName" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle Font-Bold="True" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="顺序">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_SortNumber" runat="server" Width="50px" Text='<%# DataBinder.Eval(Container.DataItem,"SortNumber") %>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="ReviewControl" HeaderText="控制点">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                            </caption>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top" align="center">
                                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td align="left" class="formItemBgStyle" rowspan="2">
                                                                        <table style="width: 100%;">
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="TB_ProjectType" runat="server" Width="100px"></asp:TextBox></td>
                                                                                <td style="text-align: Right;">
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GuanJianCi%>"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:TextBox ID="TB_KeyWord" runat="server" Width="80px"></asp:TextBox></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:TextBox ID="TB_ProjectTypeSort" runat="server" Width="30px" Text="1"></asp:TextBox></td>
                                                                                <td style="display: none;">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YXXMJLGXMZT%>"></asp:Label></td>
                                                                                <td style="display: none;">
                                                                                    <asp:DropDownList ID="DL_AllowPMChangeStatus" runat="server">
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td colspan="3">
                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XMJDSXJYX%>"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_ImpactByDetail" runat="server">
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>

                                                                                <td colspan="3">
                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,RWJDYXJHJDYQRM%>"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_PlanProgressNeedPlanerConfirm" runat="server">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>

                                                                            </tr>
                                                                            <tr style="display: none;">
                                                                                <td colspan="3">
                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,LXHZDFQLC%>"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_AutoRunWFAfterMakeProject" runat="server">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td colspan="3" align="left">
                                                                                    <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,XMQDXYCJYHQRM%>"></asp:Label></td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_ProjectStartupNeedSupperConfirm" runat="server">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td colspan="8" style="text-align: center;" class="formItemBgStyle">
                                                                                    <asp:Button ID="TB_ProjectTypeNew" runat="server" CssClass="inpu" OnClick="TB_ProejctTypeNew_Click"
                                                                                        Text="<%$ Resources:lang,XinZeng%>" />
                                                                                    &nbsp;
                                                                                <asp:Button ID="BT_ProjectTypeUpdate" runat="server" Enabled="false" CssClass="inpu" OnClick="BT_ProjectTypeUpdate_Click"
                                                                                    Text="<%$ Resources:lang,BaoCun%>" />
                                                                                    &nbsp;
                                                                                <asp:Button ID="BT_ProjectTypeDelete" runat="server" Enabled="false" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_ProjectTypeDelete_Click"
                                                                                    Text="<%$ Resources:lang,ShanChu%>" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td align="center" class="formItemBgStyle">
                                                                        <center>
                                                                            <table>
                                                                                <tr>
                                                                                    <td align="center" class="formItemBgStyle">
                                                                                        <asp:Label ID="LB_ID" runat="server"> </asp:Label>
                                                                                    </td>
                                                                                    <td style="text-align: Right;" class="formItemBgStyle">
                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    </td>
                                                                                    <td align="left" class="formItemBgStyle">
                                                                                        <asp:TextBox ID="TB_ProjectStatus" runat="server"></asp:TextBox>
                                                                                    </td>
                                                                                    <td style="text-align: Right; display: none;" class="formItemBgStyle">
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KongZhiDian%>"></asp:Label></td>
                                                                                    <td align="left" class="formItemBgStyle" style="display: none;">
                                                                                        <asp:DropDownList ID="DL_ReviewControl" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ReviewControl_SelectedIndexChanged">
                                                                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                                                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                                                                        </asp:DropDownList>
                                                                                        <span style="color: red; font-size: 8pt;">（<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XuanZeKeGengGai%>"></asp:Label>）
                                                                                        </span>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </center>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center" class="formItemBgStyle">
                                                                        <asp:Button ID="BT_ProjectStatusNew" runat="server" CssClass="inpu" OnClick="BT_ProjectStatusNew_Click"
                                                                            Text="<%$ Resources:lang,XinZeng%>" />
                                                                        &nbsp;
                                                                     <asp:Button ID="BT_ProjectStatusDelete" runat="server" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_ProjectStatusDelete_Click"
                                                                         Text="<%$ Resources:lang,ShanChu%>" />
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                                     <asp:Button ID="BT_ProjectStatusSave" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_ProjectStatusSave_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" colspan="2" valign="top">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td colspan="6" style="height: 15px; background-color: buttonface"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="vertical-align: top;">
                                                            <strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,RenWuZhuangTaiSheDing%>"></asp:Label>
                                                            </strong><span style="color: red;">*</span>
                                                        </td>
                                                        <td align="center" style="vertical-align: top;">
                                                            <strong>
                                                                <asp:Label ID="Label325" runat="server" Text="<%$ Resources:lang,ActorGroup%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" style="vertical-align: top;">
                                                            <strong>
                                                                <asp:Label ID="Label304" runat="server" Text="<%$ Resources:lang,JiHuaZhuangTaiSheDing%>"></asp:Label>
                                                            </strong>
                                                        </td>
                                                        <td align="center" style="vertical-align: top;">&nbsp;</td>
                                                        <td align="center" style="vertical-align: top;">
                                                            <strong>
                                                                <asp:Label ID="Label322" runat="server" Text="<%$ Resources:lang,CeShiZhuangTai%>"></asp:Label>
                                                            </strong></td>
                                                        <td style="height: 19px">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="vertical-align: top;">
                                                            <table width="98%" border="0" cellpadding="" cellspacing="" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="" cellspacing="" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    (Home) </strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td rowspan="5" style="vertical-align: top; text-align: center;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="" cellspacing="" width="98%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="" cellspacing="" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label326" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label327" runat="server" Text="<%$ Resources:lang,MIngCheng%>"></asp:Label>
                                                                                    (Home) </strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label328" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label329" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid21" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false" Width="98%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_GroupName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GroupName") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_HomeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>' Width="100px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle Font-Bold="True" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataGrid>
                                                            <br />
                                                            <asp:Button ID="BT_ActorGroupSave" runat="server" CssClass="inpu" OnClick="BT_ActorGroupSave_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;
                                                        </td>
                                                        <td style="vertical-align: top; text-align: center;">
                                                            <table width="98%" border="0" cellpadding="" cellspacing="" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="" cellspacing="" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    (Home) </strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="10%"><strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%"><strong></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="vertical-align: top;">&nbsp;</td>
                                                        <td style="vertical-align: top; text-align: center;">
                                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="" cellspacing="" width="98%">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table border="0" cellpadding="" cellspacing="" width="100%">
                                                                            <tr>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="30%"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    (Home) </strong></td>
                                                                                <td align="center" width="25%"><strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="15%"><strong>
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                                                </strong></td>
                                                                                <td align="center" width="5%">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="6">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td style="height: 19px"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" style="vertical-align: top;" rowspan="4">
                                                            <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid6_ItemCommand" PageSize="2" ShowHeader="false" Width="98%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Status" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_HomeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>' Width="100px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle Font-Bold="True" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            <asp:TextBox ID="TB_TaskStatus" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                            <asp:TextBox ID="TB_TaskSortNumber" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <br />
                                                            <asp:Button ID="BT_TaskStatusNew" runat="server" CssClass="inpu" OnClick="BT_TaskStatusNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_TaskStatusDelete" runat="server" CssClass="inpu" OnClick="BT_TaskStatusDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_TaskStatusSave" runat="server" CssClass="inpu" OnClick="BT_TaskStatusSave_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                        <td style="vertical-align: top; text-align: center;" rowspan="4">
                                                            <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid8_ItemCommand" PageSize="2" ShowHeader="false" Width="98%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Status" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_HomeName" runat="server" Width="100px" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle Font-Bold="True" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="Label307" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            <asp:TextBox ID="TB_PlanStatus" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <asp:Label ID="Label308" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                            <asp:TextBox ID="TB_PlanStatusSort" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <br />
                                                            <asp:Button ID="BT_PlanStatusNew" runat="server" CssClass="inpu" OnClick="BT_PlanStatusNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_PlanStatusDelete" runat="server" CssClass="inpu" OnClick="BT_PlanStatusDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_PlanStatusSave" runat="server" CssClass="inpu" OnClick="BT_PlanStatusSave_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                        <td style="vertical-align: top;">&nbsp;</td>
                                                        <td style="vertical-align: top; text-align: center;" rowspan="4">
                                                            <asp:DataGrid ID="DataGrid16" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid16_ItemCommand" ShowHeader="false" Width="98%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Status" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"Status") %>' />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="TB_HomeName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"HomeName") %>' Width="100px"></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        <HeaderStyle Font-Bold="True" Width="25%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="MakeType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="Label323" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                            <asp:TextBox ID="TB_TestStatus" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <asp:Label ID="Label324" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>
                                                            <asp:TextBox ID="TB_TestStatusSort" runat="server" Width="101px"></asp:TextBox>
                                                            <br />
                                                            <br />
                                                            <asp:Button ID="BT_TestStatusNew" runat="server" CssClass="inpu" OnClick="BT_TestStatusNew_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_TestStatusDelete" runat="server" CssClass="inpu" OnClick="BT_TestStatusDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp;
                                                                    <asp:Button ID="BT_TestStatusSave" runat="server" CssClass="inpu" OnClick="BT_TestStatusSave_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                        <td rowspan="4">&nbsp;</td>
                                                    </tr>

                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>



