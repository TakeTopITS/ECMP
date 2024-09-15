<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPersonalSpaceProjectSummary.aspx.cs" Inherits="TTPersonalSpaceProjectSummary" %>

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

        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <%--  <script type="text/javascript" src="js/jquery.mobile-1.4.5.min.js"></script>--%>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            //

            SetDataGridTrClickLink();

        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {

            setTrClickLink("DataGrid1");
            setTrClickLink("DataGrid2");
            setTrClickLink("DataGrid3");

            //swiperRightToBack("aHomePage");
        }
    </script>

</head>
<body>

    <form id="form1" class="napf" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" class="napbac" runat="server">
            <ContentTemplate>

                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td align="left">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td>
                                        <table id="TBL_ProjectCode" runat="server" width="100%">
                                            <tr>
                                                <td width="80%" align="right">
                                                    <asp:Label ID="Label9" runat="server" Text="项目码"></asp:Label>：
                                                        <asp:TextBox ID="TB_ProjectCode" runat="server" Width="70%"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_AddProject" CssClass="inpu" runat="server" Text="加入" OnClick="BT_AddProject_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>

                                <tr>
                                    <td>
                                        <div class="napbox">

                                            <div class="npb">
                                                <div class="cline">
                                                </div>
                                                <h3>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,XiangMu%>" />
                                                </h3>
                                            </div>

                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ItemDataBound="DataGrid1_ItemDataBound" OnPageIndexChanged="DataGrid1_PageIndexChanged" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="npb npbs">
                                                              <%--  <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>--%>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAppProjectDetail.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"finishpercent") %>%<sub></sub></h5>
                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"makedate") %></h6>
                                                                    <label>
                                                                        <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                            </asp:DataGrid>

                                            <asp:Label ID="LB_Sql1" runat="server" Visible="false"></asp:Label>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="napbox">
                                            <div class="npb">
                                                <div class="cline">
                                                </div>
                                                <h3>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MyInvolvedProject%>" />
                                                </h3>
                                                <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                            </div>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="false" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="npb npbs">
                                                               <%-- <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>--%>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAppInvolvedProjectDetail.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"finishpercent") %><sub></sub></h5>
                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"makedate") %></h6>
                                                                    <label>
                                                                        <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("ProStatus").ToString(),Eval("ProjectType").ToString()) %>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                            </asp:DataGrid>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <div class="napbox">
                                            <div class="npb">
                                                <div class="cline">
                                                </div>
                                                <h3>
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MyCreatedProject%>" />
                                                </h3>
                                                <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                            </div>
                                            <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="false" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="npb npbs">
                                                             <%--   <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>--%>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAPPDailyWorkReportForCreator.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"finishpercent") %><sub></sub></h5>
                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"makedate") %></h6>
                                                                    <label>
                                                                        <%# ShareClass. GetStatusHomeNameByProjectStatus(Eval("Status").ToString(),Eval("ProjectType").ToString()) %>
                                                                    </label>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                    </asp:TemplateColumn>
                                                </Columns>
                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                            </asp:DataGrid>
                                        </div>
                                    </td>
                                </tr>
                                <tr style="display: none;">
                                    <td style="width: 100%; height: 12px; text-align: left;" valign="top">
                                        <asp:Label ID="LB_Operator" runat="server" Text="<%$ Resources:lang,Operator%>" />
                                        ：<asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>


