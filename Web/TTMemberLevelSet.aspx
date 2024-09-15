<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMemberLevelSet.aspx.cs" Inherits="TTMemberLevelSet" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView2").style.height = document.documentElement.clientHeight + "px";
            document.getElementById("Div_TreeView3").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll(Div_TreeView) {
            disPostion = Div_TreeView.scrollTop;
        }


        function RestoreScroll(EndRequestHandler) {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        //function EndRequestHandler2(sender, args) {
        //    Div_TreeView2.scrollTop = disPostion;
        //}

        function EndRequestHandler3(sender, args) {
            Div_TreeView3.scrollTop = disPostion;
        }

    </script>


</head>
<body>
    <center>
        <form id="Form2" runat="server">
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
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhiJieChengYuanCengCiSheZhi%>"></asp:Label>
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
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td valign="top" style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;"
                                                align="left">
                                                <div id="Div_TreeView3" style="overflow: auto; height: 800px;">
                                                    <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                                        ShowLines="True" Width="220" Style="height: 183px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                            <td valign="top" style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;"
                                                align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td style="width: 300px; border-right: solid 1px #D8D8D8; padding: 10px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top"
                                                            align="left">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChengYuanCengCiWeiHu%>"></asp:Label>：<asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label><asp:Label
                                                                ID="LB_ChildCount" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UnderCode" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UnderName" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 26px; text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShangJiDaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="height: 26px; text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserCode" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="2" style="height: 25px; text-align: left;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YongYouDuiCiChengYuanQuanXian%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangMuKeShi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_ProjectVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiHuaKeShi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_PlanVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiXiaoKeShi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_KPIVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FuHeKeShi%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_WorkloadVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,RiChengKeShi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_ScheduleVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,LiuChengKeShi%>"></asp:Label>： 
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_WorkflowVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KeHuKeFuKeShi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_CustomerServiceVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeTongKeShi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_ConstractVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: right;">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WeiZhiKeShi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="height: 25px; text-align: left">
                                                            <asp:DropDownList ID="DL_PositionVisible" runat="server">
                                                                <asp:ListItem>YES</asp:ListItem>
                                                                <asp:ListItem>NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 25px" class="formItemBgStyle" colspan="2">
                                                            <asp:Button ID="BT_New" runat="server" CssClass="inpu" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;<asp:Button ID="BT_Update" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Update_Click" Enabled="false" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="width: 170px; padding: 5px 5px 5px 5px" valign="top" align="center">
                                                <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="false">
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
                                            </td>
                                            <td style="padding: 5px 0px 0px 5px; border-left: solid 1px #D8D8D8;"
                                                valign="top" align="left">
                                                <div id="Div_TreeView2" style="overflow: auto; height: 800px;">
                                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                        ShowLines="True" Width="220px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="LB_DepartCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
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
