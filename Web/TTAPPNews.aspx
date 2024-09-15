<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPNews.aspx.cs" Inherits="TTAPPNews" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Import Namespace="System.Globalization" %>
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

            SetDataGridTrClickLink();

        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {

            setTrClickLink("DataGrid1");
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>

                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td colspan="2" height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                            <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <img src="ImagesSkin/return.png" alt="" />
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
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
                        <td style="text-align: center; padding: 2px 2px 2px 2px;">
                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                PageSize="20" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None"
                                ShowHeader="False">
                                <Columns>




                                    <%--    <asp:BoundColumn DataField="ID" HeaderText="ID" Visible="false">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                    </asp:BoundColumn>--%>


                                    <asp:TemplateColumn HeaderText="">
                                        <ItemTemplate>


                                            <div class="npb npbs">
                                                <div class="nplef">
                                                    <img src="ImagesSkin/napicon.png" />
                                                </div>
                                                <div class="nprig">
                                                    <h4><a href="TTAPPNewsView.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"> <%# DataBinder.Eval(Container.DataItem,"ID") %>    <%# DataBinder.Eval(Container.DataItem,"Title") %></a></h4>
                                                    <h5><%# DataBinder.Eval(Container.DataItem,"Mark") %><sub></sub></h5>
                                                    <h6><%# DataBinder.Eval(Container.DataItem," publishtime") %></h6>


                                                 <%--   <label></label>--%>
                                                </div>


                                            </div>
                                        </ItemTemplate>
                                    </asp:TemplateColumn>



                                    <%--      <asp:BoundColumn DataField="Mark" Visible="false">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                    </asp:BoundColumn>--%>
                                    <%--  <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAPPNewsView.aspx?ID={0}"
                                        DataTextField="Title" HeaderText="新闻" Target="_self">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" />
                                    </asp:HyperLinkColumn>--%>
                                </Columns>

                                <ItemStyle CssClass="itemStyle" />
                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataGrid>
                            <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>

            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                </ProgressTemplate>
            </asp:UpdateProgress>
        </div>
    </form>

</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
