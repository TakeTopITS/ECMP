<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopIM.aspx.cs" Inherits="TTTakeTopIM" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>
    <script type="text/javascript">
        function opim(id, chatterName, htmlText) {

            var dg = new J.dialog({ id: id, title: chatterName, width: 550, height: 570, btnBar: false, cancelBtn: false, page: htmlText, autoPos: { left: 'center', top: 'top' }, fixed: false, left: 'center', top: 'top', rang: true });

            dg.ShowDialog();
        }
    </script>
</head>
<body>
    <left>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <table style="width: 410px;" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 210px; padding: 0px 5px 0px 5px; border-right: solid 1px #D8D8D8;"
                        valign="top" align="left">
                        <asp:TreeView ID="TreeView1" runat="server" BorderColor="Transparent" NodeWrap="True"
                            OnSelectedNodeChanged="TreeView1_SelectedNodeChanged" ShowLines="True" Width="100%">
                            <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                        </asp:TreeView>
                        <br />
                        <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    </td>
                    <td style="width: 200px; padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8;
                        text-align: center; vertical-align: top;">
                        <table style="width: 100%;" cellpadding="0" cellspacing="0">
                            <tr>
                                <td>
                                    <asp:Button ID="BT_AllActiveUser" CssClass="inpuLong" runat="server" Text="<%$ Resources:lang,CKSYZXYH%>"
                                        OnClick="BT_AllActiveUser_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: center; padding: 5px 5px 5px 5px; vertical-align: top;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td align="center">
                                                            <strong>
                                                                <asp:Label ID="LB_UserType" runat="server" Text="<%$ Resources:lang,ZaiXianYongHu%>"></asp:Label></strong>
                                                        </td>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false"
                                        Font-Bold="True">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="">
                                                <ItemTemplate>
                                                    <table width="100%"><tr>
                                                        <td width="50%" align ="center" >
                                                         <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                        CssClass="inpu" />
                                                           </td>
                                                          <td width="50%" align ="center" > 
                                                            <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                        CssClass="inpu" />

                                                          </td></tr></table>
                                                   
                                               
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                    </asp:DataGrid>
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
                <img src="Images/Processing.gif" alt="Loading,please wait..." /></ProgressTemplate>
        </asp:UpdateProgress>
    </div>
    </form>
   </left>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
