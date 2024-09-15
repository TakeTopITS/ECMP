<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseManagerList.aspx.cs" Inherits="TTWZPurchaseManagerList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购经理界面</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () {



        });



        function ClickReport(obj) {
            var url = "TTWZSelectorMember.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "HF_PurchaseCode" + "&ctrlName=" + "HF_UpLoaderCodeName", '选择专家', 800, 500);

            window.parent.document.getElementById("BT_Report").click();
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
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr style="display: none;">
                                            <td>
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShangJiLingDao%>"></asp:Label>：<asp:TextBox ID="TXT_UpLeader" runat="server" ReadOnly="true"></asp:TextBox>
                                                <asp:HiddenField ID="HF_UpLeader" runat="server" />
                                                &nbsp;<input type="button" value="选择" class="inpu" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_UpLeader', 'TXT_UpLeader')" />
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
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaiGouBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,TiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZongJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="price" CssClass="notTab">询价</asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="cancel" CssClass="notTab">询价取消</asp:LinkButton>
                                                                    <%--<asp:Button ID="Button1" runat="server" CssClass="inpu" Text="询价" CommandName="price" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# (Eval("Progress").ToString()=="报批" || Eval("Progress").ToString()=="批准") ? true : false %>' />--%>
                                                                    <%--<asp:Button ID="Button2" runat="server" CssClass="inpu" Text="呈报" CommandName="submit" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>' />--%>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="report" CssClass="notTab">呈报</asp:LinkButton>
                                                                    <%--<input type="button" value="呈报" class="inpu" onclick='ClickReport("<%# Eval("PurchaseCode") %>")' style='display:<%# Eval("Progress").ToString()=="报批" ? "block" : "none" %>' />--%>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="return" CssClass="notTab">退回</asp:LinkButton>
                                                                    <%--<asp:Button ID="Button3" runat="server" CssClass="inpu" Text="退回" CommandName="return" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# Eval("Progress").ToString()=="报批" ? true : false %>' />--%>

                                                                    <%--<asp:Button ID="Button4" runat="server" CssClass="inpu" Text="询价取消" CommandName="cancel" CommandArgument='<%# Eval("PurchaseCode") %>' Visible='<%# Eval("Progress").ToString()=="询价" ? true : false %>' />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseName" HeaderText="文件名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>
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
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
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
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PurchaseEndTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PurchaseDocument" HeaderText="采购文件">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouWenJian%>"></asp:Label>
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
                                                <asp:Label ID="LB_PurchaseSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
                <asp:HiddenField ID="HF_UpLoaderCodeName" runat="server" />
                <asp:Button ID="BT_Report" runat="server" Text="Button" OnClick="BT_Report_Click" Style="display: none;" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
