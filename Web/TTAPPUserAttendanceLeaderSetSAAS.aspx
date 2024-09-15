<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPUserAttendanceLeaderSetSAAS.aspx.cs" Inherits="TTAPPUserAttendanceLeaderSetSAAS" %>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            //

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
                  <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                   
                        <tr>
                            <td height="31" class="page_topbj" width="100%">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <a href="TakeTopAPPMain.aspx" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label ID="Label1" runat ="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
                                        </td>

                                    </tr>
                                </table>
                            </td>
                        </tr>

                        <tr>
                            <td valign="top">
                                 <table style="width: 100%; text-align: left;">
                                    <tr>
                                        <td width="80%">
                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ZhuGuanDaiMa%>"></asp:Label>：
                                      
                                            <asp:TextBox ID="TB_LeaderCode" Width="70%" runat="server"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:Button ID="BT_AddLeaderCode" CssClass="inpu" runat="server" Text="<%$ Resources:lang,JiaRu%>" OnClick="BT_AddLeaderCode_Click" />
                                        </td>
                                    </tr>
                                </table>
                                <table style="width: 100%; text-align: left;">
                                    <tr>
                                        <td>
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                              
                                                                <td width="4%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhuGuan%>"></asp:Label></strong>
                                                                </td>
                                                                  <td align="center" width="6%"><strong></strong> </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="false" CellPadding="4" ForeColor="#333333"
                                                GridLines="None" OnItemCommand="DataGrid3_ItemCommand" Width="100%" PageSize="20">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" />
                                                <ItemStyle CssClass="itemStyle" />
                                                <Columns>
                                                     <asp:BoundColumn DataField="ID" HeaderText="ID" Visible ="false" >
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"  />
                                                    </asp:BoundColumn>

                                                     <asp:TemplateColumn HeaderText="ID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            <ItemTemplate>
                                                                  <%# DataBinder.Eval(Container.DataItem,"LeaderName") %>
                                                                <br />
                                                                  <%# DataBinder.Eval(Container.DataItem,"LeaderCode") %>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                    <%--<asp:BoundColumn DataField="LeaderName" HeaderText="主管">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                    </asp:BoundColumn>--%>
                                                      <asp:TemplateColumn HeaderText="ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ID" runat="server" CssClass="inpu"
                                                               Text="<%$ Resources:lang,TuiChu%>"/>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                </Columns>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
