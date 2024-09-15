<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMWinResultView.aspx.cs" Inherits="TTBMWinResultView" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

    </script>

</head>
<body>
    <center>
        <form id="form1" runat="server">
             <div id="AboveDiv">
            <table cellpadding="0" cellspacing="0" width="100%" align="left" class="bian">
                <tr>
                    <td align="left" style="padding-top: 5px; width: 100%" colspan="2">
                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                            <tr style="color: #000000">
                                <td align="center" class="formItemBgStyle">
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAn%>"></asp:Label>：
                                    <asp:Label ID="lbl_BidRemark" runat="server"></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center" style="padding-top: 5px; width: 100%">
                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                            <tr>
                                <td align="center" class="formItemBgStyle">
                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ChengBaoShang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="45%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuanJiaPingBiaoJiLu%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                                    <strong>&nbsp;&nbsp;</strong>
                                                                </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,TouBiaoZhuangTai%>"></asp:Label></strong></td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px" Width="98%" CellPadding="4" ForeColor="#333333"
                                        GridLines="None" ShowHeader="false">
                                        <ItemStyle CssClass="itemStyle" />
                                        <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <Columns>
                                            <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="供应商">
                                                <ItemTemplate>
                                                    <%# GetBMSupplierInfoName(Eval("SupplierCode").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="专家评标记录">
                                                <ItemTemplate>
                                                    <%# GetBMSupBidByExpResult(Eval("ID").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="BiddingDate" HeaderText="投标日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:BoundColumn>
                                             <asp:TemplateColumn HeaderText="发起流程">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        <ItemTemplate>
                                                            <a href='TTBMBidPlanRelatedWorkflowListView.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"AnnInvitationID") %>&SupplierID=<%# DataBinder.Eval(Container.DataItem,"SupplierCode") %>' target="_blank">报价列表
                                                            </a>
                                                        </ItemTemplate>
                                                        <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                            HorizontalAlign="Center" />
                                                    </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="中标状态">
                                                <ItemTemplate>
                                                    <%# GetBMSupplierBidStatus(Eval("BidStatus").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" ForeColor="Blue" />
                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                    HorizontalAlign="Center" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                         
                            <tr style="color: #000000">
                                <td align="center" class="formItemBgStyle">
                                 <%--   <br />
                                    <br />
                                    <a onclick="javascript:window.history.back();">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FanHui%>"></asp:Label>
                                    </a>--%>

                                        <asp:Label ID="lbl_BidObjects" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lbl_EnterCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="lbl_count" runat="server" Visible="False"></asp:Label>
                                    <asp:TextBox ID="TB_DepartString" runat="server" Visible="False"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
                 </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
