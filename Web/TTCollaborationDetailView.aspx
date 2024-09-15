<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCollaborationDetailView.aspx.cs"
    Inherits="TTCollaborationDetailView" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
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

                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="bian">
                        <tr>
                            <td colspan="2" height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XieZuoXinXi%>"></asp:Label>
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
                            <td style="width: 45%; padding-top: 5px; text-align: center; vertical-align: top;">
                                <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                    <tr>
                                        <td width="20%" style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                        </td>
                                        <td style="text-align: left; overflow-y: auto;" class="formItemBgStyle">
                                            <asp:Label ID="LB_CollaborationName" runat="server"></asp:Label>
                                            <div id="mess_box" style="width: 100%; height: 150px; overflow: auto;">
                                                <asp:DataList ID="DataList2" runat="server" CellPadding="4" ForeColor="#333333" Width="98%">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <ItemTemplate>
                                                        <table style="width: 100%; table-layout: fixed;">
                                                            <tr>
                                                                <td style="width: 100%;">
                                                                    <%# DataBinder.Eval(Container.DataItem, "Comment")%>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                </asp:DataList>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CanYuRenYuan%>"></asp:Label>：
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Repeater ID="RP_Attendant" runat="server">
                                                <ItemTemplate>
                                                    <asp:Button ID="BT_UserName" runat="server" CssClass="ButtonCss" style="margin:1px 0;" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                        Width="70px" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>：
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="LB_Creator" runat="server"></asp:Label>&nbsp;&nbsp;
                                            <asp:Label ID="LB_CreateTime" runat="server"></asp:Label>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td style="text-align: Right;" class="formItemBgStyle">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                        </td>
                                        <td style="text-align: left;" class="formItemBgStyle">
                                            <asp:Label ID="LB_Status" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                </table>
                                <br />
                            </td>
                            <td valign="top" style="width: 55%; padding-top: 5px; padding-left: 10px; text-align: left;">
                                <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                    <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="会话记录" TabIndex="0" BorderWidth="0">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HuiHuaJiLu%>"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <div id="Div1" style="width: 100%; height: 650px; overflow: auto;">
                                                <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="98%">
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <ItemTemplate>
                                                        <table style="width: 100%; table-layout: fixed;">
                                                            <tr>
                                                                <td align="left" style="color: Blue; font-style: italic;">
                                                                    <%#DataBinder.Eval(Container.DataItem, "LogID")%>&nbsp;&nbsp;
                                                                        <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"UserCode") %>'
                                                                            target="_blank" style="text-decoration: none;">
                                                                            <%#DataBinder.Eval(Container.DataItem, "UserName")%></a> &nbsp;&nbsp;
                                                                        <%# DataBinder.Eval(Container.DataItem, "CreateTime")%>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td style="text-overflow: ellipsis; word-break: break-all; word-wrap: break-word;">
                                                                    <%# DataBinder.Eval(Container.DataItem,"LogContent") %>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ItemTemplate>
                                                </asp:DataList>
                                            </div>

                                        </ContentTemplate>
                                    </cc2:TabPanel>
                                    <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="相关文件" TabIndex="1" BorderWidth="0">
                                        <HeaderTemplate>
                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang, ShangChuanWenJian%>"></asp:Label>
                                        </HeaderTemplate>
                                        <ContentTemplate>
                                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                width="98%">
                                                <tr>
                                                    <td width="7">
                                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                    </td>
                                                    <td>
                                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                            <tr>
                                                                <td align="center" width="9%">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="12%">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="29%">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="13%">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="13%">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="18%">
                                                                    <strong>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td align="right" width="6">
                                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                ForeColor="#333333" GridLines="None" Height="1px" Width="98%" ShowHeader="False">
                                                <Columns>
                                                    <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                        DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="29%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                                    </asp:BoundColumn>
                                                    <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                                </Columns>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataGrid>
                                            <br />
                                            <table>
                                                <tr>
                                                    <td style="width: 98%; height: 1px; text-align: left">
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_CoID" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td>
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                        <br />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ContentTemplate>
                                    </cc2:TabPanel>
                                </cc2:TabContainer>
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
