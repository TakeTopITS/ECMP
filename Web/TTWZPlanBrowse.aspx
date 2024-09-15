<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPlanBrowse.aspx.cs" Inherits="TTWZPlanBrowse" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">

        $(function () { 

        });

        function printpage() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print()
            CloseLayer();
        }

    </script>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiHuaLiuLan%>"></asp:Label>
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
                                                        <td align="left" style="width: 100%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle" style="width: 80%; font-size: 20px;">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="6">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_PlanCode" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td width="200px">
                                                                                    <img src="Logo/FormLogo.png" /></td>
                                                                                <td width="550px" style="font-size: xx-large; text-align: left;" >
                                                                                    <br />
                                                                                    <h1>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WuZhiXianELingLiaoJiHua%>"></asp:Label></h1>
                                                                                    <br />
                                                                                </td>
                                                                               
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                               
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ProjectCode" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:Label ID="LB_ProjectName" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,TiJiaoRiQi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_CommitTime" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZiBianHao%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_SinceNumber" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                        <asp:Label ID="LB_PlanName" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaBianZhi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_PlanMarkerName" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr style="height: 50px;">
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GongYingFangShi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_SupplyMethod" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_StoreRoom" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_SignTime" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_PurchaseEngineerName" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_PickingUnit" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="2">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ApproveTime" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FeiKongZhuGuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_FeeManageName" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,JianLiDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_SupervisorUnit" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="2">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">&nbsp;
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuGuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JianSheDanWei%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_BuildUnit" runat="server" Text="**"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle" colspan="2">&nbsp;</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">&nbsp;
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuGuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="8">&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                      <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                                        <p class="noprint">
                                                                            <input id="print" class="inpu" onclick="window.returnValue = false; CloseLayer();"
                                                                                type="button" value="关闭" />&nbsp;
                                                                        <input id="print0" class="inpu" onclick="printpage();" type="button" value="打印" />
                                                                        </p>
                                                                    </td>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="LB_Year" runat="server" Text="yyyy"></asp:Label><asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="LB_Month" runat="server" Text="MM"></asp:Label><asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="LB_Day" runat="server" Text="dd"></asp:Label><asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,Ri%>"></asp:Label>
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
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
