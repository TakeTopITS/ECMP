<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectExpenseReport.aspx.cs"
    Inherits="TTProjectExpenseReport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }
    </script>
</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                            </td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuFeiYong%>"></asp:Label>
                                            </td>
                                            <td width="5">
                                                <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="LB_ProjectID" runat="server" T Visible="False"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td width="200px" style="border-right: solid 1px #D8D8D8; text-align: left;" valign="top">
                                    <asp:Button ID="BT_AllMember" runat="server" Width="220px" OnClick="BT_AllMember_Click"
                                        Text="<%$ Resources:lang,SuoYouXiangMuFeiYong%>" />
                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                    <br />
                                </td>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="98%">
                                        <tr>
                                            <td align="center" style="padding: 0px 5px 0px 5px; font-weight: bold; height: 24px; color: #394f66;">
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="background: #f0f0f0; text-align: left; width: 65%; height: 25px;">
                                                            <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                ID="LB_QueryScope" runat="server"></asp:Label>
                                                        </td>
                                                        <td style="background: #f0f0f0; text-align: right; width: 35%; height: 25px;">

                                                            <a href="#" onclick="preview1()">
                                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                            </a>

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdTopLine" align="center">
                                                <!--startprint1-->
                                                <table style="width: 980px;">
                                                    <tr>
                                                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                            <br />
                                                            <strong>
                                                                <asp:Label ID="LB_ReportName" runat="server"></asp:Label>
                                                            </strong>
                                                            <br />
                                                            <br />
                                                            <br />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="center">

                                                             <iframe runat="server" id="IFrame_Chart1" src="TTTakeTopAnalystChartSet.aspx" style="width: 800px; height: 295px; border: 1px solid white; overflow: hidden;"></iframe>


                                                            <%--<asp:Chart ID="Chart1" runat="server" Width="800px">
                                                                <Series>
                                                                    <asp:Series ChartType="Column" Label="#VAL" Name="Series1">
                                                                    </asp:Series>
                                                                    <asp:Series ChartType="Column" Label="#VAL" Name="Series2">
                                                                    </asp:Series>
                                                                </Series>
                                                                <ChartAreas>
                                                                    <asp:ChartArea AlignmentOrientation="Horizontal" Name="ChartArea1">
                                                                    </asp:ChartArea>
                                                                </ChartAreas>
                                                                <Titles>
                                                                    <asp:Title Alignment="TopCenter" DockedToChartArea="ChartArea1" IsDockedInsideChartArea="false" Name="标题">
                                                                    </asp:Title>
                                                                </Titles>
                                                            </asp:Chart>--%>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center; padding: 5px 5px 5px 5px;">
                                                            <table width="90%">
                                                                <tr>

                                                                    <td>
                                                                        <asp:Label ID="Label20" runat="server" BackColor="#87CEFA" ForeColor="White" Text="<%$ Resources:lang,XiangMuZongYuSuan%>"></asp:Label>:
                                                                    <asp:Label ID="LB_ProBudget" runat="server"></asp:Label>
                                                                        &nbsp;

                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FeiYongHuiZong%>"></asp:Label>:
                                                                        <asp:Label ID="LB_Member" runat="server"></asp:Label>
                                                                        &nbsp;

                                                                                    <asp:Label ID="Label19" runat="server" BackColor="#FF7F50" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label>:<asp:Label ID="LB_ConfirmAmount" runat="server"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <br />
                                                <table width="100%">

                                                    <tr>
                                                        <td>
                                                            <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <HeaderTemplate>
                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>

                                                                                        <td width="15%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZeRenRen%>"></asp:Label></strong>
                                                                                        </td>

                                                                                        <td width="15%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label></strong>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <table style="width: 100%" cellpadding="4" cellspacing="0">
                                                                        <tr>

                                                                            <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                            </td>

                                                                            <td style="width: 15%; text-align: center" class="tdRight">
                                                                                <%#DataBinder .Eval (Container .DataItem ,"AccountAmount") %>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </ItemTemplate>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />
                                                            </asp:DataList>
                                                            <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                <tr>
                                                                    <td colspan="11" class="tdTopLine">
                                                                        <asp:Label
                                                                            ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>

                                                <!--endprint1-->
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
