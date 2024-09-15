<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTTrainingRecordEmpView.aspx.cs" Inherits="TTTrainingRecordEmpView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>培训记录信息</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
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
                    <div id="AboveDiv">
                        <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian" align="left">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PeiXunJiLuXinXi%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                                        <tr>
                                            <td style="padding-left: 5px;">
                                                                        <table align="left" cellpadding="0" cellspacing="0" width="100%">
                                                                            <tr>
                                                                                <td>
                                                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                                        width="100%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                                    <tr>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong></td>
                                                                                                        <td width="9%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShenFenZhengHao%>"></asp:Label></strong></td>
                                                                                                        <td width="6%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingMing%>"></asp:Label></strong></td>
                                                                                                        <td width="4%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,XingBie%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,PeiXunXiangMu%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PeiXunYiJu%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JuBanDanWei%>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PeiXunDiDian%>"></asp:Label></strong></td>
                                                                                                        <td width="20%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,PeiXunNeiRong%>"></asp:Label></strong></td>
                                                                                                        <td width="13%" align="center">
                                                                                                            <strong>
                                                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,PeiXunRiQi%>"></asp:Label></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                                                                        OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="15" Width="100%" ShowHeader="false">
                                                                                        <Columns>
                                                                                            <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="IDCard" HeaderText="身份证号">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="UserName" HeaderText="姓名">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Gender" HeaderText="性别">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingProject" HeaderText="培训项目">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingAccord" HeaderText="培训依据">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingUnit" HeaderText="举办单位">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingAddress" HeaderText="培训地点">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingContent" HeaderText="培训内容">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="TrainingTime" HeaderText="培训日期" DataFormatString="{0:yyyy-MM-dd}">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="13%" />
                                                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
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
                                                                        </table>
                                            </td>
                                        </tr>
                        </table>
                    </div>
                </ContentTemplate>
                <Triggers>
                </Triggers>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
