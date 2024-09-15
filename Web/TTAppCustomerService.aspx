<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCustomerService.aspx.cs" Inherits="TTAppCustomerService" %>


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

        .auto-style1 {
            height: 26px;
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


            setTrClickLink("DataGrid5");
            setTrClickLink("DataGrid1");
            setTrClickLink("DataGrid3");
            setTrClickLink("DataGrid2");
            setTrClickLink("DataGrid4");

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

                <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <a href="TakeTopAPPMain.aspx" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                            <table width="145" border="0" align="left" cellpadding="0" cellspacing="0">
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
                                    <td></td>
                                    <td align="right" style="padding-top: 5px; padding-right: 8px;">
                                        <asp:Button ID="BT_MakeQuestion" runat="server" CssClass="inpuLong"
                                            Text="<%$ Resources:lang,RecordRequirement%>" OnClick="BT_MakeQuestion_Click"  />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding: 2px 2px 2px 2px;">

                            <table style="width: 100%; height: 1px">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChongDianFuWuXuQiuHuoShangJi%>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <%--    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                            </td>

                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>" /></strong>
                                                            </td>

                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,Company%>" /></strong>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>--%>
                                        <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid5_PageIndexChanged"
                                            PageSize="6" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>

                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>


                                                        <div class="npb npbs">
                                                            <div class="nplef">
                                                                <img src="ImagesSkin/napicon.png" />
                                                            </div>
                                                            <div class="nprig">
                                                                <h4><a href="TTAppCustomerQuestionHandleDetail.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"> <%# DataBinder.Eval(Container.DataItem,"ID") %>  <%# DataBinder.Eval(Container.DataItem,"Question") %></a></h4>
                                                                <h5><%# DataBinder.Eval(Container.DataItem,"Company") %>    <sub></sub></h5>
                                                                <h6><%# DataBinder.Eval(Container.DataItem,"summittime") %></h6>
                                                             <%--   <label></label>--%>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>


                                                <%--    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAppCustomerQuestionHandleDetail.aspx?ID={0}"
                                                    DataTextField="Question" HeaderText="服务需求">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>

                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Lbel1" runat="server" Text="<%$ Resources:lang,DaiChuLiDe%>" />：
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <%--   <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ID%>" /></strong>
                                                            </td>

                                                            <td align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>" /></strong>
                                                            </td>

                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,Company%>" /></strong>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>--%>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                            PageSize="6" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>

                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>


                                                        <div class="npb npbs">
                                                            <div class="nplef">
                                                                <img src="ImagesSkin/napicon.png" />
                                                            </div>
                                                            <div class="nprig">
                                                                <h4><a href="TTAppCustomerQuestionHandleDetail.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"ID") %>  <%# DataBinder.Eval(Container.DataItem,"Question") %></a></h4>
                                                                <h5><%# DataBinder.Eval(Container.DataItem,"Company") %>    <sub></sub></h5>
                                                                <h6><%# DataBinder.Eval(Container.DataItem,"summittime") %></h6>
                                                                <%--   <label></label>--%>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>



                                                <%--                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAppCustomerQuestionHandleDetail.aspx?ID={0}"
                                                    DataTextField="Question" HeaderText="服务需求">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChuLiZhongDe%>" />：
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <%-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ID%>" /></strong></strong>
                                                            </td>

                                                            <td align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>" /></strong></strong>
                                                            </td>

                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Company%>" /></strong>
                                                            </td>

                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>--%>
                                        <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="6" Width="100%"
                                            ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>

                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>


                                                        <div class="npb npbs">
                                                            <div class="nplef">
                                                                <img src="ImagesSkin/napicon.png" />
                                                            </div>
                                                            <div class="nprig">
                                                                <h4><a href="TTAppCustomerQuestionHandleDetail.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"ID") %>  <%# DataBinder.Eval(Container.DataItem,"Question") %></a></h4>
                                                                <h5><%# DataBinder.Eval(Container.DataItem,"Company") %>    <sub></sub></h5>
                                                                <h6><%# DataBinder.Eval(Container.DataItem,"summittime") %></h6>
                                                                <%--   <label></label>--%>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>


                                                <%--     <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAppCustomerQuestionHandleDetail.aspx?ID={0}"
                                                    DataTextField="Question" HeaderText="服务需求">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>

                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YiChuLiDe%>" />：
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <%--  <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ID%>" /></strong></strong>
                                                            </td>

                                                            <td align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>" /></strong></strong>
                                                            </td>

                                                            <td width="25%" align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Company%>" /></strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>--%>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                            PageSize="6" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>


                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>


                                                        <div class="npb npbs">
                                                            <div class="nplef">
                                                                <img src="ImagesSkin/napicon.png" />
                                                            </div>
                                                            <div class="nprig">
                                                                <h4><a href="TTAppCustomerQuestionHandleDetail.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"ID") %>  <%# DataBinder.Eval(Container.DataItem,"Question") %></a></h4>
                                                                <h5><%# DataBinder.Eval(Container.DataItem,"Company") %>    <sub></sub></h5>
                                                                <h6><%# DataBinder.Eval(Container.DataItem,"summittime") %></h6>
                                                                <%--   <label></label>--%>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>



                                                <%--         <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAppCustomerQuestionHandleDetail.aspx?ID={0}"
                                                    DataTextField="Question" HeaderText="服务需求">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuangJianDe%>" />:
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 100%;">
                                        <%--  <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="15%" align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ID%>" /></strong></strong>
                                                            </td>

                                                            <td align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FuWuXuQiu%>" /></strong></strong>
                                                            </td>

                                                            <td width="25%" align="center">
                                                                <strong><strong>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Company%>" /></strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>--%>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="6" Width="100%"
                                            ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>

                                                <asp:TemplateColumn HeaderText="">
                                                    <ItemTemplate>


                                                        <div class="npb npbs">
                                                            <div class="nplef">
                                                                <img src="ImagesSkin/napicon.png" />
                                                            </div>
                                                            <div class="nprig">
                                                                <h4><a href="TTAppCustomerQuestionHandleDetail.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>"><%# DataBinder.Eval(Container.DataItem,"ID") %>  <%# DataBinder.Eval(Container.DataItem,"Question") %></a></h4>
                                                                <h5><%# DataBinder.Eval(Container.DataItem,"Company") %>    <sub></sub></h5>
                                                                <h6><%# DataBinder.Eval(Container.DataItem,"summittime") %></h6>
                                                                <%--   <label></label>--%>
                                                            </div>


                                                        </div>
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>






                                                <%--                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTAppCustomerQuestionHandleDetail.aspx?ID={0}"
                                                    DataTextField="Question" HeaderText="服务需求">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Company" HeaderText="公司">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="25%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                        <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
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
