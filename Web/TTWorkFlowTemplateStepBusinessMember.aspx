<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkFlowTemplateStepBusinessMember.aspx.cs" Inherits="TTWorkFlowTemplateStepBusinessMember" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>制定计划</title>
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
                                                            <asp:Label ID="LB_Title" runat="server" Text="<%$ Resources:lang,LiuChenEWaiKeYongRenYuan%>"></asp:Label>
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
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" style="width: 190px; padding: 0px 5px 0px 5px" valign="top">
                                                <asp:TreeView ID="TreeView4" runat="server" BorderColor="Transparent" NodeWrap="True"
                                                    OnSelectedNodeChanged="TreeView4_SelectedNodeChanged" ShowLines="True" Width="190px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td style="width: 170px; padding: 5px 5px 5px 5px; text-align: center; vertical-align: top; border-right: solid 1px #D8D8D8">
                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                    width="100%">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="center" width="100%">
                                                                        <strong>
                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td align="right" width="6">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                    Font-Bold="True" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid4_ItemCommand"
                                                    ShowHeader="false" Width="100%">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' />
                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Left" />
                                                </asp:DataGrid>
                                            </td>
                                            <td align="left" class="formItemBgStyle">
                                                <div id="GoodsListDivID" style="width: 100%; overflow: auto;">
                                                    <asp:Repeater ID="RP_Attendant" runat="server" OnItemCommand="RP_Attendant_ItemCommand">
                                                        <ItemTemplate>
                                                            <table width="110%">
                                                                <tr>
                                                                    <td>
                                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' Visible="false" />
                                                                    </td>
                                                                    <td align="center">
                                                                        <asp:LinkButton ID="LBT_SaveMember" runat="server" CommandName="Save" Text="&lt;div&gt;&lt;img src=ImagesSkin/Save.gif border=0 alt='保存' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                    </td>
                                                                    <td width="60px" align="center">
                                                                        <asp:LinkButton ID="LBT_DeleteMember" runat="server" CommandName="Delete" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,WanChengTongGuo %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_AgreeNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BoHuiZhongZhi %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_RefuseNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,CheXiao %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_CancelNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,FanHui %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_AgreeBackNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShenHeZhong %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_CheckingNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FuHeZhong %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_ReviewNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                    <td align="right">
                                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,HuiQianZhong %>"></asp:Label>
                                                                    </td>
                                                                    <td align="left">
                                                                        <asp:CheckBox ID="CB_SigningNotice" AutoPostBack="true" runat="server" Checked="true" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <br />
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                    <br />
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
