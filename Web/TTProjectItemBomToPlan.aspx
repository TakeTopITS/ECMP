<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectItemBomToPlan.aspx.cs"
    Inherits="TTProjectItemBomToPlan" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>产品资料设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1560px;
            width: expression (document.body.clientWidth <= 1560? "1560px" : "auto" );
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function displayWaitingImg(img) {

            this.document.getElementById(img).style.display = 'block';
        }

        function autoheight() { //函数：获取尺寸
            //获取浏览器窗口高度
            var winHeight = 0;
            if (window.innerHeight)
                winHeight = window.innerHeight;
            else if ((document.body) && (document.body.clientHeight))
                winHeight = document.body.clientHeight;

            if (document.documentElement && document.documentElement.clientHeight)
                winHeight = document.documentElement.clientHeight;

            document.getElementById("LB_ItemCode").style.height = (winHeight - 120) + "px";
        }

        window.onresize = autoheight; //浏览器窗口发生变化时同时变化DIV高度



    </script>

</head>
<body onload="autoheight();">
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" cellspacing="0" class="bian" width="100%">
                        <tr>
                            <td>

                                <table width="100%" cellpadding="0" cellspacing="0" border="0" align="center" class="bian">
                                    <tr>
                                        <td height="31" class="page_topbj">
                                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td align="left">
                                                        <table border="0" align="left" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td width="29">
                                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                                </td>
                                                                <td align="left" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                    <asp:Label ID="LB_tiBOMToPlan" runat="server" Text="<%$ Resources:lang,WBSJieGouGuiHuaZhuanJiHua%>"></asp:Label>
                                                                </td>
                                                                <td width="5">
                                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <table style="display: none;">
                                                            <tr>
                                                                <td>（BOM:
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tiAddVersion" runat="server" Text="<%$ Resources:lang,AddVersion%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_NewProjectItemBomVerID" runat="server" Amount="1" MinAmount="1"
                                                                        Precision="0" Width="30px"> 1</NickLee:NumberBox>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_NewVersion" runat="server" CssClass="inpu" OnClick="BT_NewVersion_Click"
                                                                        Text="<%$ Resources:lang,New%>" />
                                                                </td>
                                                                <td>&nbsp;
                                                                <asp:Button ID="BT_DeleteVersion" runat="server" CssClass="inpu" OnClick="BT_DeleteVersion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                    Text="<%$ Resources:lang,Delete%>" />
                                                                </td>
                                                                <td>）
                                                                </td>
                                                                <td>(<asp:Label ID="LB_tiBomCopyVersion" runat="server" Text="<%$ Resources:lang,CopyVersion%>"></asp:Label>:
                                                                <asp:Label ID="LB_tiFromVersion" runat="server" Text="<%$ Resources:lang,From%>"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_OldVersionID" runat="server" DataTextField="VerID" DataValueField="ID"
                                                                        Width="40px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tiToVersion" runat="server" Text="<%$ Resources:lang,To%>"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_NewVersionID" runat="server" DataTextField="VerID" DataValueField="ID"
                                                                        Width="40px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>&nbsp;<asp:Button ID="BT_CopyVersion" runat="server" CssClass="inpu" OnClick="BT_CopyVersion_Click" 
                                                                    Text="<%$ Resources:lang,Copy%>" />
                                                                </td>
                                                                <td>）
                                                                <asp:HyperLink ID="HL_CopyFromOtherProjectItemBom" runat="server" Target="_blank"
                                                                    Text="<%$ Resources:lang,CMBXMFZJGWBSGH%>"></asp:HyperLink>
                                                                </td>
                                                                <td>&nbsp;&nbsp;&nbsp;
                                                                <asp:HyperLink ID="HL_ProjectImplePlan" runat="server" Target="_blank" Text="<%$ Resources:lang,hlCopyProjectPlan%>"></asp:HyperLink>
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
                                                    <td style="width: 300px; padding: 5px 5px 0px 5px; text-align: left; vertical-align: top; border-right: solid 1px #D8D8D8"
                                                        class="formItemBgStyle">
                                                        <table width="100%" cellpadding="2" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_tbBomVersion" runat="server" Text="<%$ Resources:lang,Version%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ChangeProjectItemBomVersionID" runat="server" AutoPostBack="True"
                                                                        DataTextField="VerID" DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_ChangeProjecrItemBomVersionID_SelectedIndexChanged"
                                                                        Width="40px">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbBomType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ChangeProjectItemBomVersionType" runat="server" AutoPostBack="True"
                                                                        Height="21px" OnSelectedIndexChanged="DL_ChangeProjectItemBomVersionType_SelectedIndexChanged"
                                                                        Width="50px">
                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_TransferPlanType" runat="server">
                                                                        <asp:ListItem Value="顺排" Text="<%$ Resources:lang,ShunPai%>" />
                                                                        <asp:ListItem Value="倒排" Text="<%$ Resources:lang,DaoPai%>" />
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Button ID="BT_TransferToPlan" runat="server" Text="<%$ Resources:lang,ToPlan%>"
                                                                        OnClick="BT_TransferToPlan_Click" OnClientClick="displayWaitingImg('img_processing');return confirm('操作会覆盖原来的计划结构，您确定要覆盖吗(transfer operation will cover old plan data,Are you sure you want to cover it)？');"/>
                                                                    <img id="img_processing" src="img/Processing.gif" alt="Loading,please wait..." style="display: none;" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <hr />
                                                        <asp:TreeView ID="TreeView2" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt"
                                                            NodeWrap="True" ShowLines="True" Style="width: 300px; height: 100%;">
                                                            <RootNodeStyle CssClass="rootNode" />
                                                            <NodeStyle CssClass="treeNode" />
                                                            <LeafNodeStyle CssClass="leafNode" />
                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                        </asp:TreeView>
                                                    </td>

                                                    <td style="padding: 5px 5px 0px 5px; vertical-align: top;" align="left">
                                                        <table width="300px" cellpadding="2" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_tbPlanVersion" runat="server" Text="<%$ Resources:lang,PlanVersion%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <NickLee:NumberBox MaxAmount="1000000000000" ID="NB_PlanVerID" runat="server" Amount="1" MinAmount="1" Precision="0"
                                                                        Width="30px"> 1</NickLee:NumberBox>
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="BT_AddPlanVersion" runat="server" CssClass="inpu" Text="<%$ Resources:lang,New%>"
                                                                        OnClick="BT_AddPlanVersion_Click" />
                                                                </td>
                                                                <td align="center">
                                                                    <asp:Button ID="BT_DeletePlanVersion" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Delete%>"
                                                                        OnClick="BT_DeletePlanVersion_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <hr />
                                                        <table width="400px" cellpadding="2" cellspacing="0">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_tbProjectPlanVersion" runat="server" Text="<%$ Resources:lang,Version%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_PlanVersionID" runat="server" AutoPostBack="True" DataTextField="VerID"
                                                                        DataValueField="ID" Height="21px" OnSelectedIndexChanged="DL_PlanVersionID_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbProjectPlanType" runat="server" Text="<%$ Resources:lang,Type%>"></asp:Label>:
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_ChangePlanVersionType" runat="server" AutoPostBack="True">
                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                        <asp:ListItem Value="备用" Text="<%$ Resources:lang,BeiYong%>" />
                                                                        <asp:ListItem Value="基准" Text="<%$ Resources:lang,JiZhun%>" />
                                                                    </asp:DropDownList>
                                                                    <asp:Label ID="LB_TreeDepth" runat="server" Text="-1" Visible="false"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_ProPlanGanttNew" runat="server" Target="_blank" Text="<%$ Resources:lang,hlGanttChart%>"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <hr />
                                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" ShowLines="True" Font-Size="10pt"
                                                            Font-Bold="False" Font-Names="宋体" Style="width: 300px; height: 100%;">
                                                            <RootNodeStyle CssClass="rootNode" />
                                                            <NodeStyle CssClass="treeNode" />
                                                            <LeafNodeStyle CssClass="leafNode" />
                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
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
                </div>
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
