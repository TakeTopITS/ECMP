<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTakeTopIMDetailView.aspx.cs"
    Inherits="TTTakeTopIMDetailView" %>

<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload"
    TagPrefix="Upload" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>

    <style type="text/css">
        html {
            overflow-x: hidden;
            overflow-y: auto;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table style="width: 100%" cellpadding="0" cellspacing="0" align="center">
                        <tr>
                            <td style="border-left: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                                <table width="100%" cellspacing="0">
                                    <tr>
                                        <td style="text-align: left; vertical-align: top;">
                                            <cc2:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                Width="100%">
                                                <cc2:TabPanel ID="TabPanel1" runat="server" HeaderText="会话记录" TabIndex="0" BorderWidth="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HuiHuaJiLu%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <asp:DataList ID="DataList1" runat="server" CellPadding="4" ForeColor="#333333" Width="98%">
                                                            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <SelectedItemStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                            <ItemTemplate>
                                                                <table style="width: 100%; table-layout: fixed;">
                                                                    <tr>
                                                                        <td align="left" style="color: Blue; font-style: italic;">
                                                                            <a href='TTUserInforSimple.aspx?UserCode=<%#DataBinder .Eval (Container .DataItem ,"UserCode") %>'
                                                                                target="_blank" style="text-decoration: none;">
                                                                                <%#DataBinder.Eval(Container.DataItem, "UserName")%></a> &nbsp;&nbsp;
                                                                        <%# DataBinder.Eval(Container.DataItem, "CreateTime")%>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td style="text-overflow: ellipsis; word-break: keep-all; overflow: hidden;">
                                                                            <%# DataBinder.Eval(Container.DataItem,"LogContent") %>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </ItemTemplate>
                                                        </asp:DataList>
                                                        </asp:Timer>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel2" runat="server" HeaderText="相关文件" TabIndex="1" BorderWidth="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label>
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
                                                                            <td align="center" width="50%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="20%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="20%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
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
                                                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UploadManName" HeaderText="上传者">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <ItemStyle CssClass="itemStyle" />
                                                        </asp:DataGrid><br />
                                                        <table>
                                                            <tr>
                                                                <td style="width: 98%; height: 1px; text-align: left"></td>
                                                            </tr>
                                                            <tr>
                                                                <td>
                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label><br />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                                <cc2:TabPanel ID="TabPanel3" runat="server" HeaderText="参与人员" TabIndex="1" BorderWidth="0">
                                                    <HeaderTemplate>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CanYuRenYuan%>"></asp:Label>
                                                    </HeaderTemplate>
                                                    <ContentTemplate>
                                                        <br />
                                                        <asp:Repeater ID="RP_Attendant" runat="server">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserName" runat="server" CssClass="inpuRepeat" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ContentTemplate>
                                                </cc2:TabPanel>
                                            </cc2:TabContainer>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 25%; text-align: left; vertical-align: top; padding-top: 5px;">
                                <table width="100%">
                                    <tr>
                                        <td align="center">
                                            <asp:Image ID="IM_MemberPhoto" runat="server" AlternateText="员工照片" Height="110px"
                                                Width="100px" ImageUrl="~/Images/DefaultUserPhoto.png" />
                                            <br />
                                            <asp:Label ID="LB_ChatterCode" Visible="false" runat="server"></asp:Label>
                                            <asp:Label ID="LB_ChatterName" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="formItemBgStyle" align="left">
                                            <div id="mess_box" style="width: 100%; height: 150px; overflow: auto;">
                                                <asp:DataList ID="DataList2" runat="server" CellPadding="4" ForeColor="#333333" Width="100%">

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
                                        <td align="left">
                                            <asp:Label ID="LB_CoID" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="left">
                                            <asp:Timer ID="Timer1" runat="server" OnTick="Timer1_Tick">
                                            </asp:Timer>
                                            <asp:TextBox ID="TB_CoID" Text="0" runat="server" Style="visibility: hidden"></asp:TextBox>
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
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
