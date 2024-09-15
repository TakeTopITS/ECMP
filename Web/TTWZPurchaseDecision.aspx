<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseDecision.aspx.cs" Inherits="TTWZPurchaseDecision" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>专家决策页面</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script language="javascript">

        $(function () { 

           

        });


        function ClickSign(obj) {
            $.dialog({
                lock: true,
                content: "建议：<input type='text' id='txtReason' />",
                ok: function () {
                    //alert($("#txtReason").val());
                    //alert(obj);

                    $("#HF_SupplierCode").val(obj);
                    $("#HF_Suggest").val($("#txtReason").val());
                    document.getElementById("BT_HiddenButton").click();
                },
                cancel: true
            });
        }


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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuanJiaJueCe%>"></asp:Label>
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
                                    <table width="100%;" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 1600px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        
                                                                        <td width="7%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongYingShangBaoJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <%--<td width="7%" align="center">
                                                                            <strong><asp:Label runat="server" Text="<%$ Resources:lang,TiaoShu%>"></asp:Label></strong>
                                                                        </td>--%>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuanJiaYiJian%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"SupplierCode") %>' CommandName="request" CssClass="notTab" Text='<%# Eval("IsSelect").ToString() == "没有" ? "选择" : "已选择" %>'></asp:LinkButton>
                                                                    <%--<input type="button" value='<%# Eval("IsSelect").ToString() == "没有" ? "选择" : "已选择" %>' class="inpu" onclick='ClickSign("<%# Eval("SupplierCode") %>    ")' />--%>
                                                                    <a href='TTWZPurchaseDecisionDetail.aspx?PurchaseCode=<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>&SupplierCode=<%# DataBinder.Eval(Container.DataItem,"SupplierCode") %>'>
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ChaKanBaoJia%>"></asp:Label></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseName" HeaderText="文件名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="SumApplyMoney" HeaderText="供应商报价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SupplierCode" HeaderText="供应商">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierName" HeaderText="供应商名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label>    
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"SupplierDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("SupplierDocumentName").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseMethod" HeaderText="采购方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="MarkTime" HeaderText="编制日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "MarkTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseEndTime" HeaderText="报价截止">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PurchaseEndTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseDocument" HeaderText="采购文件">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>    
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"PurchaseDocumentURL") %>' class="notTab" target="_blank"><%# DataBinder.Eval(Container.DataItem,"PurchaseDocument") %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="RowNumber" HeaderText="条数" Visible="false">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="Suggest" HeaderText="专家议建">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ZhuanJiaYiJian%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Suggest").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                        
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />

                <asp:HiddenField ID="HF_SupplierCode" runat="server" />
                <asp:HiddenField ID="HF_Suggest" runat="server" />
                <asp:Button ID="BT_HiddenButton" runat="server" Text="Button" style="display:none;" OnClick="BT_HiddenButton_Click" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
