<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectIncomeAndExpenseReport.aspx.cs"
    Inherits="TTProjectIncomeAndExpenseReport" %>

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
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                     <div id="AboveDiv">
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="LB_tiIncomeExpense" runat="server" Text="<%$ Resources:lang,ShouZhiDuiBi%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                            <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="tdBottom">
                                <table cellpadding="0" cellspacing="0" width="100%">
                                    <tr>
                                        <td width="200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top; text-align: left;">
                                            <asp:TreeView ID="TreeView1" runat="server"
                                                NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True"
                                                Width="220px">
                                                <RootNodeStyle CssClass="rootNode" />
                                                <NodeStyle CssClass="treeNode" />
                                                <LeafNodeStyle CssClass="leafNode" />
                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                            </asp:TreeView>
                                            <br />
                                        </td>
                                        <td style="vertical-align: top; padding: 0px 5px 0px 5px;">
                                            <table cellpadding="0" cellspacing="0" width="100%" style="margin-top: 5px">
                                                <tr>
                                                    <td align="left" class="tdFullBorder" style="padding: 0px 5px 0px 5px; font-weight: bold; height: 24px; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                                        <table style="width: 100%">
                                                            <tr>
                                                                <td style="background: #f0f0f0; text-align: left; width: 50%; height: 25px;" colspan="2">
                                                                    <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label ID="LB_QueryScope" runat="server"></asp:Label>
                                                                </td>
                                                                <td style="background: #f0f0f0; text-align: right; width: 35%; height: 25px;" colspan="2">
                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                                    &nbsp;
                                                                <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                                    <a href="#" onclick="preview1()">
                                                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                                    </a>
                                                                </td>
                                                                <td style="background: #f0f0f0; text-align: right; width: 15%; height: 25px;" colspan="2">
                                                                    <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                                        Text="<%$ Resources:lang,AllIncomeExpense%>" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <!--startprint1-->
                                                        <table style="width: 980px;">
                                                            <tr>
                                                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                                                    <br />
                                                                    <asp:Label ID="LB_ReportName" runat="server" Text="<%$ Resources:lang,ShouZhiBiao%>"></asp:Label>
                                                                    <br />
                                                                </td>
                                                            </tr>

                                                            <tr>
                                                                <td style="text-align: center; width: 980px;">

                                                                    <table cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td colspan="4" style="padding: 5px 5px 5px 5px;">
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td width="7">
                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="LB_dgUserCode" runat="server" Text="<%$ Resources:lang,UserCode%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="50%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="LB_dgUserName" runat="server" Text="<%$ Resources:lang,UserName%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="LB_dgIncome" runat="server" Text="<%$ Resources:lang,Income%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="10%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="LB_dgExpense" runat="server" Text="<%$ Resources:lang,Expense%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="LB_dgBanlance" runat="server" Text="<%$ Resources:lang,Banlance%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td width="6" align="right">
                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                                    </tr>
                                                                                </table>
                                                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="false"
                                                                                    Height="30px" PageSize="8" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                    <ItemStyle CssClass="itemStyle" />
                                                                                    <Columns>
                                                                                        <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UserName" HeaderText="名称">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="50%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="TotalSalary" HeaderText="收入">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="TotalExpense" HeaderText="支出">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="TotalIncome" HeaderText="收入支出差额">
                                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                                        </asp:BoundColumn>
                                                                                    </Columns>
                                                                                </asp:DataGrid>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="4" align ="center"  >
                                                                                <table>
                                                                                    <tr>
                                                                                        <td>
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_tbTotalExpense" runat="server" Text="<%$ Resources:lang,TotalExpense%>"></asp:Label>: </strong>
                                                                                            <asp:Label ID="LB_TotalExpense" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_tbTotalIncome" runat="server" Text="<%$ Resources:lang,TotalIncome%>"></asp:Label>:</strong><asp:Label ID="LB_TotalSalary" runat="server" Font-Bold="False"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_tbTotalBanlance" runat="server" Text="<%$ Resources:lang,TotalBanlance%>"></asp:Label>:</strong><asp:Label ID="LB_TotalIncome" runat="server"></asp:Label>
                                                                                        </td>
                                                                                        <td>
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_tbTotalBudget" runat="server" Text="<%$ Resources:lang,TotalBudget%>"></asp:Label></strong>
                                                                                            <asp:Label ID="LB_ProBudget" runat="server"></asp:Label>
                                                                                        </td>
                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                        </tr>
                                                                    </table>

                                                                    <br />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
