<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectDailyWorkBonusReport.aspx.cs"
    Inherits="TTProjectDailyWorkBonusReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            font-size: medium;
        }
    </style>
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
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <div>
                <table style="width: 980px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <br />
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:Label ID="LB_Project" runat="server"></asp:Label>
                            <br />
                            <br />
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongZuoJiangJinBaoBiao%>"></asp:Label><br />
                            <span class="style1">
                                <br />
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YGZRZHSCWDJS%>"></asp:Label></span>
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%; text-align: left;">
                            <table style="width: 90%;">
                                <tr>
                                    <td style="text-align: left;">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>
                                         
                                         <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label> 
                                        <asp:Label ID="LB_UserName" runat="server" 
                                            Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td>
                                        <a href="javascript:window.print()">
                                            <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 100%;">
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                <tr>
                                    <td width="7">
                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                    <td>
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>

                                                <td width="15%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                </td>
                                                <td width="20%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong>
                                                </td>
                                                <td width="65%" align="center">
                                                    <strong>
                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiangJin%>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="6" align="right">
                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" ShowHeader="false"
                                Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="25" Width="100%"
                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                <Columns>
                                    <asp:BoundColumn DataField="UserCode" HeaderText="代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Bonus" HeaderText="奖金">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="65%" />
                                    </asp:BoundColumn>
                                </Columns>
                                
                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 1200px; text-align: center;">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                            &nbsp;<asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label> ,<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label>
                        <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                            &nbsp;<asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
