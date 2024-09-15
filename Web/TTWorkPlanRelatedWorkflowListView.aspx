<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlanRelatedWorkflowListView.aspx.cs" Inherits="TTWorkPlanRelatedWorkflowListView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

    </script>

</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <caption>
                                tr&gt;
                                <tr>
                                    <td class="page_topbj" height="31">
                                        <table align="center" border="0" cellpadding="0" cellspacing="0" width="96%">
                                            <tr>
                                                <td align="left">
                                                    <table align="left" border="0" cellpadding="0" cellspacing="0" width="345">
                                                        <tr>
                                                            <td width="29">
                                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                            </td>
                                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label>
                                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LiuCheng%>"></asp:Label>
                                                            </td>
                                                            <td width="5">
                                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right"><a href="#" onclick="preview1()">
                                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                </a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" width="100%">
                                        <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                            <tr>
                                                <td align="left" style="padding-left: 20px; font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                    <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                        <tr>
                                                            <td colspan="2" style="text-align: left;">
                                                                <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>
                                                                :<asp:Label ID="LB_QueryScope" runat="server" Font-Names="Arial,宋体" Font-Size="9pt"></asp:Label>
                                                            </td>
                                                            <td align="right" colspan="2" style="padding-right: 10px">
                                                                <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />
                                                                :
                                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                &nbsp;
                                                                <asp:Label ID="LB_UserName" runat="server" Font-Size="9pt"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top">
                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" style="width: 100%; padding: 5px 5px 5px 5px;">
                                                                <table align="center" background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                <tr>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="27%"><strong>
                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="5%"><strong>&nbsp; </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="20%"><strong>
                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,FeiYong %>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                                    </strong></td>
                                                                                    <td align="center" width="5%"><strong></strong></td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td align="right" width="6">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ShowHeader="false" Width="100%">
                                                                    <Columns>
                                                                        <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWorkFlowViewMain.aspx?WLID={0}" DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="27%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTWFChartViewJS.aspx?WLID={0}" HeaderText="工作流" Target="_blank" Text="<%$ Resources:lang,JinDu%>">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="WLType" HeaderText="类型">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}" DataTextField="CreatorName" HeaderText="申请人" Target="_blank">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                        </asp:HyperLinkColumn>
                                                                        <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <a href='TTProExpenseView.aspx?WorkflowID=<%#DataBinder .Eval (Container .DataItem ,"WLID") %>'><%#DataBinder .Eval (Container .DataItem ,"Expense") %></a>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn HeaderText="状态">
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemTemplate>
                                                                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTDocumentTreeView.aspx?RelatedType=WorkFlow&RelatedID={0}") %>' Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" /></asp:HyperLink>
                                                                            </ItemTemplate>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:TemplateColumn>
                                                                    </Columns>
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                                </asp:DataGrid>
                                                                <br />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </caption>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
