<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZObjectBigList.aspx.cs" Inherits="TTWZObjectBigList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>大类列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DaLeiDaiMa%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;" valign="top">
                                    <table width="80%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <input type="button" class="inpuLong" value="列表导入" onclick="window.location.href = 'TTWZObjectBigEdit.aspx'" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaLeiShuoMing%>"></asp:Label>：<asp:TextBox ID="TXT_DLDesc" Width="350px" runat="server"></asp:TextBox>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BT_Save" CssClass="inpu" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Save_Click" />&nbsp;
                                        <asp:Button ID="BT_Cancel" CssClass="inpu" runat="server" Text="<%$ Resources:lang,QuXiao%>" OnClick="BT_Cancel_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
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
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaLeiDaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="68%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DaLeiShuoMing%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="60" ShowHeader="false"
                                                    Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                    <Columns>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            <HeaderTemplate>
                                                                <%--操作--%>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>

                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("DLCode")+"|"+Eval("DLName")+"|"+Eval("DLDesc") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>

                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="DLCode" HeaderText="大类代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <%--<asp:BoundColumn DataField="DLName" HeaderText="大类名称">
                                                    <HeaderStyle HorizontalAlign="Left" />
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DaLeiMingCheng%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# ShareClass.StringCutByRequire(Eval("DLName").ToString(), 190) %>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <%--<asp:BoundColumn DataField="DLDesc" HeaderText="大类说明">
                                                                <HeaderStyle HorizontalAlign="Left" />
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="74%" />
                                                            </asp:BoundColumn>--%>
                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="68%" />
                                                            <HeaderStyle HorizontalAlign="Left" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,DaLeiShuoMing%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>

                                                                <%# ShareClass.StringCutByRequire(Eval("DLDesc").ToString(), 30) %>
                                                                <%--<a href='TTWZObjectBigDetail.aspx?strDLCode=<%# DataBinder.Eval(Container.DataItem,"DLCode") %>'><%# ShareClass.StringCutByRequire(Eval("DLDesc").ToString(), 40) %></a>--%>
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
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_DLCode" runat="server" />
                <asp:HiddenField ID="HF_DLName" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Cancel" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
