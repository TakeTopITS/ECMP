<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSelectorDLCode.aspx.cs" Inherits="TTWZSelectorDLCode" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>大类列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>

    <script type="text/jscript" language="javascript">
        //复选框全选
        function ChooseAll(item) {

            $("input[name=dlCode]").each(function () {
                if (item.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }

        //单选择按钮判断
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

        function clickMember(str) {

            var strs = str.split('|');
            var id = getUrlParam("ctrlId");
            var name = getUrlParam("ctrlName");
            if (id != "") {
                window.parent.document.getElementById(id).value = str;
            }
            if (name != "") {
                window.parent.document.getElementById(name).value = str;
            }
            CloseLayer();

        }

        ////多选择按钮判断
        //function chooseUpdate() {
        //    var str = "";

        //    $("input[name=dlCode]").each(function () {
        //        if ($(this).attr("checked")) {
        //            str = str + $(this).attr("id") + ","; // 整个以,隔开
        //        }
        //    });
        //    if (str == "") {
        //        alert('请选择记录项！');
        //        return false;
        //    }
        //    else {
        //        window.returnValue = str;
        //        window.close();
        //        return true;
        //    }
        //}

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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaLeiLieBiao%>"></asp:Label>
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
                                                                                    <input id='checkAll' type="checkbox" onclick="ChooseAll(this)" /></strong>
                                                                            </td>
                                                                            <td width="10%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaLeiDaiMa%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="30%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="56%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLeiShuoMing%>"></asp:Label></strong>
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
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        &nbsp;
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <input id='<%#Eval("DLCode") %>' type="checkbox" name="dlCode" />
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="DLCode" HeaderText="大类代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <%--<asp:BoundColumn DataField="DLName" HeaderText="大类名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("DLName").ToString(), 30) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <%--<asp:BoundColumn DataField="DLDesc" HeaderText="大类说明">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="56%" />
                                                                </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="56%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaLeiShuoMing%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("DLDesc").ToString(), 30) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn Visible="false">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhongLei2%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ShowCollect" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ZhanKai%>" CommandName="operate" CommandArgument='<%#Eval("DLCode") %>' />

                                                                        <asp:DataGrid ID="DG_MaterialZL" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                            Width="100%">
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="ZLCode" HeaderText="中类代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <%--<asp:BoundColumn DataField="ZLName" HeaderText="中类名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>--%>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                    <HeaderTemplate>
                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhongLeiMingCheng%>"></asp:Label>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass.StringCutByRequire(Eval("ZLName").ToString(), 30) %>
                                                                                    </ItemTemplate>
                                                                                </asp:TemplateColumn>
                                                                                <%--<asp:BoundColumn DataField="ZLDesc" HeaderText="中类说明">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>--%>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                    <HeaderTemplate>
                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhongLeiShuoMing%>"></asp:Label>
                                                                                    </HeaderTemplate>
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass.StringCutByRequire(Eval("ZLDesc").ToString(), 30) %>
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
                                            <tr>
                                                <td class="formItemBgStyle">
                                                    <div style="text-align: center">
                                                        <input id="btnOk" class="inpu" onclick="return chooseUpdate()" type="button" value="确定" />
                                                        &nbsp;&nbsp;&nbsp;&nbsp;
                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false; CloseLayer();"
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
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
