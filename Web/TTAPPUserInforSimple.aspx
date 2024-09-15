<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPUserInforSimple.aspx.cs" Inherits="TTAPPUserInforSimple" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

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
                                    <a href="TakeTopAPPMain.aspx">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <img src="ImagesSkin/return.png" alt="" />
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YongHuXinXi%>"></asp:Label>
                                                </td>
                                                <td width="5">
                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </a>
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
                                    <asp:TextBox ID="TB_UserCode" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1" rowspan="6">
                                    <asp:Image ID="IM_MemberPhoto" runat="server" Height="140px" Width="154px" AlternateText="员工照片"
                                        ImageAlign="Left" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHuMing%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_UserName" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Gender" runat="server" Width="49px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label>
                                </td>
                                <td style="text-align: left" class="formItemBgStyle">
                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Age" runat="server" Precision="0" Width="49px">0</NickLee:NumberBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_Duty" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiChen%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_JobTitle" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
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
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZiBuMen%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_ChildDepartment" runat="server" Enabled="false" Width="220px"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_OfficePhone" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_MobilePhone" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">E_Mail：
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_EMail" runat="server" Enabled="False"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>
                                </td>
                                <td style="width: 250px; text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_WorkScope" runat="server" Enabled="False" Height="73px" ReadOnly="True"
                                        TextMode="MultiLine" Width="260px"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td style="text-align: right" class="formItemBgStyle">
                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>
                                </td>
                                <td style="text-align: left;" class="formItemBgStyle">
                                    <asp:TextBox ID="TB_JoinDate" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                </td>
                                <td style="text-align: left;" class="auto-style1"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_UserType" Width="65px" Enabled="false" runat="server">
                                        <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                        <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>"> </asp:ListItem>
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YongGongReiXing%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" class="formItemBgStyle">
                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                </td>
                                <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                    <asp:Label ID="LB_Status" runat="server"  Width="75px"></asp:Label>
                                </td>

                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <asp:TextBox ID="TB_RefUserCode" Enabled="False" runat="server"></asp:TextBox>
                                </td>
                                <td class="auto-style2" style="text-align: left;"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,RTXHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                    <asp:TextBox ID="TB_UserRTXCode" runat="server" Enabled="False"></asp:TextBox>
                                </td>

                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                        PositiveColor="" Precision="0" Width="80px" Enabled="False">0</NickLee:NumberBox>
                                </td>
                                <td class="formItemBgStyle" style="text-align: left;"></td>
                            </tr>
                            <tr>
                                <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YongXuDengLuSeBei%>"></asp:Label>
                                </td>
                                <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                    <asp:DropDownList ID="DL_AllowDevice" runat="server" Enabled="false">
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
