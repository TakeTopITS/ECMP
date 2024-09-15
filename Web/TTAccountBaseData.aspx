<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountBaseData.aspx.cs" Inherits="TTAccountBaseData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>会计科目设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            color: #CC0000;
        }
    </style>
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
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KuaiJiKeMuSheZhi%>"></asp:Label>
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
                                <td>
                                    <table style="width: 98%; margin-top: 5px">
                                        <tr>
                                            <td valign="top" align="left" style="width: 25%; text-align: left; padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                                <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" Font-Size="10pt" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="100%">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td>
                                                <table style="width: 99%">
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangJiKeMu%>"></asp:Label>：<asp:DropDownList ID="DL_ParentID" runat="server" DataTextField="AccountName" DataValueField="ID" AutoPostBack="True" OnSelectedIndexChanged="DL_ParentID_SelectedIndexChanged">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KeMuDaiMa%>"></asp:Label>：<asp:TextBox ID="TB_AccountCode" runat="server" CssClass="shuru" Width="140px"></asp:TextBox>
                                                            <asp:Label ID="lbl_OldCode" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeMuMingCheng%>"></asp:Label>：<asp:TextBox ID="TB_AccountName" runat="server" Width="140px" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KeMuPaiXu%>"></asp:Label>：<asp:TextBox ID="TB_SortNumber" runat="server" Width="140px" CssClass="shuru"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeMuLeiXing%>"></asp:Label>：<asp:TextBox ID="TB_AccountType" runat="server" CssClass="shuru" Width="140px">资产</asp:TextBox>
                                                            &nbsp;<asp:DropDownList ID="DL_Type" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_Type_SelectedIndexChanged">
                                                                <asp:ListItem Value="资产" Text="<%$ Resources:lang,ZiChan%>" />
                                                                <asp:ListItem Value="负债" Text="<%$ Resources:lang,FuZhai%>" />
                                                                <asp:ListItem Value="成本" Text="<%$ Resources:lang,ChengBen%>" />
                                                                <asp:ListItem Value="权益" Text="<%$ Resources:lang,QuanYi%>" />
                                                                <asp:ListItem Value="损益" Text="<%$ Resources:lang,SunYi%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LeiXingQuYu%>"></asp:Label>：<asp:TextBox ID="TB_TypeArea" runat="server" CssClass="shuru" Width="140px">中国大陆</asp:TextBox>
                                                            &nbsp;<asp:DropDownList ID="DL_Area" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_Area_SelectedIndexChanged">
                                                                <asp:ListItem Value="中国大陆" Text="<%$ Resources:lang,ZhongGuoDaLu%>" />
                                                                <asp:ListItem Value="中国香港" Text="<%$ Resources:lang,ZhongGuoXiangGang%>" />
                                                                <asp:ListItem Value="中国澳门" Text="<%$ Resources:lang,ZhongGuoAoMen%>" />
                                                                <asp:ListItem Value="美国" Text="<%$ Resources:lang,MeiGuo%>" />
                                                                <asp:ListItem Value="日本" Text="<%$ Resources:lang,RiBen%>" />
                                                                <asp:ListItem Value="英国" Text="<%$ Resources:lang,YingGuo%>" />
                                                                <asp:ListItem Value="韩国" Text="<%$ Resources:lang,HanGuo%>" />
                                                                <asp:ListItem Value="朝鲜" Text="<%$ Resources:lang,ChaoXian%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left"></td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left">
                                                            <asp:Button CssClass="inpu" ID="BT_AccountAdd" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_AccountAdd_Click" />&nbsp;
                                                        <asp:Button CssClass="inpu" ID="BT_AccountUpdate" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_AccountUpdate_Click" />&nbsp;
                                                        <asp:Button CssClass="inpu" ID="BT_AccountDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_AccountDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                            <asp:Label ID="lbl_ID" runat="server" Visible="False"></asp:Label>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
