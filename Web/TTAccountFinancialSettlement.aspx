<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAccountFinancialSettlement.aspx.cs" Inherits="TTAccountFinancialSettlement" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>财务期末转账</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
        </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiWuQiMoZhuanZhang%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
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
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                                        <table align="center" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                                        <tr>
                                                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                                                <asp:Label ID="LB_CaiWuZhangTao" runat="server" Text="<%$ Resources:lang,CaiWuZhangTao%>"></asp:Label>：</td>
                                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                                <asp:DropDownList ID="DL_Financial" runat="server" DataTextField="FinancialName" DataValueField="FinancialCode" AutoPostBack="True" OnSelectedIndexChanged="DL_Financial_SelectedIndexChanged">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td align="right" class="formItemBgStyle">
                                                                                                <asp:Label ID="LB_CaiWuQuJian" runat="server" Text="<%$ Resources:lang,CaiWuQuJian%>"></asp:Label>：</td>
                                                                                            <td align="left" class="formItemBgStyle">
                                                                                                <asp:DropDownList ID="DL_Interval" runat="server" DataTextField="IntervalName" DataValueField="IntervalCode">
                                                                                                </asp:DropDownList>
                                                                                            </td>
                                                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                                                <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                                                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                            </tr>
                                                                            <tr style="font-size: 10pt">
                                                                                <td>
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                        width="100%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_CaiWuZhangTao1" runat="server" Text="<%$ Resources:lang,CaiWuZhangTao%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_CaiWuQuJian1" runat="server" Text="<%$ Resources:lang,CaiWuQuJian%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_KuaiJiKeMu" runat="server" Text="<%$ Resources:lang,KuaiJiKeMu%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_JinE" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="LB_BiZhong" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                                        Width="100%">
                                                                                        <Columns>
                                                                                            <asp:TemplateColumn HeaderText="财务帐套">
                                                                                                <ItemTemplate>
                                                                                                    <%# GetFinancialName(Eval("FinancialCode").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:TemplateColumn HeaderText="财务区间">
                                                                                                <ItemTemplate>
                                                                                                    <%# GetIntervalName(Eval("IntervalCode").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                            <asp:BoundColumn DataField="AccountName" HeaderText="会计科目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TotalAllMoney" HeaderText="金额">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn HeaderText="币种">
                                                                                                <ItemTemplate>
                                                                                                    <%# GetFinancialCurrency(Eval("FinancialCode").ToString()) %>
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                        
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                    </asp:DataGrid>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" align="left" colspan="4">&nbsp;&nbsp; <asp:Label ID="LB_BaShamgShuQiMoJieGuoZhuanRuXiaQiJieSuanZhong" runat="server" Text="<%$ Resources:lang,BaShangShuQiMoJieGuoZhuanRuXiaQiJieSuanZhong%>"></asp:Label></td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_KuaiJiZhangTao" runat="server" Text="<%$ Resources:lang,KuaiJiZhangTao%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" colspan="1" style="text-align: left">
                                                            <asp:DropDownList ID="DL_FinancialID" runat="server" AutoPostBack="True" DataTextField="FinancialName" DataValueField="ID" OnSelectedIndexChanged="DL_FinancialID_SelectedIndexChanged" Visible="False">
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lbl_FinancialID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_FinancialName" runat="server"></asp:Label>
                                                        </td>
                                                        <td align="right" class="formItemBgStyle">
                                                            <asp:Label ID="LB_KuaiJiQuJian" runat="server" Text="<%$ Resources:lang,KuaiJiQuJian%>"></asp:Label>：</td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_IntervalID" runat="server" DataTextField="IntervalName" DataValueField="ID" Visible="False">
                                                            </asp:DropDownList>
                                                            <asp:Label ID="lbl_IntervalID" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="lbl_IntervalName" runat="server"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="LB_BenWeiBi" runat="server" Text="<%$ Resources:lang,BenWeiBi%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:Label ID="lbl_CurrencyType" runat="server"></asp:Label>
                                                            <asp:Label ID="lbl_ExchangeRate" runat="server" Visible="False"></asp:Label>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            &nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right; vertical-align: middle;">&nbsp;</td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left; vertical-align: middle;">
                                                            <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" CssClass="inpu" Text="<%$ Resources:lang,ZhuanZhang%>" />
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
                        <img src="Images/Processing.gif" alt=<asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,QSHCLZ%>"></asp:Label> />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
