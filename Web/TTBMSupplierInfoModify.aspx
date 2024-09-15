<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMSupplierInfoModify.aspx.cs" Inherits="TTBMSupplierInfoModify" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1180px;
            width: expression (document.body.clientWidth <= 1180? "1180px" : "auto" ));
        }

        .auto-style1 {
            font-size: medium;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 7%;
        }

        .auto-style4 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
        }

        .auto-style6 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
        }

        .auto-style7 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 7%;
        }

        .auto-style8 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 16%;
        }

        .auto-style9 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 14%;
        }

        .auto-style10 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 11%;
        }

        .auto-style11 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 9%;
        }
    </style>
    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            //disPostion = AssetListDivID.scrollTop;
        }

        function RestoreScroll() {
            //Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            //AssetListDivID.scrollTop = disPostion;
        }
    </script>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QiYeXinXi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_SupplierInfoID" runat="server" Visible="False"></asp:Label>
                                                &nbsp;
                                                <asp:Label ID="lbl_Code" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="middle" style="width: 100%; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" colspan="2">
                                                <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 98%; margin-top: 5px"
                                                    align="center">
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">大类：</td>
                                                        <td align="left" class="auto-style2">
                                                            <asp:TextBox ID="TB_SupplierBigType" Width="99%" runat="server" CssClass="shuru" Enabled="false"></asp:TextBox>
                                                            <%--  <asp:DropDownList ID="DL_SupplierBigType" DataValueField="Type" DataTextField="Type" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DL_SupplierBigType_SelectedIndexChanged">
                                                            </asp:DropDownList>--%>
                                                        </td>
                                                        <td style="text-align: left;" class="auto-style2">小类：</td>
                                                        <td align="left" colspan="3" class="auto-style2">
                                                            <asp:TextBox ID="TB_SupplierSmallType" Width="99%" runat="server" CssClass="shuru" Enabled="false"></asp:TextBox>
                                                            <%--<asp:DropDownList ID="DL_SupplierSmallType" DataValueField="Type" DataTextField="Type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SupplierSmallType_SelectedIndexChanged">
                                                            </asp:DropDownList>--%>

                                                        </td>
                                                        <td align="left" class="auto-style2">
                                                            <asp:Label ID="Label66" runat="server" Text="承包类型"></asp:Label>：</td>
                                                        <td align="left" class="auto-style2">
                                                            <asp:CheckBox ID="CB_IsEnginerringSupplier" Text="工程" Enabled="false" runat="server" />
                                                            &nbsp; &nbsp;
                                                            <asp:CheckBox ID="CB_IsInternationSupplier" Enabled="false" Text="国际" runat="server" />
                                                            &nbsp;
                                                            &nbsp;
                                                            <asp:CheckBox ID="CB_IsRetailSupplier" Enabled="false" Text="零售" runat="server" />
                                                            &nbsp;
                                                            &nbsp;
                                                            <asp:CheckBox ID="CB_IsStoreSupplier" Enabled="false" Text="门店" runat="server" />
                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QiYeBianMa%>"></asp:Label>
                                                            ： </td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_Code" runat="server" CssClass="shuru" Enabled="False"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span> </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QiYeMingCheng%>"></asp:Label>
                                                            ：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_Name" runat="server" CssClass="shuru"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span> </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QiYeJianCheng%>"></asp:Label>
                                                            ：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_CompanyFor" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QiYeXingZhi%>"></asp:Label>
                                                            ：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:DropDownList ID="DL_CompanyType" runat="server">
                                                                <asp:ListItem Text="<%$ Resources:lang,GuoQi%>" Value="国企" />
                                                                <asp:ListItem Text="<%$ Resources:lang,ShiYeDanWei%>" Value="事业单位" />
                                                                <asp:ListItem Text="<%$ Resources:lang,SiQi%>" Value="私企" />
                                                                <asp:ListItem Text="<%$ Resources:lang,WaiZiHeZi%>" Value="外资(合资)" />
                                                                <asp:ListItem Text="<%$ Resources:lang,GuFenZhi%>" Value="股份制" />
                                                                <asp:ListItem Text="<%$ Resources:lang,QiTa%>" Value="其它" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_PhoneNum" runat="server" CssClass="shuru"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>

                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_Fax" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_ZipCode" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,DianZiYouXiang%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:TextBox ID="TB_Email" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoRen%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_LegalRepresentative" runat="server" CssClass="shuru"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoRenJiShuZhiCheng%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_TechnicalTitles" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FaDingDaiBiaoRenDianHua%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_LegalTel" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ChengLiShiJian%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:TextBox ID="DLC_SetUpTime" runat="server" CssClass="shuru" ReadOnly="false"></asp:TextBox>
                                                            <cc1:CalendarExtender ID="DLC_SetUpTime_CalendarExtender" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_SetUpTime">
                                                            </cc1:CalendarExtender>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiShuFuZeRen%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_TechnicalDirector" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiShuFuZeRenJiShuZhiCheng%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_TechnicalTitles_T" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiShuFuZeRenDianHua%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_TechnicalTel" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YuanGongZongRenShu%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:TextBox ID="TB_EmployeesNum" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZiZhiZhengShu%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_QualificationCertificate" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YingYeZhiZhao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_BusinessLicense" runat="server" CssClass="shuru"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuJingLiRenShu%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_PMNumber" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GaoJiZhiChengRenYuan%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:TextBox ID="TB_STNumber" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuCeZiJin%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_RegisteredCapital" runat="server" CssClass="shuru"></asp:TextBox>
                                                            元
                                                            <span style="color: #ff0000">*</span>

                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_Bank" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhongJiZhiChengRenYuan%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_ITNumber" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChuJiZhiChengRenYuan%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:TextBox ID="TB_PTNumber" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9">
                                                            <asp:TextBox ID="TB_EinNo" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td class="auto-style10" style="text-align: left;">
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,KaiHuZhangHao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style4">
                                                            <asp:TextBox ID="TB_BankNo" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiGongRenYuan%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_MNumber" runat="server" CssClass="shuru">0</asp:TextBox>
                                                            人</td>
                                                        <td align="left" class="auto-style7">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style8">
                                                            <asp:DropDownList ID="DL_Status" runat="server" Enabled="False">
                                                                <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                <asp:ListItem Value="合格" Text="<%$ Resources:lang,HeGe%>" />
                                                                <asp:ListItem Value="不合格" Text="<%$ Resources:lang,BuHeGe%>" />
                                                                <asp:ListItem Value="归档" Text="<%$ Resources:lang,GuiDang%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left;" class="auto-style2" rowspan="2">
                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,GongHuoJingYing%>"></asp:Label><br />
                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>：</td>
                                                        <td colspan="3" align="left" class="formItemBgStyle" rowspan="2">
                                                            <asp:TextBox ID="TB_SupplyScope" runat="server" CssClass="shuru" Height="45px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FenBaoZhuanYe%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_SubcontractProfessional" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuCeDiZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_Address" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" rowspan="2" style="text-align: left;">
                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,QiYeZiZhi%>"></asp:Label><br />
                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,FanWei%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3" rowspan="2">
                                                            <asp:TextBox ID="TB_Qualification" runat="server" CssClass="shuru" Height="45px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,QiYeWangZhi%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_WebUrl" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TB_RecommendedUnits" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" style="text-align: left;">
                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShangNianDuGongSi%>"></asp:Label><br />
                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,RuWeiBianHao%>"></asp:Label>：</td>
                                                        <td align="left" class="auto-style9" colspan="1">
                                                            <asp:TextBox ID="TB_LastFinalistsNumber" runat="server" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                        <td align="left" class="auto-style10">
                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ShiFouZaiZhongShiYouHuoLanZhouShiHuaRuWei%>"></asp:Label>

                                                        </td>
                                                        <td align="left" class="formItemBgStyle" colspan="1">
                                                            <asp:DropDownList ID="DL_IsLand" runat="server">
                                                                <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                                                <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td align="left" class="auto-style11">
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <Upload:InputFile ID="InputFile1" runat="server" Width="400px" />
                                                                        <br />
                                                                        <div id="Div1">
                                                                            <Upload:ProgressBar ID="ProgressBar2" runat='server' Width="500px" Height="100px">
                                                                            </Upload:ProgressBar>
                                                                        </div>
                                                                    </div>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="BT_UpdateAA" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                            <asp:Repeater ID="RP_AccessoriesPath" runat="server">
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"AccessoriesPath") %>' target="_blank">
                                                                        <%# DataBinder.Eval(Container.DataItem,"Code") %>附件
                                                                    </a>
                                                                </ItemTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="auto-style2" align="left"></td>
                                                        <td align="left" class="formItemBgStyle" colspan="3">
                                                            <asp:Button ID="BT_UpdateAA" runat="server" CssClass="inpu" OnClick="BT_UpdateClaim_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        </td>
                                                        <td align="right" class="auto-style11">&nbsp;</td>
                                                        <td align="left" class="auto-style6">
                                                            <asp:TextBox ID="TB_PassWord" runat="server" CssClass="shuru" TextMode="Password" Visible="False"></asp:TextBox>
                                                        </td>
                                                        <td align="right" class="auto-style7">&nbsp;</td>
                                                        <td align="left" class="auto-style8">&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8;" valign="top">
                                                <table width="98%" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" colspan="2" style="height: 6px">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                        <asp:Button ID="BT_CreateLink" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateLink_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ShouJiHaoMa%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,DianZiYouJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">
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
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"/>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Position" HeaderText="职务">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="MobileNum" HeaderText="手机号码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="OfficePhone" HeaderText="办公电话">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Email" HeaderText="电子邮箱">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>

                                                            </table>
                                                            <br />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 50%; border-right: solid 1px #D8D8D8;" valign="top">
                                                <table width="98%" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="left" colspan="2" style="height: 6px">
                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                        <asp:Button ID="BT_CreateCer" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateCer_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                          
                                                                                            <td align="center" width="20%"><strong>
                                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="30%"><strong>
                                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,FaZhengJiGuan%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,FaZhengRiQi%>"></asp:Label></strong></td>
                                                                                            <td align="center"><strong>
                                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,FuJianXiaZai%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="30px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%">
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
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible ="false">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="CertificateNum" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                </asp:BoundColumn>
                                                                            
                                                                                <asp:BoundColumn DataField="LicenseAgency" HeaderText="发证机关">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ReleaseTime" HeaderText="发证日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                         
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="Attach" DataNavigateUrlFormatString="{0}" DataTextField="CertificateName" HeaderText="附件下载" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                                </asp:HyperLinkColumn>
                                                                            </Columns>

                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>
                                                                        <asp:Label ID="lbl_CerID" runat="server" Visible="False"></asp:Label>
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
                                </td>
                            </tr>
                        </table>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowLink"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label112" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：</td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_NameLink" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:DropDownList ID="DL_Gender" runat="server" Height="25px">
                                            <asp:ListItem>男</asp:ListItem>
                                            <asp:ListItem>女</asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Position" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShouJiHaoMa%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="TB_MobileNum" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_OfficePhone" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DianZiYouJian%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_EmailLink" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>
                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewLink" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewLink_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>



                    <div class="layui-layer layui-layer-iframe" id="popwindowCer"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label68" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">

                            <table class="formBgStyle" style="width: 100%;" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZhengShuBianHao%>"></asp:Label>：</td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_CertificateNum" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhengShuMingCheng%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="TB_CertificateName" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,FaZhengJiGuan%>"></asp:Label>：
                                    </td>
                                    <td style="text-align: left; height: 19px;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_LicenseAgency" runat="server" Width="110px" CssClass="shuru"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,FaZhengRiQi%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">
                                        <asp:TextBox ID="DLC_ReleaseTime" runat="server" Width="110px" ReadOnly="false" CssClass="shuru"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_ReleaseTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,FuJian%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;" colspan="3">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="400px" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_NewCer" />

                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewCer" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewCer_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
