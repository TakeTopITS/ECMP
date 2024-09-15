<%@ page language="C#" autoeventwireup="true" CodeFile="TTItemDataAndBomSet.aspx.cs"   Inherits="TTItemDataAndBomSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" ru产品资料设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1580px;
            width: expression (document.body.clientWidth <= 1580? "1580px" : "auto" ));
        }
      
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function clickReportPrint() {

            this.document.getElementById(("HL_BOMReport").click();
        }

    </script>

    <script type="text/javascript" src="js/Silverlight.js"></script>
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

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = LLB_ItemCode.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            LLB_ItemCode.scrollTop = disPostion;
        }

        function displayWaitingImg(img) {

            this.document.getElementById(img).style.display = 'block';
        }

    </script>


</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="1780" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="left" background="ImagesSkin/main_top_bj.jpg">（<asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZJXBBBBH%>"></asp:Label>：<NickLee:NumberBox MaxAmount="1000000000000" ID="NB_NewVerID" runat="server" MinAmount="1" Precision="0"
                                                        Width="30px" Amount="1">
                                                1</NickLee:NumberBox>
                                                        &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    <asp:DropDownList ID="DL_VersionType" runat="server">
                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>" />
                                                    </asp:DropDownList>
                                                        <asp:Button ID="BT_NewVersion" runat="server" OnClick="BT_NewVersion_Click" Text="<%$ Resources:lang,XinZeng%>"
                                                            Enabled="False" />
                                                        &nbsp;<asp:Button ID="BT_DeleteVersion" runat="server" OnClick="BT_DeleteVersion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                            Text="<%$ Resources:lang,ShanChu%>" Enabled="False" />
                                                        ）(<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XTYSJGWBSFZCBB%>"></asp:Label><asp:DropDownList ID="DL_OldVersionID" runat="server" DataTextField="VerID"
                                                            DataValueField="ID" Width="40px" AutoPostBack="True" OnSelectedIndexChanged="DL_OldVersionID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuZhiDaoBanBen%>"></asp:Label><asp:DropDownList ID="DL_NewVersionID" runat="server" DataTextField="VerID"
                                                            DataValueField="ID" Width="40px" AutoPostBack="True" OnSelectedIndexChanged="DL_NewVersionID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        &nbsp;<asp:Button ID="BT_CopyVersion" runat="server" CssClass="inpu" O="" OnClick="BT_CopyVersion_Click"
                                                            Text="<%$ Resources:lang,FuZhi%>" />
                                                        ）（<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BTYSJGWBSFZC%>"></asp:Label>：<asp:Label ID="LB_FromItemCode" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DeBanBen%>"></asp:Label>：
                                                        <asp:DropDownList ID="DL_FromVersionID" runat="server" AutoPostBack="True" DataTextField="VerID" DataValueField="ID" OnSelectedIndexChanged="DL_FromVersionID_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                        &nbsp;<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FuZhiDao%>"></asp:Label>：&nbsp;
                                                    <asp:Label ID="LB_ToItemCode" runat="server"></asp:Label>
                                                        &nbsp;<asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label>：
                                                     
                                                        <asp:DropDownList ID="DL_ToItemVersionID" runat="server" AutoPostBack="True" DataTextField="VerID" DataValueField="ID"  OnSelectedIndexChanged="DL_ToItemVersionID_SelectedIndexChanged" Width="40px">
                                                        </asp:DropDownList>
                                                        &nbsp;&nbsp;<asp:Button ID="BT_CopyVersionAB" runat="server" CssClass="inpu" O=""
                                                            OnClick="BT_CopyVersionAB_Click" Text="<%$ Resources:lang,FuZhi%>" Enabled="False" />
                                                        ）
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
                            <td>
                                <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="400px" valign="top" style="padding: 5px 5px 0px 5px; text-align: left; border-right: solid 1px #D8D8D8">
                                            <table width="400px" class="formBgStyle">
                                                <tr>
                                                    <td class="formItemBgStyle">
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                            <asp:ListItem Value="SYSTEM" Text="<%$ Resources:lang,XiTong%>" />
                                                            <asp:ListItem Value="PROJECT" Text="<%$ Resources:lang,XiangMu%>" />
                                                            <asp:ListItem Value="OTHER" Text="<%$ Resources:lang,QiTa%>" />
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td width="15%" class="formItemBgStyle">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td width="25%" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_ProjectItemType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ProjectItemType_SelectedIndexChanged">
                                                            <asp:ListItem Value="采购件" Text="<%$ Resources:lang,CaiGouJian%>" />
                                                            <asp:ListItem Value="自制件" Text="<%$ Resources:lang,ZiZhiJian%>" />
                                                            <asp:ListItem Value="外协件" Text="<%$ Resources:lang,WaiXieJian%>" />
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="10%" class="formItemBgStyle">
                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                    </td>
                                                    <td width="30%" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_ProjectItemCode" Width="92%" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td width="10%" class="formItemBgStyle">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td width="50%" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_ProjectItemName" Width="92%" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td width="10%" class="formItemBgStyle">
                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                    </td>
                                                    <td width="30%" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_FindModelNumber" Width="92%" runat="server"></asp:TextBox>
                                                    </td>
                                                    <td width="10%" class="formItemBgStyle">
                                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                    </td>
                                                    <td width="50%" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_FindBrand" Width="92%" runat="server"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" width="15%">
                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>
                                                        ：</td>
                                                    <td class="formItemBgStyle" colspan="3" width="45%">
                                                        <asp:TextBox ID="TB_ProjectItemSpec" runat="server" Width="75%"></asp:TextBox>
                                                        <asp:Button ID="BT_FindItemName" runat="server" CssClass="inpu" OnClick="BT_FindItemName_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:ListBox ID="LLB_ItemCode" runat="server" Width="100%" Height="608px" OnSelectedIndexChanged="LLB_ItemCode_SelectedIndexChanged"
                                                DataTextField="ProjectItemName" DataValueField="ItemCode" AutoPostBack="True"></asp:ListBox>

                                            <table cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">Item
                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ItemDataImport%>"></asp:Label>
                                                    </td>

                                                </tr>
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div>
                                                                    <Upload:InputFile ID="FileUpload_Item" runat="server" Width="400px" />
                                                                    <br />
                                                                    <asp:Button ID="btn_ExcelToDataTrainingForItem" runat="server" OnClientClick="javascript:displayWaitingImg('img_processing');" OnClick="btn_ExcelToDataTrainingForItem_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                    <img id="img_processing" src="Images/Processing.gif" alt="Loading,please wait..."  style="display:none;"/>
                                                                    
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuJuXingZhengMoBanGeShi%>"></asp:Label>：<a href="Template/物料定义和项目或合同关联物料数据导入表.xls"><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuJuDaoRuMuBan%>"></asp:Label></a>
                                                                    <div id="ProgressBar_Item">
                                                                        <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                        </Upload:ProgressBar>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btn_ExcelToDataTrainingForItem" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>
                                            <table cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">Item<asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ItemBOMDataImport%>"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                            <ContentTemplate>
                                                                <div>
                                                                    <Upload:InputFile ID="FileUpload_ItemBom" runat="server" Width="400px" />
                                                                    <br />
                                                                    <asp:Button ID="btn_ExcelToDataTrainingForItemBOM" runat="server" CssClass="inpu" OnClientClick="javascript:displayWaitingImg('img_processingBom');" OnClick="btn_ExcelToDataTrainingForItemBOM_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                   
                                                                    <img id="img_processingBom" src="Images/Processing.gif" alt="Loading,please wait..."  style="display:none;"/>
                                                                   
                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShuJuXingZhengMoBanGeShi%>"></asp:Label>：<a href="Template/ItemBOMImportTemplate.xls"><asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ShuJuDaoRuMuBan%>"></asp:Label></a>
                                                                    <div id="ProgressBar_ItemBom">
                                                                        <Upload:ProgressBar ID="ProgressBar2" runat="server" Height="100px" Width="500px">
                                                                        </Upload:ProgressBar>
                                                                    </div>
                                                                </div>
                                                            </ContentTemplate>
                                                            <Triggers>
                                                                <asp:PostBackTrigger ControlID="btn_ExcelToDataTrainingForItemBOM" />
                                                            </Triggers>
                                                        </asp:UpdatePanel>
                                                    </td>
                                                </tr>
                                            </table>

                                            <table width="100%" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">Item
                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,BOMItemQuery%>"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="left" class="formItemBgStyle">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_BOMItemCode" runat="server" Width="80px"></asp:TextBox>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:TextBox ID="TB_BOMItemName" runat="server" Width="99%"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                </td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:DropDownList ID="DL_BOMItemType" runat="server">
                                                                        <asp:ListItem Text="<%$ Resources:lang,CaiGouJian%>" Value="采购件" />
                                                                        <asp:ListItem Text="<%$ Resources:lang,ZiZhiJian%>" Value="自制件" />
                                                                        <asp:ListItem Text="<%$ Resources:lang,WaiXieJian%>" Value="外协件" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td class="formItemBgStyle"></td>
                                                                <td class="formItemBgStyle">
                                                                    <asp:Button ID="BT_BOMItemFind" runat="server" CssClass="inpu" OnClick="BT_BOMItemFind_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle"></td>
                                                                <td colspan="3" class="formItemBgStyle">
                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ChaXunJeGuo%>"></asp:Label>
                                                                    :<asp:Label ID="LB_ResultNumber" runat="server"></asp:Label>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="width: 680px; padding: 5px 5px 0px 5px; text-align: left; vertical-align: top; border-right: solid 1px #D8D8D8">
                                            <table style="width: 680px;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                <tr>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_ItemCode" runat="server" Width="120px"></asp:TextBox>
                                                        <span style="color: #ff0000">*</span>
                                                        <asp:HyperLink ID="HL_SetItemCode" runat="server" NavigateUrl="~/TTItemCodeSet.aspx" Text="<%$ Resources:lang,BianMa%>" Target="_blank"></asp:HyperLink>
                                                    </td>
                                                    <td style="text-align: center;" class="formItemBgStyle" colspan="2" rowspan="5">
                                                        <asp:Image ID="IM_ItemPhoto" runat="server" AlternateText="元素照片" Height="200px" Width="220px" />
                                                        <asp:HyperLink ID="HL_ItemPhoto" runat="server"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:TextBox ID="TB_ItemName" runat="server" Width="210px"></asp:TextBox>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_ItemType" runat="server" CssClass="DDList"
                                                            Width="90%">
                                                            <asp:ListItem Value="采购件" Text="<%$ Resources:lang,CaiGouJian%>" />
                                                            <asp:ListItem Value="自制件" Text="<%$ Resources:lang,ZiZhiJian%>" />
                                                            <asp:ListItem Value="外协件" Text="<%$ Resources:lang,WaiXieJian%>" />
                                                            <asp:ListItem Value="交付件" Text="<%$ Resources:lang,JiaoFuJian%>" />
                                                        </asp:DropDownList>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:DropDownList ID="DL_BigType" runat="server" AutoPostBack="true" CssClass="DDList" OnSelectedIndexChanged="DL_BigType_SelectedIndexChanged">
                                                            <asp:ListItem Value="Goods" Text="<%$ Resources:lang,WuLiao%>" />
                                                            <asp:ListItem Value="Asset" Text="<%$ Resources:lang,ZiChan%>" />
                                                        </asp:DropDownList>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,XiaoLei%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:DropDownList ID="DL_SmallType" runat="server" DataTextField="Type" DataValueField="Type" >
                                                        </asp:DropDownList>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:TextBox ID="TB_ModelNumber" runat="server" Width="220px"></asp:TextBox>
                                                    </td>
                                                    <td class="formItemBgStyle" align="center" colspan="2">
                                                        <table width="100%">
                                                            <tr>
                                                                <td align="center">
                                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                        <ContentTemplate>
                                                                            <asp:FileUpload ID="FUP_File" runat="server" Width="100px" />
                                                                            &nbsp;<asp:Button ID="BT_UploadPhoto" runat="server" CssClass="inpu" OnClick="BT_UploadPhoto_Click" Text="<%$ Resources:lang,ShangChuan%>" />

                                                                        </ContentTemplate>
                                                                        <Triggers>
                                                                            <asp:PostBackTrigger ControlID="BT_UploadPhoto" />
                                                                        </Triggers>
                                                                    </asp:UpdatePanel>

                                                                </td>
                                                                <td>&nbsp;<asp:Button ID="BT_DeletePhoto" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeletePhoto_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                                    <asp:Button ID="BT_TakePhoto" runat="server" CssClass="inpu" Enabled="False" Visible="false" OnClick="BT_TakePhoto_Click" Text="<%$ Resources:lang,PaiZhao%>" />
                                                                    <cc2:ModalPopupExtender ID="BT_TakePhoto_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_ClosePhoto" DynamicServicePath="" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_TakePhoto" Y="150">
                                                                    </cc2:ModalPopupExtender>

                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="center">（<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,Kuan200Gao200%>"></asp:Label>）</td>
                                                                <td></td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                        <asp:TextBox ID="TB_Specification" runat="server" Width="99%"></asp:TextBox>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>

                                                  <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                        <asp:TextBox ID="TB_Brand" runat="server" Width="99%"></asp:TextBox>
                                                        
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CaiGouDanJia%>"></asp:Label>
                                                        ：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <NickLee:NumberBox ID="NB_PurchasePrice" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="3" Width="79px">
                                                 0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiaoShouDanJia%>"></asp:Label>
                                                        ：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <NickLee:NumberBox ID="NB_SalePrice" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="3" Width="79px">
                                                 0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:DropDownList ID="DL_CurrencyType" runat="server" DataTextField="Type" DataValueField="Type"  >
                                                        </asp:DropDownList>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>： </td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName" >
                                                        </asp:DropDownList>
                                                        <span style="color: #ff0000">*</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,CaiGouTiQianQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_PULeadTime" runat="server" MinAmount="0" Width="79px">
                                                 0 0.00
                                                        </NickLee:NumberBox>
                                                    </td>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZhiZaoTiQianQi%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_MFLeadTime" runat="server" MinAmount="0" Width="79px">
                                                 0 0.00
                                                        </NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,RenGongChengBen%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_HRCost" runat="server" MinAmount="0" Width="79px" Precision="3">
                                                    0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CaiLiaoChengBen%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_MTCost" runat="server" MinAmount="0" Width="79px" Precision="3">
                                                 0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ZhiZaoChengBen%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_MFCost" runat="server" MinAmount="0" Width="79px" Precision="3">
                                                 0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,AnQuanKuCun%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 230px; text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_SafetyStock" runat="server" MinAmount="0" Width="79px" Precision="3">
                                                 0 0.00
                                                        0.000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,QueShengGongYi%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                        <asp:TextBox ID="TB_DefaultProcess" runat="server" Width="70%"></asp:TextBox>
                                                        <asp:DropDownList ID="DL_ProductProcess1" runat="server" DataTextField="ProcessName"
                                                            DataValueField="ProcessName" Width="150px" AutoPostBack="True" OnSelectedIndexChanged="DL_ProductProcess1_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="text-align: right;">
                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="width: 230px; text-align: left;">
                                                        <NickLee:NumberBox ID="NB_LossRate" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                 0 0.00
                                                        00.00</NickLee:NumberBox></td>
                                                    <td style="width: 100px; text-align: right;" class="formItemBgStyle">
                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label>：</td>
                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                        <NickLee:NumberBox ID="NB_WarrantyPeriod" runat="server" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="79px">
                                                       0 0.00
                                                        0</NickLee:NumberBox>
                                                        天</td>
                                                </tr>
                                                  <tr>
                                                      <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                        <asp:Label ID="Label76" runat="server" Text="注册证号"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle"  style="text-align: left">
                                                        <asp:TextBox ID="TB_RegistrationNumber" runat="server" Width="99%"></asp:TextBox>
                                                    </td>

                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">
                                                        <asp:Label ID="Label75" runat="server" Text="包装方式"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle"  style="text-align: left;">
                                                        <asp:TextBox ID="TB_PackingType" runat="server" Width="99%"></asp:TextBox>
                                                        <asp:DropDownList ID="DL_PackingType" runat="server" DataTextField="Type"
                                                            DataValueField="Type" Width="99%" AutoPostBack="True" OnSelectedIndexChanged="DL_PackingType_SelectedIndexChanged">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right;">&nbsp; </td>
                                                    <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                        <asp:Button ID="BT_New" runat="server" CssClass="inpu" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                        &nbsp;
                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                        &nbsp;
                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_Delete_Click" Text="<%$ Resources:lang,ShanChu%>" />  
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="width: 100px; text-align: left; height: 1px;" class="formItemBgStyle">&nbsp;
                                                    </td>
                                                    <td colspan="3" style="text-align: left; height: 1px;" class="formItemBgStyle">&nbsp; &nbsp; &nbsp;
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="formItemBgStyle" colspan="4" style="text-align: left; height: 1px;">
                                                        <table width="99%">
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_ChildItemCode" runat="server"></asp:Label>
                                                                    &nbsp;
                                                                <asp:Label ID="LB_ChildItemName" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label>：
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ChildVersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                                        DataValueField="ID" OnSelectedIndexChanged="DL_ChildVersionID_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="2">
                                                                    <asp:DropDownList ID="DL_ChangeChildVersionType" runat="server" Width="100%" AutoPostBack="True">
                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right" >
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                                </td>
                                                                <td >
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td align="left">
                                                                                <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_ChildItemNumberToBom" runat="server" Amount="1" MinAmount="0"
                                                                                    Width="90px" Precision="5">
                                                                   0 0.00
                                                                1.001.00000</NickLee:NumberBox></td>
                                                                            <td>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label>：</td>
                                                                            <td align="left">
                                                                                <NickLee:NumberBox ID="NB_BomItemLossRate" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="60px">
                                                 0 0.00
                                                        00.00</NickLee:NumberBox></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td >
                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YuLiuLiang%>"></asp:Label>：
                                                                </td>
                                                                <td >
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_ReservedNumber" runat="server" MinAmount="0"
                                                                        Width="90px" Precision="5">
                                                                   0 0.00
                                                                1.001.000000.00000</NickLee:NumberBox>
                                                                </td>
                                                                <td >
                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="2" >
                                                                    <asp:DropDownList ID="DL_ChildItemUnitToBom" runat="server" DataTextField="UnitName"
                                                                        DataValueField="UnitName" Width="100%">
                                                                    </asp:DropDownList>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>：
                                                                </td>
                                                                <td colspan="3">
                                                                    <asp:TextBox ID="TB_ChildDefaultProcess" runat="server" Width="150px"></asp:TextBox>
                                                                    <asp:DropDownList ID="DL_ProductProcess2" runat="server" DataTextField="ProcessName"
                                                                        DataValueField="ProcessName" AutoPostBack="True" OnSelectedIndexChanged="DL_ProductProcess2_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                    &nbsp;
                                                                </td>
                                                                <td>&nbsp;</td>
                                                                <td align="left">&nbsp;</td>
                                                                <td>&nbsp;</td>
                                                            </tr>
                                                            <tr>
                                                                <td align="right">
                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,ChengBen%>"></asp:Label>：
                                                                </td>
                                                                <td align="left">
                                                                    <table width="100%">
                                                                        <tr>
                                                                            <td style="text-align: left;">
                                                                                <asp:Label ID="LB_ChildItemBomCost" runat="server"></asp:Label></td>
                                                                            <td style="text-align: center;">
                                                                                <asp:HyperLink ID="HL_ItemRelatedDoc" runat="server" NavigateUrl="TTItemRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenDang%>" Target="_blank" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpu" Enabled="false" OnClick="BT_ExportToExcel_Click" Text="<%$ Resources:lang,ExportToExcel%>" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_CreateBOMReport" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_CreateBOMReport_Click" Text="<%$ Resources:lang,BaoBiao%>" />
                                                                </td>
                                                                <td align="left">
                                                                    <asp:CheckBox ID="CB_IncludeChildItem" runat="server" Checked="false" Text="包含子项" />
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_AddToBom" runat="server" CssClass ="inpu" Enabled="false" OnClick="BT_AddToBom_Click" Text="<%$ Resources:lang,AddToBOM%>" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="4" style="text-align: left" class="formItemBgStyle">
                                                        <asp:TreeView ID="TreeView2" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                            NodeWrap="True" ShowLines="True" Style="width: 95%; height: 100%;" >
                                                            <RootNodeStyle CssClass="rootNode" />
                                                            <NodeStyle CssClass="treeNode" />
                                                            <LeafNodeStyle CssClass="leafNode" />
                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                        </asp:TreeView>
                                                    </td>
                                                </tr>

                                            </table>
                                        </td>
                                        <td style="width: 400px; padding: 5px 5px 0px 5px; text-align: left; vertical-align: top; border-right: solid 1px #D8D8D8;">
                                            <table width="100%" cellpadding="2" cellspacing="0">
                                                <tr>
                                                    <td class="formItemBgStyle">
                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td colspan="3" class="formItemBgStyle">
                                                        <asp:Label ID="LB_TopItemCode" runat="server"></asp:Label>
                                                        &nbsp;
                                                    <asp:Label ID="LB_TopItemName" runat="server"></asp:Label>
                                                    </td>
                                                    <td class="formItemBgStyle" align="right">
                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BianJiZhuangTai%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle">
                                                        <asp:DropDownList ID="DL_EditStatus" runat="server" AutoPostBack="True">
                                                            <asp:ListItem Value="否" Text="<%$ Resources:lang,Fou%>" />
                                                            <asp:ListItem Value="是" Text="<%$ Resources:lang,Shi%>" />
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,BanBen%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_VersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                            DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_VersionID_SelectedIndexChanged"
                                                            Width="40px">
                                                        </asp:DropDownList>
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_ChangeVersionType" runat="server" AutoPostBack="True" Height="21px"
                                                            OnSelectedIndexChanged="DL_ChangeVersionType_SelectedIndexChanged" Width="50px">
                                                            <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                            <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                            <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>" />
                                                        </asp:DropDownList>
                                                        <asp:Label ID="LB_TreeDepth" runat="server" Text="-1" Visible="false"></asp:Label>
                                                    </td>
                                                    <td align="right">
                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ChengBen%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LB_ItemBomCost" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                            </table>
                                            <hr />
                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                ShowLines="True" Font-Size="10pt" Font-Bold="False" Font-Names="宋体" Style="width: 300px; height: 100%;">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                        </td>
                                        <td style="padding: 5px 5px 0px 5px; vertical-align: top;" align="left" class="formItemBgStyle">
                                            <table style="width: 300px;" cellpadding="2" cellspacing="0">
                                                <tr>
                                                    <td style="width: 20%;">
                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td style="width: 80%;">
                                                        <asp:Label ID="LB_ItemBomID" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LB_SelectItemCode" runat="server"></asp:Label>
                                                        <asp:Label ID="LB_SelectItemName" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:Label ID="LB_SelectType" runat="server"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <asp:TextBox ID="TB_SelectModelNumber" runat="server" Width="99%" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                    </td>
                                                    <td class="formItemBgStyle" style="text-align: left">
                                                        <asp:TextBox ID="TB_SelectSpecification" runat="server" Width="99%" Height="80px" TextMode="MultiLine" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                 <tr>
                                                    <td>
                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：</td>
                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                        <asp:TextBox ID="TB_SelectBrand" runat="server" Width="99%" Enabled="false"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_SelectBOMNumber" runat="server" MinAmount="0" Width="79px" Precision="5">
                                                 0 0.00
                                                        0.00000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,SunHaoLv%>"></asp:Label>：</td>
                                                    <td>
                                                        <NickLee:NumberBox ID="NB_SelectItemLossRate" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px">
                                                 0 0.00
                                                        00.00</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,YuLiuLiang%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_SelectBOMReservedNumber" runat="server" MinAmount="0" Width="79px" Precision="5">
                                                 0 0.00
                                                        0.00000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_SelectBOMUnit" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                                            >
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <asp:TextBox ID="TB_BomDefaultProcess" runat="server" Width="99%" Height="40px"
                                                            TextMode="MultiLine"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>&nbsp;
                                                    </td>
                                                    <td>
                                                        <asp:DropDownList ID="DL_ProductProcess3" runat="server" AutoPostBack="True" DataTextField="ProcessName"
                                                            DataValueField="ProcessName" OnSelectedIndexChanged="DL_ProductProcess3_SelectedIndexChanged"
                                                            Width="150px">
                                                        </asp:DropDownList>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>：
                                                    </td>
                                                    <td>
                                                        <NickLee:NumberBox ID="NB_SortNumber" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="79px" Precision="0">
                                                 0 0.00
                                                        00.000</NickLee:NumberBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td></td>
                                                    <td style="text-align: left;">
                                                        <asp:HyperLink ID="HL_ItemBomRelatedDoc" runat="server" NavigateUrl="TTItemRelatedDoc.aspx" Text="<%$ Resources:lang,XiangGuanWenDang%>"
                                                            Target="_blank" />
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="LB_SelectKeyWord" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="LB_SelectParentKeyWord" runat="server" Visible="false"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">&nbsp;<asp:Button ID="BT_UpdateFormBom" runat="server" CssClass="inpu" OnClick="BT_UpdateFormBom_Click"
                                                        Text="<%$ Resources:lang,BaoCun%>" />
                                                        &nbsp;<asp:Button ID="BT_DeleteFormBom" runat="server" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())" OnClick="BT_DeleteFormBom_Click"
                                                            Text="<%$ Resources:lang,ShanChu%>" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>
                </div>
                <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                    <div id="silverlightControlHost" class="modalPopup-text" style="width: 100%; height: 100%; float: left;">
                        <%-- <table width="100%">
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
                        </table>--%>
                    </div>
                </asp:Panel>
                <br />
                <asp:TextBox ID="TB_PhotoString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                <asp:TextBox ID="TB_PhotoString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                <asp:TextBox ID="TB_PhotoString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                <asp:TextBox ID="TB_PhotoString4" runat="server" Style="visibility: hidden"></asp:TextBox>
                <asp:Button ID="BT_SavePhoto" runat="server" CssClass="inpuLong" OnClick="BT_SavePhoto_Click"
                    Style="visibility: hidden" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
            </Triggers>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';
nt.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';
nt.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>