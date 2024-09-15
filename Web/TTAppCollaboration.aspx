<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCollaboration.aspx.cs" Inherits="TTAppCollaboration" %>



<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

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

            setTrClickLink("DataGrid2");
            setTrClickLink("DataGrid1");
            setTrClickLink("DataGrid3");
            setTrClickLink("DataGrid4");
        }
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
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                        <td align="right" style="padding-top: 5px;">
                                            <asp:Button ID="BT_MakeCollaboration" CssClass="inpuLong" runat="server" Text="<%$ Resources:lang,MakeCollaboration%>" OnClick="BT_MakeCollaboration_Click" Visible="false"/>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>

                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td>

                                            <div class="napbox">
                                                <div class="npb">
                                                    <div class="cline"></div>
                                                    <h3>
                                                        <asp:Label ID="Lbel1" runat="server" Text="<%$ Resources:lang,DaiChuLiDe%>" /></h3>
                                                </div>

                                                <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="5" Width="100%" ShowHeader="false"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />


                                                    <Columns>

                                                        <asp:TemplateColumn HeaderText="">

                                                            <ItemTemplate>

                                                               <div class="npb npbs">
                                                                    <div class="nplef">
                                                                        <img src="ImagesSkin/napicon.png" /></div>
                                                                    <div class="nprig">
                                                                        <h4><a href="TTAppCollaborationDetailMain.aspx?CoID=<%# Eval("CoID").ToString() %>"><%# Eval("CoID").ToString() %>  <%# Eval("CollaborationName") %></a></h4>
                                                                        <h5><%# Eval("CreatorName") %>  <sub></sub></h5>
                                                                        <h6><%# DataBinder.Eval(Container.DataItem,"createtime") %></h6>
                                                                        <%--    <label></label>--%>
                                                                    </div>

                                                                </div>


                                                            </ItemTemplate>

                                                        </asp:TemplateColumn>

                                                    </Columns>


                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
                                            </div>

                                        </td>
                                    </tr>

                                    <tr>
                                        <td>

                                            <div class="napbox">
                                                <div class="npb">
                                                    <div class="cline"></div>
                                                    <h3>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CanYiDe%>" /></h3>
                                                </div>


                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" Width="100%"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>

                                                        <asp:TemplateColumn HeaderText="">

                                                            <ItemTemplate>

                                                                <div class="npb npbs">
                                                                    <div class="nplef">
                                                                        <img src="ImagesSkin/napicon.png" /></div>
                                                                    <div class="nprig">
                                                                        <h4><a href="TTAppCollaborationDetailMain.aspx?CoID=<%# Eval("CoID").ToString() %>"><%# Eval("CoID").ToString() %>  <%# Eval("CollaborationName") %></a></h4>
                                                                        <h5><%# Eval("CreatorName") %>  <sub></sub></h5>
                                                                        <h6><%# DataBinder.Eval(Container.DataItem,"createtime") %></h6>
                                                                        <%--    <label></label>--%>
                                                                    </div>

                                                                </div>


                                                            </ItemTemplate>

                                                        </asp:TemplateColumn>

                                                    </Columns>

                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                            </div>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td>


                                            <div class="napbox">
                                                <div class="npb">
                                                    <div class="cline"></div>
                                                    <h3>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChuangJianDe%>" /></h3>
                                                </div>


                                                <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                    Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged" PageSize="5" Width="100%" ShowHeader="false"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                    <Columns>

                                                        <asp:TemplateColumn HeaderText="">

                                                            <ItemTemplate>

                                                                <div class="npb npbs">
                                                                    <div class="nplef">
                                                                        <img src="ImagesSkin/napicon.png" /></div>
                                                                    <div class="nprig">
                                                                        <h4><a href="TTAppCollaborationDetailMain.aspx?CoID=<%# Eval("CoID").ToString() %>"><%# Eval("CoID").ToString() %>  <%# Eval("CollaborationName") %></a></h4>
                                                                        <h5><%# Eval("CreatorName") %>  <sub></sub></h5>
                                                                        <h6><%# DataBinder.Eval(Container.DataItem,"createtime") %></h6>
                                                                        <%--    <label></label>--%>
                                                                    </div>

                                                                </div>


                                                            </ItemTemplate>

                                                        </asp:TemplateColumn>

                                                    </Columns>

                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                            </div>

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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
