<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUpdateUserInforSAAS.aspx.cs" Inherits="TTUpdateUserInforSAAS" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>更改我的资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function changeLeftBarExtend(isExtend) {

            if (isExtend === "YES") {

                window.parent.parent.document.getElementById("TakeTopLRMDI").cols = '180,*';
            }
            else {

                window.parent.parent.document.getElementById("TakeTopLRMDI").cols = '45,*';
            }

            top.frames[0].frames[2].parent.frames["leftMiddleFrame"].setExtendValue(isExtend);

        }

    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
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
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GengGaiMiMa%>"></asp:Label>
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
                                    <table style="width: 550px;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                        <tr>
                                            <td style="width: 15%; text-align: right;" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                            </td>
                                            <td style="width: 250px; text-align: left;" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_UserCode" runat="server" Enabled="False"></asp:TextBox>
                                            </td>

                                        </tr>
                                        <tr>
                                            <td style="text-align: right;" class="formItemBgStyle">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label>
                                            </td>
                                            <td style="text-align: left;" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_UserName" runat="server" Enabled="False"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;" class="formItemBgStyle">
                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YuanMiMa%>"></asp:Label>
                                            </td>
                                            <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                <asp:TextBox ID="TB_OldPassword" runat="server" Width="220px"></asp:TextBox>
                                                <%--   <cc1:PasswordStrengt
                                                ID="TB_Password_PasswordStrength" runat="server" Enabled="True" TargetControlID="TB_Password" PreferredPasswordLength="8" MinimumLowerCaseCharacters="5" MinimumNumericCharacters="2" MinimumSymbolCharacters="1">
                                            </cc1:PasswordStrength>--%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: right;" class="formItemBgStyle">
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>
                                            </td>
                                            <td style="text-align: left;" class="formItemBgStyle">
                                                <asp:TextBox ID="TB_Password" runat="server"></asp:TextBox>
                                                <%--   <cc1:PasswordStrength
                                                ID="TB_Password_PasswordStrength" runat="server" Enabled="True" TargetControlID="TB_Password" PreferredPasswordLength="8" MinimumLowerCaseCharacters="5" MinimumNumericCharacters="2" MinimumSymbolCharacters="1">
                                            </cc1:PasswordStrength>--%>
                                                <span style="font-size: 8pt; color: red">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiShaoBaWeiZhiFu%>"></asp:Label></span>
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuJieMianFengGe%>"></asp:Label></td>
                                            <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                <asp:DropDownList ID="DL_CssDirectory" runat="server">
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
                                            <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JieMianYuYan%>"></asp:Label>
                                            </td>
                                            <td class="formItemBgStyle" style="height: 12px; text-align: left;">
                                                <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true"></asp:DropDownList></td>

                                        </tr>

                                        <tr>
                                            <td class="formItemBgStyle" style="height: 12px; text-align: right;">
                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhanKaiZouBianLian%>"></asp:Label></td>
                                            <td class="formItemBgStyle" colspan="2" style="height: 12px; text-align: left;">
                                                <asp:DropDownList ID="DL_LeftBarExtend" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_LeftBarExtend_SelectedIndexChanged">
                                                    <asp:ListItem Value="NO" Text="<%$ Resources:lang,Fou%>" />
                                                    <asp:ListItem Value="YES" Text="<%$ Resources:lang,Shi%>" />
                                                    <asp:ListItem Value="NO" Text="<%$ Resources:lang,Fou%>" />
                                                </asp:DropDownList>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle"></td>
                                            <td style="text-align: left;" class="formItemBgStyle">
                                                <br />
                                                <asp:Button ID="BT_Update" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" />
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
