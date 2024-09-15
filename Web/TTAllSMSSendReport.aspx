<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAllSMSSendReport.aspx.cs" Inherits="TTAllSMSSendReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
        <form id="form2" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div>
                        <table style="width: 980px;">
                            <tr>
                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DuanXinFaSongBaoBiao%>"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: left;">
                                    <table style="width: 98%;">

                                        <tr>
                                            <td style="text-align: right;">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ShouJiHao%>"></asp:Label>：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TB_MobileCode" runat="server" Width="190px"></asp:TextBox>
                                            </td>
                                            <td style="text-align: right;">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,RTXHao%>"></asp:Label>：
                                            </td>
                                            <td>
                                                <asp:TextBox ID="TB_RTXCode" runat="server" Width="190px"></asp:TextBox>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: right;" width="10%">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,FaSongKaiShiShiJian%>"></asp:Label>：
                                            </td>
                                            <td width="30%">

                                                <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                                    runat="server" TargetControlID="DLC_StartTime">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                            <td style="text-align: right;" width="15%">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FaSongJieShuShiJian%>"></asp:Label>：
                                            </td>
                                            <td width="20%">


                                                <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                    runat="server" TargetControlID="DLC_EndTime">
                                                </ajaxToolkit:CalendarExtender>
                                            </td>
                                            <td>&nbsp;</td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right;">
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td style="text-align: right;">&nbsp;
                                            </td>
                                            <td>
                                                <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                            <td>
                                                <a href="javascript:window.print()">
                                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left;" colspan="4">
                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZLDBMFSHSBYDBFSCG%>"></asp:Label></td>
                                            <td>&nbsp;</td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShouJiHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="33%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label></strong>
                                                        </td>

                                                        <td width="7%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="7%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BiaoZhi%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FaSongShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,RXTDaiMa%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,RXTZhuangTai%>"></asp:Label></strong>
                                                        </td>

                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True" PageSize="25">
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>

                                            <asp:BoundColumn DataField="Mobile" HeaderText="手机号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Msg" HeaderText="内容">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="33%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="State" HeaderText="状态">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="SendYorn" HeaderText="成功">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="SendTime" HeaderText="发送时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="UserRTXCode" HeaderText="RTXCode">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="RTXState" HeaderText="状态">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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
                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label ID="LB_PageIndex" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                    <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                    &nbsp;<asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
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
