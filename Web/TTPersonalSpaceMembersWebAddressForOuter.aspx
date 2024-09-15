<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceMembersWebAddressForOuter.aspx.cs" Inherits="TTPersonalSpaceMembersWebAddressForOuter" %>
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
                                        <ul id="myTab5r">
                                            <li class="active" onmouseover="nTabs(this,0);">

                                                <asp:Label ID="LB_MyMember" runat="server" Text="<%$ Resources:lang,MyMember%>" />
                                            </li>

                                            <li class="normal" onmouseover="nTabs(this,1);">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WebSite%>" />
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 内容开始 -->
                                    <div class="TabContent">
                                        <div id="myTab5r_Content0">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left" colspan="2">
                                                        <div class="reny">
                                                            <ul>
                                                                <asp:Repeater ID="RP_MyMemberList" runat="server">
                                                                    <ItemTemplate>
                                                                        <li><a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                            target="_blank">
                                                                            <%# DataBinder.Eval(Container.DataItem,"UserName") %>
                                                                        </a></li>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left" style="width: 20%; padding-left: 15px;">
                                                        <br />
                                                        <table>
                                                            <tr>
                                                               <td style="font-size:small;">
                                                                    <asp:Label ID="LB_SetAgent" runat="server" Text="<%$ Resources:lang,SetAgent%>" />：
                                                                </td>
                                                                <td>
                                                                    <asp:DropDownList ID="DL_MemberAgency" runat="server" DataTextField="UserName"
                                                                        DataValueField="UserCode" AutoPostBack="True" OnSelectedIndexChanged="DL_MemberAgency_SelectedIndexChanged">
                                                                    </asp:DropDownList>
                                                                </td>
                                                                <td>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
                                                                <td>
                                                                    <asp:HyperLink ID="HL_MemberOtherSet" NavigateUrl="~/TTMyMemberLevelSet.aspx" Text="<%$ Resources:lang,OtherSet%>" runat="server"></asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>


                                        <div id="myTab5r_Content1" class="none">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left" colspan="2">
                                                        <div class="reny">
                                                            <ul>
                                                                <asp:Repeater ID="RP_WebSite" runat="server">
                                                                    <ItemTemplate>
                                                                        <li><a href='<%# DataBinder.Eval(Container.DataItem,"SiteAddress") %>' target="_blank">
                                                                            <%# DataBinder.Eval(Container.DataItem,"SiteName") %>
                                                                        </a></li>
                                                                    </ItemTemplate>
                                                                </asp:Repeater>
                                                            </ul>
                                                        </div>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2" align="left" style="width: 20%; padding-left: 20px;">
                                                        <br />
                                                        -->   
                                                <asp:HyperLink ID="HL_MakeWebSite" NavigateUrl="~/TTMakeWebSite.aspx" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:HyperLink>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
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
