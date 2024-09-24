<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowTemplateChildTemplateList.aspx.cs" Inherits="TTWorkFlowTemplateChildTemplateList" %>

<!DOCTYPE html>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
     
   </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

        });


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                        <tr>
                            <td width="7">
                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                       
                                        <td width="30%" align="center"><strong>
                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MoBanMingChen %>"></asp:Label></strong></td>
                                        <td width="15%" align="center"><strong>
                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShiFouBiXu2 %>"></asp:Label></strong></td>
                                        <td width="15%" align="center"><strong>
                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShuGuiShuBuXu %>"></asp:Label></strong></td>
                                        <td width="15%" align="center"><strong>
                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieShuYaoQiuTongGuo %>"></asp:Label></strong></td>
                                    </tr>
                                </table>
                            </td>
                            <td width="6" align="right">
                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                        </tr>
                    </table>
                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Height="1px"
                        ShowHeader="False"
                        PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                        <Columns>
                          
                            <asp:HyperLinkColumn DataNavigateUrlField="identifystring" DataNavigateUrlFormatString="TTWorkFlowDesignerJS.aspx?identifystring={0}"
                                DataTextField="RelatedWFTemName" HeaderText="模板名称" Target="_blank">
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                            </asp:HyperLinkColumn>
                            <asp:BoundColumn DataField="Requisite" HeaderText="是否必须">
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="BelongStepSortNumber" HeaderText="结束归属步骤">
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                            </asp:BoundColumn>
                            <asp:BoundColumn DataField="BelongIsMustPassed" HeaderText="结束要求通过">
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                            </asp:BoundColumn>
                        </Columns>
                        <EditItemStyle BackColor="#2461BF" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <ItemStyle CssClass="itemStyle" />
                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    </asp:DataGrid>
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
