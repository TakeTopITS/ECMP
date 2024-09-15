<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemModuleSetForPage.aspx.cs" Inherits="TTSystemModuleSetForPage" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1500px;
            width: expression (document.body.clientWidth <= 1500? "1500px" : "auto" ));
        }

        input.bigcheck {
            height: 50px;
            width: 50px;
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
                                            <td align="left" width="245px">
                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <a href="TTSuperSystemModuleSet.aspx">
                                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></a>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YeMianMoZuSheDing%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>

                                            <td style="text-align: right; padding-top: 5px;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>：</td>
                                            <td align="left" style="width: 80px; padding-top: 5px;">
                                                <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged" Style="height: 22px;">
                                                </asp:DropDownList>
                                            </td>
                                            <td width="200px" align="left" style="padding-top: 2px;">
                                                <asp:Button ID="BT_CopyAllModuleForHomeLanguage" runat="server" CssClass="inpuLongest" OnClick="BT_CopyAllModuleForHomeLanguage_Click" Text="<%$ Resources:lang,CBYMZFZSCQTYYMZ%>" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" style="width: 200px; border-right: solid 1px #D8D8D8" border="1">
                                                <table width="100%">
                                                    <tr style="display: none;">
                                                        <td align="left">
                                                            <asp:DropDownList ID="DL_ForUserType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_ForUserType_SelectedIndexChanged">
                                                                <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBuYongHuYongMoZu%>" />
                                                                <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBuYongHuYongMoZu%>" />
                                                            </asp:DropDownList></td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Style="width: 200px; height: 100%;">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left" style="padding: 5px 5px 0px 5px;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td>
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" class="tdFullBorder" style="padding-left: 18px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MuZuSheZhi%>"></asp:Label>：<asp:Label ID="LB_Level" runat="server" Text="0" Visible="False"></asp:Label>
                                                                        <asp:Label ID="LB_OldModuleName" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_OldModuleType" runat="server" Visible="false"></asp:Label>
                                                                        <asp:Label ID="LB_OldParentModuleName" runat="server" Visible="false"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="tdBottom">
                                                                        <table style="width: 100%; margin-top: 5px; padding: 3px 0px 3px 0px;" class="tableBorder"
                                                                            cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td class="tdLeft3" style="width: 80px; text-align: right; background-color: #EFF3FB">
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FuMoKuai%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="tdLeft3" style="text-align: left;">
                                                                                    <asp:TextBox ID="TB_ParentModuleName" runat="server" Width="200px" ReadOnly="true"></asp:TextBox>
                                                                                    <cc2:ModalPopupExtender ID="TB_ParentModuleName_ModalPopupExtender" runat="server"
                                                                                        Enabled="True" TargetControlID="TB_ParentModuleName" PopupControlID="Panel1"
                                                                                        CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                                    </cc2:ModalPopupExtender>
                                                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                                                </td>

                                                                                <td style="width: 80px; text-align: right; background-color: #EFF3FB" class="tdLeft3">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="width: 80px; height: 20px; text-align: left;" class="tdRight3">
                                                                                    <asp:DropDownList ID="DL_ModuleType" runat="server">
                                                                                        <asp:ListItem Value="" Text="<%$ Resources:lang,QingXuanZe%>" />
                                                                                        <asp:ListItem Value="DIYWF" Text="<%$ Resources:lang,ZiDingYiLiuCheng%>" />
                                                                                        <asp:ListItem Value="DIYMO" Text="<%$ Resources:lang,ZiDingYiMoZu%>" />
                                                                                        <asp:ListItem Value="SYSTEM" Text="<%$ Resources:lang,XiTongMoZu%>" />
                                                                                        <asp:ListItem Value="APP" Text="<%$ Resources:lang,APPMoZu%>" />
                                                                                        <asp:ListItem Value="SITE" Text="<%$ Resources:lang,WangZhanMoZu%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="text-align: right;" class="tdLeft3" colspan="2">
                                                                                    <table width="100%">
                                                                                        <tr>
                                                                                            <td width="90px;" style="text-align: right; background-color: #EFF3FB">
                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MingChengZhongWen%>"></asp:Label></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TB_ModuleName" runat="server" Width="200px"></asp:TextBox></td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td width="90px;" style="text-align: right; background-color: #EFF3FB">
                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MingChengBenYu%>"></asp:Label></td>
                                                                                            <td align="left">
                                                                                                <asp:TextBox ID="TB_HomeModuleName" runat="server" Width="200px"></asp:TextBox>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td style="width: 80px; text-align: right; background-color: #EFF3FB" class="tdLeft3">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YeMian%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left; width: 300px;" class="tdRight3">
                                                                                    <asp:TextBox ID="TB_PageName" runat="server" Width="99%" Text="TakeTopPersonalSpace.aspx"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>

                                                                                <td style="text-align: right; background-color: #EFF3FB" class="tdLeft3">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KeYong%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="tdRight3">
                                                                                    <asp:DropDownList ID="DL_Visible" runat="server" AutoPostBack="true" Height="20px">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="tdLeft3" style="text-align: right; background-color: #EFF3FB">
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="tdRight3">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="0" ID="NB_SortNumber" runat="server" Precision="0" Width="40px">0</NickLee:NumberBox>
                                                                                </td>

                                                                                <td colspan="4" style="text-align: left;">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td style="text-align: left; background-color: #EFF3FB; padding-left: 10px;">
                                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,TuBiao%>"></asp:Label>：
                                                                                
                                                                                            </td>
                                                                                            <td style="background-color: grey;">
                                                                                                <asp:Image ID="IM_ModuleIcon" runat="server" Width="32px" Height="32px" ImageAlign="Left" />

                                                                                            </td>
                                                                                            <td width="20px"></td>
                                                                                            <td>
                                                                                                <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                                                    <ContentTemplate>
                                                                                                        <asp:FileUpload ID="FUP_File" runat="server" Width="200px" />&nbsp;
                                                                                            <asp:Button ID="BT_UploadModuleIcon"
                                                                                                runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_UploadModuleIcon_Click" CssClass="inpu" Enabled="False" />
                                                                                                        <asp:Button ID="BT_DeleteModuleIcon" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_DeleteModuleIcon_Click" />
                                                                                                        <asp:Label ID="Label39" runat="server" Text="PX:32*32"></asp:Label>
                                                                                                    </ContentTemplate>
                                                                                                    <Triggers>
                                                                                                        <asp:PostBackTrigger ControlID="BT_UploadModuleIcon"></asp:PostBackTrigger>
                                                                                                    </Triggers>
                                                                                                </asp:UpdatePanel>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="center" class="tdRight3"></td>
                                                                                <td align="left" colspan="5" class="tdRight3">
                                                                                    <asp:Button ID="BT_AddChildModule" runat="server"
                                                                                        Text="<%$ Resources:lang,XinZengZiMoZu%>" OnClick="BT_AddChildModule_Click" />
                                                                                    &nbsp;<asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" Enabled="false" Text="<%$ Resources:lang,BaoCun%>" />
                                                                                    &nbsp;<asp:Button ID="BT_Delete" runat="server" Text="<%$ Resources:lang,ShanChu%>" Enabled="false" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left;">
                                                                        <asp:Label ID="LB_SelectedModuleName" runat="server" Style="font-weight: 700"></asp:Label>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZiMoZuLieBiao%>"></asp:Label>(<asp:Label ID="LB_ModuleNumber" runat="server"></asp:Label>)：
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%">
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
                                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,MoKuaiMingCheng%>">(Home)</asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="25%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuanLianYeMian%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FuMoKuai%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KeYong%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center" width="5%">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <strong>&nbsp;</strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False"
                                                                            ShowHeader="false" Height="1px"
                                                                            Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ModuleName" HeaderText="模块名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="模块名称（本语）">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="TB_HomeModuleName" runat="server" Width="100%"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="PageName" HeaderText="关联页面">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ParentModule" HeaderText="父模块">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="顺序">
                                                                                    <ItemTemplate>
                                                                                        <asp:TextBox ID="TB_SortNumber" runat="server" Width="40px" Text="0"></asp:TextBox>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn HeaderText="可用">
                                                                                    <ItemTemplate>
                                                                                        <asp:CheckBox ID="CB_ModuleVisible" runat="server" />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="LangCode" HeaderText="语言">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="UserType" HeaderText="用户">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                    <ItemTemplate>
                                                                                        <div style="background-color: grey;">
                                                                                            <asp:Image ID="IM_ModuleIcon" runat="server" ImageUrl='<%# DataBinder.Eval(Container.DataItem,"IconURL") %>' />
                                                                                        </div>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateColumn>
                                                                            </Columns>

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%;" align="center">
                                                                        <br />
                                                                        <asp:Button ID="BT_ModuleSave" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" Enabled="false" OnClick="BT_ModuleSave_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:Label ID="LB_ErrorMsg" runat="server"></asp:Label>
                                                            <br />
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
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 40%; width: 175px;">
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
