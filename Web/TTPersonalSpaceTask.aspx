<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceTask.aspx.cs" Inherits="TTPersonalSpaceTask" %>

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
    <style type="text/css">
        .auto-style1 {
            margin-top: 0px;
        }
    </style>

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
                                        <ul id="myTab4r">
                                            <li class="active" onmouseover="nTabs(this,0);">
                                                <asp:Label ID="LB_MyTask" runat="server" Text="<%$ Resources:lang,MyTask%>" />
                                            </li>
                                            <li class="normal" onmouseover="nTabs(this,1);">
                                                <asp:Label ID="LB_AssignTask" runat="server" Text="<%$ Resources:lang,AssignTask%>" />
                                            </li>
                                        </ul>
                                    </div>
                                    <!-- 内容开始 -->
                                    <div class="TabContent">
                                        <div id="myTab4r_Content0">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td align="left">
                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            CellPadding="4" Font-Bold="False" ForeColor="#333333" GridLines="None" Height="1px"
                                                            ShowHeader="False" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="8"
                                                            Width="100%" CssClass="auto-style1">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" visible="false">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            
                                                                <asp:TemplateColumn HeaderText="优先级" Visible="false">
                                                                    <ItemTemplate>
                                                                        <%# GetTaskPriority(Eval("TaskID").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                    DataTextField="Operation" HeaderText="受理人的工作" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Left" Width="55%" />
                                                                </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
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
                                        </div>
                                        <div id="myTab4r_Content1" class="none">
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td>
                                                        <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            CellPadding="4" Font-Bold="False" ForeColor="#333333" GridLines="None" Height="1px"
                                                            ShowHeader="False" OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="8"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" visible="false">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                           
                                                                <asp:TemplateColumn HeaderText="优先级" Visible="false">
                                                                    <ItemTemplate>
                                                                        <%# GetTaskPriority(Eval("TaskID").ToString()) %>
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTTaskDetail.aspx?ID={0}"
                                                                    DataTextField="Operation" HeaderText="受理人的工作" Target="_blank">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Left" Width="55%" />
                                                                </asp:HyperLinkColumn>
                                                                     <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                                    <ItemStyle CssClass="dibian" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
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
