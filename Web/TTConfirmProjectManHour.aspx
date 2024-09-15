<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConfirmProjectManHour.aspx.cs"
    Inherits="TTConfirmProjectManHour" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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
                                        <td width="200" align="left">
                                            <table width="195" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="LB_tiConfirmManhour" runat="server" Text="<%$ Resources:lang,ConfirmManhour%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="left" style="padding-left: 20px; font-weight: bold; height: 24px; color: #FFFFFF;">
                                            <table style="width: 100%;">
                                                <tr>
                                                    <td style="text-align: left; width: 65%; height: 25px;" colspan="2">
                                                        <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                            ID="LB_QueryScope" runat="server" ></asp:Label>
                                                    </td>
                                                    <td style="text-align: right; width: 35%; height: 25px;" colspan="2">
                                                        <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                            Text="<%$ Resources:lang,AllWorkSummary%>" />
                                                        &nbsp;</td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top; text-align: left;">
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
                                            <table cellpadding="0" cellspacing="0" width="95%" style="margin-top: 5px">

                                                <tr>
                                                    <td style="width: 100%; text-align: left; padding-top: 5px">
                                                        <table cellpadding="4" cellspacing="4" width="100%">
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_tbManpowerSummary" runat="server" Text="<%$ Resources:lang,ManpowerSummary%>"></asp:Label>:
                                                                            <asp:Label ID="LB_Member2" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbManHour" runat="server" Text="<%$ Resources:lang,ManHour%>"></asp:Label>:
                                                                            <asp:Label ID="LB_ManHour" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbConfirmManHour" runat="server" Text="<%$ Resources:lang,ConfirmManHour%>"></asp:Label>:<asp:Label ID="LB_ConfirmManHour" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td>(<asp:Label ID="LB_tbManHourBudget" runat="server" Text="<%$ Resources:lang,ManHourBudget%>"></asp:Label>:
                                                                            <asp:Label ID="LB_ProManHour" runat="server" Font-Bold="True"></asp:Label>)
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_tbExpenseSummary" runat="server" Text="<%$ Resources:lang,ExpenseSummary%>"></asp:Label>:
                                                                            <asp:Label ID="LB_Member1" runat="server"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbIncomeSummary" runat="server" Text="<%$ Resources:lang,IncomeSummary%>"></asp:Label>:<asp:Label ID="LB_Income" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbConfirmIncome" runat="server" Text="<%$ Resources:lang,ConfirmIncome%>"></asp:Label>:<asp:Label ID="LB_ConfirmIncome" runat="server" Font-Bold="True"></asp:Label>
                                                                </td>
                                                                <td>
                                                                    <asp:Label ID="LB_tbExpense" runat="server" Text="<%$ Resources:lang,Expense%>"></asp:Label>:&nbsp;<asp:Label ID="LB_Amount" runat="server" Font-Bold="True"></asp:Label>(
                                                                                <asp:Label ID="LB_tbExpenseBudget" runat="server" Text="<%$ Resources:lang,ExpenseBudget%>"></asp:Label>:<asp:Label
                                                                                    ID="LB_ProExpense" runat="server" Font-Bold="True"></asp:Label>)
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                            <tr>
                                                                <td style="padding: 5px 5px 0px 5px;">
                                                                    <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand"
                                                                        DataKeyField="WorkID" CellPadding="0" ForeColor="#333333">
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
                                                                                                <td width="6%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgWorkID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgWorkDate" runat="server" Text="<%$ Resources:lang,WorkDate%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="20%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgProject" runat="server" Text="<%$ Resources:lang,Project%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgManhour" runat="server" Text="<%$ Resources:lang,ManHour%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="16%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgConfirmManHour" runat="server" Text="<%$ Resources:lang,ConfirmManHour%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgIncome" runat="server" Text="<%$ Resources:lang,Income%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgConfirmIncome" runat="server" Text="<%$ Resources:lang,ConfirmIncome%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgExpense" runat="server" Text="<%$ Resources:lang,Expense%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="LB_dgProgress" runat="server" Text="<%$ Resources:lang,Progress%>"></asp:Label></strong>
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
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <ItemTemplate>
                                                                            <table cellpadding="0" cellspacing="0" style="width: 100%">
                                                                                <tr>
                                                                                    <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"WorkID") %>
                                                                                    </td>
                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"WorkDate","{0:yyyy/MM/dd}") %>
                                                                                    </td>
                                                                                    <td style="width: 20%; text-align: left; padding-left: 5px;" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ProjectName") %>
                                                                                    </td>
                                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ManHour") %>
                                                                                    </td>
                                                                                    <td style="width: 16%; text-align: center" class="tdLeft">

                                                                                        <asp:TextBox ID="TB_ConfirmManHour" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ConfirmManHour") %>'
                                                                                            Width="50px"></asp:TextBox>

                                                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" CommandName="Update" />
                                                                                    </td>
                                                                                    <td style="width: 8%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder.Eval(Container.DataItem, "DailySalary", "{0:N2}")%>
                                                                                    </td>

                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ConfirmDailySalary","{0:N2}") %>
                                                                                    </td>
                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"Charge") %>
                                                                                    </td>
                                                                                    <td style="width: 10%; text-align: center" class="tdRight">
                                                                                        <%#DataBinder .Eval (Container .DataItem ,"FinishPercent")%> %
                                                                                    </td>
                                                                                </tr>
                                                                                <tr>
                                                                                    <td style="text-align: center;" class="tdLeft">
                                                                                        <span style="font-size: 10pt">
                                                                                            <asp:Label ID="LB_tbDailySummary" runat="server" Text="<%$ Resources:lang,DailySummary%>"></asp:Label></span>
                                                                                    </td>
                                                                                    <td colspan="5" style="text-align: left;" class="tdLeft">
                                                                                        <span style="font-size: 9pt">&nbsp;<%#DataBinder .Eval (Container .DataItem ,"DailySummary") %></span></td>

                                                                                    <td style="text-align: center; vertical-align: middle;" class="tdLeft">
                                                                                        <span style="font-size: 10pt;">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                        </span>
                                                                                    </td>
                                                                                    <td colspan="2" style="text-align: center; vertical-align: middle" class="tdRight">
                                                                                        <a href='TTDailyWorkTaskView.aspx?ProjectID=<%#DataBinder.Eval(Container.DataItem, "ProjectID")%>&UserCode=<%#DataBinder.Eval(Container.DataItem, "UserCode")%>&WorkDate=<%#DataBinder.Eval(Container.DataItem, "WorkDate")%>'
                                                                                            target="_Blank">
                                                                                            <asp:Label ID="LB_tbDailyTask" runat="server" Text="<%$ Resources:lang,DailyTask%>"></asp:Label></a>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemStyle" />
                                                                    </asp:DataList>
                                                                    <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                                                        <tr>
                                                                            <td colspan="11" class="tdTopLine">&nbsp;
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
