<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConfirmProjectExpenseForFIN.aspx.cs"
    Inherits="TTConfirmProjectExpenseForFIN" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }

        .auto-style1 {
            width: 164px;
        }
    </style>
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:Label ID="LB_ProjectID" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label>
                                                            <asp:Label ID="LB_QueryScope" runat="server" Font-Size="9pt" Font-Underline="True"
                                                                Visible="FALSE"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td width="200px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top; text-align: left;">
                                                <asp:Button ID="BT_AllMember" runat="server" CssClass="inpuLong" OnClick="BT_AllMember_Click"
                                                    Text="<%$ Resources:lang,ChaKanSuoYouXiangMuFeiYong%>" /><br />
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
                                            <td style="padding: 5px 5px 5px 5px;">
                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="right" class="tdFullBorder" style="font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg');">
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
                                                                    <td class="auto-style1">(<asp:Label ID="LB_tbProjectBudget" runat="server" Text="<%$ Resources:lang,ProjectBudget%>"></asp:Label>
                                                                        <asp:Label ID="LB_ProBudget" runat="server" Font-Bold="True"></asp:Label>
                                                                        )
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:Label ID="LB_CurrencyType" runat="server" Font-Bold="True"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td valign="top">
                                                            <table style="width: 100%; margin-top: 5px">
                                                                <tr>
                                                                    <td>
                                                                        <asp:DataList ID="DataList1" runat="server" Width="100%" OnItemCommand="DataList1_ItemCommand"
                                                                            DataKeyField="ID" CellPadding="0" ForeColor="#333333">
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <HeaderTemplate>
                                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                    <tr>
                                                                                        <td width="7">
                                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                        <td>
                                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                <tr>
                                                                                                    <td width="6%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                                    </td>

                                                                                                    <td width="14%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,RiQi%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZeRenRen%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="20%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KeMu%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="15%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                    <td width="25%" align="center">
                                                                                                        <strong>
                                                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QueRenFeiYong%>"></asp:Label></strong>
                                                                                                    </td>
                                                                                                </tr>
                                                                                            </table>
                                                                                        </td>
                                                                                        <td width="6" align="right">
                                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                                                        <td style="width: 14%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"EffectDate","{0:yyyy/MM/dd}") %>
                                                                                        </td>
                                                                                        <td style="width: 20%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"UserName") %>
                                                                                        </td>
                                                                                        <td style="width: 20%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Account") %>
                                                                                        </td>
                                                                                        <td style="width: 15%; text-align: center" class="tdLeft">
                                                                                            <%#DataBinder .Eval (Container .DataItem ,"Amount") %>
                                                                                        </td>
                                                                                        <td style="width: 25%; text-align: center; padding-top: 5px;" class="tdRight">
                                                                                            <asp:TextBox ID="TB_ConfirmAmount" runat="server" Text='<%#DataBinder .Eval (Container .DataItem ,"ConfirmAmount") %>'
                                                                                                Width="50%"></asp:TextBox>
                                                                                            <asp:Button ID="BT_Update" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" CommandName="Update" />
                                                                                        </td>
                                                                                    </tr>
                                                                                    <tr>
                                                                                        <td style="width: 6%; text-align: center;" class="tdLeft">
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>
                                                                                        </td>
                                                                                        <td colspan="5" style="text-align: left; width: 84%; padding-left: 5px" class="tdLeft">
                                                                                            <span style="font-size: 9pt">
                                                                                                <%#DataBinder .Eval (Container .DataItem ,"Description") %>
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

