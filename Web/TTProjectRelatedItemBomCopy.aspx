<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRelatedItemBomCopy.aspx.cs"
    Inherits="TTProjectRelatedItemBomCopy" %>

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
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

    </script>

</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>

                    <table cellpadding="0" cellspacing="0" border="0" width="100%" align="center" class="bian">
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td class="page_topbj" height="31">
                                            <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                                <tr>
                                                    <td align="left">
                                                        <table align="left" border="0" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="29">
                                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                </td>
                                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                    <span class="style1">
                                                                        <asp:Label ID="LB_tiMakeBOM" runat="server" Text="<%$ Resources:lang,MakeBOM%>"></asp:Label>
                                                                        &nbsp;&nbsp; </span>
                                                                </td>
                                                                <td width="5">
                                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                </td>
                                                                <td>(
                                                                <asp:Label ID="LB_tiItemBOMVersionID" runat="server" Text="<%$ Resources:lang,VersionID%>"></asp:Label>
                                                                    ：
                                                                <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_NewVerID" runat="server" Amount="1" MinAmount="1" Precision="0"
                                                                    Width="30px"> 
                                                        1
                                                                </NickLee:NumberBox>
                                                                    &nbsp;
                                                                <asp:Label ID="LB_tiProjectItemBOMType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>
                                                                    <asp:DropDownList ID="DL_VersionType" runat="server">
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>"/>
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>"/>
                                                                    </asp:DropDownList>
                                                                    <asp:Button ID="BT_NewVersion" runat="server" CssClass="ButtonCss" Height="20px"
                                                                        OnClick="BT_NewVersion_Click" Text="<%$ Resources:lang,New%>" />
                                                                    &nbsp;<asp:Button ID="BT_DeleteVersion" runat="server" CssClass="ButtonCss" Height="20px" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                        OnClick="BT_DeleteVersion_Click" Text="<%$ Resources:lang,Delete%>" />
                                                                    ）(<asp:Label ID="LB_tiCopyBOM" runat="server" Text="<%$ Resources:lang,Copy%>"></asp:Label>
                                                                    BOM:<asp:Label ID="LB_tbFrom" runat="server" Text="<%$ Resources:lang,From%>"></asp:Label>
                                                                    &nbsp;<asp:Label ID="LB_OldProjectID" runat="server"></asp:Label>
                                                                    &nbsp;BOM<asp:Label ID="LB_tiFromVersion" runat="server" Text="<%$ Resources:lang,Version%>"></asp:Label>
                                                                    <asp:DropDownList ID="DL_OldVersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                                        DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_OldVersionID_SelectedIndexChanged"
                                                                        Width="50px">
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="LB_tiCopyToProject" runat="server" Text="<%$ Resources:lang,CopyToProject%>"></asp:Label>
                                                                    &nbsp;<asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                                    &nbsp;BOM<asp:Label ID="LB_tiToBOMVersion" runat="server" Text="<%$ Resources:lang,Version%>"></asp:Label>
                                                                    <asp:DropDownList ID="DL_NewVersionID" runat="server" DataTextField="VerID" DataValueField="ID"
                                                                        Height="21px" Width="50px">
                                                                    </asp:DropDownList>
                                                                    &nbsp;&nbsp;<asp:Button ID="BT_CopyVersion" runat="server" CssClass="ButtonCss" Enabled="False"
                                                                        Height="20px" OnClick="BT_CopyVersion_Click" Text="<%$ Resources:lang,Copy%>" />
                                                                    )
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
                                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                                <tr>
                                                    <td style="padding: 5px 5px 0px 5px; text-align: left; border-right: solid 1px #D8D8D8"
                                                        valign="top" width="300px">
                                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                            ShowLines="True" Width="300px">
                                                            <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                        </asp:TreeView>
                                                    </td>
                                                    <td style="width: 300px; padding: 5px 5px 0px 5px; text-align: left; vertical-align: top; border-right: solid 1px #D8D8D8">
                                                        <asp:TreeView ID="TreeView3" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                            NodeWrap="True" ShowLines="True" Width="300px">
                                                            <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                        </asp:TreeView>
                                                    </td>
                                                    <td style="padding: 5px 5px 0px 5px; text-align: left;" valign="top">
                                                        <table style="width: 100%;">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XuanZeBanBen%>"></asp:Label>：
                                                                <asp:DropDownList ID="DL_VersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                                    DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_Version_SelectedIndexChanged"
                                                                    Width="40px">
                                                                </asp:DropDownList>
                                                                    &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：<asp:DropDownList ID="DL_ChangeVersionType" runat="server" AutoPostBack="True"
                                                                        OnSelectedIndexChanged="DL_ChangeVersionType_SelectedIndexChanged">
                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>"/>
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>"/>
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>"/>
                                                                    </asp:DropDownList>
                                                                    <br />
                                                                    <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                                        NodeWrap="True" ShowLines="True" Width="300px">
                                                                        <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                                    </asp:TreeView>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
