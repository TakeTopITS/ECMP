<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeWebSite.aspx.cs" Inherits="TTMakeWebSite" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
  
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
                    <table cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChangYongWangZhiBianJi%>"></asp:Label>
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
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="center" style="padding: 5px 5px 5px 5px; vertical-align: top; border-right: solid 1px #D8D8D8">
                                            <table cellpadding="5" cellspacing="0" class="formBgStyle" width="95%">
                                                <tr>
                                                    <td align="center" class="formItemBgStyle" colspan="2" style="font-weight: bold; font-size: 15px; height: 22px;">
                                                        <br />
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WangZhiWoDeChangYongWangZhi%>"></asp:Label>
                                                    <br />
                                                        <br />
                                                    </td>
                                                </tr>
                                                <tr style="display:none;">
                                                    <td align="right" class="formItemBgStyle" style="width: 15%; height: 24px">
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="formItemBgStyle" style="width: 15%; height: 24px">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteName" runat="server" Width="80%"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="right" class="formItemBgStyle" style="width: 15%; height: 24px">
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：
                                                    </td>
                                                    <td align="left" class="formItemBgStyle">
                                                        <asp:TextBox ID="TB_SiteAddress" runat="server" Width="80%"></asp:TextBox>
                                                        <br />
                                                        <span style="color: red; font-size: 8pt;">（<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WangZhiQianYaoJiahttp%>"></asp:Label>）</span>
                                                    </td>
                                                </tr>
                                                <caption>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="width: 15%; height: 24px">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" Precision="0" Width="50px" OnBlur=""
                                                                OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="width: 15%; height: 21px;">&nbsp;
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu" OnClick="BT_Add_Click" Text="<%$ Resources:lang,XinZeng%>" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click"
                                                            Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                            Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp; &nbsp;&nbsp;
                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            &nbsp;&nbsp;
                                                        </td>
                                                    </tr>
                                            </table>
                                            <br />
                                            <table cellpadding="0" cellspacing="0" width="95%">
                                                <tr>
                                                    <td align="left" colspan="2" style="height: 29px;">
                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,WangZhiLieBiao%>"></asp:Label>：
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="center" colspan="2" style="height: 29px;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                            width="100%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="25%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="50%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td align="center" width="15%">
                                                                                <strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid4_ItemCommand"
                                                            OnPageIndexChanged="DataGrid4_PageIndexChanged" ShowHeader="false" Width="100%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SiteName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="25%" />
                                                                </asp:BoundColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="SiteAddress" DataNavigateUrlFormatString="{0}"
                                                                    DataTextField="SiteAddress" HeaderText="网址" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                                </asp:HyperLinkColumn>
                                                                <asp:BoundColumn DataField="SortNumber" HeaderText="顺序">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                            </Columns>
                                                            
                                                            <ItemStyle CssClass="itemStyle " />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        </asp:DataGrid>
                                                    </td>
                                                </tr>
                                            </table>
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
