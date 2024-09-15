<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInforView.aspx.cs"
    Inherits="TTUserInforView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YongHuXinXi%>"></asp:Label>
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
                            <td style="padding-top: 5px; text-align: center;">
                                <table width="98%" cellpadding="0" cellspacing="0" align="center">
                                    <tr>
                                        <td align="left">
                                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" Width="100%" runat="server" ActiveTabIndex="0">
                                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="基本信息">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table class="formBgStyle" style="width: 650px; text-align: left;" cellpadding="3"
                                                            cellspacing="0">
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_UserCode" Width="220px" runat="server" /></td>
                                                                <td style="text-align: left;" width="40px" class="formItemBgStyle"><span style="color: #ff0000">* </td>
                                                                <td style="text-align: left;" width="220px" rowspan="8" class="formItemBgStyle">
                                                                    <asp:Image ID="IM_MemberPhoto" runat="server" Height="240px" Width="219px" AlternateText="员工照片" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_UserName" Width="220px" runat="server" /></td>
                                                                <td style="text-align: left;" class="formItemBgStyle"><span style="color: #ff0000">* </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label>
                                                                </td>
                                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Gender" runat="server" Enabled="false">
                                                                        <asp:ListItem Selected="True" Value="男"></asp:ListItem>
                                                                        <asp:ListItem Value="女" />
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label>
                                                                </td>
                                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Age" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label>
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiWu %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Duty" runat="server" Width="220px" /></td>
                                                                <td style="text-align: left;" class="formItemBgStyle"><span style="color: #ff0000">*</span> </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhiChen %>"></asp:Label></td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_JobTitle" runat="server" Width="220px" />
                                                                </td>
                                                                <td class="formItemBgStyle" style="text-align: left;">&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label>
                                                                </td>
                                                                <td colspan="2" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Department" runat="server" Width="220px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZiBuMen %>"></asp:Label></td>
                                                                <td colspan="2" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_ChildDepartment" runat="server" Width="220px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BanGongDianHua %>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_OfficePhone" runat="server" Width="220px" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_MobilePhone" runat="server" Width="220px" /></td>
                                                                <td style="height: 28px; text-align: Left;" class="formItemBgStyle"><span style="color: #ff0000">*</span> </td>
                                                                <td class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">E_Mail： </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_EMail" runat="server" Width="220px" /></td>
                                                                <td style="text-align: Left;" class="formItemBgStyle"><span style="color: #ff0000">*</span> </td>
                                                                <td class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 23px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongZuoFanWei %>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" style="height: 23px" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_WorkScope" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XingZhi %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DL_UserType" Enabled="False" runat="server">
                                                                        <asp:ListItem Value="INNER"></asp:ListItem>
                                                                        <asp:ListItem Value="OUTER"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle"></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_Status" runat="server" Enabled="false">
                                                                        <asp:ListItem Value="在职" />
                                                                        <asp:ListItem Value="离职" />
                                                                        <asp:ListItem Value="终止"></asp:ListItem>
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YongGongLeiXing %>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName" Enabled="false">
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JiaRuRiQi %>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="DLC_JoinDate" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CanKaoGongHao %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                                    <asp:Label ID="TB_RefUserCode" runat="server" Width="220px" /></td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">&#160; </td>
                                                            </tr>
                                                            <tr style ="display :none;">
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,RTXZhangHu %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                                    <asp:Label ID="TB_UserRTXCode" runat="server" Width="220px" /></td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShunXuHao %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">

                                                                    <asp:Label ID="NB_SortNumber" runat="server" Text="<%$ Resources:lang,ShunXuHao %>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">&#160; </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YongXuDengLuSeBei %>"></asp:Label></td>
                                                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                                    <asp:DropDownList ID="DL_AllowDevice" runat="server" Enabled="false">
                                                                        <asp:ListItem Value="ALL" />
                                                                        <asp:ListItem Value="PC" />
                                                                        <asp:ListItem Value="MOBILE" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="详细信息">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiangXiXinXi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table class="formBgStyle" style="width: 700px; text-align: left;" cellpadding="3"
                                                            cellspacing="0">
                                                            <tr>
                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_EnglishName" Width="220px" runat="server" /></td>
                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingZhu%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Nationality" Width="220px" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChuShengDi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_NativePlace" runat="server" /></td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,HuKouSuoZaiDi%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_HuKou" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JuZhuDi%>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Residency" Width="220px" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Address" runat="server" Width="99%" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShengRi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="DLC_BirthDay" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,NongLiShengRi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="DLC_LunarBirthday" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XueLi%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Degree" runat="server" /></td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuanYe%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Major" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BiYeXueXiao%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_GraduateSchool" runat="server" Style="width: 99%;" /></td>
                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,HunYinZhuangTai%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_MaritalStatus" runat="server" Enabled="false">
                                                                        <asp:ListItem Value="未婚" Text="<%$ Resources:lang,WeiHun%>" />
                                                                        <asp:ListItem Value="已婚" Text="<%$ Resources:lang,YiHun%>" />
                                                                    </asp:DropDownList></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShengFengZhengHao%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_IDCard" runat="server" /></td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XueXing%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_BloodType" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShengGao%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="NB_Height" runat="server" Text="<%$ Resources:lang,ShengGao%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Language" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,JingJiLianXiRen%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_UrgencyPerson" runat="server" /></td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,JingJiDianHua%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_UrgencyCall" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShaoRen%>"></asp:Label>J </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Introducer" runat="server" /></td>
                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieshaoRenBuMen%>"></asp:Label>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_IntroducerDepartment" Width="220px" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YuJieShaoRenGuanXi%>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_IntroducerRelation" runat="server" /></td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                </td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="TB_Comment" runat="server" /></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="工作经历">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GongZuoJingLi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; text-align: center;">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="8%" align="center"><strong>
                                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>
                                                                                            </strong></td>
                                                                                        <td width="17%" align="center"><strong>
                                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,GongZi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="15%" align="center"><strong>
                                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,LiZhiYuanYin%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label54" runat="server" TText="<%$ Resources:lang,ZhengMingRen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ZhengMingRenDianHua%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                        GridLines="None" Width="100%">
                                                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Salary" HeaderText="工资">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ResignReason" HeaderText="离职原因">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="renterence" HeaderText="证明人">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>

                                                                            <asp:BoundColumn DataField="renterenceCall" HeaderText="证明人电话">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                        </Columns>
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemStyle CssClass="itemStyle"></ItemStyle>
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="教育培训">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,JiaoYuPeiXun%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; text-align: left;">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="30%" align="center"><strong>
                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,XueXiaoMingChen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="25%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label>
                                                                                            </strong></td>
                                                                                        <td width="25%" align="center"><strong>
                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ZhengShu%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                        GridLines="None" Width="100%">
                                                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="School" HeaderText="学校名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Certificate" HeaderText="证书">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
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
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText=" 家庭成员">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,JiaTingChengYuan%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 100%; text-align: center;">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="8%" align="center"><strong>
                                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="12%" align="center"><strong>
                                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,ChenWei%>"></asp:Label>
                                                                                            </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="30%" align="center"><strong>
                                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="13%" align="center"><strong>
                                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                                                        GridLines="None" Width="100%">
                                                                        <AlternatingItemStyle BackColor="White"></AlternatingItemStyle>
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MemberName" HeaderText="姓名">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Relation" HeaderText="称谓">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="WorkAddress" HeaderText="地址">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PostCode" HeaderText="邮编">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                            </asp:BoundColumn>
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
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText=" 家庭成员">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,YiDongXinXi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 98%; text-align: left;">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="60%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>
                                                                                            </strong></td>
                                                                                        <td width="20%" align="center"><strong>
                                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                        ShowHeader="False" Width="100%">
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TransType" HeaderText="类型">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="60%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EffectDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    </asp:DataGrid></td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc1:TabPanel>
                                                <cc1:TabPanel ID="TabPanel7" runat="server" HeaderText=" 兼职信息">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,JianZhiXinXi%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <table style="width: 98%; text-align: left;">
                                                            <tr>
                                                                <td>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td width="10%" align="center"><strong>
                                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="30%" align="center"><strong>
                                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,JianZhiBuMen%>"></asp:Label>
                                                                                        </strong></td>
                                                                                        <td width="40%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,JianZhiZhiWu%>"></asp:Label>
                                                                                            </strong></td>
                                                                                        <td width="20%" align="center"><strong>
                                                                                            <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                                                                        </strong></td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                        ShowHeader="False" Width="100%">
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="DepartName" HeaderText="兼职部门">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Duty" HeaderText="兼职职务">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="EffectTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生效日期">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                                            </asp:BoundColumn>
                                                                        </Columns>
                                                                        <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                            Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    </asp:DataGrid></td>
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

