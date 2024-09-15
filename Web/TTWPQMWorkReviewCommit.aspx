<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWPQMWorkReviewCommit.aspx.cs" Inherits="TTWPQMWorkReviewCommit" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>工评任务书</title>
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
                    <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongPingRenWuShu%>"></asp:Label></td>
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
                            <td align="center" style="padding-top: 5px;">
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                    <tr>
                                        <td align="right" style="width: 150px" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label>
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldProCode" runat="server" AutoPostBack="True" DataTextField="Code" DataValueField="Code" OnSelectedIndexChanged="DL_WeldProCode_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RenWuShuHouDu%>"></asp:Label>
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_SpecificationThickness" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RenWuShuZhiJing%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_SpecificationDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,RenWuShuCunDian%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_SpecificationPad" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">α=°：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_1" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">δ=：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_2" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">b =：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_3" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">p =：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_4" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">H =：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_5" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">β=°：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_6" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">R =：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_7" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JingJianFuShiShiYan%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_IntergranularCorrTest" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,RTJianCheBiLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_RTInsProportion" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,RTHeGeJiBie%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_RTQualifiedLevel" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,RTPingDingBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_RTEvaluationCriteria" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MTJianCheBiLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_MTInsProportion" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MTHeGeJiBie%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_MTQualifiedLevel" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MTPingDingBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_MTEvaluationCriteria" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PTJianCheBiLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_PTInsProportion" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,PTHeGeJiBie%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PTQualifiedLevel" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PTPingDingBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_PTEvaluationCriteria" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,UTJianCheBiLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_UTInsProportion" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,UTHeGeJiBie%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_UTQualifiedLevel" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,UTPingDingBiaoZhun%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_UTEvaluationCriteria" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,PingDingYongTu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_EvaluationPurposes" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JianYanYaoQiuQiTa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_SpecificationOtherReq" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiXieXingNengYaoQiuRm%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_MechanicalPerReqRm" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JiXieXingNengYaoQiuRel%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_MechanicalPerReqRel" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiXieXingNengMianWan%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_MechanicalPerBend" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiXieXingNengBeiWan%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_MechanicalPerBack" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiXieXingNengCheWan%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_MechanicalPerScol" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ChongJiWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ShockTemperature" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChongJiFengHanQu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ImpactWeldZone" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ChongJiReYingXiangQu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ImpactHeatZone" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ChongJiMuCaiQu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ImpactMetalArea" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,YingDuHRB%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_HardnessHRB" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YingDuHRC%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_HardnessHRC" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YingDuHV%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_HardnessHV" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DuanKou%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Fracture" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YanBian%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Flattening" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ChuiDuan%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_HamBreak" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,HuaXueChengFengC%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_C" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HuaXueChengFengMn%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Mn" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,HuaXueChengFengSi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Si" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,HuaXueChengS%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_S" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HuaXueChengFengP%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_P" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,HuaXueChengFengC%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Cr" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HuaXueChengFengNi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Ni" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,HuaXueChengFengMo%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Mo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,HuaXueChengFengV%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_V" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,HuaXueChengFengTi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Ti" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,HuaXueChengFengNb%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChemicalComp_Nb" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,JingXiang%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Metallographic" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,HanHouReChuLiLeiBie%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterWeldingClass" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,HanHouReChuLiBaoWenShiJian%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterWeldingPreTime" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,HanHouReChuLiWenDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterWeldingTem" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,LengQueFangFa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_CoolingMethod" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,RenWuShuQiTa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_SpecificationOther" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;">
                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,RenWuShuBeiZhu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_Remark" runat="server" CssClass="shuru" Height="40px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle" style="vertical-align: middle">
                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,HanFengJieGouChiCunXiangTu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3" style="vertical-align: middle"><asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="500px" />
                                                    <br />
                                                    <div id="ProgressBar">
                                                        <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_Add" />
                                                <asp:PostBackTrigger ControlID="BT_Update" />
                                                <asp:PostBackTrigger ControlID="BT_Delete" />
                                            </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" style="width: 150px;" class="formItemBgStyle">
                                            <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                        <td align="left" class="formItemBgStyle" colspan="7">
                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />&nbsp;
                                        <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                            Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                            &nbsp;
                                        <asp:Button ID="BT_Delete" runat="server" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" CssClass="inpu"
                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                            <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="90%">
                                    <tr>
                                        <td align="left">
                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,LengQueFangFa%>"></asp:Label> <asp:DropDownList ID="DL_CoolingMethod1" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp;&nbsp;&nbsp; <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,GongPingRenWuShuXinXi%>"></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="95%">
                                    <tr>
                                        <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp; <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,GongPingRenWuShuLieBiao%>"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="formItemBgStyle">
                                            <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label> </strong></td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,RenWuShuHouDu%>"></asp:Label> </strong></td>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,RenWuShuZhiJing%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,RenWuShuCunDian%>"></asp:Label> </strong></td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,LengQueFangFa%>"></asp:Label> </strong></td>
                                                                <td width="14%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,RenWuShuQiTa%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,JieGouChiCunXiangTu%>"></asp:Label></strong></td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,RenWuShuBeiZhu%>"></asp:Label></strong></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                OnItemCommand="DataGrid2_ItemCommand" Width="98%" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                                <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="编号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                        </ItemTemplate>
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="WeldProCode" HeaderText="焊接工艺评定">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SpecificationThickness" HeaderText="任务书厚度">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SpecificationDiameter" HeaderText="任务书直径">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SpecificationPad" HeaderText="任务书衬垫">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CoolingMethod" HeaderText="冷却方法">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="SpecificationOther" HeaderText="任务书其它">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="DetailWeldSizePath" DataNavigateUrlFormatString="{0}" DataTextField="WeldProCode" HeaderText="结构尺寸详图" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="Remark" HeaderText="任务书备注">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>
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
