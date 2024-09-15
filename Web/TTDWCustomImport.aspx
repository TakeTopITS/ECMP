<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDWCustomImport.aspx.cs" Inherits="TTDWCustomImport" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>客户价值表-导入</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { 

            

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KeHuJiaZhiTongJi%>"></asp:Label>
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Nian%>"></asp:Label>：<asp:DropDownList ID="DDL_Year" runat="server"></asp:DropDownList>&nbsp;
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Yue%>"></asp:Label>：<asp:DropDownList ID="DDL_Month" runat="server"></asp:DropDownList>&nbsp;
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="display:none;">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KeHuMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_CustomName" runat="server"></asp:TextBox>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HuoZhe%>"></asp:Label>
                                                                    <asp:DropDownList ID="DDL_CustomName" runat="server" DataTextField="CustomName" DataValueField="CustomName"></asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Seach" runat="server" Text="<%$ Resources:lang,ChaXun%>" CssClass="inpu" OnClick="BT_Seach_Click" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" width="100%">
                                                <table cellpadding="2" cellspacing="0" class="formBgStyle" style="width: 100%;">
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                                <div style="width: 2200px;">
                                                                    <asp:DataGrid ID="DG_CustomValue" runat="server" AllowPaging="false" AutoGenerateColumns="False" CellPadding="4"
                                                                        ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="True" Width="100%" OnPageIndexChanged="DG_CustomValue_PageIndexChanged">
                                                                        <Columns>
                                                                            <asp:BoundColumn DataField="CustomName" HeaderText="客户名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ProductCode" HeaderText="产品编号">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ProductType" HeaderText="类别">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <%--<asp:BoundColumn DataField="SaleTime" HeaderText="日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                        </asp:BoundColumn>--%>
                                                                            <asp:TemplateColumn HeaderText="日期">
                                                                                <ItemStyle HorizontalAlign="Center" />
                                                                                <ItemTemplate>
                                                                                    <%#DataBinder.Eval(Container.DataItem, "SaleTime", "{0:yyyy/MM/dd}")%>
                                                                                </ItemTemplate>
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="SaleNumber" HeaderText="销售数量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="SalePrice" HeaderText="销售单价">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="SaleMoney" HeaderText="销售金额">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ProductCost" HeaderText="产品成本">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="MakeCost" HeaderText="制造费用">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TonCost" HeaderText="吨耗">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="PickCost" HeaderText="包装费用">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="QualityCost" HeaderText="质量损失">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TransportCost" HeaderText="运输费用月结">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="AccountCost" HeaderText="财务费用月结">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ServeCost" HeaderText="招待费用">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="TravelCost" HeaderText="差旅费">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Applyer" HeaderText="报销人员">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="SurplusValue" HeaderText="剩余价值" Visible="false">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                            </asp:BoundColumn>
                                                                        </Columns>
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        
                                                                        <ItemStyle CssClass="itemStyle" />
                                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                    </asp:DataGrid>
                                                                </div>
                                                                <asp:Label ID="LB_CustomValueSql" runat="server" Visible="False"></asp:Label>
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
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Seach" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
