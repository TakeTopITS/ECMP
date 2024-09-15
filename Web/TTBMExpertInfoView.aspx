<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMExpertInfoView.aspx.cs" Inherits="TTBMExpertInfoView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
        .auto-style1
        {
            font-size: large;
            font-weight: bold;
        }
        </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
           
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="80%" cellspacing="0" class="bian">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuanJiaXinXi%>"></asp:Label>
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
                                        <td valign="top">
                                            <table width="100%" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td style="text-align: left; padding-top: 5px;" valign="top">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuanJiaBianMa%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_ExpertCode" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuanJiaMingCheng%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Name" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuanJiaXingBie%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Gender" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuanJia%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_IDCard" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Phone" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_OfficePhone" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DianZiYouXiang%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Email" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiYeYuanXiao%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_GraduateSchool" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,SuoXueZhuanYe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Major" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZuiGaoXueLi%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Degree" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_IntroducerDepartment" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_WorkUnit" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CanJiaGongZuoShiJian%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_JoinDate" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuanJiaZhiWu%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Job" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuanJiaZhiCheng%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_JobTitle" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CongShiZhuanYeLeiBie%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_EngagedCategory" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaiGouZhuanJia%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_ProcurementCategory" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuanJiaLeiXing%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_Type" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongZuoDianShu%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_WorkingPoint" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_CreateTime" runat="server"></asp:Label>
                                                                            </td>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                <asp:Label ID="lbl_CreateCode" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuanYeFanWei%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" style="text-align: left" colspan="5">
                                                                                <asp:Label ID="lbl_ExpertType" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BenZhiZhuanYeTeChang%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_LaborExpertise" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,FeiBenZhiZhuanYeTeChang%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_NotLaborExpertise" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,CaoZuoLeiTuChuJiNeng%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_ActionOutstanding" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YouLiangYeJi%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_GoodPerformance" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ChengGongChuLiAnLi%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_SuccessfulCasePro" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LunZhuWenXian%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_LiteratureWorks" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,FaMingZhuanLi%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_PatentInvention" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KeYanChengGuo%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_ScientificAchieve" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuanLiChuangXin%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_ManagementInnovation" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BuLiangBiaoXianJiLu%>"></asp:Label>：</td>
                                                                            <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                                <asp:Label ID="lbl_BadTrackRecord" runat="server"></asp:Label>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" colspan="6" style="text-align: left">&nbsp;<span class="auto-style1"><asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GongZuoJingLi%>"></asp:Label></span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" colspan="6" style="text-align: left">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="20%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GongZi%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,LiZhiYuanYin%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="8%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ZhengMingRen%>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="9%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="100%">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Salary" HeaderText="工资">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ResignReason" HeaderText="离职原因">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="renterence" HeaderText="证明人">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="renterenceCall" HeaderText="证明人电话">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                        </asp:DataGrid>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" colspan="6" style="text-align: left">&nbsp;<span class="auto-style1"><asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YeJiPingGu%>"></asp:Label></span></td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td class="formItemBgStyle" colspan="6" style="text-align: left">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuanJiaMingCheng%>"></asp:Label></strong></td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAn%>"></asp:Label></strong></td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,GeRenBiaoXian%>"></asp:Label></strong></td>
                                                                <td width="30%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong></td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None" ShowHeader="False" Width="100%">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="专家名称">
                                                        <ItemTemplate>
                                                            <%# GetExpertName(Eval("ExpertID").ToString()) %>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="BidPlanName" HeaderText="招标方案">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CooperateDegree" HeaderText="个人表现">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                            HorizontalAlign="Center" />
                                                    </asp:BoundColumn>
                                                                            </Columns>
                                                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                        </asp:DataGrid>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
