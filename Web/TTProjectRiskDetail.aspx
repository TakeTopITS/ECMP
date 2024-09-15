<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRiskDetail.aspx.cs"
    Inherits="TTProjectRiskDetail" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuFengXianGuanLi%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="padding: 5px 5px 5px 5px;">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td style="padding: 5px 5px 5px 5px;" align="left">
                                                            <table cellpadding="0" cellspacing="0" width="90%">
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                            <tr>
                                                                                <td align="right">

                                                                                    <asp:HyperLink ID="HL_RiskToTask" runat="server" Enabled="false" Target="_blank">--&gt;<asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,FengXianZhuanRenWu%>"></asp:Label></asp:HyperLink>

                                                                                    &nbsp;&nbsp;
                                                                               
                                                                                    <asp:HyperLink ID="HL_RiskRelatedDoc" runat="server" Enabled="false" Target="_blank">
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
                                                                                    </asp:HyperLink>

                                                                                    &nbsp;&nbsp;

                                                                                     <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:HyperLink ID="HL_RiskReviewWF" runat="server" Visible="False" Target="_blank">--&gt;<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,FengXianPingGu%>"></asp:Label></asp:HyperLink>

                                                                                   <asp:HyperLink ID="HL_RunRiskByWF" runat="server" Visible="False" Target="_blank">
                                                                                       <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,FXCLLCMS%>"></asp:Label>
                                                                                   </asp:HyperLink>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="left">
                                                                        <table style="width: 90%;" cellpadding="2" cellspacing="0" class="formBgStyle">

                                                                            <tr>
                                                                                <td style="width: 10%; text-align: right; height: 24px;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td colspan="3" style="height: 24px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                                </td>

                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FengXianMingCheng%>"></asp:Label>：
                                                                                </td>
                                                                                <td align="left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_RiskName" runat="server" Width="98%"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="font-size: 12pt; width: 20%; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_RiskLevel" runat="server">
                                                                                        <asp:ListItem Value="中" Text="<%$ Resources:lang,Zhong%>" />
                                                                                        <asp:ListItem Value="高" Text="<%$ Resources:lang,Gao%>" />
                                                                                        <asp:ListItem Value="低" Text="<%$ Resources:lang,Di2%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangXiMiaoShu%>"></asp:Label>：
                                                                                </td>
                                                                                <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_RiskDetail" runat="server" Height="60px" TextMode="MultiLine"
                                                                                        Width="99%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YuJiFaShengShiJian%>"></asp:Label>：&nbsp;
                                                                                </td>
                                                                                <td style="width: 200px; text-align: left;" class="formItemBgStyle">

                                                                                    <asp:TextBox ID="DLC_EffectDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_EffectDate">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FaXianShiJian%>"></asp:Label>：&nbsp;
                                                                                </td>
                                                                                <td style="width: 200px; text-align: left;" class="formItemBgStyle">


                                                                                    <asp:TextBox ID="DLC_FindDate" ReadOnly="false" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_FindDate">
                                                                                    </ajaxToolkit:CalendarExtender>

                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                                </td>
                                                                                <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                                                        <asp:ListItem Value="潜在" Text="<%$ Resources:lang,QianZai%>" />
                                                                                        <asp:ListItem Value="暴露" Text="<%$ Resources:lang,BaoLu%>" />
                                                                                        <asp:ListItem Value="发生" Text="<%$ Resources:lang,FaSheng%>" />
                                                                                        <asp:ListItem Value="解除" Text="<%$ Resources:lang,JieChu%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">&nbsp;
                                                                                </td>
                                                                                <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_Update" runat="server" CssClass="inpu" OnClick="BT_Update_Click"
                                                                                        Text="<%$ Resources:lang,BaoCun%>" />
                                                                                    &nbsp;
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
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
