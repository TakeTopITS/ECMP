<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppMembersPosition.aspx.cs" Inherits="TTAppMembersPosition" %>

<!DOCTYPE html>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>

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



            setMapTrClickLink("DataGrid2");

        });

        function setMapTrClickLink(gridId) {
            //阻止事件冒泡
            jQuery("#" + gridId).find("tr:not(.notTab)").find("a").click(function () {
                event.stopPropagation();
            });

            //tr点击跳转
            jQuery("#" + gridId).find("tr:not(.notTab)").find("a").closest("table").closest("tr").click(function () {
                $("#IFR_UserPositionMap").attr("src", $(this).find("a").attr("href"));
            });
        }
    </script>
</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td height="31" class="page_topbj" width="100%">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
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
                        <td valign="top" align="center" width="100%">
                            <div style="width: 100%;">
                                <iframe id="IFR_UserPositionMap" name="IFR_UserPositionMap" src="TTAppUserPositionView.aspx" style="width: 100%; height: 200px;" frameborder="no" border="0" framespacing="0"></iframe>
                            </div>
                            <asp:DropDownList ID="DL_MemberList" DataValueField="UserCode" DataTextField="UserName" runat="server" Style="width: 99%;" AutoPostBack="true" OnSelectedIndexChanged="DL_MemberList_SelectedIndexChanged">
                            </asp:DropDownList>
                            <div id="Div1" style="width: 100%; height: 400px; overflow: auto;">
                                <%--  <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,UserName%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="60%" align="center">
                                                            <strong>
                                                                <asp:Label ID="LB_UserPosition" runat="server" Text="<%$ Resources:lang,Position%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="25%" align="center">
                                                            <strong>
                                                                <asp:Label ID="LB_CreateTime" runat="server" Text="<%$ Resources:lang,Time%>"></asp:Label></strong>
                                                        </td>



                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>--%>
                                <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False" Width="100%"
                                    ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                    PageSize="10" CellPadding="4" ForeColor="#333333" GridLines="None">
                                    <Columns>


                                        <asp:TemplateColumn HeaderText="">

                                            <ItemTemplate>

                                                <div class="npb npbs">
                                                    <div class="nplef">
                                                        <img src="ImagesSkin/napicon.png" /></div>
                                                    <div class="nprig">
                                                        <h4><a target="IFR_UserPositionMap" href="TTAppUserPositionView.aspx?lng=<%# DataBinder.Eval(Container.DataItem,"Longitude").ToString().Trim() %>&lat=<%# DataBinder.Eval(Container.DataItem,"Latitude").ToString().Trim() %>"><%# Eval("Address") %></a></h4>
                                                        <h5><%# Eval("UserName") %><sub></sub></h5>
                                                        <h6><%# DataBinder.Eval(Container.DataItem,"createtime") %></h6>
                                                        <label><%# Eval("MacAddress").ToString() %></label>
                                                    </div>

                                                </div>


                                            </ItemTemplate>

                                        </asp:TemplateColumn>


                                        <%--                                            <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="位置：">
                                                <ItemTemplate>
                                                    <table width="100%">
                                                        <tr>
                                                            <td>
                                                                <a href='TTAppUserPositionView.aspx?lng=<%# DataBinder.Eval(Container.DataItem,"Longitude").ToString().Trim() %>&lat=<%# DataBinder.Eval(Container.DataItem,"Latitude").ToString().Trim() %>'
                                                                    target="IFR_UserPositionMap">
                                                                    <%# DataBinder.Eval(Container.DataItem,"Address")%></a>

                                                            </td>

                                                        </tr>
                                                        <tr>
                                                            <td style="font-size: small; font-style: italic;">Mac: <%# DataBinder.Eval(Container.DataItem,"MacAddress")%>

                                                            </td>

                                                        </tr>

                                                    </table>


                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="60%" />
                                            </asp:TemplateColumn>

                                            <asp:BoundColumn DataField="CreateTime" HeaderText="时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                            </asp:BoundColumn>--%>
                                    </Columns>

                                    <ItemStyle CssClass="itemStyle" />
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <EditItemStyle BackColor="#2461BF" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                </asp:DataGrid>
                            </div>

                        </td>
                    </tr>
                    <tr style="display: none;">
                        <td align="center">
                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LB_PlanID" runat="server" Visible="false"></asp:Label>
                            <asp:Label ID="LB_OperatorCode" runat="server" Visible="False"></asp:Label>

                            <asp:Label ID="LB_OperatorName" runat="server" Visible="False"></asp:Label>


                            <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>

                            <asp:Label ID="LB_DepartName" runat="server" Visible="False"></asp:Label>

                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>

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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
