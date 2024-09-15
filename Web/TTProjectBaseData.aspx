<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectBaseData.aspx.cs" Inherits="TTProjectBaseData" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            color: #CC0000;
        }

        .auto-style1 {
            height: 20px;
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XMJCSZ%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td valign="top" align="center">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HBZLSZHLWYYRMBKDHDSGHBSL%>"></asp:Label></strong>
                                                <br />
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="40%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="40%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid2_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="币种">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_Type" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Type").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="ExchangeRate" HeaderText="汇率">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="SortNo" HeaderText="排序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <br />
                                                <br />
                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label>：<asp:TextBox ID="TB_Type" runat="server"></asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HuiLv%>"></asp:Label>：<asp:TextBox ID="TB_ExchangeRate" runat="server">1</asp:TextBox>
                                                <br />
                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,PaiXu%>"></asp:Label>：<asp:TextBox ID="TB_SortNo" runat="server">1</asp:TextBox>
                                                <br />
                                                <br />

                                                <asp:Label ID="lbl_TypeOld" runat="server" Visible="False"></asp:Label>

                                                <asp:Button ID="BT_NewCurrencyType" runat="server" CssClass="inpu" OnClick="BT_NewCurrencyType_Click" Text="<%$ Resources:lang,XinZeng%>" />


                                                <asp:Button ID="BT_UpdateCurrencyType" runat="server" CssClass="inpu" OnClick="BT_UpdateCurrencyType_Click" Text="<%$ Resources:lang,BaoCun%>" />

                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" align="center" style="padding-top: 20px;">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,SJKJKSD%>"></asp:Label></strong>
                                                <br />
                                                <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="25%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuJuKu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DengLuMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid1_ItemCommand"
                                                    ShowHeader="false" PageSize="20" Width="98%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编码">
                                                            <ItemTemplate>
                                                                <asp:Button CssClass="inpu" ID="BT_Code" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Code").ToString().Trim() %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Host" HeaderText="服务器">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DataBaseName" HeaderText="数据库">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="LoginNo" HeaderText="登录名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PassWord" HeaderText="密码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                        </asp:BoundColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                                <br />
                                                <br />

                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianMa%>"></asp:Label>：<asp:TextBox ID="TB_Code" runat="server"></asp:TextBox>
                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label>：<asp:TextBox ID="TB_Host" runat="server"></asp:TextBox>
                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShuJuKu%>"></asp:Label>：<asp:TextBox ID="TB_DataBaseName" runat="server"></asp:TextBox>

                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DengLuMing%>"></asp:Label>：<asp:TextBox ID="TB_LoginNo" runat="server"></asp:TextBox>
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MiMa%>"></asp:Label>：<asp:TextBox ID="TB_PassWord" runat="server"></asp:TextBox>
                                                <br />
                                                <br />
                                                <asp:Button CssClass="inpu" ID="BT_NewProjectDataLink" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_NewProjectDataLink_Click" />&nbsp;
                                                <asp:Button CssClass="inpu" ID="BT_UpdateProjectDataLink" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_UpdateProjectDataLink_Click" />
                                                <asp:Label ID="lbl_Code" runat="server" Visible="False"></asp:Label>
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
