<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemDataManage.aspx.cs"
    Inherits="TTSystemDataManage" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Register assembly="System.Web.Extensions, Version=1.0.61025.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35" namespace="System.Web.UI" tagprefix="asp" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiTongShuJuGuanLi%>"></asp:Label>
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
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BeiFenShuJuKu%>"></asp:Label>
                                                            ，<asp:Label ID="Label36" runat="server" Text="前次备份时间"></asp:Label>：<asp:Label ID="LB_LastestBackupDBTime" runat="server"></asp:Label>：
                                                            （<asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,XTYHZMZESLDWSLDZZDBF%>"></asp:Label>）                                                        
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BFSJKQLJ%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TXT_BackDBUrl" runat="server" Width="400"></asp:TextBox>&nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LiRu%>"></asp:Label>：D:\BackupDB，
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZWJJYSYUSERYHSYQXDSXXAQSZ%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BFSJKQJGSJ%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_BackDBPeriodDay" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Amount="3" Precision="0">3</NickLee:NumberBox>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShuJuKu%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TXT_DataName" runat="server" Width="250"></asp:TextBox>&nbsp;<asp:Button ID="BT_SaveDBPath" runat="server" CssClass="inpu" OnClick="BT_SaveDBPath_Click" Text="<%$ Resources:lang,BaoCun%>" />&nbsp;<asp:Button ID="BT_CopyData" runat="server" CssClass="inpuLong" OnClick="BT_CopyData_Click" Text="<%$ Resources:lang,KaiShiBeiFen%>" />
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BeiFenWenJian%>"></asp:Label>(Doc,WorkflowTemplate,XML,UserPhoto,Bar,RTXAccount,Log)
                                                         
                                                            ，<asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,QianCiBeiFengShiJIan%>"></asp:Label>：<asp:Label ID="LB_LastestBackupDocTime" runat="server"></asp:Label>，
                                                           （
                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,XTYHZMZESLDWSLDZZDBF%>"></asp:Label>）
                                                            <br />
                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DYDYCBFHTSBSYWDSJBF%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BeiFenWenJianLuJing%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:TextBox ID="TXT_BackDocUrl" runat="server" Width="400"></asp:TextBox>&nbsp;
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LiRu%>"></asp:Label>：D:\BackupDoc，                            
                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZWJJYSYUSERYHSYQXDSXXAQSZ%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,BeiFenWenJianJianGeShiJian%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_BackDocPeriodDay" runat="server" Width="80px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Amount="3" Precision="0">3</NickLee:NumberBox>

                                                                                    <td>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,Tian%>"></asp:Label>
                                                                                    </td>
                                                                                    <td>&nbsp;<asp:Button ID="BT_SaveDocPath" runat="server" CssClass="inpu" OnClick="BT_SaveDocPath_Click" Text="<%$ Resources:lang,BaoCun%>" />&nbsp;<asp:Button ID="BT_CopyDirectory" runat="server" CssClass="inpuLong" OnClick="BT_CopyDirectory_Click" Text="<%$ Resources:lang,KaiShiBeiFen%>" />

                                                                                    </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td>&nbsp;</td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label40" runat="server" Text="只读数据库用户ID"></asp:Label>：
                                                         
                                                            <asp:Label ID="LB_DBUserID" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>
                                                            ：
                                                            <asp:TextBox ID="TB_ReadOnlyUserPassword" runat="server"></asp:TextBox>
                                                            <br />
                                                            <span style="font-size: x-small; color: red;">(<asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,MiMaYBHDSZMBDHKJSZ%>"></asp:Label>)</span>
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_SaveDBUserIDPassword" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_SaveDBUserIDPassword_Click" />

                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left; height: 25px;">
                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZZSJKZDYHYYDSJBIFSHBBSJ%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left; width: 60%; height: 25px;">&nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,LiuChengShuJiZhuanYu%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,QueZiShiJian%>"></asp:Label>
                                                            ：
                                                            <asp:TextBox ID="DLC_WorkflowStart" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_WorkflowStart">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_BackupWorkflow" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZiXunShuJiZhuanYu%>" OnClick="BT_BackupWorkflow_Click" />

                                                        </td>

                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: left; height: 25px; color: red;">
                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,RGYZYGAZLXMLWJQXBXMLCOPY%>"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left; width: 60%; height: 25px;">
                                                            <asp:Button ID="BT_ImportDIYWFXMLData" runat="server" CssClass="inpuLongest" OnClick="BT_ImportDIYWFXMLData_Click" Text="<%$ Resources:lang,DRSYZDYBDGZLSJ%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr style="display:none;">
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="4" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,RiChengShuJiZhuanYu%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,QueZiShiJian%>"></asp:Label>
                                                            ：<asp:TextBox ID="DLC_EventStart" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_EventStart">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_BackupSchedule" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZiXunShuJiZhuanYu%>" OnClick="BT_BackupSchedule_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="4" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiHuaShuJiZhuanYu%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QueZiShiJian%>"></asp:Label>
                                                            ：
                                                            <asp:TextBox ID="DLC_PlanStart" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_PlanStart">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_BackupPlan" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZiXunShuJiZhuanYu%>" OnClick="BT_BackupPlan_Click" />

                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="4" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XieZuoShuJiZhuanYu%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,QueZiShiJian%>"></asp:Label>
                                                            ：
                                                            <asp:TextBox ID="DLC_CollaborationStart" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_PlanStart">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_BackupCollaboration" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ZiXunShuJiZhuanYu%>" OnClick="BT_BackupCollaboration_Click" />

                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,CuoWuRuZhi%>"></asp:Label>
                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XiaZai%>"></asp:Label>

                                                            ：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">&nbsp;&nbsp;&nbsp;
                                                            <asp:HyperLink ID="HL_ErrorLog" NavigateUrl="Doc/Log/LogFile.txt" runat="server" Text="<%$ Resources:lang,XiaZai%>">
                                                            </asp:HyperLink>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="4" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuJuQingKong%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_ExportLoginLog" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,DaoChuRiZhiWeiEXCEL%>" OnClick="BT_ExportLoginLog_Click" />
                                                            &nbsp;&nbsp;
                                                            <asp:Button ID="BT_ClearLogoLog" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,QingKongRiZhiBiao%>" OnClick="BT_ClearLogoLog_Click" />
                                                        </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_ClearSMSSent" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,QingKongXinXiFaSongBiao%>" OnClick="BT_ClearSMSSent_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="4" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,QingChuXiTongHanCheng%>"></asp:Label>（<span style="color: red;">
                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,QZKXSJJXYXCZ%>"></asp:Label></span> ）：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_ClearLeftBar" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,QingChuZuBianLanHanCheng%>" OnClick="BT_ClearLeftBar_Click"   />&nbsp;&nbsp;
                                                            <asp:Button ID="BT_ClearSystemCache" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,QingChuXiTongHanCheng%>" OnClick="BT_ClearSystemCache_Click"  />
                                                            &nbsp;&nbsp;
                                                            </td>
                                                        <td style="text-align: left; width: 60%; height: 25px;" class="formItemBgStyle">
                                                            &nbsp;</td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top" align="left">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShengChengRTXZhangHuWenJian%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left; height: 25px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_CreateRTXAccountData" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,ChouQuZhangHuShuJu%>"
                                                                OnClick="BT_CreateRTXAccountData_Click" />
                                                            &nbsp;<asp:Button ID="BT_CreateRTXDataToTXT" runat="server" CssClass="inpuLong" OnClick="BT_CreateRTXDataToTXT_Click"
                                                                Text="<%$ Resources:lang,ShengChengZhangHuWenJian%>" />
                                                            &nbsp;
                                                        <asp:HyperLink ID="HL_RTXAccountDataFile" runat="server">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XZRTXZHSJWJAYJLC%>"></asp:Label>
                                                        </asp:HyperLink>
                                                            &nbsp;&nbsp;&nbsp;
                                                        <asp:HyperLink ID="HL_RTXTest" NavigateUrl="TTRTXTest.aspx" runat="server">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,RTXFuWuLianJieCeShi%>"></asp:Label>
                                                        </asp:HyperLink>
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
                    </div>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportLoginLog" />
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
