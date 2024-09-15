<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTLTCandidateInformation.aspx.cs" Inherits="TTLTCandidateInformation" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
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
    <script type="text/javascript" language="javascript">
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
                                <td>
                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CandidateInformation%>"></asp:Label>
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
                                                        <td align="center" style="border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px"
                                                            valign="top">

                                                            <table width="100%">
                                                                <tr>
                                                                    <td align="center">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DaoRuYuanGongXinXi%>"></asp:Label>：
                                                                                </td>
                                                                                <td>
                                                                                    <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                                        <ContentTemplate>
                                                                                            <div>
                                                                                                <Upload:InputFile ID="FileUpload_Training" runat="server" />
                                                                                                <asp:Button ID="btn_ExcelToDB" runat="server" CssClass="inpu" OnClick="btn_ExcelToDB_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />

                                                                                                <div id="ProgressBar">
                                                                                                    <Upload:ProgressBar ID="ProgressBar1" runat="server" Height="100px" Width="500px">
                                                                                                    </Upload:ProgressBar>
                                                                                                </div>

                                                                                            </div>
                                                                                        </ContentTemplate>
                                                                                        <Triggers>
                                                                                            <asp:PostBackTrigger ControlID="btn_ExcelToDB" />
                                                                                        </Triggers>
                                                                                    </asp:UpdatePanel>
                                                                                    <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <a href="Template/修选人数据导入模版.xls">
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,SJDRMB%>"></asp:Label>
                                                                                    </a>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" width="10%">

                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>


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
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,NianLing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="17%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="13%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="8%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                                Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="25"
                                                                ShowHeader="false">
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
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserName" DataNavigateUrlFormatString="TTLTCandidateInformationView.aspx?UserName={0}"
                                                                        DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Age" HeaderText="年龄">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="17%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="CurrentDuty" HeaderText="职责">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="加入日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                </Columns>
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
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

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label55" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left;">

                            <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" Width="100%" runat="server" ActiveTabIndex="0">
                                <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="基本信息">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiBenXinXi%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                            cellspacing="0">
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingMing %>"></asp:Label></td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_UserName" runat="server" Width="220px"></asp:TextBox><asp:Label ID="LB_ID" runat="server"></asp:Label></span></td>
                                                <td style="text-align: left;" width="40px" class="formItemBgStyle" rowspan="8">
                                                    <asp:Image ID="IM_MemberPhoto" runat="server" AlternateText="Candidate Photo" Height="200px" ImageAlign="Left" Width="220px" /></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label></td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Gender" runat="server" AutoPostBack="True">
                                                        <asp:ListItem Selected="True" Text="<%$ Resources:lang,Nan %>" />
                                                        <asp:ListItem Text="<%$ Resources:lang,Nv %>" />
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label></td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Age" runat="server" Precision="0" Width="50px" OnBlur=""
                                                        OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GongSi %>"></asp:Label></td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Company" runat="server" Width="220px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label></td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Department" runat="server" Width="220px"></asp:TextBox></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiWu %>"></asp:Label></td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_CurrentDuty" runat="server"></asp:TextBox><asp:DropDownList
                                                        ID="DL_Duty" runat="server" DataTextField="Duty" DataValueField="Duty"
                                                        AutoPostBack="True" OnSelectedIndexChanged="DDL_Duty_SelectedIndexChanged">
                                                    </asp:DropDownList><span style="color: #ff0000">*</span> </td>
                                            </tr>
                                            <tr>
                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label>&nbsp;</td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_MobilePhone" runat="server" Width="220px"></asp:TextBox><span style="color: #ff0000">*<span> </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                        <asp:ListItem Value="在职" />
                                                        <asp:ListItem Value="离职" />
                                                        <asp:ListItem Value="终止" />
                                                        <asp:ListItem Value="删除" />
                                                        <asp:ListItem />
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiaRuRiQi %>"></asp:Label></td>
                                                <td colspan="2" style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_CreateTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_CreateTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GuiShuBuMen %>"></asp:Label></td>
                                                <td colspan="2" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_BelongDepartment" Width="225px" runat="server" DataTextField="DepartName"
                                                        DataValueField="DepartCode" CssClass="DDList">
                                                    </asp:DropDownList></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle"></td>
                                                <td colspan="2" style="text-align: left" class="formItemBgStyle"><span style="color: red; font-size: 8pt;">
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DWBTXXGSMMWKJBGBYLMM %>"></asp:Label></span></td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhaoPianShangChuan %>"></asp:Label>： </td>
                                                <td colspan="2" style="text-align: left" class="formItemBgStyle">
                                                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                        <ContentTemplate>
                                                            <asp:FileUpload ID="FUP_File" runat="server" Width="300px" />&nbsp;<asp:Button ID="BT_UploadPhoto"
                                                                runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_UploadPhoto_Click" CssClass="inpu" Enabled="False" /><asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TuPianKuan200Gao200%>"></asp:Label><asp:HyperLink ID="HL_MemberPhoto" runat="server" Visible="False">[HL_MemberPhoto]</asp:HyperLink>
                                                        </ContentTemplate>
                                                        <Triggers>
                                                            <asp:PostBackTrigger ControlID="BT_UploadPhoto"></asp:PostBackTrigger>
                                                        </Triggers>
                                                    </asp:UpdatePanel>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                                <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="详细信息">
                                    <HeaderTemplate>
                                        <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,XiangXiXinXi%>"></asp:Label>
                                    </HeaderTemplate>
                                    <ContentTemplate>
                                        <table class="formBgStyle" style="width: 99%; text-align: left;" class="formBgStyle"
                                            cellpadding="3" cellspacing="0">
                                            <tr>
                                                <td class="formItemBgStyle">
                                                    <CKEditor:CKEditorControl ID="HE_CondidateInformation" runat="server" Height="700px" Width="99%" /></td>
                                            </tr>
                                        </table>
                                    </ContentTemplate>
                                </cc1:TabPanel>
                            </cc1:TabContainer>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>
                    <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
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
