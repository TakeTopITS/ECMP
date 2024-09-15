<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TakeTopSiteContentEdit.aspx.cs" Inherits="TakeTopSiteContentEdit" %>

<!DOCTYPE html>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/cssGreen/bluelightmain.css" rel="stylesheet" type="text/css" />

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
                                            <td align="left" width="250px">
                                                <table width="285" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WangZhanBianJi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td style="text-align: right; width: 100px;">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YuYan%>"></asp:Label>：</td>
                                            <td align="left" style="width: 80px; padding-top: 5px;">
                                                <asp:DropDownList ID="ddlLangSwitcher" runat="server" DataValueField="LangCode" DataTextField="Language" AutoPostBack="true" OnSelectedIndexChanged="ddlLangSwitcher_SelectedIndexChanged">
                                                </asp:DropDownList>
                                            </td>

                                            <td align="left" style="padding-top: 5px;">&nbsp;
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="5" cellspacing="0">
                                        <tr>
                                            <td width="200" style="padding: 5px 5px 0px 5px; border-right: solid 1px #6d92ad">
                                                <asp:TreeView ID="TreeView1" runat="server" Font-Bold="False" Font-Names="宋体" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Style="width: 200px; height: 100%;">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td style="width: 400px; padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8;" valign="top">
                                                <asp:Label ID="LB_ModuleID" runat="server"></asp:Label>
                                                <asp:Label ID="LB_ModuleName" runat="server" Visible="false"></asp:Label>
                                                <asp:Label ID="LB_HomeModuleName" runat="server"></asp:Label>
                                                <asp:Label ID="LB_Level" runat="server" Text="0" Visible="False"></asp:Label>
                                                <br />
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand"
                                                    Width="400px" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ContentID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Title" HeaderText="主题">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="90%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <br />
                                            </td>
                                            <td>
                                                <table width="100%" class="formBgStyle">
                                                    <tr>
                                                        <td align="right" width="80px" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Label ID="LB_ContentID" runat="server"></asp:Label>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TB_Title" runat="server" Width="95%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" valign="top" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <CKEditor:CKEditorControl ID="CKEditor1" Width="98%" Height="550px" runat="server" Visible="False">
                                                            </CKEditor:CKEditorControl>
                                                            <CKEditor:CKEditorControl runat="server" ID="HTEditor1" Width="98%" Height="550px" Visible="False" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" style="width: 50px; height: 29px" class="formItemBgStyle"></td>
                                                        <td align="left" style="height: 29px" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Add" runat="server" Text="<%$ Resources:lang,XinZeng%>" CssClass="inpu" OnClick="BT_Add_Click" />
                                                            &nbsp;<asp:Button ID="BT_Update" runat="server" Enabled="false" CssClass="inpu" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;<asp:Button ID="BT_Delete" runat="server" Enabled="false" CssClass="inpu" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu%>" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
