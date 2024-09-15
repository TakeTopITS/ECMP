<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemExchangeDBServer.aspx.cs" Inherits="TTSystemExchangeDBServer" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>数据交换接口命令定义</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 980px;
            width: expression (document.body.clientWidth <= 980? "980px" : "auto" ));
        }*/

        .auto-style5 {
            font-size: small;
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
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td>

                                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShuJuJiaoHuanFuWuQi%>"></asp:Label>
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
                                                        <td valign="top" style="padding: 5px 5px 5px 5px; border-right: solid 1px #D8D8D8;">
                                                            <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                                <tr>
                                                                    <td>
                                                                        <table width="100%" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="width: 7%; text-align: right;">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" style="width: 20%; text-align: left;">
                                                                                    <asp:TextBox ID="TB_DBServerName" runat="server" Width="99%"></asp:TextBox>
                                                                                </td>
                                                                                <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangGuanShuJuKu%>"></asp:Label>：
                                                                                </td>
                                                                                <td style="width: 65%; text-align: left; padding-right: 5px;" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_DBName" runat="server" Width="100%"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" align="right" valign="top">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LianJieChuan%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" align="left" colspan="3" style="padding-right: 5px;">
                                                                                    <asp:TextBox ID="TB_ConnectString" runat="server" Style="width: 100%;"></asp:TextBox>
                                                                                    <br />
                                                                                    <span class="auto-style5">
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShiLi%>"></asp:Label>：EXEC sp_addlinkedserver @server=&#39;DBVIP&#39;,--<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BFWDFWQBM%>"></asp:Label>
                                                                                        @srvproduct=&#39;&#39;, @provider=&#39;SQLOLEDB&#39;, @datasrc=&#39;Server2&#39; --<asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YFWDFWQ%>"></asp:Label></span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" align="right" valign="top">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DengLuChuan%>"></asp:Label>：</td>
                                                                                <td style="padding-right: 5px;" class="formItemBgStyle" align="left" colspan="3">
                                                                                    <asp:TextBox ID="TB_LoginString" runat="server" Style="width: 100%;"></asp:TextBox>
                                                                                    <br />
                                                                                    <span class="auto-style5">
                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShiLi%>"></asp:Label>：EXEC sp_addlinkedsrvlogin &#39;DBVIP&#39;, --<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BFWDFWQBM%>"></asp:Label>
                                                                                        &#39;false&#39;, NULL, &#39;sa&#39;, --<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>
                                                                                        &#39;thankyoubobby&#39; --<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label></span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: right;">
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="true" CssClass="DDList" >
                                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                                        <asp:ListItem Value="停用" Text="<%$ Resources:lang,TingYong%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="formItemBgStyle" style="text-align: right;">
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle" style="text-align: left;">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNumber" runat="server" Width="53px" Precision="0">0</NickLee:NumberBox>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="top" class="formItemBgStyle">&nbsp;</td>
                                                                                <td colspan="3" style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_New" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpu"
                                                                                        OnClick="BT_New_Click" />
                                                                                    &nbsp; &nbsp;
                                                                    <asp:Button ID="BT_Upate" runat="server" Text="<%$ Resources:lang,Update%>" CssClass="inpu"
                                                                        OnClick="BT_Update_Click" Enabled="False" />&nbsp;&nbsp;
                                                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click"
                                                                        Text="<%$ Resources:lang,Delete%>" />

                                                                                </td>
                                                                            </tr>

                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table style="width: 100%; text-align: left;">
                                                                            <tr>
                                                                                <td width="60%" align="left">
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,JiaoHuanShuJuKuLieBiao%>"></asp:Label>：
                                                                                </td>
                                                                                <td align="right">&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <table cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td colspan="4">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                            </td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="17%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShuJuKu%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="40%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LianJieChuan%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="23%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DengLuChuan%>"></asp:Label></strong>
                                                                                                        </td>

                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShunXu%>"></asp:Label></strong>
                                                                                                        </td>

                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                                        OnItemCommand="DataGrid2_ItemCommand"
                                                                                        AllowCustomPaging="false" ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="数据库">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_DBServerName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"DBServerName") %>'
                                                                                                        CssClass="inpu" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="DBName" HeaderText="数据库">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="17%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="ConnectString" HeaderText="连接串">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="LoginString" HeaderText="登录串">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="23%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="SortNumber" HeaderText="顺序号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                            </asp:BoundColumn>
                                                                                        </Columns>
                                                                                    </asp:DataGrid>
                                                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>&nbsp;
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
            <div style="position: absolute; left: 35%; top: 35%;">
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
