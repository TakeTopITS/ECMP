<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDWeldersList.aspx.cs" Inherits="TTGDWeldersList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>焊工列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HanGongLieBiao%>"></asp:Label>
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
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <input type="button" class="inpuLong" value="新增焊工" onclick="window.location.href = 'TTGDWeldersEdit.aspx'" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 100%;">
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
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HanGongHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FaBuRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenQingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,GongSiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZiGe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HanJieWeiZhiYi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="9%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HanJieWeiZhiEr%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
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
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='TTGDWeldersEdit.aspx?id=<%# DataBinder.Eval(Container.DataItem,"Welders") %>'>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></a>
                                                                    <asp:LinkButton ID="LB_Del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Welders") %>' CommandName="del" CssClass="notTab">
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label>
                                                                    </asp:LinkButton>
                                                                    <%--<asp:Button ID="Button1" CssClass="inpu" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"Welders") %>' CommandName="del" Text="删除" />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Welders" HeaderText="焊工号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PublicTime" HeaderText="发布日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="WelderName" HeaderText="名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RequestCode" HeaderText="申请号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CompanyName" HeaderText="公司名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Qualification" HeaderText="资格">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WeldPosition1" HeaderText="焊接位置1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WeldPosition2" HeaderText="焊接位置2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Remarks" HeaderText="备注">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                            </asp:BoundColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                    </asp:DataGrid>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
