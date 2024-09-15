<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTQueryTime.aspx.cs" Inherits="TTQueryTime" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查询用时检测</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
    <style type="text/css">
        .auto-style1 {
            height: 268px;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaXunYongShiJianCe%>"></asp:Label></td>
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
                                <td align="center" style="padding-top: 5px;" class="auto-style1">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="900px">
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,SQLYuJuSelectYuJu%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" style="height: 30px" colspan="3">
                                                <asp:TextBox ID="TB_SQLCode" runat="server" CssClass="shuru" Height="150px" TextMode="MultiLine" Width="95%"></asp:TextBox>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr style="color: #000000">
                                            <td align="right" class="formItemBgStyle" style="width: 150px; height: 30px">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongShi%>"></asp:Label>：</td>
                                            <td align="left" class="formItemBgStyle" colspan="3" style="height: 30px">
                                                <asp:Label ID="lbl_Time" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="right" class="formItemBgStyle" style="width: 150px;"></td>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Button ID="BT_Check" runat="server" CssClass="inpu" OnClick="BT_Check_Click" Text="<%$ Resources:lang,JianCe%>" />
                                            </td>
                                            <td align="left" class="formItemBgStyle">&nbsp;</td>
                                            <td align="left" class="formItemBgStyle">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="true" Width="100%"
                                        ShowHeader="true" AllowPaging="True" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                        CellPadding="4" ForeColor="#333333" GridLines="None" PageSize="50">


                                        <ItemStyle CssClass="itemStyle" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    <br />
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
