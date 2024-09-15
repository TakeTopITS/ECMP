<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConfirmProjectExpense.aspx.cs"
    Inherits="TTConfirmProjectExpense" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1280px;
            width: expression (document.body.clientWidth <= 1280? "1280px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

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
                    <div id="AboveDiv">
                        <table id="Table1" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" width="100%">
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
                                                                        <asp:Label ID="LB_tiConfirmExpense" runat="server" Text="<%$ Resources:lang,ConfirmExpense%>"></asp:Label>
                                                                    </td>
                                                                    <td width="5">
                                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="tdBottom">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #6d92ad; vertical-align: top; text-align: left;">
                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                            </asp:TreeView>
                                                            <br />
                                                        </td>
                                                        <td style="padding: 5px 5px 5px 5px;" valign="top">
                                                            <table cellpadding="0" cellspacing="0" width="95%">
                                                                <tr>
                                                                    <td align="left" style="font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg');">
                                                                        <table style="width: 100%">
                                                                            <tr>
                                                                                <td style="background: #f0f0f0; text-align: left; height: 25px;">
                                                                                    <asp:Label ID="LB_MyQueryScope" runat="server" Text="<%$ Resources:lang,MyQueryScope%>"></asp:Label>:<asp:Label
                                                                                        ID="LB_QueryScope" runat="server"></asp:Label>
                                                                                    <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                                                    <asp:Label ID="LB_UserName" runat="server" FVisible="false"></asp:Label>
                                                                                </td>
                                                                                <td style="background: #f0f0f0; text-align: right; width: 300px; height: 25px;">
                                                                                    <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                                                        Text="<%$ Resources:lang,AllProjectExpense%>" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table style="width: 100%; margin-top: 5px">
                                                                            <tr>
                                                                                <td align="right" style="padding-top: 5px; ">
                                                                                    <table>
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Label ID="LB_tbExpenaseSummary" runat="server" Text="<%$ Resources:lang,ExpenseSummary%>"></asp:Label>
                                                                                                <asp:Label ID="LB_Member" runat="server"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="LB_tbEffectExpense" runat="server" Text="<%$ Resources:lang,EffectExpense%>"></asp:Label><asp:Label
                                                                                                    ID="LB_Amount" runat="server" Font-Bold="True"></asp:Label>
                                                                                            </td>
                                                                                            <td>
                                                                                                <asp:Label ID="LB_tbConfirmEffectExpense" runat="server" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label><asp:Label
                                                                                                    ID="LB_ConfirmAmount" runat="server" Font-Bold="True"></asp:Label>
                                                                                            </td>
                                                                                            <td>(<asp:Label ID="LB_tbProjectBudget" runat="server" Text="<%$ Resources:lang,ProjectBudget%>"></asp:Label>
                                                                                                <asp:Label ID="LB_ProBudget" runat="server" Font-Bold="True"></asp:Label>)
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand"
                                                                                        DataKeyField="ID" CellPadding="0" ForeColor="#333333">
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
                                                                                                                        <asp:Label ID="LB_dgExpenseID" runat="server" Text="<%$ Resources:lang,ID%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="LB_dgWorkDate" runat="server" Text="<%$ Resources:lang,WorkDate%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="20%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="LB_dgOperator" runat="server" Text="<%$ Resources:lang,Operator%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="44%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="LB_dgAccount" runat="server" Text="<%$ Resources:lang,Account%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="LB_dgExpense" runat="server" Text="<%$ Resources:lang,Expense%>"></asp:Label></strong>
                                                                                                                </td>
                                                                                                                <td width="10%" align="center">
                                                                                                                    <strong>
                                                                                                                        <asp:Label ID="LB_dgConfirmExpense" runat="server" Text="<%$ Resources:lang,ConfirmExpense%>"></asp:Label></strong>
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
                                                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                                                <tr>
                                                                                                    <td style="width: 6%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"EffectDate","{0:yyyy/MM/dd}") %>
                                                                                                    </td>
                                                                                                    <td style="width: 20%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                                    </td>
                                                                                                    <td style="width: 44%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"Account") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: center" class="tdLeft">
                                                                                                        <%#DataBinder .Eval (Container .DataItem ,"Amount") %>
                                                                                                    </td>
                                                                                                    <td style="width: 10%; text-align: center" class="tdRight">
                                                                                                        <asp:TextBox ID="TB_ConfirmAmount" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ConfirmAmount") %>'
                                                                                                            Width="90%"></asp:TextBox>
                                                                                                    </td>
                                                                                                </tr>
                                                                                                <tr>
                                                                                                    <td style="width: 6%; text-align: center;" class="tdLeft">
                                                                                                        <asp:Label ID="LB_dgDescription" runat="server" Text="<%$ Resources:lang,Description%>"></asp:Label>
                                                                                                    </td>
                                                                                                    <td colspan="4" style="text-align: left; width: 84%; padding-left: 5px" class="tdLeft">
                                                                                                        <span style="font-size: 9pt">
                                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Description") %>
                                                                                                    </td>
                                                                                                    <td style="text-align: center; width: 10%" class="tdRight">
                                                                                                        <asp:Button ID="BT_Update" runat="server" Text="<%$ Resources:lang,Update%>" CssClass="inpu"
                                                                                                            CommandName="Update" />
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
                                                                    </td>
                                                                </tr>
                                                            </table>
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
