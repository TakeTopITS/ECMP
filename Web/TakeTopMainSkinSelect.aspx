<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopMainSkinSelect.aspx.cs" Inherits="TakeTopMainSkinSelect" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="css/liucheng.css" rel="stylesheet" type="text/css" />

    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }
        });

        function redirectToInnerTopPage() {
            window.open('TakeTopLRExMDI.html' +'?Flag=<%=Session["SkinFlag"].ToString() %>', '_top')
        }

        function redirectToOuterTopPage() {
            window.open('TakeTopCSMDI.html' + '?Flag=<%=Session["SkinFlag"].ToString() %>', '_top')
        }

        function redirectToSAASTopPage() {
            window.open('TakeTopLRExMDISAAS.html' + '?Flag=<%=Session["SkinFlag"].ToString() %>', '_top')
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div id="main">
                    <div class="main_middle">
                        <table border="0">
                            <tr>
                                <td colspan="6" style="text-align: center;">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuTiXuanZe%>"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Button ID="BT_Green" runat="server" ToolTip="CssGreen" Style="background-color: #0E553B; width: 200px; height: 200px;" OnClick="BT_Green_Click" />
                                </td>
                                <td id="TD_Blue" runat="server">
                                    <asp:Button ID="BT_Blue" runat="server" ToolTip="CssBlue" Style="background: linear-gradient(180deg, #D53E54 0%, #057BF9 100%); width: 200px; height: 200px;" OnClick="BT_Blue_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="BT_Red" runat="server" ToolTip="CssRed" Style="background-color: red; width: 200px; height: 200px;" OnClick="BT_Red_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="BT_Gold" runat="server" ToolTip="CssGolden" Style="background-color: gold; width: 200px; height: 200px;" OnClick="BT_Gold_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="BT_Grey" runat="server" ToolTip="CssGrey" Style="background-color: #3e526c; width: 200px; height: 200px;" OnClick="BT_Grey_Click" />
                                </td>
                                <td>
                                    <asp:Button ID="BT_Black" runat="server" ToolTip="CssBlack" Style="background-color: black; width: 200px; height: 200px;" OnClick="BT_Black_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: center;">&nbsp;</td>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: center;">
                                    <br />
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuYanXuanZe%>"></asp:Label>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td colspan="6" style="text-align: center;">

                                    <asp:Repeater ID="RP_Language" runat="server" OnItemCommand="RP_Language_ItemCommand">
                                        <ItemTemplate>
                                            <asp:Button ID="BT_Language" runat="server" ToolTip='<%# DataBinder.Eval(Container.DataItem,"LangCode") %>' CssClass="inpuLong" Text='<%# DataBinder.Eval(Container.DataItem,"Language").ToString().Trim() %>' Style="background-color: red; width: 100px; height: 100px; margin: 1px 0;" />
                                        </ItemTemplate>
                                    </asp:Repeater>

                                </td>
                            </tr>
                        </table>
                    </div>
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
