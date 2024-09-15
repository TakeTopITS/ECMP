<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSelectorSupplierDecision.aspx.cs" Inherits="TTWZSelectorSupplierDecision" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供应商</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script type="text/jscript" language="javascript">
        //多选择按钮判断
        function chooseUpdate() {
            var str = "";
            $("input[name=dlCode]").each(function () {
                if ($(this).attr("checked")) {
                    str = str + $(this).attr("id") + ","; // 整个以,隔开
                }
            });
            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                clickMember(str);
            }
        }

        function clickMember(resultList) {

            if (resultList != "" && resultList != undefined) {

                window.parent.document.getElementById("HF_Supplier").value = resultList;
                //$("#HF_Supplier").val(resultList);
                window.parent.document.getElementById("BT_Supplier").click();

            }
            CloseLayer();
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
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
                                                    <div>
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="4%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouBianMa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="15%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="36%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZJXZCGYSSL%>"></asp:Label></strong>
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
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    <ItemTemplate>
                                                                        <input id='<%# Eval("SupplierCode") %>,<%# Eval("SupplierName") %>' type="radio" name="dlCode" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SupplierCode" HeaderText="供应商">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <%--<asp:BoundColumn DataField="SupplierName" HeaderText="供应商名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BaoJiaWenJian%>"></asp:Label>    
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <a href='<%# DataBinder.Eval(Container.DataItem,"DocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("DocumentName").ToString(), 190) %></a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SelectCount" HeaderText="专家选择此供应商数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="36%" />
                                                                </asp:BoundColumn>
                                                                <%--<asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    <ItemTemplate>
                                                                        <input id='<%# Eval("SupplierCode") %>' type="radio" checked='<%# Eval("IsSelect") == "没有" ? "false" : "true" %>' name="dlCode" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseName" HeaderText="文件名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SumApplyMoney" HeaderText="总价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="SupplierCode" HeaderText="供应商">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseMethod" HeaderText="采购方式">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="MarkTime" HeaderText="编制日期">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseEndTime" HeaderText="报价截止">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PurchaseDocument" HeaderText="采购文件">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="RowNumber" HeaderText="条数" Visible="false">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Suggest" HeaderText="专家议建">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                </asp:BoundColumn>--%>
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
                                            <tr>
                                                <td class="formItemBgStyle">
                                                    <div style="text-align: left">
                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input id="btnOk" class="inpu" onclick="return chooseUpdate()" type="button" value="确定" />
                                                        &nbsp;
                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                            type="button" value="关闭" />
                                                    </div>
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

        <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
