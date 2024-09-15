<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectVendorView.aspx.cs"
    Inherits="TTProjectVendorView" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
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
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
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
                                            <table width="300" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShangZiLiao%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td align="left" style="padding: 5px 5px 5px 5px;">
                                <table width="90%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                    <tr>
                                        <td class="formItemBgStyle" rowspan="2">
                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="30%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>

                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px" ShowHeader="false"
                                                OnItemCommand="DataGrid2_ItemCommand" Width="100%" PageSize="5" GridLines="None"
                                                CellPadding="4" ForeColor="#333333">
                                                <Columns>
                                                    <asp:TemplateColumn HeaderText="代码">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_VendorCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"VendorCode") %>' CssClass="inpu" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="VendorName" HeaderText="名称">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                    </asp:BoundColumn>

                                                </Columns>
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <EditItemStyle BackColor="#2461BF" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                            </asp:DataGrid>
                                        </td>
                                        <td class="formItemBgStyle" style="width: 80%;">
                                            <asp:DataList ID="DataList2" runat="server" Height="1px" Width="100%" CellPadding="0"
                                                ForeColor="#333333">
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <ItemTemplate>
                                                    <table style="width: 100%;" class="bian" cellpadding="4" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongYingShangDaiMa%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 100px" align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"VendorCode") %>
                                                            </td>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongYingShangMingCheng%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"VendorName") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YingWenMing%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="5" style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"VendorEnglishName") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HangYeLeiXing%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 100px" align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                            </td>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuYaoLianXiRen%>"></asp:Label>：
                                                            </td>
                                                            <td align="left">
                                                                <%# DataBinder.Eval(Container.DataItem, "ContactName")%>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 135px; text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"SalesPerson") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right;">
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FaPiaoDiZhi%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"InvoiceAddress") %>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                            </td>
                                                            <td align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Currency") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YinHangZhangHao%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"BankAccount") %>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZheKouLv%>"></asp:Label>：
                                                            </td>
                                                            <td align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Discount") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,KaiHuYinHang%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Bank") %>
                                                            </td>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XinYongDengJi%>"></asp:Label>：
                                                            </td>
                                                            <td align="left">
                                                                <%# DataBinder.Eval(Container.DataItem,"CreditRate") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DianHua1%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Tel1") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DianHua2%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="style4">
                                                                <%# DataBinder.Eval(Container.DataItem,"Tel2") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChuanZhen%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Fax") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; text-align: right">E_Mail：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"EmailAddress") %>
                                                            </td>
                                                            <td></td>
                                                            <td></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WangZhi%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"WebSite") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="style4">
                                                                <%# DataBinder.Eval(Container.DataItem,"ZP") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right"></td>
                                                            <td style="height: 20px; text-align: left"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuoJia%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Country") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShengFen%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="style4">
                                                                <%# DataBinder.Eval(Container.DataItem,"State") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ChengShi%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"City") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiZhong%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left" colspan="5">
                                                                <%# DataBinder.Eval(Container.DataItem,"RegistrationAddressCN") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangXiDiZhiYing%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="5" style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"RegistrationAddressEN") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 100px; height: 20px; text-align: right">
                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"Comment") %>
                                                            </td>
                                                            <td style="height: 20px; text-align: right">
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JianLiRiQi%>"></asp:Label>：
                                                            </td>
                                                            <td style="height: 20px; text-align: left">
                                                                <%# DataBinder.Eval(Container.DataItem,"CreateDate") %>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                
                                                <ItemStyle CssClass="itemStyle" />
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                                    <td align="center" class="formItemBgStyle">
                                                        <asp:HyperLink ID="HL_RelatedContactInfor" runat="server" Enabled="False" Target="_blank">
                                                            ---&gt;<asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangGuanLianXiRen %>"></asp:Label>
                                                        </asp:HyperLink>
                                                    </td>
                                                </tr>
                                </table>
                                <br />
                            </td>
                        </tr>
                    </table>
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
