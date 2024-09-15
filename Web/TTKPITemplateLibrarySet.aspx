<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTKPITemplateLibrarySet.aspx.cs"
    Inherits="TTKPITemplateLibrarySet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit.HTMLEditor"
    TagPrefix="cc2" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }*/

        /* CSS样式 */
        .ajax_tab_menu .ajax__tab_header /*整体按钮底样式*/ {
            font-family: 宋体;
            height: 28px;
            font-size: 12px;
            background: url("ImagesSkin/Tab_Option_bg.gif") repeat-x bottom;
        }

        .ajax_tab_menu .ajax__tab_body /*资料区*/ {
            font-family: 宋体;
            font-size: 12px;
            border-top: 0;
            border-top: 1px dotted #8AB2E5;
        }

        .ajax_tab_menu .ajax__tab_tab /*预设样式*/ {
            background: url("ImagesSkin/Tab_Option_bg_OFF.gif") repeat-x;
            width: 78px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            margin-right: 4px;
            margin: 0;
        }

        .ajax_tab_menu .ajax__tab_hover .ajax__tab_tab /*鼠标经过样式*/ {
            background: url("ImagesSkin/Tab_Option_bg_hover.gif") repeat-x;
            width: 78px;
            height: 28px;
            color: #FFFFFF;
            line-height: 28px;
            text-align: center;
        }

        .ajax_tab_menu .ajax__tab_active .ajax__tab_tab /*当前使用中样式*/ {
            background: url("ImagesSkin/Tab_Option_bg_ON.gif") repeat-x;
            width: 78px;
            height: 28px;
            line-height: 28px;
            text-align: center;
            color: #FFFFFF;
        }
    </style>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KPIMuBanKuSheZhi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>
                                            </td>
                                            <td style="text-align: right;">
                                                <table>
                                                    <tr>
                                                        <td style="text-align: right;">
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DaoRuXinXi%>"></asp:Label>： 
                                                        </td>
                                                        <td align="left">
                                                            <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                                                <ContentTemplate>
                                                                    <div>
                                                                        <Upload:InputFile ID="FileUpload_Training" runat="server" Width="300px" />
                                                                        <asp:Button ID="btn_ExcelToDataTraining" runat="server" CssClass="inpu" OnClick="btn_ExcelToDataTraining_Click" Text="<%$ Resources:lang,DaoRuShuJu%>" />
                                                                        <asp:Label ID="Label29" runat="server"></asp:Label><asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,SJDRMBGS%>"></asp:Label>：<a href="Template/KPI指标库导入新增模版.xls"><asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,SJDRMB%>"></asp:Label></a>
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
                                                        <td>
                                                            <asp:Label ID="LB_ErrorText" runat="server" ForeColor="Red"></asp:Label>
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
                                            <td align="left" valign="top" style="padding: 5px 5px 5px 5px;">
                                                <table class="formBgStyle" style="width: 100%; text-align: left;" cellpadding="3"
                                                    cellspacing="0">
                                                    <tr>
                                                        <td style="width: 10%; text-align: right" class="formItemBgStyle">&nbsp;</td>
                                                        <td style="text-align: right; padding-bottom: 5px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Create" runat="server" CssClass="inpuYello" OnClick="BT_Create_Click" Text="<%$ Resources:lang,New%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_KPI" runat="server" Width="90%"></asp:TextBox>
                                                            <asp:Label ID="LB_KPIID" runat="server" Visible="false"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_KPIType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                Width="200px">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right;" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DingYi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Definition" runat="server" Height="59px" TextMode="MultiLine"
                                                                Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongNeng%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Function" runat="server" Height="59px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Formula" runat="server" Height="59px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,SQLDaiMa%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle">

                                                            <asp:TextBox ID="TB_SqlCode" runat="server" Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                            <br />
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DanWeiFenZhi%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <NickLee:NumberBox ID="NB_UnitSqlPoint" runat="server" MaxAmount="0" MinAmount="-1000000000000" Width="53px" Amount="-1">-1.00</NickLee:NumberBox>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                            （<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YGZKPIKSSJKPIJSSJBKPIZDM%>"></asp:Label>)<br />
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DaiMaShiLi%>"></asp:Label>：Select Count(*) * -5 From T_Project Where Status = &#39;<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieAn%>"></asp:Label>&#39; and PMCode = &#39;[TAKETOPKPIUSERCODE]&#39; and to_char(BeginDate,'yyyymmdd') &gt;= &#39;[TAKETOPKPISTARTTIME]&#39; and to_char(EndDate,'yyyymmdd') &lt;= &#39;[TAKETOPKPIENDTIME]&#39;
                                                                        <br />
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZWDBDWFZKYSJYQTSZQD%>"></asp:Label>）</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Source" runat="server" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNubmer" runat="server" Precision="0" Width="53px">0</NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right;">&nbsp;</td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Button ID="BT_Update" runat="server" OnClick="BT_Update_Click" CssClass="inpu"
                                                                Text="<%$ Resources:lang,BaoCun%>" Enabled="False" />
                                                            &nbsp;<asp:Button ID="BT_Delete" runat="server" Enabled="False" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                Text="<%$ Resources:lang,ShanChu%>" />
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
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label91" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                cellspacing="0">
                                <tr>
                                    <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_KPINew" runat="server" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_KPITypeNew" runat="server" DataTextField="Type" DataValueField="Type"
                                            Width="200px">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right;" class="formItemBgStyle">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DingYi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DefinitionNew" runat="server" Height="59px" TextMode="MultiLine"
                                            Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GongNeng%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FunctionNew" runat="server" Height="59px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_FormulaNew" runat="server" Height="59px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,SQLDaiMa%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle">

                                        <asp:TextBox ID="TB_SqlCodeNew" runat="server" Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                        <br />
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanWeiFenZhi%>"></asp:Label>：</td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_UnitSqlPointNew" runat="server" MaxAmount="0" MinAmount="-1000000000000" Width="53px" Amount="-1">-1.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                        （<asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YGZKPIKSSJKPIJSSJBKPIZDM%>"></asp:Label>)<br />
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DaiMaShiLi%>"></asp:Label>：Select Count(*) * 5 From T_Project Where Status = &#39;<asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JieAn%>"></asp:Label>&#39; and PMCode = &#39;[TAKETOPKPIUSERCODE]&#39; and to_char(BeginDate,'yyyymmdd') &gt;= &#39;[TAKETOPKPISTARTTIME]&#39; and to_char(EndDate,'yyyymmdd') &lt;= &#39;[TAKETOPKPIENDTIME]&#39;
                                                                        <br />
                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZWDBDWFZKYSJYQTSZQD%>"></asp:Label>）</td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SourceNew" runat="server" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_SortNubmerNew" MaxAmount="1000000000000" MinAmount="-1000000000000" runat="server" Precision="0" Width="53px">0</NickLee:NumberBox>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>



                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left"></td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center"></td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
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
