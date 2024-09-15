<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPUpdateUserInfor.aspx.cs" Inherits="TTAPPUpdateUserInfor" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<!DOCTYPE html>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>


    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,Back%>"></asp:Label>
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
                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                    <tr>
                                        <td style="width: 15%; text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_UserCode" runat="server" Enabled="False" Width="99%"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_UserName" runat="server" Enabled="False" Width="99%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Password" runat="server" Width="99%"></asp:TextBox>
                                            <br />
                                            <span style="font-size: 8pt; color: red">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiShaoBaWeiZhiFu%>"></asp:Label></span>
                                        </td>
                                    </tr>
                                    <tr style="display: none;">
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label></td>
                                    </tr>
                                   <tr style="display: none;">
                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                            <asp:DropDownList ID="DL_CssDirectory" runat="server" Width="99%">

                                                <asp:ListItem Value="CssBlue" Text="<%$ Resources:lang,LanSe%>" />
                                                <asp:ListItem Value="CssGreen" Text="<%$ Resources:lang,LuSe%>" />
                                                <asp:ListItem Value="CssRed" Text="<%$ Resources:lang,HongSe%>" />
                                                <asp:ListItem Value="CssGolden" Text="<%$ Resources:lang,JinSe%>" />
                                                <asp:ListItem Value="CssGray" Text="<%$ Resources:lang,HuiSe%>" />
                                                <asp:ListItem Value="CssBlack" Text="<%$ Resources:lang,HeiSe%>" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JieMianYuYan%>"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>

                                        <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                            <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true" Width="99%"></asp:DropDownList></td>

                                    </tr>


                                    <tr>

                                        <td style="text-align: center;" class="formItemBgStyle">
                                            <br />
                                            <asp:Button ID="BT_Update" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" Width="99%" />
                                        </td>
                                    </tr>
                                </table>

                            </td>
                        </tr>

                        <tr style="display: none;">
                            <td>
                                <table style="display: none;">
                                    <tr>
                                        <td style="text-align: right" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_Gender" runat="server" Enabled="False">
                                                <asp:ListItem Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,NianLin%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left" class="formItemBgStyle">
                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_Age" runat="server" Precision="0" Width="49px">0</NickLee:NumberBox>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_Duty" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle">
                                            <asp:Image ID="IM_MemberPhoto" runat="server" AlternateText="员工照片" Height="140px" ImageAlign="Left" Width="154px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="text-align: right;">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhiChen%>"></asp:Label></td>
                                        <td class="formItemBgStyle" style="text-align: left;">
                                            <asp:TextBox ID="TB_JobTitle" runat="server" Enabled="False" ReadOnly="True"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle">&nbsp;</td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_Department" runat="server" DataTextField="DepartName"
                                                DataValueField="DepartCode" Enabled="False">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="formItemBgStyle">
                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiBuMen%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_ChildDepartment" runat="server" Enabled="false" Width="220px"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BanGongDianHua%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_OfficePhone" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_MobilePhone" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">E_Mail：
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_EMail" runat="server"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongZuoFanWei%>"></asp:Label>
                                        </td>
                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_WorkScope" runat="server" Height="73px" Width="260px" ReadOnly="True"
                                                TextMode="MultiLine" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label>
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:TextBox ID="TB_JoinDate" runat="server" ReadOnly="True" Enabled="False"></asp:TextBox>
                                        </td>
                                        <td class="formItemBgStyle"></td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XingZhi%>"></asp:Label>
                                        </td>
                                        <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                            <asp:DropDownList ID="DL_UserType" Enabled="false" runat="server">
                                                <asp:ListItem Value="INNER" Text="<%$ Resources:lang,NeiBu%>" />
                                                <asp:ListItem Value="OUTER" Text="<%$ Resources:lang,WaiBu%>" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;" class="formItemBgStyle">
                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                        </td>
                                        <td colspan="2" style="text-align: left;" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_Status" runat="server" Enabled="false">
                                                <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                                <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right" class="formItemBgStyle">
                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YongGongleixing%>"></asp:Label></td>
                                        <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                            <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName" Enabled="false">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CanKaoGongHao%>"></asp:Label>
                                        </td>
                                        <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                            <asp:TextBox ID="TB_RefUserCode" runat="server" Width="220px" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,RTXHao%>"></asp:Label>
                                        </td>
                                        <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                            <asp:TextBox ID="TB_UserRTXCode" runat="server" Width="220px" Enabled="False"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,SongXuHao%>"></asp:Label>
                                        </td>
                                        <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                PositiveColor="" Precision="0" Width="80px" Enabled="False">0</NickLee:NumberBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label></td>
                                        <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                            <asp:DropDownList ID="DL_SystemMDIStyle" runat="server" DataTextField="MDIStyle" DataValueField="MDIStyle">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YongXuDengLuSeBei%>"></asp:Label></td>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
