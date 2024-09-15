<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDWeekWorkloadList.aspx.cs" Inherits="TTGDWeekWorkloadList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhouGongZuoLiangChaXun%>"></asp:Label>
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
                                            <td align="left" class="formItemBgStyle">
                                                <table class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label>：<asp:DropDownList ID="DropDownList2" runat="server"></asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：<asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>
                                                    </tr>
                                                </table>
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
                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="25%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,QuYu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="34%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HanJieXingShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="35%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HanJieDB%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="35%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,HanJieJieTou%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="35%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanXianChangDu%>"></asp:Label></strong>
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
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectAddress" HeaderText="地点">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
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
