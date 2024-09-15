<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectWorkflowTemplateCopy.aspx.cs" Inherits="TTProjectWorkflowTemplateCopy" %>

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
                                    <td width="29">
                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                    </td>
                                    <td align="left" background="ImagesSkin/main_top_bj.jpg">


                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongZuoLiuMoBan%>"></asp:Label>
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FuZhi%>"></asp:Label>


                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td valign="top" align="left">
                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="300px" valign="top" style="text-align: left; border-right: solid 1px #D8D8D8;">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="300px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td valign="top" style="text-align: left; border-right: solid 1px #D8D8D8"
                                        width="400px">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="20%" align="center">
                                                                <strong></strong>
                                                            </td>
                                                            <td width="45%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MuBanMingCheng%>"></asp:Label></strong>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                            Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None">

                                            <Columns>

                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_WFTemName" runat="server" CssClass="inpuLong" Text='<%# DataBinder.Eval(Container.DataItem,"WFTemplateName") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTWorkFlowTemplateView.aspx?IdentifyString={0}"
                                                    HeaderText="模板名称" Target="_blank" Text="模板内容">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="45%" />
                                                </asp:HyperLinkColumn>

                                            </Columns>
                                            <HeaderStyle Font-Bold="True" HorizontalAlign="Center" BackColor="#507CD1" ForeColor="White" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
                                    </td>
                                    <td valign="top" style="width: 80px; text-align: center; border-right: solid 1px #D8D8D8;">
                                        <asp:Button ID="BT_CopyWorkflowTemplate" runat="server" CssClass="ButtonCss" Enabled="False" Height="25px" OnClick="BT_CopyWorkflowTemplate_Click" Text="<%$ Resources:lang,FuZhi%>" />

                                        <br />
                                        <asp:Label ID="LB_NewProjectID" runat="server" Visible="false"></asp:Label>


                                        <asp:Label ID="LB_OldProjectID" runat="server" Visible="false"></asp:Label>


                                    </td>
                                    <td valign="top" style="text-align: left; border-right: solid 1px #D8D8D8;">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="65%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MuBanMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                            OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4"
                                            ForeColor="#333333" ShowHeader="False"
                                            GridLines="None">
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTWorkFlowTemplateView.aspx?IdentifyString={0}"
                                                    DataTextField="WFTemplateName" HeaderText="模板名称" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="65%" />
                                                </asp:HyperLinkColumn>
                                                <asp:ButtonColumn CommandName="Delete"
                                                    Text="&lt;div&gt;&lt;img src=ImagesSkin/icon_del.gif border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:ButtonColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                        </asp:DataGrid>
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
