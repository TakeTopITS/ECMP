<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="TTTrainingUserInfo.aspx.cs" Inherits="TTTrainingUserInfo" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>培训人员维护</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
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
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PeiXunRenYuanWeiHu%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="center" style="width: 165px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td style="text-align: center;">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" alt="" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                                Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                                ShowHeader="false">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="部门人员：">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                                CssClass="inpu" />
                                                                            <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                                CssClass="inpu" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                <br />
                                            </td>
                                            <td align="left" valign="top" style="padding: 5px 5px 5px 5px;">
                                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" Width="100%" runat="server" ActiveTabIndex="0">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="员工培训">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YuanGongPeiXun%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3" cellspacing="0">
                                                                <tr style="display: none">
                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XuHao %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="LB_TrainingID" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YongHuBianMa %>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_TrainingUserCode" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: Right;" width="130px">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;" width="130px">
                                                                        <asp:DropDownList ID="ddl_TrainingSex" runat="server">
                                                                            <asp:ListItem Selected="True" Value="男" />
                                                                            <asp:ListItem Value="女" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingNumberNo" Width="140px" runat="server"></asp:TextBox>
                                                                        &nbsp;
                                                                                    <asp:Button ID="BT_TrainingCheck" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_TrainingCheck_Click" />
                                                                    </td>
                                                                    <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YongGongLeiBie %>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="ddl_TrainingWorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhiYeJiNengDengJi %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingProfessionalSkillLevel" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiNengZhengShuBianHao %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingProfessionSkillNumber" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JianDingGongZhong %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingValidityType" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FaZhengRiQi %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="DLC_TrainingReleaseTime" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_TrainingReleaseTime" Enabled="True">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,AnKongZhengShuBianHao %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingAnnCertificateNo" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,AnKongYouXiaoQi %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingAnnValidTime" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,SheWaiYingYuKaoHe %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingEnglishRiew" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,PeiXunXiangGuanXinXi %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_TrainingTrainingInfo" Width="220px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" colspan="3">
                                                                        <asp:TextBox ID="TB_TrainingRemark" Width="98%" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="4" align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="4" style="text-align: left">

                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                            </td>
                                                                                            <td width="5%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,PeiXunXiangMu %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,PeiXunYiJu %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JuBanDanWei %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="10%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,PeiXunDiDian %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="30%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,PeiXunNeiRong %>"></asp:Label></strong>
                                                                                            </td>
                                                                                            <td width="15%" align="center">
                                                                                                <strong>
                                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,PeiXunRiQi %>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                            OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="100%">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:ButtonColumn>
                                                                                <asp:TemplateColumn HeaderText="Delete">
                                                                                    <ItemTemplate>
                                                                                        <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                                        HorizontalAlign="Center" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingProject" HeaderText="培训项目">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingAccord" HeaderText="培训依据">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingUnit" HeaderText="举办单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingAddress" HeaderText="培训地点">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingContent" HeaderText="培训内容">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="TrainingTime" HeaderText="培训日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                                                </asp:BoundColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid></td>
                                                                </tr>

                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,PiLiangDaoRuYuanGong %>"></asp:Label><br />
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,PeiXunXinXi %>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" colspan="3">
                                                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <div>
                                                                                    <Upload:InputFile ID="FileUpload_Training" runat="server" Width="400px" />
                                                                                    <br />
                                                                                    <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/员工培训数据导入模版.xls"><asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YGPXSJDRMB%>"></asp:Label></a>
                                                                                    <div id="ProgressBar">
                                                                                        <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                                        </Upload:ProgressBar>
                                                                                    </div>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,PiLiangDaoRuYuanGong %>"></asp:Label><br />
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,XunJiLuXinXi %>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" colspan="3">
                                                                        <asp:UpdatePanel ID="UpdatePanel7" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <div>
                                                                                    <Upload:InputFile ID="InputFile1" runat="server" Width="400px" />
                                                                                    <br />
                                                                                    <asp:Button ID="btn_ExcelToDataTraining1" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining1_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/员工培训记录数据导入模版.xls"><asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YGPXJLSJDRMB%>"></asp:Label></a>
                                                                                    <div id="Div5">
                                                                                        <Upload:ProgressBar ID="ProgressBar6" runat="server" Height="100px" Width="500px">
                                                                                        </Upload:ProgressBar>
                                                                                    </div>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="btn_ExcelToDataTraining1" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>


                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="4" style="text-align: center">
                                                                        <asp:Button ID="BT_TrainingUpdate" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_TrainingUpdate_Click" Text="<%$ Resources:lang,BaoCun %>" />
                                                                        &nbsp;
                                                                        <asp:Button ID="BT_TrainingDelete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_TrainingDelete_Click" Text="<%$ Resources:lang,ShanChu %>" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="特种作业">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TeZhongZuoYe%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3" cellspacing="0">
                                                                <tr style="display: none">
                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="LB_OperationID" runat="server"></asp:Label>
                                                                    </td>
                                                                    <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,YongHuBianMa%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_OperationUserCode" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationName" runat="server" Width="200px" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: Right;" width="130px">
                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: left;" width="130px">
                                                                        <asp:DropDownList ID="ddl_OperationSex" runat="server">
                                                                            <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                            <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationNumberNo" Width="200px" runat="server" Enabled="false"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,YongGongLeiBie%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="ddl_OperationWorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZuoYeLeiBie%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationSpeOpeType" Width="200px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhunCaoXiangMu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationSpeOpeProject" Width="200px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhengShuBianHao%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationSpeOpeNumber" Width="200px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: Right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,QuZhengRiQi%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="DLC_OperationSpeOpeStartTime" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_OperationSpeOpeStartTime" Enabled="True">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,FuShenRiQi%>"></asp:Label>：
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="DLC_OperationSpeOpeReviewTime" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_OperationSpeOpeReviewTime" Enabled="True">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                    <td style="text-align: Right;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_OperationRemark" Width="200px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,PiLiangDaoRu%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" colspan="3">
                                                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                            <ContentTemplate>
                                                                                <div>
                                                                                    <Upload:InputFile ID="InputFile_Operation" runat="server" Width="400px" />
                                                                                    <br />
                                                                                    <asp:Button ID="btn_ExcelToDataOperation" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataOperation_Click" />
                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/特种作业数据导入模版.xls"><asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,TZZYSJDRMB%>"></asp:Label></a>
                                                                                    <div id="Div1">
                                                                                        <Upload:ProgressBar ID="ProgressBar2" runat='server' Width="500px" Height="100px">
                                                                                        </Upload:ProgressBar>
                                                                                    </div>
                                                                                </div>
                                                                            </ContentTemplate>
                                                                            <Triggers>
                                                                                <asp:PostBackTrigger ControlID="btn_ExcelToDataOperation" />
                                                                            </Triggers>
                                                                        </asp:UpdatePanel>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                                                    <td colspan="3" class="formItemBgStyle">
                                                                        <asp:Button ID="Btn_OperationSave" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun%>" OnClick="Btn_OperationSave_Click" />
                                                                        &nbsp;<asp:Button ID="Btn_OperationDelete" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="Btn_OperationDelete_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="特种设备">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,TeZhongSheBei%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr style="display: none">
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_EquipmentID" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,YongHuBianMa%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_EquipmentUserCode" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: Right;" width="130px">
                                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: left;" width="130px">
                                                                                    <asp:DropDownList ID="ddl_EquipmentSex" runat="server">
                                                                                        <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                                        <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentNumberNo" Width="200px" runat="server" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,YongGongLeiXing%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="ddl_EquipmentWorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,SheBeiLeiBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentSpeEquType" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZhunCaoXiangMu%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentSpeEquProject" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,ZhengShuBianHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentSpeEquNumber" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,QuZhengRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_EquipmentSpeEquStartTime" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_EquipmentSpeEquStartTime" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,FuShenRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_EquipmentSpeEquReviewTime" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5" runat="server" TargetControlID="DLC_EquipmentSpeEquReviewTime" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                                <td style="text-align: Right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_EquipmentRemark" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,PiLiangDaoRu%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" colspan="3">
                                                                                    <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                                                                        <ContentTemplate>
                                                                                            <div>
                                                                                                <Upload:InputFile ID="InputFile_Equipment" runat="server" Width="400px" />
                                                                                                <br />
                                                                                                <asp:Button ID="btn_ExcelToDataEquipment" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataEquipment_Click" />
                                                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/特种设备数据导入模版.xls"><asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,TZSBSJDRMB%>"></asp:Label></a>
                                                                                                <div id="Div2">
                                                                                                    <Upload:ProgressBar ID="ProgressBar3" runat='server' Width="500px" Height="100px">
                                                                                                    </Upload:ProgressBar>
                                                                                                </div>
                                                                                            </div>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:PostBackTrigger ControlID="btn_ExcelToDataEquipment" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle"></td>
                                                                                <td colspan="3" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_EquipmentUpdate" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_EquipmentUpdate_Click" />
                                                                                    &nbsp;<asp:Button ID="BT_EquipmentDelete" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_EquipmentDelete_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="焊工持证">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,HanGongChiZheng%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr style="display: none">
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_HolderID" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,YongHuBianMa%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_HolderUserCode" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                    <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_HolderName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: Right;" width="130px">
                                                                                    <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: left;" width="130px">
                                                                                    <asp:DropDownList ID="ddl_HolderSex" runat="server">
                                                                                        <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                                        <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_HolderNumberNo" Width="200px" runat="server" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_HolderUnit" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,ZhengJianBianMa%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_HolderCertificateNo" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,HanGongGangYin%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_HolderWelderSeal" Width="220px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4" align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                                                    <asp:Button ID="BT_CreateHolder" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateHolder_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="5%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                                        </td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="40%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,ChiZhengXiangMu%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="30%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,YouXiaoQi%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="20%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,SaoMiaoJian%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:ButtonColumn>
                                                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                                                <ItemTemplate>
                                                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                                                    HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="HolderProject" HeaderText="持证项目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ValidTime" HeaderText="有效期">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%"></ItemStyle>
                                                                                            </asp:BoundColumn>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="AttachPath" DataNavigateUrlFormatString="{0}"  Text ="附件" HeaderText="扫描件" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" Font-Size="XX-Small" Font-Underline="False" />
                                                                                            </asp:HyperLinkColumn>
                                                                                        </Columns>
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle" colspan="3">
                                                                                    <asp:TextBox ID="TB_HolderRemark" runat="server" Width="90%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: right; width: 100px;">
                                                                                    <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,PiLiangDaoRu%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" colspan="3">
                                                                                    <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                                                                        <ContentTemplate>
                                                                                            <div>
                                                                                                <Upload:InputFile ID="InputFile_Holder" runat="server" Width="400px" />
                                                                                                <br />
                                                                                                <asp:Button ID="btn_ExcelToDataHolder" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataHolder_Click" />
                                                                                                <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/焊工持证数据导入模版.xls"><asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,HGCZSJDRMB%>"></asp:Label></a>
                                                                                                <div id="Div3">
                                                                                                    <Upload:ProgressBar ID="ProgressBar4" runat='server' Width="500px" Height="100px">
                                                                                                    </Upload:ProgressBar>
                                                                                                </div>
                                                                                            </div>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:PostBackTrigger ControlID="btn_ExcelToDataHolder" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle"></td>
                                                                                <td colspan="3" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_HolderUpdate" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_HolderUpdate_Click" />
                                                                                    &nbsp;<asp:Button ID="BT_HolderDelete" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_HolderDelete_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="施工管理员证">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,ShiGongGuanLiYuanZheng%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%; text-align: left;">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                            <tr style="display: none">
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_PostID" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,YongHuBianMa%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="LB_PostUserCode" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostName" runat="server" Width="200px" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: Right;" width="130px">
                                                                                    <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: left;" width="130px">
                                                                                    <asp:DropDownList ID="ddl_PostSex" runat="server">
                                                                                        <asp:ListItem Selected="True" Value="男" Text="<%$ Resources:lang,Nan%>" />
                                                                                        <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostNumberNo" Width="200px" runat="server" Enabled="False"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,ChuShengRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_PostBirthDay" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender7" runat="server" TargetControlID="DLC_PostBirthDay" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostUnit" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,YongGongLeiBie%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="ddl_PostWorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,GangWeiZhiWu%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostJob" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,GangWeiZhengShuBianHao%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostCertificateNo" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,FaZhengJiGuan%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostCertificateOffice" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,QuZhengRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_PostCertificateTime" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender8" runat="server" TargetControlID="DLC_PostCertificateTime" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,FuShenRiQi%>"></asp:Label>：
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="DLC_PostCertificateReviewTime" runat="server"></asp:TextBox>
                                                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender9" runat="server" TargetControlID="DLC_PostCertificateReviewTime" Enabled="True">
                                                                                    </ajaxToolkit:CalendarExtender>
                                                                                </td>
                                                                                <td style="text-align: Right;" width="130px" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="text-align: left;" width="130px" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_PostRemark" Width="200px" runat="server"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                                                                    <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,PiLiangDaoRu%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" colspan="3">
                                                                                    <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                                                                        <ContentTemplate>
                                                                                            <div>
                                                                                                <Upload:InputFile ID="InputFile_Post" runat="server" Width="400px" />
                                                                                                <br />
                                                                                                <asp:Button ID="btn_ExcelToDataPost" runat="server" CssClass="inpu" Text="<%$ Resources:lang,DaoRuShuJu%>" OnClick="btn_ExcelToDataPost_Click" />
                                                                                                <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/岗位管理数据导入模版.xls"><asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,GWGLSJDRMB%>"></asp:Label></a>
                                                                                                <div id="Div4">
                                                                                                    <Upload:ProgressBar ID="ProgressBar5" runat='server' Width="500px" Height="100px">
                                                                                                    </Upload:ProgressBar>
                                                                                                </div>
                                                                                            </div>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:PostBackTrigger ControlID="btn_ExcelToDataPost" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="width: 100px; text-align: right" class="formItemBgStyle"></td>
                                                                                <td colspan="3" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_PostUpdate" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_PostUpdate_Click" />
                                                                                    &nbsp;<asp:Button ID="BT_PostDelete" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_PostDelete_Click" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                </cc1:TabContainer>

                                                <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label110" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">


                            <table>
                                <tr>
                                    <td class="formItemBgStyle" colspan="1" style="text-align: right">
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,PeiXunXiangMu %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TrainingProject" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,PeiXunYiJu %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TrainingAccord" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" colspan="1" style="text-align: right">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JuBanDanWei %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TrainingUnit" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,PeiXunDiDian %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TrainingAddress" runat="server" CssClass="shuru" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" colspan="1" style="text-align: right">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,PeiXunNeiRong %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TrainingContent" runat="server" CssClass="shuru" Height="35px" TextMode="MultiLine" Width="98%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,PeiXunRiQi %>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_TrainingTime" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="DLC_TrainingTime_CalendarExtender" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_TrainingTime">
                                        </cc1:CalendarExtender>
                                        <asp:TextBox ID="txt_ID" runat="server" Visible="False" Width="20px"></asp:TextBox>
                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindowHolder"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label114" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table>
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ChiZhengXiangMu%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HolderProject" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,YouXiaoQi%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HolderValidTime" runat="server" Width="200px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                        <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,SaoMiaoJian%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:UpdatePanel ID="UpdatePanel8" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <div>
                                                    <Upload:InputFile ID="AttachFile" runat="server" Width="559px" />
                                                    <asp:Label ID="lbl_AttachPath" runat="server"  Visible="false"></asp:Label>
                                                    <br />
                                                    <div id="Div6">
                                                        <Upload:ProgressBar ID="ProgressBar7" runat='server' Width="500px" Height="100px">
                                                        </Upload:ProgressBar>
                                                    </div>
                                                </div>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_NewHolder" />
                                              <%--  <asp:PostBackTrigger ControlID="BT_ProjectUpdate" />
                                                <asp:PostBackTrigger ControlID="BT_ProjectDelete" />--%>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                               <%-- <tr>
                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">&nbsp;</td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:Button ID="BT_ProjectAdd" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" Enabled="False" OnClick="BT_ProjectAdd_Click" />&nbsp;
                                        <asp:Button ID="BT_ProjectUpdate" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" Enabled="False" OnClick="BT_ProjectUpdate_Click" />&nbsp;
                                        <asp:Button ID="BT_ProjectDelete" runat="server" Enabled="False" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_ProjectDelete_Click" /></td>
                                </tr>--%>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewHolder" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewHolder_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>




                    <%--<asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
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
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>--%>
                    <%--<br />
                    <asp:TextBox ID="TB_PhotoString" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SaveUserPhoto" runat="server" CssClass="inpuLong" OnClick="BT_SaveUserPhoto_Click"
                        Style="visibility: hidden" />--%>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
