<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSupplierMember.aspx.cs" Inherits="TTWZSupplierMember" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>第三方帐号管理</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView").style.height = document.documentElement.clientHeight + "px";
        }

    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0">
                        <tr>
                            <td>
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
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShangZhangHaoGuanLi%>"></asp:Label>
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
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td style="border-right: solid 1px #D8D8D8; width: 18%" valign="top" align="left">
                                                        <div id="Div_TreeView" style="overflow: auto; height: 800px;">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" ShowLines="True"
                                                                OnSelectedNodeChanged="TreeView1_SelectedNodeChanged">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                        </div>
                                                    </td>
                                                    <td align="left" style="width: 48%">
                                                        <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                                            cellspacing="0">
                                                            <tr>
                                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_UserCode" Width="120px" runat="server" Enabled="false"></asp:TextBox>
                                                                    &nbsp;<span style="color: #ff0000">*</span>
                                                                </td>
                                                                <td style="text-align: left;" width="200px" rowspan="6" class="formItemBgStyle">
                                                                    <asp:Image ID="IM_MemberPhoto" runat="server" Height="240px" Width="199px" AlternateText="员工照片" />

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_UserName" Width="120px" runat="server"></asp:TextBox>
                                                                    &nbsp;<span style="color: #ff0000">*</span>

                                                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Gender" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                        <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Age" runat="server" Precision="0" Width="50px" OnBlur=""
                                                                        OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Password" runat="server" Width="120px"></asp:TextBox>
                                                                    <cc1:PasswordStrength ID="TB_Password_PasswordStrength" runat="server" Enabled="True"
                                                                        TargetControlID="TB_Password">
                                                                    </cc1:PasswordStrength>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_Duty" runat="server" Width="120px"></asp:TextBox>
                                                                    &nbsp;<span style="color: #ff0000">*</span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Department" runat="server" DataTextField="DepartName"
                                                                        DataValueField="DepartCode" CssClass="DDList">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:FileUpload ID="FUP_File" runat="server" Width="99%" />
                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:PostBackTrigger ControlID="BT_UploadPhoto"></asp:PostBackTrigger>
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>
                                                                    <asp:Button ID="BT_UploadPhoto" runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_UploadPhoto_Click"
                                                                        CssClass="inpu" Enabled="False" />
                                                                    &nbsp;
                                                                    <asp:Button ID="BT_TakeUserPhoto" runat="server" CssClass="inpu"
                                                                        Enabled="False" OnClick="BT_TakeUserPhoto_Click" Text="<%$ Resources:lang,PaiZhao%>" />

                                                                    <cc1:ModalPopupExtender ID="BT_TakeUserPhoto_ModalPopupExtender" runat="server"
                                                                        BackgroundCssClass="modalBackground" Y="150" CancelControlID="IMBT_Close"
                                                                        DynamicServicePath="" Enabled="True" PopupControlID="Panel2"
                                                                        TargetControlID="BT_TakeUserPhoto">
                                                                    </cc1:ModalPopupExtender>
                                                                    &nbsp;&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZiBuMen%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_ChildDepartment" runat="server" Width="120px"></asp:TextBox>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Button ID="BT_DeletePhoto" runat="server" CssClass="inpu"
                                                                        Enabled="False" OnClick="BT_DeletePhoto_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_OfficePhone" runat="server" Width="120px"></asp:TextBox>
                                                                </td>
                                                                <td class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_MobilePhone" runat="server" Width="120px"></asp:TextBox>
                                                                    &nbsp;<span style="color: #ff0000">*</span>
                                                                </td>
                                                                <td style="height: 28px; text-align: left;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">E_Mail：
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_EMail" runat="server" Width="120px"></asp:TextBox>
                                                                    &nbsp;<span style="color: #ff0000">*</span>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 23px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>：
                                                                </td>
                                                                <td style="height: 23px" class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_WorkScope" runat="server" Height="73px" TextMode="MultiLine"
                                                                        Width="120px"></asp:TextBox>
                                                                </td>
                                                                <td style="height: 23px" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: right; width: 100px;">
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShengFengZhengHao %>"></asp:Label></td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_IDCard" runat="server" Width="97%"></asp:TextBox></td>
                                                                <td style="height: 23px" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YongGongLeiXing%>"></asp:Label>：</td>
                                                                <td style="text-align: left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>：
                                                                </td>
                                                                <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:TextBox ID="DLC_JoinDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                        runat="server" TargetControlID="DLC_JoinDate">
                                                                    </ajaxToolkit:CalendarExtender>
                                                                </td>
                                                                <td style="height: 12px; text-align: left;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DL_UserType" Enabled="false" runat="server">
                                                                        <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                                                        <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                                        <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                                                        <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                                                        <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DropDownList1" Enabled="false" runat="server">
                                                                        <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                                                        <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DL_SystemMDIStyle" runat="server" Enabled="false">
                                                                        <asp:ListItem Value="左右下展" Text="<%$ Resources:lang,ZuoYouXiaZhan%>" />
                                                                        <asp:ListItem Value="上下联动" Text="<%$ Resources:lang,ShangXiaLianDong%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,JieMianYuYan%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true"></asp:DropDownList></td>

                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KeDengLuSheBei%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DL_AllowDevice" runat="server"  Enabled="false">
                                                                        <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>" />
                                                                        <asp:ListItem Value="PC" Text="<%$ Resources:lang,DianNao%>" />
                                                                        <asp:ListItem Value="MOBILE" Text="<%$ Resources:lang,YiDongSheBei%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:TextBox ID="TB_RefUserCode" runat="server" Width="120px"></asp:TextBox>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr style="display: none;">
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RTXZhangHu%>"></asp:Label>：</td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <asp:TextBox ID="TB_UserRTXCode" runat="server" Width="120px"></asp:TextBox>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                        PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" style="text-align: center" class="formItemBgStyle">
                                                                    <span style="color: red; font-size: 8pt;">
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,DWBTXXGSMMWKJBGBYLMM%>"></asp:Label></span>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" colspan="3" style="text-align: center">
                                                                    <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,KaiTong%>" />
                                                                    &nbsp;<asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                                                        Text="<%$ Resources:lang,JiHuo%>" Enabled="False" />
                                                                    &nbsp;<asp:Button ID="BT_Delete" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        Text="<%$ Resources:lang,ShanChu%>" />
                                                                    &nbsp;</td>
                                                            </tr>


                                                            <tr>
                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:HyperLink ID="HL_MemberPhoto" runat="server" Visible="False">[HL_MemberPhoto]</asp:HyperLink>
                                                                </td>
                                                            </tr>


                                                        </table>
                                                        <br />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td align="left" class="formItemBgStyle">
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="80px"></asp:TextBox>

                                                                </td>
                                                                <td align="left" class="formItemBgStyle" style="vertical-align: middle; text-align: center">
                                                                    <asp:Button ID="BT_Query" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Query_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="2">
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="25%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DengLuDaiMa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="25%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DengLuMiMa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,KaiTong%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiHuo%>"></asp:Label></strong>
                                                                            </td>

                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                            Width="100%" AllowPaging="True" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                            ShowHeader="false" CellPadding="1" ForeColor="#333333" GridLines="None">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="登录代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_SupplierID" runat="server" CommandName="click" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpuLong" Style="text-align: center;" Text='<%# DataBinder.Eval(Container.DataItem,"SupplierCode") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SupplierPass" HeaderText="登录密码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SupplierName" HeaderText="企业名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn HeaderText="开通">
                                                                    <ItemTemplate>
                                                                        <%# GetProjectMember(Eval("SupplierCode").ToString().Trim()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn HeaderText="激活">
                                                                    <ItemTemplate>
                                                                        <%# GetSystemActionUser(Eval("SupplierCode").ToString().Trim()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid>
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
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                        <%--  <div id="silverlightControlHost" class="modalPopup-text" style="width: 100%; height: 100%; float: left;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 710px;" valign="top" align="left">
                                        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                                            width="710px" height="320px">
                                            <param name="source" value="ClientBin/TakeTopMakePhoto.xap" />
                                            <param name="onError" value="onSilverlightError" />
                                            <param name="background" value="white" />
                                            <param name="minRuntimeVersion" value="4.0.50826.0" />
                                            <param name="autoUpgrade" value="true" />
                                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight"
                                                    style="border-style: none" />
                                            </a>
                                        </object>
                                        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px; border: 0px"></iframe>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>--%>
                    </asp:Panel>
                    <br />
                    <asp:TextBox ID="TB_UserPhotoString" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SaveUserPhoto" runat="server" CssClass="inpuLong" OnClick="BT_SaveUserPhoto_Click"
                        Style="visibility: hidden" />
                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
