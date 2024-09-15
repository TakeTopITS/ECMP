<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSystemExchangeOrder.aspx.cs" Inherits="TTSystemExchangeOrder" %>

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


        .auto-style3 {
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
                                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,SJJHMLDY%>"></asp:Label>
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
                                                                                <td style="width: 8%; text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label>:
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                                    <asp:DropDownList ID="DL_DBServerName" runat="server" AutoPostBack="true" CssClass="DDList" DataTextField="DBServerName" DataValueField="DBServerName"  OnSelectedIndexChanged="DL_Database_SelectedIndexChanged">
                                                                                    </asp:DropDownList>
                                                                                    &nbsp;<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangGuanShuJuKu%>"></asp:Label>：<asp:Label ID="LB_DBName" runat="server"></asp:Label>
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" align="right" valign="top">
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiXingYuJu%>"></asp:Label>:</td>
                                                                                <td style="width: 100%;" class="formItemBgStyle" align="left" colspan="3">
                                                                                    <asp:TextBox ID="TB_SqlOrderString" TextMode="MultiLine" runat="server" Style="width: 99%; height: 150px;"></asp:TextBox>
                                                                                    <br />
                                                                                    <span class="auto-style3">
                                                                                        <asp:Label ID="Label4" runat="server"></asp:Label><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,SLCYAQKLBNSY%>"></asp:Label>Delete,Update,Drop,Insert,Alter<asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label><asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,YuJu%>"></asp:Label>）：<br />
                                                                                        --<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ChaRuXinZengDeShuJu%>"></asp:Label>
                                                                                        insert srv2.<asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,KuMing%>"></asp:Label>.dbo.author(id,name,telphone) select id,name,telphone from author i where not exists( select * from srv2.<asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KuMing%>"></asp:Label>.dbo.author where id=i.id)
                                                                                    <br />
                                                                                        --<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GengXinXiuGaiGuoDeShuJu%>"></asp:Label>
                                                                                        update b set name=i.name,telphone=i.telphone from srv2.<asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KuMing%>"></asp:Label>.dbo.author b,author i where b.id=i.id and (b.name &lt;&gt; i.name or b.telphone &lt;&gt; i.telphone)<br />
                                                                                        --<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,SCYJSCDSJ%>"></asp:Label>
                                                                                        delete b from srv2.<asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KuMing%>"></asp:Label>.dbo.author b where not exists( select * from author where id=b.id)</span></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>:
                                                                                </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="true" CssClass="DDList">
                                                                                        <asp:ListItem Value="在用" Text="<%$ Resources:lang,ZaiYong%>" />
                                                                                        <asp:ListItem Value="停用" Text="<%$ Resources:lang,TingYong%>" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td style="text-align: right;" class="formItemBgStyle">&nbsp;</td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">&nbsp;</td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td align="right" valign="top" class="formItemBgStyle">&nbsp;</td>
                                                                                <td colspan="3" style="text-align: left; width: 100%;" class="formItemBgStyle">
                                                                                    <asp:Button ID="BT_New" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpu"
                                                                                        OnClick="BT_New_Click" />
                                                                                    &nbsp; &nbsp;
                                                                                    <asp:Button ID="BT_Upate" runat="server" Text="<%$ Resources:lang,Update%>" CssClass="inpu"
                                                                                        OnClick="BT_Update_Click" Enabled="False" />&nbsp;&nbsp;
                                                                                    <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
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
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,SJJHMLLB%>"></asp:Label>：
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
                                                                                                        <td width="8%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="75%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhiXingYuJu%>"></asp:Label></strong>
                                                                                                        </td>
                                                                                                        <td width="7%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                                                            <asp:TemplateColumn HeaderText="编号">
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_ID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>'
                                                                                                        CssClass="inpu" />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="DBServerName" HeaderText="服务器">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="SqlOrderString" HeaderText="执行语句">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="75%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="状态">
                                                                                                <ItemTemplate>
                                                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                            </asp:TemplateColumn>

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
