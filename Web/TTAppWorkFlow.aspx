<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppWorkFlow.aspx.cs" Inherits="TTAppWorkFlow" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
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
        .ToolBarLeftRight {
            position: fixed !important;
            top: 200px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            background-color: white;
            width: 25px;
            height: 30px;
        }

        .ToolBarReflash {
            position: fixed !important;
            top: 250px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            background-color: white;
            width: 25px;
            height: 30px;
        }

        .ToolBarUpDown {
            position: fixed !important;
            top: 300px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            background-color: white;
            width: 25px;
            height: 30px;
        }
    </style>

    <script type="text/javascript">
        var preFrameW = '500,*';
        var FrameHide = 0;
        var preDivW = '150px';

        var i = 500;
        var j = 30;

        var decreaseTimer;
        var creaseTimer;

        var way;

        function ChangeMenu(way) {

            var fcol = window.parent.document.getElementById("bodyFrame").cols;
            var divWidth = window.document.getElementById("DivID").style.width;

            //alert(divWidth);

            clearInterval(decreaseTimer);
            clearInterval(creaseTimer);

            if (FrameHide == 0) {
                preFrameW = window.parent.document.getElementById("bodyFrame").cols;

                if (preFrameW != '30,*') {

                    window.parent.document.getElementById("bodyFrame").cols = '30,*';

                    //decreaseTimer = setInterval(decreaseLeftWidth, 1);
                    i = 500;

                    FrameHide = 1;
                    //return;
                }
                else {

                    window.parent.document.getElementById("bodyFrame").cols = '500,*';

                    FrameHide = 1;
                    //return;
                }

                preDivW = window.document.getElementById("DivID").style.width;
                if (preDivW != '150px') {
                    window.document.getElementById("DivID").style.width = '150px';
                    FrameHide = 1;
                }
                else {
                    window.document.getElementById("DivID").style.width = '30px';
                    FrameHide = 1;
                }

            } else {

                window.parent.document.getElementById("bodyFrame").cols = preFrameW;
                window.document.getElementById("DivID").style.width = preDivW;

                //creaseTimer = setInterval(creaseLeftWidth, 1);
                j = 30;

                FrameHide = 0;
                return;
            }
        }

        function decreaseLeftWidth() {
            i = i - 10;
            if (i >= 30) {
                window.parent.document.getElementById("bodyFrame").cols = i.toString() + ",*";
            }
        }
        function creaseLeftWidth() {
            j = j + 10;
            if (j <= 500) {
                window.parent.document.getElementById("bodyFrame").cols = j.toString() + ",*";
            }
        }

        function clickUpDownArrow() {

            self.parent.frames["rightFrame"].frames["upFrame"].document.getElementById("alinkUpDown").click();

        }


    </script>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {



            SetDataGridTrClickLink();

        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {

            setTrClickLinkSpec("TabContainer2_TabPanel3_DataGrid1");
            setTrClickLinkSpec("TabContainer1_TabPanel2_DataGrid5");
            setTrClickLinkSpec("TabContainer1_TabPanel1_DataGrid4");
            setTrClickLinkSpec("DataGrid3");
            setTrClickLinkSpec("TabContainer2_TabPanel4_DataGrid6");
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" class="napbac" runat="server">
            <ContentTemplate>


                <div id="DivID" style="width: 100%; overflow: auto;">

                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td colspan="2" height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <a href="TakeTopAPPMain.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';" target="_top">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" />
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                        </td>
                                                    </tr>
                                                </table>

                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td>
                                                        <div class="napbox">
                                                            <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td style="width: 100%; height: 1px;" align="left">


                                                                        <asp:Label ID="LB_Reflash" runat="server" Text="<%$ Resources:lang,DaiChuLide %>" />

                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            ShowHeader="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                            OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="5" Width="100%">

                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                                    <ItemStyle CssClass="" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="要审核的工作">
                                                                                    <ItemTemplate>

                                                                                        <div class="npb">
                                                                                            <div class="cline"></div>


                                                                                            <div class="nprig wfinfo">
                                                                                                <a href='TTAppWorkFlowDetailMain.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="rightFrame">
                                                                                                    <h4><%# DataBinder.Eval(Container.DataItem,"WorkDetail") %></h4>
                                                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"WLName") %></h5>
                                                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"CreatorName") %></h6>
                                                                                                    <sub class="yesno">必需:<%# DataBinder.Eval(Container.DataItem,"Requisite") %></sub><label><%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %></label></a></div>
                                                                                        </div>


                                                                                    </ItemTemplate>


                                                                                </asp:TemplateColumn>


                                                                            </Columns>

                                                                            <EditItemStyle BackColor="#2461BF" />

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />


                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>

                                                                        <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>


                                                                    </td>
                                                                </tr>

                                                                <tr>
                                                                    <td align="left">


                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YiChuLiDe %>" />

                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            ShowHeader="False" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                            PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="要审核的工作">
                                                                                    <ItemTemplate>



                                                                                        <div class="npb">
                                                                                            <div class="cline"></div>


                                                                                            <div class="nprig wfinfo">
                                                                                                <a href='TTAppWorkFlowDetailMain.aspx?ID=<%# DataBinder.Eval(Container.DataItem,"ID") %>' target="rightFrame">
                                                                                                    <h4><%# DataBinder.Eval(Container.DataItem,"WorkDetail") %></h4>
                                                                                                    <h5><%# DataBinder.Eval(Container.DataItem,"WLName") %></h5>
                                                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"CreatorName") %></h6>
                                                                                                    <sub class="yesno">必需:<%# DataBinder.Eval(Container.DataItem,"Requisite") %></sub><label><%# ShareClass.GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %></label></a></div>
                                                                                        </div>


                                                                                    </ItemTemplate>

                                                                                </asp:TemplateColumn>

                                                                            </Columns>
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid><asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="width: 100%; height: 1px;" align="left">
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ChuangJianDe %>" />

                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid3_PageIndexChanged"
                                                                            PageSize="5" Width="100%" CellPadding="0" GridLines="None">
                                                                            <HeaderStyle HorizontalAlign="Center" />
                                                                            <Columns>
                                                                                <asp:TemplateColumn></asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号" Visible="false"></asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="要审核的工作">
                                                                                    <ItemTemplate>

                                                                                        <div class="npb">
                                                                                            <div class="cline"></div>
                                                                                            <div class="nprig wfinfo">
                                                                                                <h5>
                                                                                                    <asp:ImageButton ID="IMB_Lamp" ImageUrl="~/Images/lamp_yellow.png" runat="server" /></h5>
                                                                                                <h4 onclick="javascript:ChangeMenu(0);"><a href='TTAppMyWorkDetailMain.aspx?WLID=<%# DataBinder.Eval(Container.DataItem,"WLID") %>&RelatedType=Null' target="rightFrame"><%# DataBinder.Eval(Container.DataItem,"WLName")%></a></h4>
                                                                                                <label><%# ShareClass. GetStatusHomeNameByWorkflowStatus(Eval("Status").ToString()) %></label>
                                                                                            </div>
                                                                                        </div>


                                                                                    </ItemTemplate>

                                                                                </asp:TemplateColumn>

                                                                                <%--  <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTAppMyWorkDetailMain.aspx?WLID={0}"
                                                                                DataTextField="WLName" HeaderText="工作流" Target="rightFrame">
                                                                                
                                                                            </asp:HyperLinkColumn>--%>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                    </ItemTemplate>

                                                                                </asp:TemplateColumn>
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
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>

                                                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                            <br />
                                                        </div>
                                                    </td>

                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
