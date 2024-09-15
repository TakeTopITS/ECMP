<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPRegularWLList.aspx.cs" Inherits="TTAPPRegularWLList" %>

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


        .ToolBar {
            position: fixed !important;
            top: 0px;
            left: 0px;
            margin: 0 auto;
            position: absolute;
            bottom: expression(offsetParent.scrollBottom+0);
            border: 0px solid #dddddd;
            border-bottom: 1px solid #dddddd;
            /*background-color: ButtonFace;*/
            width: 100%;
            height: 30px;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

            setTrClickLink("DataGrid1");
            setTrClickLink("DataGrid2");

        });

        //点击DATAGRID行内任何一点，都能触发行内的链接
        function setTrClickLink(gridId) {
            //阻止事件冒泡
            jQuery("#" + gridId).find("tr:not(.notTab)").find("a").click(function () {
                event.stopPropagation();
            });

            //tr点击跳转
            jQuery("#" + gridId).find("tr:not(.notTab)").find("a").closest("tr").click(function () {
                ChangeMenu(0);
                $("#Right", parent.document).attr("src", $(this).find("a").attr("href"));
            });
        }
    </script>


    <script type="text/javascript">

        var way;

        function ChangeMenu(way) {

            window.parent.document.getElementById("A_LRArrow").onclick();
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="divToolBar" name="divTooBar" class="ToolBar" style="width: 100%;">
            <table style="width: 100%;">
                <tr>
                    <td class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td style="width: 30%; text-align: left;">
                                    <a href="TakeTopAPPMain.aspx" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';" target="_top">
                                        <table width="100%" border="0" align="left" cellpadding="0" cellspacing="0">
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
                                <td style="width: 40%; text-align: center; padding-top: 5px;" onclick="javascript:ChangeMenu(0);">
                                    <strong>
                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenQingLeiXing%>"></asp:Label></strong>

                                </td>

                                <td style="width: 30%; text-align: left; padding-top: 5px;" onclick="javascript:ChangeMenu(0);">
                                    <asp:Image ID="IMG_LRArrow" ImageUrl="Images/UpDnArrow.png" Width="18px" Height="24px" border="0" alt="隐藏右边栏" runat="server" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>

        <table style="width: 100%;">
            <tr>
                <td style="width: 100%; padding-top: 40px;" class="formItemBgStyle" valign="top" align="left">
                    <%-- <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                        <tr>
                            <td width="7">
                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="100%" align="center">
                                            <strong>
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShenQingLeiXing%>"></asp:Label></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="6" align="right">
                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                            </td>
                        </tr>
                    </table>--%>

                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                        Width="100%" GridLines="None" CellPadding="4"
                        ForeColor="#333333">
                        <Columns>


                            <asp:TemplateColumn HeaderText="">
                                <ItemTemplate>


                                    <div class="npb npbs">
                                        <div class="nplef">
                                            <img src="ImagesSkin/napicon.png" />
                                        </div>
                                        <div class="nprig">
                                            <h4>

                                                <a href="TTAPPDIYWorkFlowForm.aspx?TargetID=<%#DataBinder .Eval (Container .DataItem ,"ID") %>" onclick="javascript:ChangeMenu(0);"
                                                    target="Right">
                                                    <asp:Label ID="LB_TemName" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"HomeName") %>'></asp:Label>
                                                </a>
                                            </h4>

                                        </div>


                                    </div>
                                </ItemTemplate>
                            </asp:TemplateColumn>

<%--                            <asp:TemplateColumn HeaderText="">
                                <ItemTemplate>
                                    <a href="TTAPPDIYWorkFlowForm.aspx?TargetID=<%#DataBinder .Eval (Container .DataItem ,"ID") %>" onclick="javascript:ChangeMenu(0);"
                                        target="Right">
                                        <asp:Label ID="LB_TemName" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"HomeName") %>'></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
                            </asp:TemplateColumn>--%>


                        </Columns>
                        <ItemStyle CssClass="itemStyle" />
                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        <EditItemStyle BackColor="#2461BF" />
                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                    </asp:DataGrid>
                    <br />
                    <%--<table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                        <tr>
                            <td width="7">
                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                            </td>
                            <td>
                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tr>
                                        <td width="100%" align="center">
                                            <strong>
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CYLC%>"></asp:Label></strong>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td width="6" align="right">
                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                            </td>
                        </tr>
                    </table>--%>
                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                        Width="100%" GridLines="None" CellPadding="4" ShowHeader="false"
                        ForeColor="#333333">
                        <Columns>

                            <asp:TemplateColumn HeaderText="">
                                <ItemTemplate>


                                    <div class="npb npbs">
                                        <div class="nplef">
                                            <img src="ImagesSkin/napicon.png" />
                                        </div>
                                        <div class="nprig">
                                            <h4>
                                                <a href="<%#DataBinder .Eval (Container .DataItem ,"PageFile") %>?TargetID=<%#DataBinder .Eval (Container .DataItem ,"IdentifyString") %>" onclick="javascript:ChangeMenu(0);"
                                                    target="Right">
                                                    <asp:Label ID="LB_TemName" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"TemName") %>'></asp:Label>
                                                </a>
                                            </h4>

                                        </div>


                                    </div>
                                </ItemTemplate>
                            </asp:TemplateColumn>


                     <%--       <asp:TemplateColumn HeaderText="Resources.lang.ShenQingLeiXing">
                                <ItemTemplate>
                                    <a href="<%#DataBinder .Eval (Container .DataItem ,"PageFile") %>?TargetID=<%#DataBinder .Eval (Container .DataItem ,"IdentifyString") %>" onclick="javascript:ChangeMenu(0);"
                                        target="Right">
                                        <asp:Label ID="LB_TemName" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"TemName") %>'></asp:Label>
                                    </a>
                                </ItemTemplate>
                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="100px" />
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

        <%--        <div id="DivID" style="width: 100%; overflow: auto; padding-top: 27px;">
        </div>--%>
    </form>
</body>
