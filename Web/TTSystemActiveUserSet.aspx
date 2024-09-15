<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemActiveUserSet.aspx.cs"
    Inherits="TTSystemActiveUserSet" %>

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

        .auto-style1 {
            background-color: #D8D8D8;
            width: 350px;
            margin-bottom: 0px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function AdjustDivHeight() {

            document.getElementById("Div_TreeView").style.height = document.documentElement.clientHeight + "px";
        }

    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView.scrollTop = disPostion;
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiTongYongHuSheZhi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </td>
                                            <td style="padding-top: 3px; text-align: right;">
                                                <asp:HyperLink ID="HL_NoUpdatePasswordUser" NavigateUrl="TTAllUsersForNoUpdatePassword.aspx" Target="_blank" ForeColor="White" Font-Size="X-Small" runat="server" Text="<%$ Resources:lang,NoChangePasswordUser%>"></asp:HyperLink>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="width: 230px; padding: 5px 0px 0px 5px; border-left: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;"
                                                valign="top" align="left">
                                                <div id="Div_TreeView" style="overflow: auto; height: 800px;">
                                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                        ShowLines="True" Width="100%" Style="height: 183px">
                                                        <RootNodeStyle CssClass="rootNode" />
                                                        <NodeStyle CssClass="treeNode" />
                                                        <LeafNodeStyle CssClass="leafNode" />
                                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                    </asp:TreeView>
                                                    <asp:Label ID="LB_SelectedDepartCode" runat="server" Visible="false"></asp:Label>
                                                </div>
                                            </td>
                                            <td style="width: 170px; padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8;" valign="top" align="center">
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
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Button ID="BT_AddSystemUser" CssClass="inpu" runat="server" Text="全部添加" OnClick="BT_AddSystemUser_Click" />
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
                                                                <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Width="45%" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Width="45%" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
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
                                            <td style="width: 350px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;" align="center"
                                                valign="top">
                                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top"
                                                            align="left">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongYongHuWeiHu%>"></asp:Label>：
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserCode" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserName" runat="server" Enabled="false"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KeYongWEB%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_IsWEBUser" runat="server">
                                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>

                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KeYongAPP%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_IsAPPUser" runat="server">

                                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="height: 25px" class="formItemBgStyle"></td>
                                                        <td style="height: 25px; text-align: left" class="formItemBgStyle">
                                                            <asp:Button ID="BT_New" runat="server" OnClick="BT_New_Click" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />

                                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top"
                                                            align="left">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiTongYongHuZongShu%>"></asp:Label>： 
                                                        <asp:Label ID="LB_SystemUserNumber" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,Ren%>"></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top"
                                                            align="left">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiTongYongHuChaXun%>"></asp:Label>：
                                                         
                                                            <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                                            <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserCodeFind" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: right" class="formItemBgStyle">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_UserNameFind" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KeYongWEB%>"></asp:Label>:
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_CanWEBUser" runat="server">
                                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Button ID="BT_FindWebUser" runat="server" CssClass="inpu" OnClick="BT_FindWebUser_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KeYongAPP%>"></asp:Label>:</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_CanAPPUser" runat="server">
                                                                <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                <asp:ListItem Value="NO">NO</asp:ListItem>
                                                            </asp:DropDownList>
                                                            &nbsp;<asp:Button ID="BT_FindAppUser" runat="server" CssClass="inpu" OnClick="BT_FindAppUser_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                                <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td colspan="2" style="padding: 5px 0px 0px 5px" class="formItemBgStyle" valign="top"
                                                            align="left">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ChaXunDaoXiTongYongHuShu%>"></asp:Label>： 
                                                        <asp:Label ID="LB_FindUserNumber" runat="server"></asp:Label>
                                                            &nbsp;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Ren%>"></asp:Label></td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                            <td valign="top" style="width: 400px; border-right: solid 1px #D8D8D8; padding: 5px 5px 5px 5px;"
                                                align="left">
                                                <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center">
                                                                        <asp:Button ID="BT_AllSystemUser" CssClass="inpuLong" runat="server" Text="全部系统用户" OnClick="BT_AllSystemUser_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid4_ItemCommand"
                                                    OnPageIndexChanged="DataGrid4_PageIndexChanged" Width="100%"
                                                    AllowPaging="True" PageSize="30">
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang,DaiMa%>">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_SystemUserCode" runat="server" CssClass="inpu" Width="99%" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />

                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang,MingCheng%>">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_SystemUserName" runat="server" CssClass="inpu" Width="99%" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang,KeYongWEB%>">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="DL_WebUser" runat="server">
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang,KeYongAPP%>">
                                                            <ItemTemplate>
                                                                <asp:DropDownList ID="DL_AppUser" runat="server" A>
                                                                    <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                    <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                </asp:DropDownList>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_Save" CommandName="Save" CssClass="inpu" runat="server" Text="<%$ Resources:lang,baocun%>"></asp:Button>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="<%$ Resources:lang,ShanChu%>">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>

                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
