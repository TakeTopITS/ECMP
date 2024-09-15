<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTSetMemberAgency.aspx.cs"
    Inherits="TTSetMemberAgency" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>直接下属设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
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
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29"><%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WoDeDaiLiRenSheZhi%>"></asp:Label>
                                                </td>
                                                <td width="5"><%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" width="50%" style="padding: 10px 0px 10px 5px; border-right: solid 1px #D8D8D8">
                                        <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7"><img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuanZe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="40%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiLiRenDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="50%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,DaiLiRenMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right"><img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" BorderColor="#394f66"
                                            ForeColor="#333333" ShowHeader="false"
                                            GridLines="None" OnItemCommand="DataGrid3_ItemCommand" Width="98%">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            
                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="选择">
                                                    <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="CB_AgencyStatus" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="AgencyCode" HeaderText="代理人代码">
                                                     <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="40%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="AgencyName" HeaderText="代理人名称">
                                                     <ItemStyle  CssClass="itemBorder" HorizontalAlign="Center" Width="50%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                    <td width="50%" align="left" style="padding: 5px 0px 0px 5px; " valign="top">
                                        <table style="width: 98%; height: 53px" cellpadding="4" cellspacing="0">
                                            <tr>
                                                <td style="width: 50%;padding: 5px 0px 0px 5px;"
                                                    valign="top" align="left">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DLSPLXLB%>"></asp:Label>：</strong>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="left" style="width: 50%; padding: 5px 0px 0px 5px;"
                                                    valign="top">
                                                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_WFType" runat="server" CssClass="inpuLong" Text='<%# DataBinder.Eval(Container.DataItem,"Type") %>'/>
                                                        </ItemTemplate>
                                                    </asp:Repeater>
                                                    <asp:Label ID="LB_UserCode" runat="server" ></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </ContentTemplate>
        </asp:UpdatePanel>
        <div style="position: absolute; left: 50%; top: 50%;">
            <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                <ProgressTemplate>
                    <img src="Images/Processing.gif" alt="Loading,please wait..." /></ProgressTemplate>
            </asp:UpdateProgress>
        </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
