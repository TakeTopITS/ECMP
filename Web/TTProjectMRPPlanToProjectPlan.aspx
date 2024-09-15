<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectMRPPlanToProjectPlan.aspx.cs" Inherits="TTProjectMRPPlanToProjectPlan" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目工作计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

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
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="29">
                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                    </td>
                                    <td align="left" background="ImagesSkin/main_top_bj.jpg">
                                        <table>
                                            <tr>
                                                <td>（
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiDingJiHuaBanBenHao%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_NewVerID" runat="server"
                                                        MinAmount="1" Precision="0" Width="30px" Amount="1">
                                                                 1</NickLee:NumberBox>
                                                </td>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaLeiXing%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:DropDownList ID="DL_VersionType" runat="server">
                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                    </asp:DropDownList></td>
                                                <td>
                                                    <asp:Button ID="BT_NewVersion" runat="server" CssClass="inpu"
                                                        OnClick="BT_NewVersion_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_DeleteVersion" runat="server" CssClass="inpu"
                                                        OnClick="BT_DeleteVersion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                </td>
                                                <td>）</td>
                                                <td></td>
                                                <td>(
                                                </td>
                                                
                                                <td>
                                                    <asp:Label ID="LB_OldProjectID" runat="server"></asp:Label></td>
                                                <td>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DeJiHuaBanBen%>"></asp:Label></td>
                                                <td>
                                                    <asp:DropDownList ID="DL_OldVersionID" runat="server" DataTextField="VerID"
                                                        DataValueField="ID" OnSelectedIndexChanged="DL_OldVersionID_SelectedIndexChanged"
                                                        AutoPostBack="True">
                                                    </asp:DropDownList></td>
                                               <td>）
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="left">
                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td rowspan="4" width="300px" valign="top" style="text-align: left; border-right: solid 1px #D8D8D8;">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="300px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td rowspan="4" valign="top" style="text-align: left; border-right: solid 1px #D8D8D8"
                                        width="360px">
                                        <div style="width: 360px; text-align: right;">
                                            &nbsp;&nbsp;<asp:HyperLink ID="HL_ProPlanGanttOld" runat="server" Target="_blank">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GanTeTu%>"></asp:Label>
                                            </asp:HyperLink>
                                        </div>
                                        <asp:TreeView ID="TreeView3" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                            NodeWrap="True" ShowLines="True" Width="400px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                 <td rowspan="4" valign="top" style="text-align: left; border-right: solid 1px #D8D8D8;padding-top:5px;"
                                        width="360px">
                                     <asp:Button ID="BT_TransferPlan" runat="server" CssClass="inpu" Text="转计划" OnClick="BT_TransferPlan_Click" OnClientClick="displayWaitingImg('img_processing');return confirm('操作会覆盖原来的计划结构，您确定要覆盖吗(transfer operation will cover old plan data,Are you sure you want to cover it)？');"/>
                                     <img id="img_processing" src="img/Processing.gif" alt="Loading,please wait..." style="display: none;" />
                                 </td>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
