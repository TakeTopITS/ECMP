<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZProjectBrowse.aspx.cs" Inherits="TTWZProjectBrowse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>浏览项目</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
        <div>
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
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LiuLanXiangMu%>"></asp:Label>
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
                        <td style="padding: 0px 5px 5px 5px;" valign="top">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="padding-top: 5px;">
                                        <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_ProjectCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMuJingLi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:HiddenField ID="HF_ProjectManager" runat="server" />
                                                    <asp:TextBox ID="TXT_ProjectManager" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouJingLi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:HiddenField ID="HF_PurchaseManager" runat="server" />
                                                    <asp:TextBox ID="TXT_PurchaseManager" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KaiGongRiQi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_StartTime" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WanGongRiQi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_EndTime" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="4">
                                                    <asp:TextBox ID="TXT_ProjectName" runat="server" Width="315px"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShouQuanCaiGou%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%--<asp:DropDownList ID="TXT_PowerPurchase" runat="server">
                                                        <asp:ListItem Text="有" Value="有"/>
                                                        <asp:ListItem Text="无" Value="无"/>
                                                    </asp:DropDownList>--%>
                                                    <asp:TextBox ID="TXT_PowerPurchase" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <%--<asp:DropDownList ID="DDL_StoreRoom" runat="server"
                                                         DataTextField="StockCode" DataValueField="StockCode"></asp:DropDownList>--%>
                                                    <asp:TextBox ID="TXT_StoreRoom" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangMuMiaoShu%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="9">
                                                    <asp:TextBox ID="TXT_ProjectDesc" runat="server" TextMode="MultiLine" Height="123px" Width="745px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JianSheDanWei%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                    <asp:TextBox ID="TXT_BuildUnit" runat="server" Width="450px"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_DelegateAgent" runat="server"></asp:TextBox>
                                                    <asp:HiddenField ID="HF_DelegateAgent" runat="server" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                                                    <asp:TextBox ID="TXT_PurchaseEngineer" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JianLiDanWei%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="5">
                                                    <asp:TextBox ID="TXT_SupervisorUnit" runat="server" Width="450px"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:HiddenField ID="HF_Checker" runat="server" />
                                                    <asp:TextBox ID="TXT_Checker" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:HiddenField ID="HF_Contracter" runat="server" />
                                                    <asp:TextBox ID="TXT_Contracter" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:HiddenField ID="HF_Safekeep" runat="server" />
                                                    <asp:TextBox ID="TXT_Safekeep" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_MarkTime" runat="server" ReadOnly="true"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_Marker" runat="server" ReadOnly="true"></asp:TextBox>
                                                    <asp:HiddenField ID="HF_Marker" runat="server" />
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BuChongBianJi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_SupplementEditor" runat="server" ReadOnly="true"></asp:TextBox>
                                                    <asp:HiddenField ID="HF_SupplementEditor" runat="server" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZiGouGaiSuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_SelfCost" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_ContractMoney" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_AcceptMoney" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_ProjectTax" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YunZaFei%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_TheFreight" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,FaLiaoJinE%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_SendMoney" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,CaiGouJinDu%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_FinishingRate" runat="server"></asp:TextBox>%
                                                </td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiaGongYuSuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_ForCost" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiaLingYuSuan%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_TheBudget" runat="server"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td class="formItemBgStyle">&nbsp;</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_Progress" runat="server"></asp:TextBox>
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TXT_IsMark" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XiangMuDaiMa%>"></asp:Label>：</td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="9">
                                                    <asp:TextBox ID="TXT_RelatedCode" runat="server"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: center" class="formItemBgStyle" colspan="10">
                                                    <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                                type="button" value="关闭" />
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
        </div>
        <asp:HiddenField ID="HF_ID" runat="server" />
                </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
