<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppProject.aspx.cs" Inherits="TTAppProject" %>

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
                        <td align="left">



                            <table width="100%" cellpadding="0" cellspacing="0">

                                <tr style="display:none;">
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
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MyInvolvedProject%>" />
                                                </h3>
                                                <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                            </div>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="false" CellPadding="4" Font-Bold="False" Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False" ForeColor="#333333" GridLines="None" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="npb npbs">
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAppInvolvedProjectDetail.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"PMName") %><sub></sub></h5>
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
                                        <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>"></asp:Label>
                                                                </strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label>
                                                                </strong>
                                                            </td>

                                                            <%-- 2013-11-28 LiuJianping--%>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_Status" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table> -->
                                        <div class="napbox">
                                            <div class="npb">
                                                <div class="cline">
                                                </div>
                                                <h3>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,MyUnderTakeProject%>" />
                                                </h3>
                                                <asp:Label ID="LB_Sql1" runat="server" Visible="false"></asp:Label>
                                                </asp:label>
                                            </div>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" ItemDataBound="DataGrid1_ItemDataBound" OnPageIndexChanged="DataGrid1_PageIndexChanged" ShowHeader="false" Width="100%">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>
                                                            <div class="npb npbs">
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAppProjectDetail.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"PMName") %><sub></sub></h5>
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
                                <tr>
                                    <td>
                                        <!-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7"><img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ProjectID%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ProjectName%>"></asp:Label></strong>
                                                            </td>

                                                            <%-- 2013-11-28 LiuJianping--%>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,Status%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table> -->
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
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href='TTAPPDailyWorkReportForCreator.aspx?ProjectID=<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'><%# DataBinder.Eval(Container.DataItem,"ProjectID") %><%# DataBinder.Eval(Container.DataItem,"ProjectName") %></a></h4>
                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"PMName") %><sub></sub></h5>
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
