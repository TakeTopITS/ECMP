<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchasePurchaseList.aspx.cs" Inherits="TTWZPurchasePurchaseList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购工程师</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           


        });

        // 选择供应商
        function SelectSupplier() {
            var strPurchaseCode = $("#HF_PurchaseCode").val();
            if (strPurchaseCode == "" || strPurchaseCode == null) {
                alert("请先选择采购文件！");
                return;
            }

            var url = "TTWZSelectorSupplierDecision.aspx?PurchaseCode=" + strPurchaseCode;

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "HF_Supplier" , '选择供应商', 800, 500);
         
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <asp:HiddenField ID="HiddenField1" runat="server" />
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PurchaseCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*</font>
                                                        </td>
                                                    </tr>
                                                    <tr style="display:none;">
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_SupplierName" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" class="inpu" value="手动选择" id="BT_SupplierSelect" onclick="SelectSupplier()" />

                                                            <asp:HiddenField ID="HF_Supplier" runat="server" />
                                                            <asp:Button ID="BT_Supplier" runat="server" Text="Button" OnClick="BT_Supplier_Click" Style="display: none;" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle"><asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:FileUpload ID="FUP_PurchaseOfferDocument" runat="server" />&nbsp;
                                                            <asp:Button ID="BT_Upload" runat="server" Text="<%$ Resources:lang,ShangChuan%>" CssClass="inpu" OnClick="BT_Upload_Click" /><br />
                                                            <asp:Repeater ID="RPT_PurchaseDocument" runat="server" OnItemCommand="RPT_PurchaseDocument_ItemCommand">
                                                                <HeaderTemplate>
                                                                    <table>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <tr>
                                                                        <td>
                                                                            <a href='<%# Eval("DocumentUrl") %>' class="notTab"><%# Eval("DocumentName") %></a>
                                                                        </td>
                                                                        <td>
                                                                            <%--<asp:LinkButton ID="LB_Del" CommandName="del" CommandArgument='<%# Eval("ID") %>' runat="server">删除</asp:LinkButton>--%>
                                                                            <asp:Button ID="Button4" runat="server" CssClass="inpu" CommandName="del" CommandArgument='<%# Eval("ID") %>' Text="<%$ Resources:lang,ShanChu%>" />
                                                                        </td>
                                                                    </tr>
                                                                </ItemTemplate>
                                                                <FooterTemplate>
                                                                    </table>
                                                                </FooterTemplate>
                                                            </asp:Repeater>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 1500px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="8%" align="center">
                                                                            <strong><asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong><asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong><asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,TiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong><asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong><asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZongJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong><asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <%--<td width="7%" align="center">
                                                                            <strong>进度</strong>
                                                                        </td>--%>
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
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="edit" CssClass="notTab" Visible='<%# (Eval("Progress").ToString()=="询价" || Eval("Progress").ToString()=="评标") ? true : false %>'>
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:Button ID="Button1" runat="server" CssClass="inpu" Text="编辑" CommandName="edit" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# (Eval("Progress").ToString()=="询价" || Eval("Progress").ToString()=="评标") ? true : false %>' />--%>
                                                                    <%--<a href='TTWZPurchaseDetail.aspx?PurchaseCode=<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>'>明细</a>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="assess" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="询价" ? true : false %>'>
                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,PingBiao%>"></asp:Label></asp:LinkButton>--%>
                                                                    <%--<asp:Button ID="Button3" runat="server" CssClass="inpu" Text="评标" CommandName="assess" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# Eval("Progress").ToString()=="询价" ? true : false %>' />--%>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="apply" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="评标" ? true : false %>'>
                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BaoJia%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:Button ID="Button2" runat="server" CssClass="inpu" Text="报价" CommandName="apply" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# Eval("Progress").ToString()=="评标" ? true : false %>' />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseName" HeaderText="文件名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseMethod" HeaderText="采购方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="MarkTime" HeaderText="编制日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "MarkTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseEndTime" HeaderText="报价截止">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PurchaseEndTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseDocument" HeaderText="采购文件">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# Eval("PurchaseDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("PurchaseDocument").ToString(), 190) %></a>

                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="RowNumber" HeaderText="条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalMoney" HeaderText="总价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
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
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
                <asp:HiddenField ID="HF_PurchaseManager" runat="server" />
                <asp:HiddenField ID="HF_Decision" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Supplier" />
                <asp:PostBackTrigger ControlID="BT_Upload" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
