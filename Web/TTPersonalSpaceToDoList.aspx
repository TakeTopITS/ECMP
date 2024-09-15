<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceToDoList.aspx.cs" Inherits="TTPersonalSpaceToDoList" %>
<%@ OutputCache Duration="2678400" VaryByParam="*" %>

<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<%@ Import Namespace="System.Globalization" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="tabCss" href="css/tab.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="css/tab.js"></script>

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
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <asp:Timer ID="Timer1" OnTick="Timer1_Tick" runat="server" Interval="1000" />
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="Timer1" />
            </Triggers>
            <ContentTemplate>
                <div class="renyList" style="width: 100%; height: 300px; overflow: auto;">
                    <table width="100%" cellpadding="0" cellspacing="0">
                        <tr>
                            <td valign="top" style="padding: 1px 1px 1px 10px;">
                                <div class="nTabr">
                                    <!-- 标题开始 -->
                                    <div class="TabTitle">
                                        <ul id="myTab2r">
                                            <li id="LI_ToDoList" class="active" onmouseover="nTabs(this,0);">
                                                <asp:Label ID="LB_ToDoList" runat="server" Text="<%$ Resources:lang,ToDoList%>"></asp:Label>
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 内容开始 -->
                                    <div class="TabContent">
                                        <div id="myTab2r_Content0" runat="server">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left">
                                                        <div class="renyList">
                                                            <ul>
                                                                <asp:Repeater ID="RP_ToDoList" runat="server">
                                                                    <ItemTemplate>
                                                                        <li style="color: #333;">
                                                                            <a href='<%#DataBinder .Eval (Container .DataItem,"LinkAddress") %>' target="rightFrame"><%#DataBinder .Eval (Container .DataItem,"HomeName") %> :<%# GetNumberCount(Eval("SQLCode").ToString()) %></a></li>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <asp:Label ID="LB_Sql7" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql9" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_SuperDepartString" runat="server" Visible="False"></asp:Label>
                                    </div>
                                </div>
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
<script type="text/javascript" language="javascript">
    var cssDirectory = '<%=Session["CssDirectory"] %>';

    var oLink = document.getElementById('mainCss');
    oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';

    var oTabLink = document.getElementById('tabCss');
    oTabLink.href = 'css/' + cssDirectory + '/' + 'tab.css';

</script>
</html>
