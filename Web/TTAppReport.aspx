<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppReport.aspx.cs" Inherits="TTAppReport" %>


<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Import Namespace="System.Globalization" %>
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



        });

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
                                        <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">

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
                        <td style="text-align: left;">

                            <table border="0" style="width: 100%; padding-top: 3px;">
                                <tr>
                                    <td align="left" style="width: 100%;">
                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            PageSize="15" ShowHeader="False" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                            OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" Font-Bold="False"
                                            Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="报表文件">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ReportName" CommandName="Open" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ReportName") %>'
                                                            CssClass="inpuLongest" Width="99%" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                                </asp:TemplateColumn>
                                                <%--<asp:HyperLinkColumn DataNavigateUrlField="ReportURL" DataNavigateUrlFormatString="{0}"
                                                     DataTextField="ReportName" HeaderText="报表文件" Target="_blank">
                                                     <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                 </asp:HyperLinkColumn>--%>
                                                <%--<asp:BoundColumn DataField="TemName" HeaderText="模板">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="CreatorName" HeaderText="上传者" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:HyperLinkColumn>
                                                <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                </asp:BoundColumn>--%>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                            <br />
                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YiYueBaoBiao%>"></asp:Label>：
                            <br />

                            <table border="0" style="width: 100%; padding-top: 3px;">
                                <tr>
                                    <td align="left" style="width: 100%;">
                                        <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            PageSize="15" ShowHeader="False" Height="1px" OnItemCommand="DataGrid2_ItemCommand"
                                            OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" Font-Bold="False"
                                            Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="序号" Visible="false">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="报表文件">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ReportName" CommandName="Open" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ReportName") %>'
                                                            CssClass="inpuLongest" Width="99%" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                                </asp:TemplateColumn>
                                                <%--<asp:HyperLinkColumn DataNavigateUrlField="ReportURL" DataNavigateUrlFormatString="{0}"
                               DataTextField="ReportName" HeaderText="报表文件" Target="_blank">
                               <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                           </asp:HyperLinkColumn>--%>
                                                <%--<asp:BoundColumn DataField="TemName" HeaderText="模板">
                              <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                          </asp:BoundColumn>
                          <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                              DataTextField="CreatorName" HeaderText="上传者" Target="_blank">
                              <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                          </asp:HyperLinkColumn>
                          <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                              <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                          </asp:BoundColumn>--%>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>


                            <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                            <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
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
