<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceNewsNotice.aspx.cs" Inherits="TTPersonalSpaceNewsNotice" %>
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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,NewsList%>" />
                                            </li>

                                            <li class="normal" onmouseover="nTabs(this,1);">
                                                <asp:Label ID="LB_ToBeReadReport" runat="server" Text="<%$ Resources:lang,PublicNotice%>" />
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 内容开始 -->
                                    <div class="TabContent">
                                        <div id="myTab2r_Content0" runat="server">
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="left" style="width: 100%;">
                                                        <asp:DataGrid ID="DataGrid9" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                            OnPageIndexChanged="DataGrid9_PageIndexChanged" PageSize="8" Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="False">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>

                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTNews.aspx?ID={0}" DataTextField="Title" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="60%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="RelatedDepartName" HeaderText="归属部门">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="PublisherCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="PublisherName" HeaderText="发布者" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="PublishTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发布时间">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
                                        </div>
                                        <div id="myTab2r_Content1" class="none">
                                            <table border="0" style="width: 100%">
                                                <tr>
                                                    <td align="left" style="width: 100%;">
                                                        <asp:DataGrid ID="DataGrid7" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                            OnItemCommand="DataGrid7_ItemCommand" OnPageIndexChanged="DataGrid7_PageIndexChanged"
                                                            PageSize="8" Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}" DataTextField="DocName" HeaderText="公告文件名" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Left" Width="40%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="RelatedDepartName" HeaderText="归属部门">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="UploadManName" HeaderText="发布者" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="UploadTime" HeaderText="发布时间">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_Read" runat="server" Text="<%$ Resources:lang,YiYue%>" />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>

                                                        <asp:Label ID="LB_Sql7" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_Sql9" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_SuperDepartString" runat="server" Visible="False"></asp:Label>
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
