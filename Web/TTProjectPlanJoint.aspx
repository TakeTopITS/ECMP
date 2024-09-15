<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectPlanJoint.aspx.cs" Inherits="TTProjectPlanJoint" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>项目项目工作计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

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
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="计划拼接"></asp:Label>
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
                                        <div style="width: 400px; text-align: left;">
                                            <table>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LB_OldProjectID" runat="server"></asp:Label>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DeJiHuaBanBen%>"></asp:Label>
                                                        <asp:DropDownList ID="DL_OldVersionID" runat="server" AutoPostBack="True" DataTextField="VerID" DataValueField="ID" OnSelectedIndexChanged="DL_OldVersionID_SelectedIndexChanged">
                                                        </asp:DropDownList></td>
                                                    <td style="padding-left: 10px;">
                                                        <asp:HyperLink ID="HL_ProPlanGanttOld" runat="server" Target="_blank">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GanTeTu%>"></asp:Label>
                                                        </asp:HyperLink></td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <asp:Label ID="Label2" runat="server" Text="请选择要拼接的节点"></asp:Label>
                                                    </td>

                                                </tr>
                                            </table>
                                        </div>
                                        <asp:TreeView ID="TreeView3" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                            NodeWrap="True" ShowLines="True" Width="400px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td rowspan="4" valign="top" style="text-align: left; border-right: solid 1px #D8D8D8;">
                                        <table style="width: 550px;">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DeJiHuaBanBen%>"></asp:Label>

                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XuanZeBanBen%>"></asp:Label>：
                                              
                                                    <asp:DropDownList ID="DL_VersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                        DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_Version_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                    &nbsp;&nbsp;
                                                    <asp:HyperLink ID="HL_ProPlanGanttNew" runat="server" Target="_blank">
                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GanTeTu%>"></asp:Label>
                                                    </asp:HyperLink>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="5" align="left">
                                                    <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                        NodeWrap="True" ShowLines="True" Width="360px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                </td>
                                                <td colspan="5" align="left">

                                                    <asp:Button ID="BT_Joint" runat="server" CssClass="inpu" OnClick="BT_Joint_Click" OnClientClick="return confirm(getJoinProjectPlanMsgByLangCode())" Text="<%$ Resources:lang,PingJie%>" />
                                                    <asp:Label ID="LB_PlanIDString" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
