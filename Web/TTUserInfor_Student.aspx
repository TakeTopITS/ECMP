<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInfor_Student.aspx.cs" Inherits="TTUserInfor_Student" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>学籍表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/Silverlight.js"></script>

    <script src="js/My97DatePicker/WdatePicker.js"></script>

    <script type="text/javascript">
        function onSilverlightError(sender, args) {
            var appSource = "";
            if (sender != null && sender != 0) {
                appSource = sender.getHost().Source;
            }

            var errorType = args.ErrorType;
            var iErrorCode = args.ErrorCode;

            if (errorType == "ImageError" || errorType == "MediaError") {
                return;
            }

            var errMsg = "Unhandled Error in Silverlight Application " + appSource + "\n";

            errMsg += "Code: " + iErrorCode + "    \n";
            errMsg += "Category: " + errorType + "       \n";
            errMsg += "Message: " + args.ErrorMessage + "     \n";

            if (errorType == "ParserError") {
                errMsg += "File: " + args.xamlFile + "     \n";
                errMsg += "Line: " + args.lineNumber + "     \n";
                errMsg += "Position: " + args.charPosition + "     \n";
            }
            else if (errorType == "RuntimeError") {
                if (args.lineNumber != 0) {
                    errMsg += "Line: " + args.lineNumber + "     \n";
                    errMsg += "Position: " + args.charPosition + "     \n";
                }
                errMsg += "MethodName: " + args.methodName + "     \n";
            }

            throw new Error(errMsg);
        }
    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script language="javascript" type="text/javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }
            
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="60%" align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XueJiBiao%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <asp:Label ID="LB_StudentNumber" runat="server"></asp:Label>
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>

                                            <td align="left" valign="top" style="padding: 5px 5px 5px 5px;">

                                                <table class="formBgStyle" style="width: 100%; text-align: left;" cellpadding="3"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,TianXieRiQi%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_JoinDate" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_UserCode" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td align="center" class="formItemBgStyle" colspan="2" rowspan="5">
                                                            <asp:Image ID="IM_MemberPhoto" runat="server" Height="200px" Width="220px" AlternateText="员工照片" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserName" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_Gender" runat="server" AutoPostBack="True">
                                                                <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ChuShengRiJi%>"></asp:Label></td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="DLC_BirthDay" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ChuShengDiDian%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_NativePlace" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: Right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HuKouSuoZaiDi%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_HuKou" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BanJi%>"></asp:Label>Class 
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_StudentClass" runat="server" Width="150px">
                                                                <%--<asp:ListItem>小A</asp:ListItem>
                                                                <asp:ListItem>小B</asp:ListItem>
                                                                <asp:ListItem>小C</asp:ListItem>--%>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: Right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhuZhi%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Residency" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuZaiDianHua%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_OfficePhone" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JingJiLianXiRen%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UrgencyPerson" Width="220px" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: Right;" class="formItemBgStyle">&nbsp;</td>
                                                        <td style="text-align: right;" class="formItemBgStyle" colspan="3">
                                                            <asp:Button ID="BT_TakePhoto" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_TakePhoto_Click" Text="<%$ Resources:lang,PaiZhao%>" />
                                                            <cc1:ModalPopupExtender ID="BT_TakePhoto_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_ClosePhoto" DynamicServicePath="" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_TakePhoto" Y="150">
                                                            </cc1:ModalPopupExtender>
                                                            &nbsp;
                                                            <asp:Button ID="BT_DeletePhoto" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeletePhoto_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                            <asp:HyperLink ID="HL_MemberPhoto" runat="server"></asp:HyperLink>
                                                            <br />
                                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <asp:FileUpload ID="FUP_File" runat="server" Width="100px" />
                                                                    &nbsp;<asp:Button ID="BT_UploadPhoto" runat="server" CssClass="inpu" OnClick="BT_UploadPhoto_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TuPianKuan220Gao200%>"></asp:Label>
                                                                </ContentTemplate>
                                                                <Triggers>
                                                                    <asp:PostBackTrigger ControlID="BT_UploadPhoto" />
                                                                </Triggers>
                                                            </asp:UpdatePanel>
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td style="text-align: Right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UrgencyCall" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left;" class="formItemBgStyle">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ChenJiuDuYouErYuan%>"></asp:Label>
                                                        </td>

                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_AttendedKindergarten" runat="server" Width="220px"></asp:TextBox>
                                                            <span style="color: #ff0000">*</span>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,KeHouTuoGuanBan%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_ManagedAfterClass" runat="server" />
                                                        </td>
                                                        <td class="formItemBgStyle">&nbsp;</td>
                                                        <td class="formItemBgStyle">&nbsp;</td>
                                                        <td style="text-align: left;" width="40px" class="formItemBgStyle" colspan="2">&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" colspan="2" class="formItemBgStyle">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></td>
                                                        <td style="text-align: center" colspan="2" class="formItemBgStyle">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label></td>
                                                        <td style="text-align: center" colspan="2" class="formItemBgStyle">
                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BaBa%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_FatherName" runat="server" Width="220px"></asp:TextBox>
                                                        </td>

                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                            <asp:TextBox ID="TXT_FatherUnit" runat="server" Width="220px"></asp:TextBox>
                                                        </td>

                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                            <asp:TextBox ID="TXT_FatherPhone" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,MaMa%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_MonthName" runat="server" Width="220px"></asp:TextBox>
                                                        </td>

                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                            <asp:TextBox ID="TXT_MonthUnit" runat="server" Width="220px"></asp:TextBox>
                                                        </td>

                                                        <td style="text-align: left;" class="formItemBgStyle" colspan="2">
                                                            <asp:TextBox ID="TXT_MonthPhone" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,RuXueRiQi%>"></asp:Label>
                                                        </td>
                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="DLC_AdmissionDate" runat="server" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox>
                                                        </td>
                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle" colspan="4">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GuoMingShi%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsAllergy" runat="server" />
                                                        </td>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiaoChuanShi%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsAsthma" runat="server" />
                                                        </td>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YiChuaBing%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsInheritedillnesses" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,YaoWuGuoMingShi%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsMedicalAllergy" runat="server" />
                                                        </td>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JingJiBing%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsForbiddenillness" runat="server" />
                                                        </td>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ChengZuoShouShu%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsSurgery" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ChengHuanZhongDaJiBing%>"></asp:Label>
                                                        </td>
                                                        <td colspan="" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:CheckBox ID="CKB_IsMajordiseases" runat="server" />
                                                        </td>
                                                        <td style="height: 12px; text-align: left;" class="formItemBgStyle" colspan="4">&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label>
                                                        </td>
                                                        <td colspan="5" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_OtherRemark" runat="server" TextMode="MultiLine" Height="90px" Width="778px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,MeiXueQiBaoJiaoFei%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_WangFeePerSemester" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,SanShiFei%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Meals" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,KeWaiHuoDongFeiYong%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ActivityCost" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,KeHouTuoGuanFei%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_CustodyAfterClass" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,DaiShouDaiZhiShengHuoYongPingFei%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ReplaceCosts" runat="server" Width="220px"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right" class="formItemBgStyle">&nbsp;
                                                        </td>
                                                        <td class="formItemBgStyle"></td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />
                                                &nbsp;<asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                                    Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                                &nbsp;<asp:Button ID="BT_Delete" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                    Text="<%$ Resources:lang,ShanChu%>" />
                                                &nbsp;</td>

                                            <td align="left" style="width: 30%; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top">
                                                <div style="width: 800px;">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="TB_UserCode" runat="server" Width="80px"></asp:TextBox></td>
                                                            <td>
                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></td>
                                                            <td>
                                                                <asp:TextBox ID="TextBox1" Width="80px" runat="server"></asp:TextBox></td>
                                                            <td>
                                                                <asp:Button ID="BT_Find" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_Find_Click" /></td>

                                                            <td align="right">
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label></td>
                                                            <td width="350px" style="text-align: left;">
                                                                <asp:Label ID="LB_BelongDepartCode" runat="server"></asp:Label>
                                                                <asp:TextBox ID="TB_BelongDepartName" runat="server" Width="125px"></asp:TextBox>
                                                                <cc1:ModalPopupExtender ID="TB_BelongDepartName_ModalPopupExtender" runat="server"
                                                                    Enabled="True" TargetControlID="TB_BelongDepartName" PopupControlID="Panel1"
                                                                    CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                                <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QingKong%>" OnClick="BT_Clear_Click" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                            </strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                            </strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BanJi%>"></asp:Label>
                                                                            </strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>
                                                                            </strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="24" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' CommandName="click" CssClass="notTab">
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                    </asp:LinkButton>
                                                                    <%--<a href='TTUserInfor_StudentCare.aspx?StudentCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>&StudentName=<%# DataBinder.Eval(Container.DataItem,"UserName") %>'  target="_blank">保健</a>--%>
                                                                    <a href='TTUserInfor_StudentAtten.aspx?StudentCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>&StudentName=<%# DataBinder.Eval(Container.DataItem,"UserName") %>'  target="_blank">
                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,KaoQing%>"></asp:Label></a>
                                                                    <%--<a href='TTUserInfor_StudentCo.aspx?StudentCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>&StudentName=<%# DataBinder.Eval(Container.DataItem,"UserName") %>'  target="_blank">收费</a>--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="UserCode" HeaderText="学生编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="UserName" HeaderText="学生名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ClassName" HeaderText="班级">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                        <div id="silverlightControlHost" class="modalPopup-text" style="width: 100%; height: 100%; float: left;">
                            <table width="100%">
                                <tr>
                                    <td style="width: 710px;" valign="top" align="left">
                                        <object data="data:application/x-silverlight-2," type="application/x-silverlight-2"
                                            width="710px" height="320px">
                                            <param name="source" value="ClientBin/TakeTopMakePhoto.xap" />
                                            <param name="onError" value="onSilverlightError" />
                                            <param name="background" value="white" />
                                            <param name="minRuntimeVersion" value="4.0.50826.0" />
                                            <param name="autoUpgrade" value="true" />
                                            <a href="http://go.microsoft.com/fwlink/?LinkID=149156&v=4.0.50826.0" style="text-decoration: none">
                                                <img src="http://go.microsoft.com/fwlink/?LinkId=161376" alt="Get Microsoft Silverlight"
                                                    style="border-style: none" />
                                            </a>
                                        </object>
                                        <iframe id="_sl_historyFrame" style="visibility: hidden; height: 0px; width: 0px; border: 0px"></iframe>
                                    </td>
                                    <td>
                                        <br />
                                        <asp:ImageButton ID="IMBT_ClosePhoto" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <br />
                    <asp:TextBox ID="TB_PhotoString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString4" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SavePhoto" runat="server" CssClass="inpuLong" OnClick="BT_SavePhoto_Click"
                        Style="visibility: hidden" />

                    <asp:HiddenField ID="HF_UserCode" runat="server" />
                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 1%;">
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
