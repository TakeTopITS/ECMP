<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInforSimpleForGanttPlan.aspx.cs" Inherits="TTUserInforSimpleForGanttPlan" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 145px;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 12px;
            width: 145px;
        }
    </style>

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

            <%--var MustInFrame = '<%=Session["MustInFrame"].ToString() %>'.trim();
            if (MustInFrame == 'YES') {
                if (top.location != self.location) { } else { CloseWebPage(); }
            }--%>

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">

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
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi"></asp:Label><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongHuXinXi%>"></asp:Label>
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
                    <td style="padding-top: 5px; padding-bottom: 5px;" align="center">
                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="550px">
                            <tr>
                                <td style="width: 150px; text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                </td>
                                <td style="width: 130px; text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_UserCode" runat="server" Enabled="False" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle" rowspan="6">
                                    <asp:Image ID="IM_MemberPhoto" runat="server" Height="140px" Width="154px" AlternateText="员工照片"
                                        ImageAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_UserName" runat="server" Enabled="False" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_Gender" runat="server" Width="49px" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>
                                </td>
                                <td style="text-align: left" class="formItemBgStyle">
                                    <asp:Label ID="TB_Age" runat="server"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_Duty" runat="server" Enabled="False" ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiChen%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_JobTitle" runat="server" Enabled="False" ReadOnly="True" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:DropDownList ID="DL_Department" runat="server" DataTextField="DepartName" DataValueField="DepartCode"
                                        Width="152px" Enabled="False">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZiBuMen%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_ChildDepartment" runat="server" Enabled="false" Width="220px" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_OfficePhone" runat="server" Enabled="False" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_MobilePhone" runat="server" Enabled="False" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">E_Mail：
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_EMail" runat="server" Enabled="False" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>
                                </td>
                                <td style="width: 250px; text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_WorkScope" runat="server" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="TB_JoinDate" runat="server" Enabled="False" ReadOnly="True" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_UserType" Width="65px" Enabled="false" runat="server">
                                        <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                        <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>"> </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YongGongReiXing%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName" Enabled="false">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="LB_Status" runat="server" Width="75px"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:Label ID="TB_RefUserCode" Enabled="False" runat="server" />
                                </td>
                                <td class="formItemBgStyle" style="text-align: left;"></td>
                            </tr>
                            <tr style="display: none;">
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,RTXHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:Label ID="TB_UserRTXCode" runat="server" Enabled="False" />
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:Label ID="NB_SortNumber" runat="server"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="text-align: left;"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YongXuDengLuSeBei%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_AllowDevice" runat="server"  Enabled="false">
                                        <asp:ListItem Value="ALL" Text="<%$ Resources:lang,QuanBu%>" />
                                        <asp:ListItem Value="PC" Text="<%$ Resources:lang,DianNao%>" />
                                        <asp:ListItem Value="MOBILE" Text="<%$ Resources:lang,YiDongSheBei%>" />
                                    </asp:DropDownList>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;"></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
