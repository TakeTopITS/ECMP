<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWPQMWeldingRecord.aspx.cs" Inherits="TTWPQMWeldingRecord" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>焊接记录表管理</title>
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HanJieJiLuBiao%>"></asp:Label></td>
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
                                        <td align="right" style="width: 100px" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldProCode" runat="server" AutoPostBack="True" DataTextField="Code" DataValueField="Code" OnSelectedIndexChanged="DL_WeldProCode_SelectedIndexChanged">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" style="width: 130px" class="formItemBgStyle">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiBieZhuHao%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_CategoryGroups" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" style="width: 165px" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MuCaiGangHao%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_MaterialNo" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" style="width: 150px" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MuCaiGuiGe%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_MaterialSpecification" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HanJieFangFa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldingMethod" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HanCaiLeiBie%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldMaterialCategory" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiaReFangShi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_HeatingMode" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HanJieFangXiang%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WeldingDirection" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HuanJingWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_EnvironmentTemperature" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangDuiShiDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_RelativeHumidity" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,HanJieWeiZhi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_WeldingPosition" runat="server" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BeiMianQingGengFangFa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_BackClearRootMethod" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CheWenFangFa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_TempMeasureMethod" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YuReWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_PreheatingTemperature" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HouReWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterHotTemp" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HanJieDianLiu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_WeldingCurrent" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HanJieShuDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WeldingSpeed" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YuReShiJian%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WarmUpTime" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HouReShiJian%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterHotTime" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,HanJieDianYa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WeldingVoltage" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiangNengLiang%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_LineEnergy" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,WuJiLeiXing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TunElecType" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BaoHuQiTiZhongLei%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ProtectiveGas" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BaoHuQiTiHunHeHua%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ProGasMixRatio" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BaoHuQiTiLiuLiang%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ShieldingGasFlowRate" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,WuJiZhiJing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TunElecDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,WeiBuBaoHuQiTiZhongLei%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TailProtectiveGas" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WeiBuBaoHuQiTiHunHeBi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TailProtectiveGasMixRatio" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,WeiBuBaoHuQiTiLiuLiang%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TailGasFlowRate" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,PengZuiZhiJing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_NozzleDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BeiMianBaoHuQiTiZhongLei%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_BackProtectiveGas" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BeiMianBaoHuQITiHunHeBi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_BackProtectiveGasMixRatio" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BeiMianBaoHuQiTiLiuLiang%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_BackGasFlowRate" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;" rowspan="2">
                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,HanSiXingHaoPaiHaoGuiGe%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_WireType" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_WireBrand" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_WireSpe" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                            <br />
                                        </td>
                                        <td align="right" class="formItemBgStyle" rowspan="1" style="vertical-align: middle">
                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DianLiuZhongLei%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_CurrentType" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle" colspan="1">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ChenDaoJianWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_LayerTemperature" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_WireTypeBrandSpe" runat="server" CssClass="shuru" Width="95%" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,HanSiShongJingShuDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_WireSpeed" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DaoDianZuiZhiGongJianJuLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ConductiveMouthArtifacts" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;" rowspan="2">
                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HanTiaoXingHaoPaiHaoGuiGe%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_ElecType" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_ElecBrand" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_ElecSpe" runat="server" DataTextField="Description" DataValueField="ID" >
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,HanQianQingLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_CleanBefWelding" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ChenDaoJianQingLi%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_LayerClean" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_ElecTypeBrandSpe" runat="server" CssClass="shuru" Width="95%" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle" rowspan="2" style="vertical-align: middle">
                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BeiKouJianTu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3" rowspan="2" style="vertical-align: middle">
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <div>
                                                        <Upload:InputFile ID="AttachFile" runat="server" Width="500px" />
                                                        <br />
                                                        <div id="ProgressBar">
                                                            <Upload:ProgressBar ID="ProgressBar1" runat='server' Width="500px" Height="100px">
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
                                        <td align="right" class="formItemBgStyle" style="width: 150px" rowspan="2">
                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,HanJiXingHaoPaiHaoGuiGe%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_FluxType" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_FluxBrand" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            <asp:DropDownList ID="DL_FluxSpe" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_FluxTypeBrandSpe" runat="server" CssClass="shuru" Width="95%" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,TuBiaoShuoMing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_WeldingFormDiagram" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
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
                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LeiBieZhuHao%>"></asp:Label><asp:DropDownList ID="DL_CategoryGroups1" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp; <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,HanJieFangFa%>"></asp:Label> <asp:DropDownList ID="DL_WeldingMethod1" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp; <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JiaReFangShi%>"></asp:Label>  <asp:DropDownList ID="DL_HeatingMode1" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                            &nbsp;&nbsp; <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,HanJieJiLuXingXi%>"></asp:Label><asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="2" cellspacing="0" class="formBgStyle" width="95%">
                                    <tr>
                                        <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp;<asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,HanJieJiLuLieBiao%>"></asp:Label> ：</td>
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
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,HanJieGongYiPingDing%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,LeiBieZhuHao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,MuCaiGangHao%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,MuCaiGuiGe%>"></asp:Label> </strong></td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,HanJieFangFa%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JiaReFangShi%>"></asp:Label> </strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BoKouJianTu%>"></asp:Label> </strong></td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,BiaoTuShuoMing%>"></asp:Label> </strong></td>
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
                                                    <asp:BoundColumn DataField="CategoryGroups" HeaderText="类别组号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="MaterialNo" HeaderText="母材钢号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="MaterialSpecification" HeaderText="母材规格">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="WeldingMethod" HeaderText="焊接方法">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="HeatingMode" HeaderText="加热方式">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="GrooveDiagramPath" DataNavigateUrlFormatString="{0}" DataTextField="WeldProCode" HeaderText="坡口简图" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="WeldingFormDiagram" HeaderText="表图说明">
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
