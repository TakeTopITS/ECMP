<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppUserLogonLog.aspx.cs" Inherits="TTAppUserLogonLog" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <link id="flxappCss" href="css/flxapp.css" rel="stylesheet" type="text/css" />


    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }

        table {
            table-layout: fixed;
        }

        td {
            word-break: break-all;
            word-wrap: break-word;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

                                                <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td width="80px" align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>

                                                        <td align="right" style="padding-top: 5px;">
                                                            <asp:Label ID="LB_QueryScope" runat="server"></asp:Label>
                                                        </td>
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
                            <td style="padding-top: 3px;">
                                <%-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                    <tr>
                                        <td width="7">
                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                        <td>
                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                <tr>
                                                    <td width="20%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="25%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YongHu%>"></asp:Label></strong>
                                                    </td>

                                                    <td width="28%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,WeiZhi%>"></asp:Label></strong>
                                                    </td>
                                                    <td align="center">
                                                        <strong>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>--%>
                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                    Height="25px" Width="100%"
                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>


                                        <asp:TemplateColumn HeaderText="">

                                            <ItemTemplate>

                                                <div class="npb npbs">
                                                    <div class="nplef">
                                                        <img src="ImagesSkin/napicon.png" />
                                                    </div>
                                                    <div class="nprig">
                                                        <h4> <%# Eval("ID").ToString() %> <%# Eval("UserName") %>    </h4>
                                                        <h5><%# Eval("Position") %>   <sub></sub></h5>
                                                        <h6>Start：<%# DataBinder.Eval(Container.DataItem,"LoginTime") %></h6>
                                                        <h6>End：<%# DataBinder.Eval(Container.DataItem,"LastestTime") %></h6>
                                                    </div>

                                                </div>


                                            </ItemTemplate>

                                        </asp:TemplateColumn>


                                        <%--                                        <asp:BoundColumn DataField="ID" HeaderText="编号">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="UserName" HeaderText="用户">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="Position" HeaderText="位置">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="28%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="LoginTime" HeaderText="登录时间">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                        </asp:BoundColumn>--%>
                                    </Columns>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                    <ItemStyle CssClass="itemStyle" />
                                </asp:DataGrid>
                            </td>
                        </tr>
                        <tr style="display: none;">
                            <td>
                                <asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                <asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                <asp:Label ID="LB_Sql" runat="server"></asp:Label>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
