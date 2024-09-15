<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectCostAnalyseAndActiveStatusReport.aspx.cs" Inherits="TTProjectCostAnalyseAndActiveStatusReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="DayPilot" Namespace="DayPilot.Web.Ui" TagPrefix="DayPilot" %>
<%@ Register Assembly="DayPilot.MonthPicker" Namespace="DayPilot.Web.UI" TagPrefix="DayPilot" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <%-- <title>成本分析及动态表</title>--%>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">

    <script type="text/javascripx" src="js/My97DatePicker/WdatePicker.js"></script>
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
                    <center>

                        <div id="DIV_HidePrint">
                            <table>
                                <tr>
                                    <td width="190px" align="left" style="padding-top: 5px;">
                                        <DayPilot:MonthPicker ID="MonthPicker1" runat="server" YearEnd="2099" />
                                    </td>
                                    <td width="100px" style="padding-top: 5px;">
                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,chaxun%>" />
                                    </td>
                                    <td width="100px" align="center" style="padding-top: 5px;">
                                        <a href="#" onclick="document.getElementById('DIV_HidePrint').style.display='none';print();document.getElementById('DIV_HidePrint').style.display='block';">

                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                        </a>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="DIV_LargeTable" style="text-align: center; padding: 10px 10px 10px 10px; width: 2000px;">

                            <table border="0" cellpadding="0" cellspacing="0" width="2000" style="border-collapse: collapse;">
                                <tr>
                                    <td colspan="19" align="center" style="font-size: xx-large; padding-top: 10px; border: unset; height: 20px;">
                                        <br />
                                        项目成本分析及动态管理表
                                        <br />
                                        <br />
                                        <div style="font-size: medium;">
                                            （<asp:Label ID="LB_ReportYearMonth" runat="server"></asp:Label>
                                            )
                                           
                                        </div>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table border="1" cellpadding="0" cellspacing="0" width="2000" style="border-collapse: collapse;">
                                <tr class="xl69">
                                    <td class="auto-style499" colspan="2" style="text-align: center;" width="269">项目编码：<asp:Label ID="LB_ProjectCode" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style374" colspan="5" style="text-align: center;">项目名称：<asp:Label ID="LB_ProjectName" runat="server"></asp:Label>
                                    </td>
                                    <td colspan="3" class="auto-style262" width="216" align="center">日期：<asp:Label ID="LB_ReportTime" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style374" width="186" align="left" colspan="6">
                                        <asp:Label ID="LB_YearMonth" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td class="auto-style374" colspan="3"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style483" rowspan="2" width="100px">序号</td>
                                    <td class="xl190" rowspan="2" style="width: 144px" width="192">费用名称</td>
                                    <td class="xl272" colspan="10" style="border-left: none; width: 1541px" width="2052">总计值</td>
                                    <td class="xl269" colspan="3" style="border-left: none; width: 527px" width="701">当月增加合计值</td>
                                    <td class="xl275" colspan="4" style="width: 489px" width="652">&nbsp;</td>
                                </tr>
                                <tr height="45" style="height: 34.25px">
                                    <td class="auto-style500" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">合同预算价（一次）</td>
                                    <td class="auto-style501" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">税率</td>
                                    <td class="auto-style502" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">税金</td>
                                    <td class="auto-style502" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">合同预算价（税后）</td>
                                    <td class="auto-style502" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">审减率（一次）</td>
                                    <td class="auto-style503" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">合同预算价（二次）</td>
                                    <td class="auto-style504" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">税率</td>
                                    <td class="auto-style505" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">税金</td>
                                    <td class="auto-style506" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">合同预算价（税后）</td>
                                    <td class="auto-style507" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344">审减率（二次）</td>
                                    <td class="auto-style508" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">变化金额</td>
                                    <td class="auto-style509" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">税率</td>
                                    <td class="auto-style509" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">税金</td>
                                    <td class="auto-style510" colspan="4" width="652">备 注</td>
                                </tr>
                                <tr height="23" style="height: 17.5px">
                                    <td class="auto-style439" height="23" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">一、</td>
                                    <td class="xl238" style="border-top: none; border-left: none; width: 144px" width="192">总收入</td>
                                    <td class="xl142" style="border-top: none; width: 160px" width="213"></td>
                                    <td class="xl145" style="border-top: none; width: 148px" width="197"></td>
                                    <td class="xl145" style="border-top: none; width: 127px" width="169"></td>
                                    <td class="xl139" style="border-top: none; width: 127px" width="169"></td>
                                    <td class="xl167" style="width: 127px" width="169"></td>
                                    <td class="xl139" style="border-top: none; width: 162px" width="216"></td>
                                    <td class="xl145" style="border-top: none; width: 140px" width="186"></td>
                                    <td class="xl145" style="border-top: none; width: 149px" width="199"></td>
                                    <td class="xl139" style="border-top: none; width: 143px" width="190"></td>
                                    <td class="xl146" style="border-top: none; width: 258px" width="344"></td>
                                    <td class="xl124" style="width: 209px" width="279"></td>
                                    <td class="xl124" style="width: 159px" width="211"></td>
                                    <td class="xl124" style="width: 159px" width="211"></td>
                                    <td class="xl158" style="border-top: none; width: 157px" width="209"></td>
                                    <td class="xl159" style="border-top: none; width: 116px" width="155"></td>
                                    <td class="xl159" style="border-top: none; width: 116px" width="155"></td>
                                    <td class="xl125" style="border-top: none; width: 100px" width="133"></td>
                                </tr>
                                <tr class="xl117">
                                    <td class="auto-style31">1</td>
                                    <td class="auto-style32" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">初始合同额</td>
                                    <td class="auto-style33" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_InitialConstractAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style34" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_InitialConstractTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style35" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_InitialConstractTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style35" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_InitialConstractAfterTaxAmount" runat="server"></asp:Label></td>
                                    <td class="auto-style35" width="169"></td>
                                    <td class="auto-style36" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_InitialSecondConstractAmount" runat="server"></asp:Label></td>
                                    <td class="auto-style37" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_InitialSecondConstractTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style38" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_InitialSecondConstractTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style39" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_InitialSecondConstractAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style40" width="344"></td>
                                    <td class="auto-style41" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBianGenHouAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style42" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBianGenHouTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style42" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBianGenHouTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl160" width="209" align="left" colspan="4" rowspan="6">主要内容：
                                    <br />
                                        <asp:Label ID="LB_InitialConstractMainContent" runat="server"></asp:Label>
                                        <br />
                                        <br />
                                        异常描述：
                                    <br />
                                        <asp:Label ID="LB_InitialConstractException" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl117">
                                    <td class="auto-style43">2</td>
                                    <td class="auto-style44" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">合同增补额</td>
                                    <td class="auto-style45" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_SupplementConstractAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style46" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_SupplementConstractTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style55" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_SupplementConstractTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style55" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_SupplementConstractAfterTaxAmount" runat="server"></asp:Label></td>
                                    <td class="auto-style55" width="169">（本格无数据）</td>
                                    <td class="auto-style48" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_ConstractSecondSupplementAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style49" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_ConstractSecondSupplementTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style50" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_ConstractSecondSupplementTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style51" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_ConstractSecondSupplementAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style52" width="344">（本格无数据）</td>
                                    <td class="auto-style53" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBianGenJianQiShangYueHeTongAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style56" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBianGenJianQiShangYueHeTongTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style56" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBianGenJianQiShangYueHeTongTaxAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl115">
                                    <td class="auto-style484">3</td>
                                    <td class="auto-style58" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">各项奖励</td>
                                    <td class="auto-style59" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_RGSYGeXiangJiangLi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style60" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_gexiangjiangli_slv" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style61" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_gexiangjiangli_sj" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style61" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_gexiangjiangli_sh" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style61" width="169"></td>
                                    <td class="auto-style62" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_BuKeYiJianBiaoGeXiangJiangLiHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style63" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_BuKeYiJianBiaoGeXiangJiangLiHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style64" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_BuKeYiJianBiaoGeXiangJiangLiHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style65" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_BuKeYiJianBiaoGeXiangJiangLiHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style66" width="344"></td>
                                    <td class="auto-style67" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueGeXiangJiangLiQianQiShangYueGeXiangJiangLiHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style68" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueGeXiangJiangLiQianQiShangYueGeXiangJiangLiHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style68" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueGeXiangJiangLiQianQiShangYueGeXiangJiangLiHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl118">
                                    <td class="auto-style485">4</td>
                                    <td class="auto-style70" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">不可预见费</td>
                                    <td class="auto-style71" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_BuKeYuJianFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style72" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_BuKeYuJianFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_BuKeYuJianFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_BuKeYuJianFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" width="169"></td>
                                    <td class="auto-style74" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBuKeYiJianFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style75" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBuKeYiJianFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style76" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBuKeYiJianFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style77" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBuKeYiJianFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style78" width="344"></td>
                                    <td class="auto-style79" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBuKeYuJianFeiQianQiShangYueBuKeYuJianFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBuKeYuJianFeiQianQiShangYueBuKeYuJianFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueBuKeYuJianFeiQianQiShangYueBuKeYuJianFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl115">
                                    <td class="auto-style486">5</td>
                                    <td class="auto-style82" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">预计审减额</td>
                                    <td class="auto-style83" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_FirstYiJiShenJianE" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style84" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_FirstYiJiShenJianETaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style85" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_FirstYiJiShenJianETaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style85" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_FirstYiJiShenJianEAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style85" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_FirstYiJiShenJianRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style86" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBYiJiShenJianE" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style87" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBYiJiShenJianETaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style88" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBYiJiShenJianETaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style89" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBYiJiShenJianEAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style90" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuECiBiaoJiaFenLiBiaoBYiJiShenJianLu" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style91" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiShengJianEQianQiShangYueYiJiShengJianEAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiShengJianEQianQiShangYueYiJiShengJianETaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiShengJianEQianQiShangYueYiJiShengJianETaxAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl118" height="83" style="height: 62.25px">
                                    <td class="auto-style487">6</td>
                                    <td class="auto-style94" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">预计总收入合计</td>
                                    <td class="auto-style95" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_YiJiHeTongYiShuanJiaZongShouRuHeJi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style96" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_YiJiTaxRateZongShouRuHeJi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_YiJiTaxAmountZongShouRuHeJi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_YiJiHeTongYiShuanJiaAfterTaxZongShouRuHeJi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" width="169">（本格无数据）</td>
                                    <td class="auto-style98" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">
                                        <asp:Label ID="LB_SecondYiJiHeTongYiShuanJiaZongShouRuHeJi" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style99" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_SecondYiJiHeTongYiShuanJiaZongShouRuHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style100" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_SecondYiJiHeTongYiShuanJiaZongShouRuHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style101" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_SecondYiJiHeTongYiShuanJiaZongShouRuHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style102" width="344">（本格无数据）</td>
                                    <td class="auto-style103" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiZongShouRuQianQiShangYueZongShouRuAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiZongShouRuQianQiShangYueZongShouRuTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuHeTongBenYueYiJiZongShouRuQianQiShangYueZongShouRuTaxAmount" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl116">
                                    <td class="auto-style485">二、</td>
                                    <td class="auto-style70" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192">总成本</td>
                                    <td class="auto-style71" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">目标成本（一次）</td>
                                    <td class="auto-style72" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">税率</td>
                                    <td class="auto-style73" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">税金</td>
                                    <td class="auto-style73" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">税后目标值（一次）</td>
                                    <td class="auto-style110" colspan="2" width="385">总成本</td>
                                    <td class="auto-style75" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">目标成本（二次）</td>
                                    <td class="auto-style76" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">税率</td>
                                    <td class="auto-style77" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">税金</td>
                                    <td class="auto-style78" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">税后目标值（二次）</td>
                                    <td class="auto-style79" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279"><font class="font47">当月实际发生成本（税前）</font><font class="font48">（每个数据上做链接到这个数据来源的所有表单）</font> </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211"><font class="font47">累计实际发生成本（税前 ）</font><font class="font48">（每个数据上做链接到这个数据来源的所有表单））</font> </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">实际税金（当月） </td>
                                    <td class="auto-style117" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="209">实际税金累计</td>
                                    <td class="auto-style118" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">当月实际成本（税后）</td>
                                    <td class="auto-style118" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">当月实际成本（税后）累计 </td>
                                    <td class="auto-style118" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">当月实际成本税率</td>
                                </tr>
                                <tr class="xl116">
                                    <td class="auto-style458">1</td>
                                    <td class="auto-style119" style="border-left: none">人工费<ruby><font class="font60"><rt class="font60"></rt></font></ruby></td>
                                    <td class="auto-style3" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoRenGongFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style4" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoRenGongFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style120" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoRenGongFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style120" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoRenGongFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style120" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">1</td>
                                    <td class="auto-style6" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">直接人工费当月（）</td>
                                    <td class="auto-style7" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieRenGongFeiYongAmount" runat="server"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style8" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieRenGongFeiYongTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style9" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieRenGongFeiYongTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style10" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieRenGongFeiYongAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style11" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">人工费表-人工费合计<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenRenGongFeiHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style121" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenRenGongFeiHeJiSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style121" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenRenGongFeiHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style13" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenRenGongFeiHeJiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style122" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenRenGongFeiHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style122" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenRenGongFeiHeJiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style15" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenRenGongFeiHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl116">
                                    <td class="auto-style488" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">2</td>
                                    <td class="auto-style123" style="border-top: none; border-left: none">设备费</td>
                                    <td class="auto-style124" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoSheBeiFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style125" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoSheBeiFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoSheBeiFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoSheBeiFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">1.1</td>
                                    <td class="auto-style127" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>工资及各项保险</td>
                                    <td class="auto-style128" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiGeXiangBaoXianAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style129" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiGeXiangBaoXianTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style130" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiGeXiangBaoXianTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style131" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiGeXiangBaoXianAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style132" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">人工费表-工资保险<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengongzibaoxianHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style133" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengongzibaoxianHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style133" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengongzibaoxianHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style134" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengongzibaoxianHeJiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style135" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengongzibaoxianHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style135" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengongzibaoxianHeJiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style136" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengongzibaoxianHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style489" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">3</td>
                                    <td class="auto-style137" style="border-top: none; border-left: none">材料费</td>
                                    <td class="auto-style138" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoCaiLiaoFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style139" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoCaiLiaoFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoCaiLiaoFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoCaiLiaoFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">1.2</td>
                                    <td class="auto-style141" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>奖金(项目部人工费)</td>
                                    <td class="auto-style142" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiJiangJinAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style143" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiJiangJinTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style144" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiJiangJinTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style145" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiJiangJinAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style146" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">人工费表-各项奖励<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengexiangjiangliHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style147" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengexiangjiangliHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style147" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengexiangjiangliHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style148" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengexiangjiangliHeJiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style149" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBengexiangjiangliHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style149" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengexiangjiangliHeJiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style150" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBengexiangjiangliHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style490" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">4</td>
                                    <td class="auto-style151" style="border-top: none; border-left: none">机械使用费<ruby><font class="font60"><rt class="font60"></rt></font></ruby></td>
                                    <td class="auto-style152" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJiJieShiYongFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style153" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJiJieShiYongFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJiJieShiYongFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJiJieShiYongFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">1.3</td>
                                    <td class="auto-style155" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>其他补助津贴 </td>
                                    <td class="auto-style156" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiQiTaBuZhouAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style157" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiQiTaBuZhouTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style158" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiQiTaBuZhouTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style159" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiQiTaBuZhouAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style160" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">人工费表-其它补助<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitabuzhuHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitabuzhuHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitabuzhuHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style162" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitabuzhuHeJiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitabuzhuHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitabuzhuHeJiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style164" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitabuzhuHeJiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style485" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">5</td>
                                    <td class="auto-style165" style="border-top: none; border-left: none">分包成本</td>
                                    <td class="auto-style71" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoFenBaoChengBen" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style72" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoFenBaoChengBenTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoFenBaoChengBenTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoFenBaoChengBenAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style73" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">1.4</td>
                                    <td class="auto-style74" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">外出补助</td>
                                    <td class="auto-style75" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiWaiChuJinTieAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style76" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiWaiChuJinTieTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style77" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiWaiChuJinTieTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style78" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiWaiChuJinTieAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style79" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">人工费表-外出补助<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaichubuzhuHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaichubuzhuHeJiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style80" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaichubuzhuHeJiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style117" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaichubuzhuHeJiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style118" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaichubuzhuHeJiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style118" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaichubuzhuHeJiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style178" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaichubuzhuHeJiTaxRate" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style491" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">5.1</td>
                                    <td class="auto-style179" style="border-top: none; border-left: none">建筑工程</td>
                                    <td class="auto-style180" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJianZuoGongChengFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style181" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJianZuoGongChengFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJianZuoGongChengFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoJianZuoGongChengFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2</td>
                                    <td class="auto-style183" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">分包工程费（）</td>
                                    <td class="auto-style184" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenBaoGongZhengAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style185" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenBaoGongZhengTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style186" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenBaoGongZhengTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style187" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenBaoGongZhengAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style188" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-分包费合计<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfenbaofeihejiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style189" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfenbaofeihejiSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style189" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfenbaofeihejiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style190" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfenbaofeihejiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style191" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfenbaofeihejiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style191" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfenbaofeihejiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style192" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfenbaofeihejiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style490" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">5.2</td>
                                    <td class="auto-style151" style="border-top: none; border-left: none">安装工程</td>
                                    <td class="auto-style152" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoAnZhangGongChengFei" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style153" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoAnZhangGongChengFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoAnZhangGongChengFeiTaxAmount" runat="server"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoAnZhangGongChengFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">2.1</td>
                                    <td class="auto-style155" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">分包</td>
                                    <td class="auto-style156" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBaoAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style157" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBaoTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style158" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBaoTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style159" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBaoAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style160" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-分包1（税前）-分包2（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style162" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style164" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqlaowufenbao2sqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style487" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">6</td>
                                    <td class="auto-style193" style="border-top: none; border-left: none">其他费用</td>
                                    <td class="auto-style95" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoQiTaFeiYong" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style96" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoQiTaFeiYongTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoQiTaFeiYongTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoQiTaFeiYongAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.1.1</td>
                                    <td class="auto-style98" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">分包1</td>
                                    <td class="auto-style99" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao1Amount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style100" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao1TaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style101" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao1TaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style102" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao1AfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style103" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-分包1（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style194" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style195" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao1sqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style195" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style196" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao1sqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style491" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">7</td>
                                    <td class="auto-style179" style="border-top: none; border-left: none">增值税附加</td>
                                    <td class="auto-style180" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuFirstCiFengLiBiaoZengChiShuiFuJia" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style181" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197">&nbsp;</td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">&nbsp;</td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">&nbsp;</td>
                                    <td class="auto-style182" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.1.2</td>
                                    <td class="auto-style183" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">分包2</td>
                                    <td class="auto-style184" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao2Amount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style185" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao2TaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style186" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao2TaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style187" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiLaoWuFenBao2AfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style188" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-分包2（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao2sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style189" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao2sqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style189" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao2sqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style190" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao2sqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style191" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaowufenbao2sqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style191" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao2sqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style192" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaowufenbao2sqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style492" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="auto-style198" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="192"></td>
                                    <td class="auto-style199" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style200" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.2</td>
                                    <td class="auto-style202" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">专业分包</td>
                                    <td class="auto-style203" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiZhuanYeFenBaoAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style204" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiZhuanYeFenBaoTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style205" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiZhuanYeFenBaoTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style206" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiZhuanYeFenBaoAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style207" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-专业分包（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzhuanyefenbaosqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style208" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzhuanyefenbaosqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style208" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzhuanyefenbaosqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style209" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzhuanyefenbaosqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style210" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzhuanyefenbaosqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style210" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzhuanyefenbaosqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style211" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzhuanyefenbaosqTaxRate" runat="server"></asp:Label>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="auto-style212"></td>
                                    <td class="auto-style213" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style214" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style215" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style216" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style216" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style216" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.3</td>
                                    <td class="auto-style217" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">分公司自完</td>
                                    <td class="auto-style218" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenGongShiZiWanAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style219" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenGongShiZiWanTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style220" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenGongShiZiWanTaxAmount" runat="server"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style221" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiFenGongShiZiWanAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style222" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-分公司自完（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfbfengongsiziwansqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style223" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfbfengongsiziwansqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style223" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfbfengongsiziwansqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style224" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfbfengongsiziwansqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style225" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfbfengongsiziwansqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style225" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfbfengongsiziwansqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style226" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfbfengongsiziwansqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style493"></td>
                                    <td class="auto-style228" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style229" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style230" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.4 </td>
                                    <td class="auto-style232" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">电仪 </td>
                                    <td class="auto-style233" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiDianYuAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style234" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiDianYuTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style235" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiDianYuTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style236" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieGongZhiJiDianYuAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style237" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-电仪（税前）
                                        <br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendianyisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style238" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendianyisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style238" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendianyisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style239" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendianyisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style240" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendianyisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style240" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendianyisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style241" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendianyisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style492"></td>
                                    <td class="auto-style198" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style199" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style200" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style201" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">2.5 </td>
                                    <td class="auto-style202" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">吊装</td>
                                    <td class="auto-style203" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieDiaoZhuangAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style204" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieDiaoZhuangTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style205" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieDiaoZhuangTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style206" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZiJieDiaoZhuangAfterTaxAmount" runat="server"></asp:Label>
                                        <td class="auto-style207" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">分包用费表-吊装（税前）
                                            <br />
                                            <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendiaozhuangsqAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style208" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                            <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendiaozhuangsqAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style208" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                            <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendiaozhuangsqTaxAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style209" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                            <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendiaozhuangsqSumTaxAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style210" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                            <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendiaozhuangsqAfterTaxAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style210" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                            <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendiaozhuangsqSumAfterTaxAmount" runat="server"></asp:Label>
                                        </td>
                                        <td class="auto-style211" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                            <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendiaozhuangsqTaxRate" runat="server"></asp:Label>
                                        </td>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style486"></td>
                                    <td class="auto-style82" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style83" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style84" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">3</td>
                                    <td class="auto-style86" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">直接材料费</td>
                                    <td class="auto-style87" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhiJieLiaoFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style88" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhiJieLiaoFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style89" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhiJieLiaoFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style90" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhiJieLiaoFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style91" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">材料费表-材料费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeisqAmount" runat="server"></asp:Label>

                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">

                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style254" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style256" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeisqTaxRate" runat="server"></asp:Label>

                                    </td>
                                </tr>
                                <tr class="xl74" height="29" style="height: 21.65px">
                                    <td class="auto-style494" height="29"></td>
                                    <td class="xl210" style="border-left: none; width: 144px" width="192"></td>
                                    <td class="xl170" style="border-left: none; width: 160px" width="213"></td>
                                    <td class="xl170" style="border-left: none; width: 148px" width="197"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl209" style="border-top: none; border-left: none; width: 127px" width="169">3.1</td>
                                    <td class="xl210" style="border-top: none; border-left: none; width: 162px" width="216"></span>主材</td>
                                    <td class="xl85" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuCaiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 149px" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuCaiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 143px" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuCaiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 258px" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuCaiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl121" style="border-top: none; border-left: none; width: 209px" width="279">材料费表-主材费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeizhucaisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeizhucaisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeizhucaisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 157px" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeizhucaisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl101" style="border-left: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeizhucaisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeizhucaisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 100px" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeizhucaisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74" height="29" style="height: 21.65px">
                                    <td class="auto-style494" height="29"></td>
                                    <td class="xl212" style="border-left: none; width: 144px" width="192"></td>
                                    <td class="xl170" style="border-left: none; width: 160px" width="213"></td>
                                    <td class="xl170" style="border-left: none; width: 148px" width="197"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl211" style="border-left: none; width: 127px" width="169">3.2</td>
                                    <td class="xl212" style="border-left: none; width: 162px" width="216"></span>辅材</td>
                                    <td class="xl85" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFuCaiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 149px" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFuCaiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 143px" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFuCaiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 258px" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFuCaiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl121" style="border-left: none; width: 209px" width="279">材料费表-辅材费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeifucaisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeifucaisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeifucaisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 157px" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeifucaisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl101" style="border-left: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeifucaisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeifucaisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 100px" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeifucaisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74" height="29" style="height: 21.65px">
                                    <td class="auto-style494" height="29"></td>
                                    <td class="xl231" style="border-left: none; width: 144px" width="192"></td>
                                    <td class="xl170" style="border-left: none; width: 160px" width="213"></td>
                                    <td class="xl170" style="border-left: none; width: 148px" width="197"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl213" style="border-left: none; width: 127px" width="169">3.3 c</td>
                                    <td class="xl206" style="border-left: none; width: 162px" width="216">材料平库 </td>
                                    <td class="xl85" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieCaiLiaoPingKuAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 149px" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieCaiLiaoPingKuTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 143px" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieCaiLiaoPingKuTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 258px" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieCaiLiaoPingKuAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl121" style="border-left: none; width: 209px" width="279">材料费表-平库费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeipingkusqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeipingkusqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeipingkusqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 157px" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeipingkusqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl101" style="border-left: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeipingkusqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeipingkusqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 100px" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeipingkusqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74" height="29" style="height: 21.65px">
                                    <td class="auto-style494" height="29"></td>
                                    <td class="xl231" style="border-left: none; width: 144px" width="192"></td>
                                    <td class="xl170" style="border-left: none; width: 160px" width="213"></td>
                                    <td class="xl170" style="border-left: none; width: 148px" width="197"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl170" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl213" style="border-left: none; width: 127px" width="169">3.4 </td>
                                    <td class="xl206" style="border-left: none; width: 162px" width="216">底漆 </td>
                                    <td class="xl85" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieDiQiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 149px" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieDiQiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 143px" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieDiQiTaxAmount" runat="server"></asp:Label>
                                        &nbsp;</td>
                                    <td class="xl85" style="border-left: none; width: 258px" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieDiQiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl121" style="border-left: none; width: 209px" width="279">材料费表-底漆费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeidiqisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeidiqisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 159px" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeidiqisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; border-left: none; width: 157px" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeidiqisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl101" style="border-left: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBencailiaofeidiqisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl185" style="border-top: none; width: 116px" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeidiqisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl73" style="border-left: none; width: 100px" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBencailiaofeidiqisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style495"></td>
                                    <td class="auto-style258" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style259" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style260" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">4</td>
                                    <td class="auto-style262" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">机械费</td>
                                    <td class="auto-style263" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style264" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style265" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style266" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style267" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">机械设备租赁费表-机械租赁税前合计<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixiezulinshuiqianhejiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style268" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixiezulinshuiqianhejiSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style268" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixiezulinshuiqianhejiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style269" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixiezulinshuiqianhejiSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style270" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixiezulinshuiqianhejiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style270" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixiezulinshuiqianhejiSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style271" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixiezulinshuiqianhejiTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style393"></td>
                                    <td class="auto-style394" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style395" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style396" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style397" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style397" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style397" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">4.1</td>
                                    <td class="auto-style398" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>机械使用费</td>
                                    <td class="auto-style399" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieShiYongFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style400" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieShiYongFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style401" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieShiYongFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style402" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJiJieShiYongFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style403" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">机械设备租赁费表-机械使用费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixieshiyongfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style404" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixieshiyongfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style404" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixieshiyongfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style405" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixieshiyongfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style406" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjixieshiyongfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style406" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixieshiyongfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style407" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjixieshiyongfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style483"></td>
                                    <td class="auto-style273" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style274" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style275" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style515" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style515" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style515" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">4.2</td>
                                    <td class="auto-style277" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>分公司自完</td>
                                    <td class="auto-style278" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFenGongShiZiWanAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style279" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFenGongShiZiWanTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style280" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFenGongShiZiWanTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style281" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFenGongShiZiWanAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style282" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">机械设备租赁费表-分公司自完（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxfengongsiziwansqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style516" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxfengongsiziwansqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style516" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxfengongsiziwansqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style284" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxfengongsiziwansqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style517" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxfengongsiziwansqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style517" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxfengongsiziwansqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style286" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxfengongsiziwansqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style496"></td>
                                    <td class="auto-style312" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style313" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style314" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">4.3</td>
                                    <td class="auto-style316" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>其他</td>
                                    <td class="auto-style317" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style318" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style319" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style320" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style321" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">机械设备租赁费表-其它（税前）<br />
                                        &nbsp;<asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxqitasqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxqitasqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxqitasqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style323" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxqitasqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjxqitasqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxqitasqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style325" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjxqitasqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style493"></td>
                                    <td class="auto-style228" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style229" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style230" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style231" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">5</td>
                                    <td class="auto-style232" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">临时设施费</td>
                                    <td class="auto-style233" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLingShiSheSiFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style234" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLingShiSheSiFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style235" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLingShiSheSiFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style236" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLingShiSheSiFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style237" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">临时设施费表-临时设施（税前）<br />
                                        &nbsp;
                                <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlinshisheshisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style238" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlinshisheshisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style238" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlinshisheshisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style239" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlinshisheshisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style240" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlinshisheshisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style240" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlinshisheshisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style241" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlinshisheshisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style487"></td>
                                    <td class="auto-style94" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style95" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style96" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style97" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">6</td>
                                    <td class="auto-style98" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">安全措施费</td>
                                    <td class="auto-style99" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieAnQianChuShiFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style100" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieAnQianChuShiFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style101" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieAnQianChuShiFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style102" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieAnQianChuShiFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style103" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">安全措施费表-安全措施（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenanquancuoshisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenanquancuoshisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style104" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenanquancuoshisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style194" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenanquancuoshisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style195" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenanquancuoshisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style195" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenanquancuoshisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style196" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenanquancuoshisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style489"></td>
                                    <td class="auto-style327" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style138" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style139" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style140" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">7</td>
                                    <td class="auto-style141" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">水电费</td>
                                    <td class="auto-style142" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieShuiDianFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style143" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieShuiDianFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style144" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieShuiDianFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style145" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieShuiDianFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style146" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">水电费表-水电费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenshuidianfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style147" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenshuidianfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style147" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenshuidianfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style148" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenshuidianfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style149" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenshuidianfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style149" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenshuidianfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style150" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenshuidianfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style490" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="auto-style329" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="192"></td>
                                    <td class="auto-style152" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style153" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">8</td>
                                    <td class="auto-style155" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">其他工程费</td>
                                    <td class="auto-style156" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaGongChengFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style157" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaGongChengFeiTaxRate" runat="server"></asp:Label>
                                        &nbsp;</td>
                                    <td class="auto-style158" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaGongChengFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style159" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaGongChengFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style160" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他工程费用表-其它工程费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitagongchengfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitagongchengfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitagongchengfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style162" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitagongchengfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitagongchengfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitagongchengfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style164" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitagongchengfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style496" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="auto-style312" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style313" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style314" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">9</td>
                                    <td class="auto-style316" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">其他费</td>
                                    <td class="auto-style317" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style318" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style319" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style320" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style321" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">其他费表-其它费合计（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitafeihejisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitafeihejisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitafeihejisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style323" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitafeihejisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitafeihejisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitafeihejisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style325" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitafeihejisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style486"></td>
                                    <td class="auto-style82" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style83" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style84" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">9.1&nbsp;</td>
                                    <td class="auto-style86" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>检测费</td>
                                    <td class="auto-style87" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJianCheFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style88" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJianCheFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style89" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJianCheFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style90" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieJianCheFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style91" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">其他费表-检测费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjiancefeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjiancefeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjiancefeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style254" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjiancefeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenjiancefeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjiancefeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style256" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenjiancefeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style497"></td>
                                    <td class="auto-style331" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style332" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style333" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.2</td>
                                    <td class="auto-style335" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>外协加工费</td>
                                    <td class="auto-style336" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieWaiXieJiaGongFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style337" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieWaiXieJiaGongFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style338" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieWaiXieJiaGongFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style339" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieWaiXieJiaGongFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style340" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">其他费表-外协加工费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaixiejiagongfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaixiejiagongfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaixiejiagongfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style342" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaixiejiagongfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenwaixiejiagongfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaixiejiagongfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style344" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenwaixiejiagongfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style484"></td>
                                    <td class="auto-style58" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style59" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style60" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style61" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style61" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style61" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.3</td>
                                    <td class="auto-style62" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>租赁费</td>
                                    <td class="auto-style63" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuLingFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style64" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuLingFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style65" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuLingFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style66" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZhuLingFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style67" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">其他费表-租赁费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzulinfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style68" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzulinfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style68" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzulinfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style357" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzulinfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style358" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenzulinfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style358" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzulinfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style359" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenzulinfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style497"></td>
                                    <td class="auto-style331" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style332" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style333" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.4</td>
                                    <td class="auto-style335" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>劳动保护费</td>
                                    <td class="auto-style336" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLaoDongBaoHuFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style337" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLaoDongBaoHuFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style338" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLaoDongBaoHuFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style339" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieLaoDongBaoHuFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style340" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">其他费表-劳动保护费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaodongbaohufeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaodongbaohufeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaodongbaohufeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style342" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaodongbaohufeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenlaodongbaohufeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaodongbaohufeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style344" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenlaodongbaohufeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style497"></td>
                                    <td class="auto-style331" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style332" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style333" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.5</td>
                                    <td class="auto-style335" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>修理费</td>
                                    <td class="auto-style336" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieXiuLiFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style337" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieXiuLiFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style338" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieXiuLiFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style339" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieXiuLiFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style340" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他费表-修理费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenxiulifeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenxiulifeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenxiulifeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style342" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenxiulifeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenxiulifeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenxiulifeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style344" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenxiulifeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style490"></td>
                                    <td class="auto-style329" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style152" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style153" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.6</td>
                                    <td class="auto-style155" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>不可预见成本</td>
                                    <td class="auto-style156" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieBuKeYiJianChenBenAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style157" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieBuKeYiJianChenBenTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style158" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieBuKeYiJianChenBenTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style159" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieBuKeYiJianChenBenAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style160" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他费表-不可预见费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbukeyujiansqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbukeyujiansqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbukeyujiansqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style162" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbukeyujiansqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbukeyujiansqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbukeyujiansqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style164" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbukeyujiansqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style496"></td>
                                    <td class="auto-style312" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style313" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style314" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style315" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.7</td>
                                    <td class="auto-style316" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">罚款</td>
                                    <td class="auto-style317" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFaKuanAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style318" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFaKuanTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style319" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFaKuanTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style320" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieFaKuanAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style321" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他费表-罚款费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfakuansqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfakuansqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style322" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfakuansqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style323" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfakuansqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenfakuansqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style324" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfakuansqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style325" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenfakuansqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl74">
                                    <td class="auto-style497"></td>
                                    <td class="auto-style331" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style332" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style333" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.8</td>
                                    <td class="auto-style335" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">办公用品</td>
                                    <td class="auto-style336" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJiePanGongYongPingAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style337" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJiePanGongYongPingTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style338" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJiePanGongYongPingTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style339" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJiePanGongYongPingAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style340" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他费表-办公用品（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbangongyongpingsqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbangongyongpingsqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbangongyongpingsqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style342" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbangongyongpingsqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenbangongyongpingsqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbangongyongpingsqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style344" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenbangongyongpingsqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style488"></td>
                                    <td class="auto-style361" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style124" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style125" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style126" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">9.9</td>
                                    <td class="auto-style127" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216"></span>其他</td>
                                    <td class="auto-style128" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTa2Amount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style129" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTa2TaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style130" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTa2TaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style131" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTa2AfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style132" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">其他费表-其它费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitaqitasqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style133" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitaqitasqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style133" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitaqitasqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style134" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitaqitasqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style135" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenqitaqitasqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style135" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitaqitasqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style136" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenqitaqitasqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style497"></td>
                                    <td class="auto-style331" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style332" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style333" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style334" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">10</td>
                                    <td class="auto-style335" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">动迁费</td>
                                    <td class="auto-style336" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieTongQianFeiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style337" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieTongQianFeiTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style338" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieTongQianFeiTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style339" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieTongQianFeiAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style340" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279"></span>动迁费表-动迁费（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendongqianfeisqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendongqianfeisqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style341" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendongqianfeisqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style342" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendongqianfeisqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBendongqianfeisqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style343" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendongqianfeisqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style344" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBendongqianfeisqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style495"></td>
                                    <td class="auto-style258" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style259" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213"></td>
                                    <td class="auto-style260" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style261" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">11</td>
                                    <td class="auto-style262" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">其他让利项</td>
                                    <td class="auto-style263" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaLiangLiXiangAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style264" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaLiangLiXiangTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style265" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaLiangLiXiangTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style266" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieQiTaLiangLiXiangAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style267" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">让利成本项表-让利成本（税前）<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenranglichengbensqAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style268" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenranglichengbensqSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style374">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenranglichengbensqTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style269" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenranglichengbensqSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style270" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenranglichengbensqAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style270" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenranglichengbensqSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style271" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenranglichengbensqTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr class="xl82">
                                    <td class="auto-style486"></td>
                                    <td class="auto-style82" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style83" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213"></td>
                                    <td class="auto-style84" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style85" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169">12</td>
                                    <td class="auto-style86" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">总成本</td>
                                    <td class="auto-style87" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZongChengBenAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style88" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZongChengBenTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style89" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZongChengBenTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style90" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuErChiBiaoJiaFenLiBiaoZhiJieZongChengBenAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style91" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">当月实际发生成本（税前）:<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenShiJiChengBenAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuMiYueShiJiFaShengChengBenShiJiChengBenSumAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style92" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style254" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenSumTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenShiJiChengBenAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style255" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenShiJiChengBenSumAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style256" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133">
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengChengBenShiJiChengBenTaxRate" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style465" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">三</td>
                                    <td class="auto-style17" style="border-top: none; border-left: none">项目毛利<ruby><font class="font60"><rt class="font60"></rt></font></ruby></td>
                                    <td class="auto-style18" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuYiCiFenLiBiaoMaoLiAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style19" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="197">&nbsp;</td>
                                    <td class="auto-style375" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">&nbsp;</td>
                                    <td class="auto-style375" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">&nbsp;</td>
                                    <td class="auto-style375" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">三</td>
                                    <td class="auto-style21" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">利润</td>
                                    <td class="auto-style22" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_RiRen" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style23" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199"></td>
                                    <td class="auto-style24" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190"></td>
                                    <td class="auto-style25" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344"></td>
                                    <td class="auto-style26" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">利润（总收入-累计实际发生成本（税前 ））<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengProfitAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style376" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211"></td>
                                    <td class="auto-style376" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211"></td>
                                    <td class="auto-style28" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209"></td>
                                    <td class="auto-style377" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="155"></td>
                                    <td class="auto-style377" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style30" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style466" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">四</td>
                                    <td class="auto-style379" style="border-top: none; border-left: none">税金</td>
                                    <td class="auto-style380" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213">
                                        <asp:Label ID="LB_XiangMuYiCiFenLiBiaoShuiJingAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style381" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style382" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style382" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style382" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">四</td>
                                    <td class="auto-style383" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">销项税额</td>
                                    <td class="auto-style384" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="186">
                                        <asp:Label ID="LB_XiaoXiangShuiE" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style385" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="199"></td>
                                    <td class="auto-style386" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190"></td>
                                    <td class="auto-style387" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344"></td>
                                    <td class="auto-style388" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="279">销项税额=∑实际结算额*税率,即：来自表单“<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengProfitSaleTaxAmount" runat="server"></asp:Label>
                                        <br>
                                    </td>
                                    <td class="auto-style389" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211"></td>
                                    <td class="auto-style389" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211"></td>
                                    <td class="auto-style390" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209"></td>
                                    <td class="auto-style391" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style391" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style392" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133"></td>
                                </tr>
                                <tr class="xl82" height="30" style="height: 30.65px">
                                    <td class="auto-style498" height="30" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">五</td>
                                    <td class="xl236" style="border-top: none; border-left: none">项目成本+税金</td>
                                    <td class="xl112" style="border-left: none; width: 160px" width="213">
                                        <asp:Label ID="LB_XiangMuYiCiFenLiBiaoChengBenJiaShuiJingAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 148px" width="197">&nbsp;</td>
                                    <td class="xl85" style="border-left: none; width: 127px" width="169">&nbsp;</td>
                                    <td class="xl85" style="border-left: none; width: 127px" width="169">&nbsp;</td>
                                    <td class="xl225" style="border-top: none; border-left: none; width: 127px" width="169">五</td>
                                    <td class="xl223" style="border-left: none; width: 162px" width="216">进项税额</td>
                                    <td class="xl130" style="border-top: none; border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_JinXiangShuiE" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl131" style="border-top: none; width: 149px" width="199"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 143px" width="190"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 258px" width="344"></td>
                                    <td class="xl130" style="border-top: none; border-left: none; width: 209px" width="279">进项税额：来自所有成本项表单填写的实际总税额<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengProfitXiaoXiangTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl131" style="border-top: none; width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 157px" width="209"></td>
                                    <td class="xl133" style="border-top: none; border-left: none; width: 116px" width="155"></td>
                                    <td class="xl134" style="border-top: none; width: 116px" width="155"></td>
                                    <td class="xl70" style="border-left: none; width: 100px" width="133"></td>
                                </tr>
                                <tr class="xl82" height="30" style="height: 30.65px">
                                    <td class="auto-style498" height="30" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">六</td>
                                    <td class="xl236" style="border-top: none; border-left: none">预计利润</td>
                                    <td class="xl112" style="border-left: none; width: 160px" width="213">
                                        <asp:Label ID="LB_XiangMuYiCiFenLiBiaoYiJiProfitAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl85" style="border-left: none; width: 148px" width="197">&nbsp;</td>
                                    <td class="xl85" style="border-left: none; width: 127px" width="169">&nbsp;</td>
                                    <td class="xl85" style="border-left: none; width: 127px" width="169">&nbsp;</td>
                                    <td class="xl225" style="border-top: none; border-left: none; width: 127px" width="169">六</td>
                                    <td class="xl223" style="border-left: none; width: 162px" width="216">税金</td>
                                    <td class="xl130" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_ShuiJin" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl131" style="width: 149px" width="199"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 143px" width="190"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 258px" width="344"></td>
                                    <td class="xl130" style="border-left: none; width: 209px" width="279">税金=销项税额-进项税额<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengProfitJingXiangTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="xl131" style="width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 157px" width="209"></td>
                                    <td class="xl133" style="border-top: none; border-left: none; width: 116px" width="155"></td>
                                    <td class="xl134" style="border-top: none; width: 116px" width="155"></td>
                                    <td class="xl70" style="border-left: none; width: 100px" width="133"></td>
                                </tr>
                                <tr class="xl82" height="30" style="height: 30.65px">
                                    <td class="auto-style498" height="30" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="xl223" style="border-left: none; width: 144px" width="192"></td>
                                    <td class="xl130" style="border-left: none; width: 160px" width="213"></td>
                                    <td class="xl131" style="width: 148px" width="197"></td>
                                    <td class="xl132" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl130" style="border-left: none; width: 127px" width="169"></td>
                                    <td class="xl225" style="border-top: none; border-left: none; width: 127px" width="169">七</td>
                                    <td class="xl223" style="border-left: none; width: 162px" width="216">税金附加</td>
                                    <td class="xl130" style="border-left: none; width: 140px" width="186">
                                        <asp:Label ID="LB_ShuiJinFuJia" runat="server"></asp:Label>
                                        <br>
                                    </td>
                                    <td class="xl131" style="width: 149px" width="199"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 143px" width="190"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 258px" width="344"></td>
                                    <td class="xl130" style="border-left: none; width: 209px" width="279">税金附加=税金*12%<br />
                                        <asp:Label ID="LB_XiangMuCurrentMonthShiJiFaShengProfitFuJiaTaxAmount" runat="server"></asp:Label>
                                        <br>
                                    </td>
                                    <td class="xl131" style="width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 159px" width="211"></td>
                                    <td class="xl132" style="border-top: none; border-left: none; width: 157px" width="209"></td>
                                    <td class="xl133" style="border-top: none; border-left: none; width: 116px" width="155"></td>
                                    <td class="xl134" style="border-top: none; width: 116px" width="155"></td>
                                    <td class="xl70" style="border-left: none; width: 100px" width="133"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style490" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="auto-style329" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="192"></td>
                                    <td class="auto-style152" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="213"></td>
                                    <td class="auto-style153" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="197"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="169"></td>
                                    <td class="auto-style154" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">八</td>
                                    <td class="auto-style155" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="216">工程造价</td>
                                    <td class="auto-style156" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="186">
                                        <asp:Label ID="LB_XiangMuZongYuSuan" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style157" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="199">
                                        <asp:Label ID="LB_XiangMuTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style158" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="190">
                                        <asp:Label ID="LB_XiangMuTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style159" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="344">
                                        <asp:Label ID="LB_XiangMuZongShouRu" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style160" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="279">“项目管理”模块“项目立项”界面”“项目总预算<br />
                                        <asp:Label ID="LB_XiangMuTotalBudget" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuTotalTaxRate" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style161" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="211">
                                        <asp:Label ID="LB_XiangMuTotalTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style162" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="209">
                                        <asp:Label ID="LB_XiangMuTotalAfterTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style163" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style163" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style164" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133"></td>
                                </tr>
                                <tr>
                                    <td class="auto-style518" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"></td>
                                    <td class="auto-style421" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="192"></td>
                                    <td class="auto-style519" width="213"></td>
                                    <td class="auto-style520" width="197"></td>
                                    <td class="auto-style521" width="169"></td>
                                    <td class="auto-style521" width="169"></td>
                                    <td class="auto-style521" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="169">九</td>
                                    <td class="auto-style522" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="216">预算(综合)税负</td>
                                    <td class="auto-style414" colspan="4" width="919">
                                        <asp:Label ID="LB_XiangMuYuSuanZongHeShuiFu" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style415" width="1065">综合税负 
                                    </td>
                                    <td class="auto-style523" colspan="4" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155">
                                        <asp:Label ID="LB_XiangMuTotalSummaryTaxAmount" runat="server"></asp:Label>
                                    </td>
                                    <td class="auto-style523" style="border-left-style: none; border-left-color: inherit; border-left-width: medium; border-top-style: none; border-top-color: inherit; border-top-width: medium;" width="155"></td>
                                    <td class="auto-style524" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;" width="133"></td>
                                </tr>
                            </table>

                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />
                            <br />

                            <table width="100%">
                                <tr>
                                    <td width="40%">
                                        <table border="1" cellpadding="0" cellspacing="0" width="800" style='border-collapse: collapse; text-align: center;'>
                                            <tr height="53" style="height: 39.65px">
                                                <td colspan="3" height="53" align="center" style="height: 39.65px; font-size: x-large;">
                                                    <br />
                                                    奖金包干总额月度奖金额明细表
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr class="xl67">
                                                <td class="auto-style426" colspan="3">工程编码：<asp:Label ID="LB_ProjectCode2" runat="server"></asp:Label>项目名称：<asp:Label ID="LB_ProjectName2" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr height="29" style="height: 22.25px">
                                                <td class="xl100" height="29" style="height: 22.25px; border-top: none;">项目</td>

                                                <td class="xl300" style="border-left: none;">预算</td>

                                                <td class="xl100" style="border-left: none;">实际</td>

                                            </tr>
                                            <tr>
                                                <td class="auto-style427" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;"
                                                    width="150px">总收入</td>
                                                <td class="auto-style428" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuHeTongYuShuanJiaErCiAmount" runat="server"></asp:Label>
                                                </td>
                                                <td class="auto-style429" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuHeTongJingDuShengYuZongShouRuAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style427" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">成本</td>
                                                <td class="auto-style428" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuMuBiaoChengBenErCiAmount" runat="server"></asp:Label>
                                                </td>
                                                <td class="auto-style429" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuLieJiShiJiFaShengChengBenAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style430" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">预计发生总成本</td>
                                                <td class="auto-style431" colspan="2" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuYiJiFaShengZongChengBenAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style436" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">利润（毛利）</td>
                                                <td class="auto-style437" colspan="2" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuYiJiFaShengLiRenMaoLiAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style434" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">包干总额</td>
                                                <td class="auto-style435" colspan="2" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuYiJiFaShengBaoGuanZongEAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="auto-style436" style="border-top-style: none; border-top-color: inherit; border-top-width: medium;">进度</td>
                                                <td class="auto-style437" colspan="2" style="border-left-style: none; border-left-color: inherit; border-left-width: medium;">
                                                    <asp:Label ID="LB_XiangMuYiJiFaShengJingDuAmount" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr height="17" style="height: 13.0px">
                                                <td colspan="3" height="17" align="center" style="height: 13.0px; border-top-style: none; border-top-color: inherit; border-top-width: medium;">

                                                    <table border="1" cellpadding="0" cellspacing="0" width="100%" style="text-align: center;">
                                                        <tr height="31" style="height: 23.0px">
                                                            <td height="31" style="height: 23.0px; border-top: none; width: 15%;">时段</td>

                                                            <td style="border-top: none; border-left: none; width: 15%;">利润</td>

                                                            <td style="border-top: none; border-left: none; width: 15%;">结算</td>

                                                            <td style="border-top: none; border-left: none; width: 15%;">回款</td>

                                                            <td class="xl94" style="border-top: none; border-left: none; width: 15%;">QHSE打分</td>

                                                            <td class="xl97" style="border-top: none; border-left: none;">进度</td>

                                                        </tr>
                                                    </table>

                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                        Width="100%" ShowHeader="false">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <ItemStyle CssClass="itemStyle" HorizontalAlign="Center" />
                                                        <Columns>

                                                            <asp:BoundColumn DataField="MonthNumber" HeaderText="月份">
                                                                <ItemStyle CssClass="itemBorder" BorderWidth="1" HorizontalAlign="center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Profit" HeaderText="利润">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Clearing" HeaderText="结算">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ReturnMoney" HeaderText="回款">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="QHSE" HeaderText="QHSE 打分">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>

                                                        </Columns>
                                                    </asp:DataGrid>
                                                    <br />
                                                    <table border="1" cellpadding="0" cellspacing="0" width="100%" style="text-align: center;">
                                                        <tr height="31" style="height: 23.0px">
                                                            <td style="border-top: none; border-left: none; width: 15%;">合计</td>

                                                            <td style="border-top: none; border-left: none; width: 15%;">

                                                                <asp:Label ID="LB_XiangMuBaoGuanZongEProfitHeJi" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="border-top: none; border-left: none; width: 15%;">

                                                                <asp:Label ID="LB_XiangMuBaoGuanZongEClearingHeJi" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="border-top: none; border-left: none; width: 15%;">

                                                                <asp:Label ID="LB_XiangMuBaoGuanZongEReturnMoneyHeJi" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="border-top: none; border-left: none; width: 15%;">

                                                                <asp:Label ID="LB_XiangMuBaoGuanZongEQHSEHeJi" runat="server"></asp:Label>
                                                            </td>
                                                            <td style="border-top: none; border-left: none;">

                                                                <asp:Label ID="LB_XiangMuBaoGuanZongEProgressHeJi" runat="server"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <%-- 
                                            <tr height="16" style=" height: 12.0px">
                                                <td class="xl255" height="16" style="height: 12.0px">累计已发放奖金额<span style="mso-spacerun: yes">&nbsp;</span></td>
                                                <td class="xl288" colspan="5" style="border-right: .5pt solid black">截至到上个月的下面单元格B17的“本次可发放额”值的总和（就是不含本月累计值），其中项目开始第一个月的累计值取“0”</td>
                                            </tr>
                                            <tr height="65" style=" height: 48.75px">
                                                <td class="xl256"  height="65" style="height: 48.75px; width: 104px" width="139">本次可发放额</td>
                                                <td class="xl285" colspan="5"  style="border-left: none; width: 550px"
                                                    width="733"><font class="font75">项目部每月可动用奖金额=奖金包干总额*（进度、结算、回款及HSE综合打分系数）-累计已发放奖金额+单项奖+事件考核奖励+超额利润提成<span style="mso-spacerun: yes">&nbsp;</span></font><font class="font25"><span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font><font class="font8"><span style="mso-spacerun: yes">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span></font><font class="font25"><br>
                                                    </font><![if !supportAnnotations]><span class="msocomspan1"><span id="_anchor_1" class="msocomspan2" language="JavaScripx" onmouseout="msoCommentHide('_com_1')" onmouseover="msoCommentShow('_com_1','_anchor_1')"><a class="msocomanch" href="#_msocom_1" name="_msoanchor_1">[1]</a></span></span><![endif]></td>
                                            </tr>--%>
                                            <tr height="17" style="text-align: center; height: 13.0px">
                                                <td class="xl66" colspan="3" height="17" style="height: 13.0px;"></td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="60%">
                                        <table border="1" cellpadding="0" cellspacing="0" width="1180px" style='border-collapse: collapse;'>
                                            <tr height="53">
                                                <td height="53" align="center" style="font-size: x-large;">
                                                    <br />
                                                    项目成本收入分析总图
                                                    <br />
                                                    <br />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr height="31" style="height: 23.0px">
                                                            <td height="31" style="height: 23.0px; border-top: none; text-align: center; width: 20%">时段</td>

                                                            <td style="border-top: none; border-left: none; text-align: center; width: 20%">目标成本（二次）</td>

                                                            <td style="border-top: none; border-left: none; text-align: center; width: 20%">累计实际发生成本（税前 ）</td>

                                                            <td style="border-top: none; border-left: none; text-align: center; width: 20%">累计实际发生成本（税后）</td>

                                                            <td style="border-top: none; border-left: none; text-align: center; width: 20%">累计结算</td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False"
                                                        Width="100%" ShowHeader="false">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        <ItemStyle CssClass="itemStyle" HorizontalAlign="Center" />
                                                        <Columns>
                                                            <asp:BoundColumn DataField="MonthNumber" HeaderText="月份">
                                                                <ItemStyle CssClass="itemBorder" BorderWidth="1" HorizontalAlign="center" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CurrentMonthTotalCost" HeaderText="目标成本（二次）">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CumulativeActualTaxCost" HeaderText="累计实际发生成本（税前 ）">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CumulativeActualAfterTaxCost" HeaderText="累计实际发生成本（税后）">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="AccumulationSettlement" HeaderText="累计结算">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                      <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                    <%--<asp:Chart ID="Chart1" runat="server" Width="800px">
                                                        <Series>
                                                            <asp:Series ChartType="Column" Label="#VAL" Name="Series1" Legend="Legend1">
                                                            </asp:Series>
                                                            <asp:Series ChartType="Column" Label="#VAL" Name="Series2" Legend="Legend1">
                                                            </asp:Series>
                                                            <asp:Series ChartType="Column" Label="#VAL" Name="Series3" Legend="Legend1">
                                                            </asp:Series>
                                                            <asp:Series ChartType="Column" Label="#VAL" Name="Series4" Legend="Legend1">
                                                            </asp:Series>
                                                        </Series>
                                                        <ChartAreas>
                                                            <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                            </asp:ChartArea>
                                                        </ChartAreas>
                                                        <Legends>
                                                            <asp:Legend Name="Legend1">
                                                            </asp:Legend>
                                                            <asp:Legend Name="Legend2">
                                                            </asp:Legend>
                                                            <asp:Legend Name="Legend3">
                                                            </asp:Legend>
                                                            <asp:Legend Name="Legend4">
                                                            </asp:Legend>
                                                        </Legends>
                                                        <Titles>
                                                            <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="false" Name="标题">
                                                            </asp:Title>
                                                        </Titles>
                                                    </asp:Chart>--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <asp:Label ID="LB_ErrorText" runat="server"></asp:Label>
                        </div>
                    </center>
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
