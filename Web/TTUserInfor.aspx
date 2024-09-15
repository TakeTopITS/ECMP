<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTUserInfor.aspx.cs" Inherits="TTUserInfor" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目成员资料</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1300px;
            width: expression (document.body.clientWidth <= 1300? "1300px" : "auto" ));
        }

        .auto-style1 {
            background-color: #D8D8D8;
            width: 100%;
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

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView1").style.height = document.documentElement.clientHeight + "px";

        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView1.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView1.scrollTop = disPostion;
        }

        function clickIFrameUserExtendSaveButton() {

            self.frames['IFrame_UserInformationExtend'].document.forms[0]['HF_UserCode'].value = document.getElementById("TB_UserCode").value;
            //alert(self.frames['IFrame_UserInformationExtend'].document.forms[0]['HF_UserCode'].value);

            self.frames['IFrame_UserInformationExtend'].document.all('BT_Save').click();
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuanGongDanAnSeZhi%>"></asp:Label>
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
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                valign="top" align="left">
                                                <div id="Div_TreeView1" style="overflow: auto; height: 800px;">
                                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                        ShowLines="True" Width="220" Style="height: 183px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                            <td align="center" valign="top">
                                                <table style="width: 100%; text-align: left;">
                                                    <tr>
                                                        <td align="center" style="padding: 5px 5px 5px 5px;">
                                                            <table width="100%">
                                                                <tr>

                                                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_UserCodeFind" Width="100px" runat="server"></asp:TextBox></td>

                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label121" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_UserNameFind" Width="100px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                                    </td>

                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label25" runat="server" Text="微信ID"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_WXID" Width="150px" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_FindWXID" runat="server" CssClass="inpu" OnClick="BT_FindWXID_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Button ID="BT_ClearAllMemberWXID" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,QCSYYGWXID %>" OnClick="BT_ClearAllMemberWXID_Click" />
                                                                    </td>

                                                                    <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
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
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="3%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BuMenDaiMa%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BuMenMingCheng%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhiZe%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,YiDongDianHua%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="5%" align="left">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="3%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong></strong>
                                                                                </td>
                                                                                <td width="4%" align="center">
                                                                                    <strong></strong>
                                                                                </td>

                                                                                <td width="7%" align="left">
                                                                                    <strong>WeChatID</strong>
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
                                                                    <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInforView.aspx?UserCode={0}"
                                                                        DataTextField="UserName" HeaderText="姓名" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="DepartCode" HeaderText="部门代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="DepartName" HeaderText="部门名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Duty" HeaderText="职责">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="MobilePhone" HeaderText="移动电话">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="JoinDate" HeaderText="加入日期" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                    </asp:TemplateColumn>


                                                                    <asp:HyperLinkColumn DataNavigateUrlField="UserCode" DataNavigateUrlFormatString="TTUserInfoExtend.aspx?UserCode={0}"
                                                                        HeaderText="姓名" Text="..." Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="Photo">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Photo" CommandName="Photo" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ZhaoPian%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="Work">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Work" CommandName="Work" CssClass="inpu" runat="server" Text="<%$ Resources:lang,GongZuo%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="Education">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Education" CommandName="Education" CssClass="inpu" runat="server" Text="<%$ Resources:lang,JiaoYu%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="Family">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Family" CommandName="Family" CssClass="inpu" runat="server" Text="<%$ Resources:lang,JiaTing%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="PartTime">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_PartTime" CommandName="PartTime" CssClass="inpu" runat="server" Text="<%$ Resources:lang,JianZhi%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="Change">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Change" CommandName="Change" CssClass="inpu" runat="server" Text="<%$ Resources:lang,YiDong%>"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="微信ID">
                                                                        <ItemTemplate>
                                                                            <table>
                                                                                <tr>
                                                                                    <td style="vertical-align:middle;">
                                                                                        <asp:LinkButton ID="LBT_ClearWXID" CommandName="ClearWXID" CssClass="inpu" runat="server" Text="<%$ Resources:lang,QingChu%>"></asp:LinkButton>
                                                                                    </td>
                                                                                     <td style="vertical-align:middle;">
                                                                                        <%# getWXID(Eval("UserCode").ToString()) %>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" VerticalAlign="Middle" />
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label53" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; text-align: left;">


                            <table class="formBgStyle" style="width: 100%; text-align: left;" class="formBgStyle"
                                cellpadding="3" cellspacing="0">
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UserCode" Width="90%" runat="server"></asp:TextBox><span style="color: #ff0000">*</span></td>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YongHuMing %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UserName" Width="90%" runat="server"></asp:TextBox><span style="color: #ff0000">*<span>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,MiMa %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Password" runat="server" Width="90%"></asp:TextBox>
                                        <%--  <span style="color: #ff0000">*<span><cc1:PasswordStrength
                                            ID="TB_Password_PasswordStrength" runat="server" Enabled="True" TargetControlID="TB_Password">
                                        </cc1:PasswordStrength>--%>
                                    </td>
                                    <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShouJi %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_MobilePhone" runat="server" Width="90%"></asp:TextBox><span style="color: #ff0000">*<span> </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">E_Mail </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EMail" runat="server" Width="90%"></asp:TextBox><span style="color: #ff0000">*<span> </td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhiWu %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Duty" runat="server"></asp:TextBox><span style="color: #ff0000">*</span><asp:DropDownList
                                            ID="DL_Duty" runat="server" DataTextField="Duty" DataValueField="Duty"
                                            Width="100px" AutoPostBack="True" OnSelectedIndexChanged="DDL_Duty_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BuMen %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_DepartCode" runat="server"></asp:TextBox>
                                        <asp:Label ID="LB_DepartName" runat="server"></asp:Label><span style="color: #ff0000">*<span>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1"
                                                runat="server" Enabled="True" TargetControlID="TB_DepartCode" PopupControlID="Panel3"
                                                CancelControlID="IMB_CloseDepartment" BackgroundCssClass="modalBackground" Y="150">
                                            </cc1:ModalPopupExtender></td>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZiBuMen %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_ChildDepartment" runat="server" Width="97%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingBie %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Gender" runat="server">
                                            <asp:ListItem Value="男" Text="<%$ Resources:lang,Nan %>" />
                                            <asp:ListItem Value="女" Text="<%$ Resources:lang,Nv %>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShengRi %>"></asp:Label></td>
                                    <td class="formItemBgStyle" align="left">
                                        <table>
                                            <tr>
                                                <td style="text-align: left">
                                                    <asp:TextBox ID="DLC_BirthDay" runat="server" Width="100px"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_BirthDay" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                    <asp:Button ID="BT_CountChinaDate" runat="server" CssClass="inpu" Text="<%$ Resources:lang,jisuan%>" OnClick="BT_CountChinaDate_Click" />
                                                </td>
                                                <td style="text-align: right; width: 100px;">
                                                    <asp:Label ID="Label2225" runat="server" Text="<%$ Resources:lang,NongLiShengRi %>"></asp:Label></td>
                                                <td>
                                                    <asp:TextBox ID="DLC_LunarBirthDay" runat="server" Width="100px"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender9" runat="server" TargetControlID="DLC_LunarBirthDay" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                    <asp:Button ID="BT_CountGLDate" runat="server" CssClass="inpu" OnClick="BT_CountGLDate_Click" Text="<%$ Resources:lang,jisuan%>" />
                                                </td>
                                                <td style="text-align: right; width: 80px;">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,NianLing %>"></asp:Label></td>
                                                <td style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Age" runat="server" Precision="0" Width="30px" OnBlur=""
                                                        OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BanGongDianHua %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_OfficePhone" runat="server" Width="90%"></asp:TextBox></td>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShengFengZhengHao %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_IDCard" runat="server" Width="97%"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiaRuRiQi %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="DLC_JoinDate" runat="server"></asp:TextBox>
                                        <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Enabled="True" Format="yyyy-MM-dd" TargetControlID="DLC_JoinDate">
                                        </cc1:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,XingZhi %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_UserType" runat="server">
                                            <asp:ListItem Text="<%$ Resources:lang,NeiBu %>" Value="INNER" />
                                            <asp:ListItem Text="<%$ Resources:lang,WaiBu %>" Value="OUTER" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Status" runat="server">
                                            <asp:ListItem Value="在职" Text="<%$ Resources:lang,ZaiZhi%>" />
                                            <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi %>" />
                                            <asp:ListItem Value="终止" Text="<%$ Resources:lang,ZhongZhi %>" />
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle"></td>
                                    <td colspan="3" style="text-align: left;" class="formItemBgStyle">
                                        <span style="color: red; font-size: 8pt;">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DWBTXXGSMMWKJBGBYLMM %>"></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            <table class="formBgStyle" style="width: 100%; text-align: left;" class="formBgStyle" cellpadding="3" cellspacing="0">
                                <tr>
                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YongGongLeiXing %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:DropDownList ID="DL_WorkType" runat="server" DataTextField="TypeName" DataValueField="TypeName">
                                        </asp:DropDownList>
                                    </td>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Zhichen %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_JobTitle" runat="server"></asp:TextBox><asp:DropDownList
                                            ID="DDL_JobTitle" runat="server" DataTextField="Position" DataValueField="Position"
                                            Width="100px" AutoPostBack="True" OnSelectedIndexChanged="DDL_JobTitle_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,HeTongDaoQiShiJian %>"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TXT_ContractEndTime" runat="server" Width="99%" onClick="WdatePicker({dateFmt:'yyyy-MM-dd'})"></asp:TextBox></td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,HeTongWenJian %>"></asp:Label></td>
                                    <td style="text-align: left" class="formItemBgStyle">
                                        <asp:UpdatePanel ID="UpdatePanel6" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUL_ContractDocument" runat="server" Width="150px" />&nbsp;<asp:Button ID="BT_ContractDocument"
                                                    runat="server" Text="<%$ Resources:lang,ShangChuan%>" OnClick="BT_ContractDocument_Click" CssClass="inpu" Enabled="false" /><asp:Literal ID="LT_ContractDocumentText" runat="server"></asp:Literal><asp:HiddenField ID="HF_ContractDocument" runat="server" />
                                                <asp:HiddenField ID="HF_ContractDocumentURL" runat="server" />
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_ContractDocument"></asp:PostBackTrigger>
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="height: 23px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GongZuoFanWei %>"></asp:Label></td>
                                    <td colspan="3" style="height: 23px" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkScope" runat="server"
                                            Width="99%"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label134" runat="server" Text="<%$ Resources:lang,UnitSalary%>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox ID="NB_HourlySalary" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="80px">0.00</NickLee:NumberBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label135" runat="server" Text="<%$ Resources:lang,YueXin %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_MonthlySalary" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="80px">0.00</NickLee:NumberBox>
                                    </td>
                                </tr>
                                <tr>

                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,CanKaoGongHao %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_RefUserCode" runat="server" Width="99%"></asp:TextBox></td>
                                    <td class="formItemBgStyle" style="text-align: right;"></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_CssDirectory" runat="server" Visible="false">
                                            <asp:ListItem Value="CssBlue" Text="<%$ Resources:lang,LanSe%>" />
                                            <asp:ListItem Value="CssGreen" Text="<%$ Resources:lang,LuSe%>" />
                                            <asp:ListItem Value="CssRed" Text="<%$ Resources:lang,HongSe%>" />
                                            <asp:ListItem Value="CssGolden" Text="<%$ Resources:lang,JinSe%>" />
                                            <asp:ListItem Value="CssGray" Text="<%$ Resources:lang,HuiSe%>" />
                                            <asp:ListItem Value="CssBlack" Text="<%$ Resources:lang,HeiSe%>" />
                                        </asp:DropDownList>
                                        <asp:DropDownList ID="DL_SystemMDIStyle" runat="server" DataTextField="MDIStyle" DataValueField="MDIStyle" Visible="false"></asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>

                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YXDLSB %>"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="DL_AllowDevice" runat="server">
                                            <asp:ListItem Value="ALL" />
                                            <asp:ListItem Value="PC" />
                                            <asp:ListItem Value="MOBILE" />
                                        </asp:DropDownList></td>
                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieMianYuYan %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language"></asp:DropDownList>

                                    </td>
                                </tr>
                                <tr>

                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShunXuHao %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <NickLee:NumberBox ID="NB_SortNumber" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="80px">0</NickLee:NumberBox>
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: right;">
                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,RTXZhangHu %>" Visible="false"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_UserRTXCode" runat="server" Width="99%" Visible="false"></asp:TextBox></td>
                                </tr>

                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle" colspan="4">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,YingWenMing %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_EnglishName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,MingZhu %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_Nationality" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ChuShengDi %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_NativePlace" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,HuKouSuoZaiDi %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_HuKou" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JuZhuDi %>"></asp:Label></td>
                                    <td class="formItemBgStyle" colspan="3">
                                        <asp:TextBox ID="TB_Residency" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Address" runat="server" Width="99%"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,HunYingZhuangTai %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_MaritalStatus" runat="server">
                                            <asp:ListItem Value="未婚" />
                                            <asp:ListItem Value="已婚" />
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,XueLi %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Degree" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ZhuanYe %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Major" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,BiYeXueXiao %>"></asp:Label></td>
                                    <td colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_GraduateSchool" runat="server" Width="99%"></asp:TextBox></td>
                                </tr>
                                <tr>

                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,XueXing %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BloodType" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,ShengGao %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_Height" runat="server" Width="40px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="" MinAmount="0" Precision="0">0</NickLee:NumberBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,JingJiLianXiRen %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UrgencyPerson" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,LianXiDianHua %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_UrgencyCall" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,JieShaoRen %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Introducer" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,JieShaoRenBuMen %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_IntroducerDepartment" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,YuJieShaoGuanXi %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_IntroducerRelation" Width="99%" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,BeiZhu %>"></asp:Label></td>
                                    <td colspan="3" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Comment" runat="server" Height="50px" TextMode="MultiLine" Width="80%"></asp:TextBox></td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popWorkWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label7" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="BT_CreateWork" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateWork_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>

                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,Gongsi%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,Gongzi%>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,LiZhiYuanYing%>"></asp:Label></strong></td>
                                                            <td width="8%" align="center"><strong>
                                                                <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,ZhengMingRen%>"></asp:Label></strong></td>
                                                            <td align="center"><strong>
                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,DianHua%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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

                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Salary" HeaderText="工资">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ResignReason" HeaderText="离职原因">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="renterence" HeaderText="证明人">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="renterenceCall" HeaderText="证明人电话">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:DataGrid>

                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label119" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popWorkDetailWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title3">
                            <asp:Label ID="Label122" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content3" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="LB_WorkID" runat="server"></asp:Label>
                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_WorkStartTime" ReadOnly="false" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_WorkStartTime"></ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;" width="15%">
                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="DLC_WorkEndTime" ReadOnly="false" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_WorkEndTime"></ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GongSi%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkCompany" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkDuty" Width="200px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,GongZi%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_WorkSalary" runat="server" Width="80px" OnBlur="" OnFocus=""
                                            OnKeyPress="" PositiveColor="">0.00</NickLee:NumberBox>
                                    </td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,LiZhiYuanYing%>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkResignReason" Width="200px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,ZhengMingRen%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkRenterence" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ZhengMingRenDianHua%>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkRenterenceCall" Width="200px" runat="server"></asp:TextBox></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer3" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewWork_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label136" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popEducationWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title4">
                            <asp:Label ID="Label137" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content4" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">

                                <tr>
                                    <td align="right">
                                        <asp:Button ID="BT_CreateEducation" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateEducation_Click" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label103" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>

                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="45%" align="center"><strong>
                                                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,XueXiaoMingChen %>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,KaiShiRiQi %>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,JieShuRiQi %>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,ZhengShu %>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="School" HeaderText="学校名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="StartTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Certificate" HeaderText="证书">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid></td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer4" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label138" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popEducationDetailWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title5">
                            <asp:Label ID="Label139" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content5" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                        <asp:Label ID="LB_EducationID" runat="server"></asp:Label>
                                        <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_SchoolStartTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender5"
                                            runat="server" TargetControlID="DLC_SchoolStartTime" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,JieShuShiJian %>"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="DLC_SchoolEndTime" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender6"
                                            runat="server" TargetControlID="DLC_SchoolEndTime" Enabled="True">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,XueXiao %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_School" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,ZhuanYe %>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_SchoolMajor" Width="99%" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,ZhengShu %>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Certificate" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle"></td>
                                    <td style="text-align: left;" class="formItemBgStyle"></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer5" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton4" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewEducation_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label140" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popFamilyWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title6">
                            <asp:Label ID="Label125" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content6" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="BT_CreateFamily" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateFamily_Click" />
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label129" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label142" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>

                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label96" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label97" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label98" runat="server" Text="<%$ Resources:lang,ChenWei%>"></asp:Label></strong></td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label99" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label></strong></td>
                                                            <td width="15%" align="center"><strong>
                                                                <asp:Label ID="Label100" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label101" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong></td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label102" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid4_ItemCommand" ShowHeader="False" Width="100%">
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
                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="MemberName" HeaderText="姓名">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Relation" HeaderText="称谓">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="WorkAddress" HeaderText="工作单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Duty" HeaderText="职位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="PostCode" HeaderText="邮编">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Comment" HeaderText="备注">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>

                                    </td>
                                </tr>

                            </table>


                        </div>

                        <div id="popwindow_footer6" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label141" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popFamilyDetailWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title7">
                            <asp:Label ID="Label143" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content7" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                        <asp:Label ID="LB_MemberID" runat="server"></asp:Label>
                                        <asp:Label ID="Label104" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_MemberName" runat="server" Width="200px"></asp:TextBox></td>
                                    <td class="formItemBgStyle" style="text-align: Right;">
                                        <asp:Label ID="Label105" runat="server" Text="<%$ Resources:lang,ChenWei%>"></asp:Label></td>
                                    <td class="formItemBgStyle" style="text-align: left;">
                                        <asp:TextBox ID="TB_Relation" runat="server" Width="200px"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label106" runat="server" Text="<%$ Resources:lang,GongZuoDanWei%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_WorkAddress" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label107" runat="server" Text="<%$ Resources:lang,ZhiWei%>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_MemberDuty" Width="200px" runat="server"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label108" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PostCode" Width="200px" runat="server"></asp:TextBox></td>
                                    <td style="text-align: Right;" class="formItemBgStyle">
                                        <asp:Label ID="Label109" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></td>
                                    <td style="text-align: left;" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_MemberComment" Width="200px" runat="server"></asp:TextBox></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer7" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton6" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewFamily_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label144" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popChangeWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title8">
                            <asp:Label ID="Label145" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content8" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="BT_CreateChange" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateChange_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>

                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong></td>
                                                            <td width="60%" align="center"><strong>
                                                                <asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label></strong></td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid5" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid5_ItemCommand" ShowHeader="False" Width="100%">
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
                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="TransType" HeaderText="类型">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Description" HeaderText="描述">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="60%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EffectDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:DataGrid></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer8" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label146" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popChangeDetailWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title9">
                            <asp:Label ID="Label147" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content9" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_TransID" runat="server"></asp:Label><asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_TransType" runat="server"></asp:TextBox><asp:DropDownList ID="DL_TransType"
                                            runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_TransType_SelectedIndexChanged">
                                            <asp:ListItem Value="入职" Text="<%$ Resources:lang,RuZhi%>" />
                                            <asp:ListItem Value="升职" Text="<%$ Resources:lang,ShenZhi%>" />
                                            <asp:ListItem Value="调动" Text="<%$ Resources:lang,DiaoZhi%>" />
                                            <asp:ListItem Value="离职" Text="<%$ Resources:lang,LiZhi%>" />
                                            <asp:ListItem Value="其它" Text="<%$ Resources:lang,QiTa%>" />
                                        </asp:DropDownList></td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_Description" runat="server" Width="95%"></asp:TextBox></td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DLC_EffectDate" ReadOnly="false" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender7"
                                            runat="server" TargetControlID="DLC_EffectDate">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer9" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton8" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewChange_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPartTimeWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title10">
                            <asp:Label ID="Label149" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content10" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right">
                                        <asp:Button ID="BT_CreatePartTime" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreatePartTime_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>

                                                            <td width="5%" align="center"><strong>
                                                                <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="30%" align="center"><strong>
                                                                <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,JianZhiBuMen%>"></asp:Label></strong></td>
                                                            <td width="40%" align="center"><strong>
                                                                <asp:Label ID="Label127" runat="server" Text="<%$ Resources:lang,JianZhiZhiWu%>"></asp:Label></strong></td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label128" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></strong></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid6" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid6_ItemCommand" ShowHeader="False" Width="100%">
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
                                                <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="DepartName" HeaderText="兼职部门">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Duty" HeaderText="兼职职务">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EffectTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生效日期">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%"></ItemStyle>
                                                </asp:BoundColumn>
                                            </Columns>
                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                        </asp:DataGrid></td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer10" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label150" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPartTimeDetailWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title11">
                            <asp:Label ID="Label151" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content11" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr>
                                    <td style="text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="LB_PartTimeID" runat="server"></asp:Label>
                                        <asp:Label ID="Label130" runat="server" Text="<%$ Resources:lang,JianZhiBuMenDaiMa%>"></asp:Label></td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PartTimeDepartCode" runat="server"></asp:TextBox><asp:Label ID="LB_PartTimeDepartName"
                                            runat="server"></asp:Label><cc1:ModalPopupExtender ID="TB_PartTimeDepartCode_ModalPopupExtender"
                                                runat="server" Enabled="True" TargetControlID="TB_PartTimeDepartCode" PopupControlID="Panel1"
                                                CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                            </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label131" runat="server" Text="<%$ Resources:lang,ZhiWu%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="TB_PartTimeDuty" runat="server"></asp:TextBox><asp:DropDownList
                                            ID="DL_PartTimeDuty" runat="server" DataTextField="Duty" DataValueField="Duty"
                                            AutoPostBack="True" OnSelectedIndexChanged="DDL_PartTimeDuty_SelectedIndexChanged">
                                        </asp:DropDownList><span style="color: #ff0000">*</span> </td>
                                </tr>
                                <tr>
                                    <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label132" runat="server" Text="<%$ Resources:lang,ShengXiaoShiJian%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle">
                                        <asp:TextBox ID="DDC_PartTimeTime" ReadOnly="false" runat="server"></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender8"
                                            runat="server" TargetControlID="DDC_PartTimeTime">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>

                            </table>

                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton10" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewPartTime_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popPhotoWindow" name="noConfirm"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title12">
                            <asp:Label ID="Label3" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content12" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                        <asp:Image ID="IM_MemberPhoto" runat="server" Height="200px" Width="200px" AlternateText="Member'sPhoto" />
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhaoPianShangChuan %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                        <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUP_File" runat="server" Width="150px" />
                                                &nbsp;
                                                   <asp:Button ID="BT_UploadPhoto" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UploadPhoto_Click" Text="<%$ Resources:lang,ShangChuan%>" />

                                                <asp:Button ID="BT_DeletePhoto" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeletePhoto_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" />
                                                &nbsp;
                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TuPianKuan200Gao200%>"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadPhoto" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,QianMingYiShangChuan %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" align="left">
                                        <asp:Image ID="IM_SignPicture" runat="server" AlternateText="SignaturePicture" Height="80px" Width="200px" />
                                        <br />
                                        <br />
                                        <asp:UpdatePanel ID="UpdatePanel3" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUP_Sign" runat="server" Width="150px" />
                                                &nbsp;<asp:Button ID="BT_UploadSignPicture" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UploadSignPicture_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                &nbsp; 
                                                <asp:Button ID="BT_DeleteSignPicture" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteSignPicture_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" />

                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,TuPianKuanErLiangBaiGaoBaShi%>"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadSignPicture" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,QianMing2ShangChuan %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left">

                                        <asp:Image ID="IM_SignPicture2" runat="server" AlternateText="SignaturePicture" Height="80px" Width="200px" />
                                        <br />

                                        <asp:UpdatePanel ID="UpdatePanel4" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUP_Sign2" runat="server" Width="150px" />
                                                &nbsp;<asp:Button ID="BT_UploadSignPicture2" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UploadSignPicture2_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                <asp:Button ID="BT_DeleteSignPicture2" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteSignPicture2_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" />
                                                &nbsp;
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TuPianKuanErLiangBaiGaoBaShi%>"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadSignPicture2" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,QianMing3ShangChuan %>"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                        <asp:Image ID="IM_SignPicture3" runat="server" AlternateText="SignaturePicture" Height="80px" Width="200px" />
                                        <br />


                                        <asp:UpdatePanel ID="UpdatePanel5" runat="server" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <asp:FileUpload ID="FUP_Sign3" runat="server" Width="150px" />
                                                &nbsp;<asp:Button ID="BT_UploadSignPicture3" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UploadSignPicture3_Click" Text="<%$ Resources:lang,ShangChuan%>" />
                                                &nbsp;
                                                <asp:Button ID="BT_DeleteSignPicture3" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_DeleteSignPicture3_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" />

                                                <asp:Label ID="Label133" runat="server" Text="<%$ Resources:lang,TuPianKuanErLiangBaiGaoBaShi%>"></asp:Label>
                                            </ContentTemplate>
                                            <Triggers>
                                                <asp:PostBackTrigger ControlID="BT_UploadSignPicture3" />
                                            </Triggers>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>

                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right"></td>
                                    <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                        <asp:HyperLink ID="HL_MemberPhoto" runat="server" Visible="False">[HL_MemberPhoto]</asp:HyperLink>
                                        <asp:HyperLink ID="HL_SignPicture" runat="server" Visible="False">[HL_SignPicture]</asp:HyperLink>
                                        <asp:HyperLink ID="HL_SignPicture2" runat="server" Visible="False">[HL_SignPicture]</asp:HyperLink>
                                        <asp:HyperLink ID="HL_SignPicture3" runat="server" Visible="False">[HL_SignPicture]</asp:HyperLink>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer12" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label5008" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="99%">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMB_CloseDepartment" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="99%">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePhoto" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none; width: 710px; height: 320px;">
                        <%-- <div id="silverlightControlHost" class="modalPopup-text" style="width: 100%; height: 100%; float: left;">
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
                        </div>--%>
                    </asp:Panel>
                    <br />
                    <asp:TextBox ID="TB_PhotoString1" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString2" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString3" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:TextBox ID="TB_PhotoString4" runat="server" Style="visibility: hidden"></asp:TextBox>
                    <asp:Button ID="BT_SavePhoto" runat="server" CssClass="inpuLong" OnClick="BT_SavePhoto_Click"
                        Style="visibility: hidden" />
                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql2" runat="server" Visible="false"></asp:Label>
                    <asp:Label ID="LB_NewUserCode" runat="server" Visible="False"></asp:Label>

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

    <script type="text/javascript" language="javascript">
        $(function () {
            $("#<%=DLC_JoinDate.ClientID%>").change(function () {
                self.frames['IFrame_UserInformationExtend'].document.forms[0]['HF_JoinDate'].value = document.getElementById("DLC_JoinDate").value;
                self.frames['IFrame_UserInformationExtend'].document.forms[0]['BT_Calc'].click();
            });
        });
    </script>


</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>


</html>
