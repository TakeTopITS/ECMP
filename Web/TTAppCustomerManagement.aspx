<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppCustomerManagement.aspx.cs" Inherits="TTAppCustomerManagement" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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

        .ToolBar {
            position: fixed !important;
            bottom: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            top: expression(offsetParent.scrollTop+0);
            border: 1px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            background-color: ButtonFace;
            width: 100%;
            height: 30px;
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

            // SetDataGridTrClickLink();



        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function SetDataGridTrClickLink() {

            setTrClickLink("TabContainer1_TabPanel1_DataGrid1");
            setTrClickLink("TabContainer1_TabPanel2_DataGrid2");
            setTrClickLink("DataGrid3");
            setTrClickLink("DataGrid5");
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
                                        <td height="31" class="page_topbj">
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
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Back%>" />
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                                        </a>
                                                    </td>
                                                    <td align="right" style="padding-top: 5px; padding-right: 8px;">
                                                        <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" Visible="false" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px 5px 5px 5px;">

                                <br />
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                ShowHeader="False" Height="1px" PageSize="25"
                                                OnPageIndexChanged="DataGrid2_PageIndexChanged" Width="100%" CellPadding="4"
                                                ForeColor="#333333" GridLines="None">
                                                <Columns>

                                                    <asp:TemplateColumn HeaderText="">
                                                        <ItemTemplate>


                                                            <div class="npb npbs">
                                                                <div class="nplef">
                                                                    <img src="ImagesSkin/napicon.png" />
                                                                </div>
                                                                <div class="nprig">
                                                                    <h4><a href="TTAPPCustomerInfoView.aspx?CustomerCode=<%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>"><%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>  <%# DataBinder.Eval(Container.DataItem,"CustomerName") %></a></h4>

                                                                    <h5><a href="TTAPPCustomerQuestionHandleDetailFromCustomer.aspx?CustomerCode=<%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>">
                                                                        <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,ZZKeHuFuWu%>"></asp:Label></a><sub></sub></h5>

                                                                    <h6><%# DataBinder.Eval(Container.DataItem,"createdate") %></h6>


                                                                    <%-- <label>   </label>--%>
                                                                </div>
                                                            </div>
                                                        </ItemTemplate>
                                                    </asp:TemplateColumn>


                                                    <%--                                                    <asp:BoundColumn DataField="CustomerCode" HeaderText="代码">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                        DataTextField="CustomerName" HeaderText="客户名称" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                    </asp:HyperLinkColumn>

                                                    <asp:TemplateColumn>
                                                        <ItemTemplate>
                                                            <a href='TTAPPCustomerQuestionHandleDetailFromCustomer.aspx?CustomerCode=<%# Eval("CustomerCode").ToString() %>'>
                                                                <asp:Label ID="LB_KHFW" runat="server" Text="<%$ Resources:lang,ZZKeHuFuWu%>"></asp:Label>
                                                            </a>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>--%>
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

                                <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                <br />

                            </td>
                        </tr>
                    </table>

                    <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%; text-align: left; padding-top: 10px; padding-bottom: 10px; background-color: aliceblue;"
                        onclick="javascript:this.style.height=310;">
                        <table width="100%">
                            <tr>
                                <td colspan="2" style="text-align: right; padding-right: 10px;">
                                      <table width="100%">
                                        <tr>
                                            <td style="width:70%;">
                                              &nbsp;
                                            </td>
                                              <td style="width:20%; text-align:left;">
                                                <img src="ImagesSkin/up.png" />
                                            </td>
                                            <td style="padding-top: 5px; width: 10%; text-align: center;">
                                                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/ImagesSkin/down.png"/>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>

                            <tr>
                                <td align="left" width="50%">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>
                                </td>
                                <td align="left" width="50%">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                </td>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TB_CustCode" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_CustName" runat="server" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TB_IndustryTypeFind" runat="server" Width="99%"></asp:TextBox>
                                        <br />
                                        <asp:DropDownList ID="DL_IndustryTypeFind" runat="server" AutoPostBack="True" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="DL_IndustryTypeFind_SelectedIndexChanged" Width="99%">
                                        </asp:DropDownList>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_ContactPerson" runat="server" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,FenGuanDaiLiShang%>"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TB_AgencyName" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_AreaAddress" runat="server" Width="100%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>
                                    </td>
                                    <td align="left">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:TextBox ID="TB_State" runat="server" Width="99%"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_City" runat="server" Width="100%"></asp:TextBox>
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="padding-top: 10px;">
                                        <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                    </td>
                                </tr>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
