<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWPQMWeldProQuaAll.aspx.cs" Inherits="TTWPQMWeldProQuaAll" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>完善工艺信息</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            
        });
    </script>
    <style type="text/css">
        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 170px;
        }

        .auto-style5 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 111px;
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WanShanGongYiXinXi%>"></asp:Label></td>
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
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,PingDingBianMa%>"></asp:Label> 
                                        </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_Code" runat="server" CssClass="shuru" Width="120px" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BeiKouXingShi%>"></asp:Label>
                                        </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_GrooveForm" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,HouReWenDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterHotTemp" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HouReShiJian%>"></asp:Label>  </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_AfterHotTime" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BaiDongLeiXing%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                               <asp:DropDownList ID="DL_SwingType" runat="server">
                                                <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>"/>
                                                <asp:ListItem Value="摆动焊" Text="<%$ Resources:lang,BaiDongHan%>"/>
                                                <asp:ListItem Value="不摆动焊" Text="<%$ Resources:lang,BuBaiDongHan%>"/>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaiDongCanShu%>"></asp:Label> ：</td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_OscillationParameters" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LengQueFangFa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_CoolingMethod" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CunDianCaiLiaoJiGuiGe%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_PadMaterialSpec" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiXieHuaChengDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_MechanizationDegree" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ReChuLiLuXingHao%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_HeatTreFurnModel" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,RuLuWenDuLiLun%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_BoilingTemp" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShenWenShuDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_HeatingSpeed" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JianWenShuDu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_CoolingSpeed" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PWPSBiaoZhunHao%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_PWPSStandardNo" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">α：</td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_Value_1" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">δ：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_2" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">b：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_3" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">p：</td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_Value_4" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">H：</td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_Value_5" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">β：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_6" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">R：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Value_7" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,LeiBieZhuHao%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:DropDownList ID="DL_CategoryGroups" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HanJieFangXiang%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:DropDownList ID="DL_WeldingDirection" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JiaReFangShi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:DropDownList ID="DL_HeatingMode" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;" rowspan="2">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HanJieJieTouJianTu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3" rowspan="2">
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
                                                    <asp:PostBackTrigger ControlID="BT_Update" />
                                                </Triggers>
                                            </asp:UpdatePanel>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,RenWuShuHouDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_SpecificationThickness" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,RenWuShuZhiJing%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_SpecificationDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ReChuLiFangFa%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_HeatTreatmentMethod" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,HanCaiBiaoZhun%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:DropDownList ID="DL_WeldingMaterialStandard" runat="server" DataTextField="Description" DataValueField="ID">
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DaoHanLeiXing%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                           <asp:DropDownList ID="DL_PassWeldingType" runat="server">
                                                <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>"/>
                                                <asp:ListItem Value="单道焊" Text="<%$ Resources:lang,DanDaoHan%>"/>
                                                <asp:ListItem Value="多道焊" Text="<%$ Resources:lang,DuoDaoHan%>"/>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DianLiuZhongLei%>"></asp:Label> ：</td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_CurrentType" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JiXing%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Polarity" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DanWeiMingCheng%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_EntityName" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,SiHanLeiXing%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                             <asp:DropDownList ID="DL_WireWeldingType" runat="server">
                                                <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>"/>
                                                <asp:ListItem Value="单丝焊" Text="<%$ Resources:lang,DanSiHan%>"/>
                                                <asp:ListItem Value="多丝焊" Text="<%$ Resources:lang,DuoSiHan%>"/>
                                            </asp:DropDownList>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiaoHanFengWeiZhi%>"></asp:Label>  </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_FilletWeldPosition" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,LiHanHanJieFangXiang%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_VerticalWeldingDirection" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YuReShiJian%>"></asp:Label>  </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_WarmUpTime" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CheWenFangFa%>"></asp:Label> </td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_TempMeasureMethod" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,HanSiSongJingShuDu%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WireSpeed" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,HanJieDianHuZhongLei%>"></asp:Label></td>
                                        <td align="left" class="formItemBgStyle">
                                             <asp:DropDownList ID="DL_WeldingArcType" runat="server">
                                                <asp:ListItem Value="请选择" Text="<%$ Resources:lang,QingXuanZe%>"/>
                                                <asp:ListItem Value="喷射弧" Text="<%$ Resources:lang,PengSheHu%>"/>
                                                <asp:ListItem Value="短路弧" Text="<%$ Resources:lang,DuanLuHu%>"/>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WuJiLeiXing%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_TunElecType" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WeiBuBaoQiTiZhongLei%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_TailProtectiveGas" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,WeiBuBaoHuQiTiHunHeBi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_TailProtectiveGasMixRatio" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WeiBuBaoHuQiTiLiu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_TailGasFlowRate" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px">
                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,WuJiZhiJing%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_TunElecDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="auto-style5">
                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BeiMianBaoHuQiTiZhongLei%>"></asp:Label></td>
                                        <td align="left" class="auto-style3">
                                            <asp:TextBox ID="TB_BackProtectiveGas" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BeiMianBaoHuQiTiHunHeBi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_BackProtectiveGasMixRatio" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,beiMianBaoHuQiTiLiuLiang%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_BackGasFlowRate" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;" rowspan="1">
                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,PengZuiZhiJing%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="1">
                                            <asp:TextBox ID="TB_NozzleDiameter" runat="server" CssClass="shuru"></asp:TextBox>
                                            <br />
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,HanQianQingLi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" rowspan="1" style="vertical-align: middle">
                                            <asp:TextBox ID="TB_CleanBefWelding" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ChengDaoJianQingLi%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_LayerClean" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle" colspan="1">
                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShiJianShuLiang%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle">
                                            <asp:TextBox ID="NB_NumberSpecimens" runat="server" CssClass="shuru"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; vertical-align: middle;" rowspan="1">
                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BeiMianQingGengFangFa%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_BackClearRootMethod" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                        <td align="right" class="formItemBgStyle">
                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,WuShongjianCheYaoQiu%>"></asp:Label> </td>
                                        <td align="left" class="formItemBgStyle" colspan="3">
                                            <asp:TextBox ID="TB_NondestructiveTestReq" runat="server" CssClass="shuru" Width="95%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right" class="formItemBgStyle" style="width: 150px; ">&nbsp;</td>
                                        <td align="left" class="formItemBgStyle" colspan="7">
                                            <asp:Button ID="BT_Update" runat="server" CssClass="inpu" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                            <asp:Label ID="lbl_WeldedJointDiagram" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
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
