<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTReqRelatedDocView.aspx.cs"
    Inherits="TTReqRelatedDocView" %>

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


            <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                <tr>
                    <td height="31" class="page_topbj">
                        <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                            <tr>
                                <td align="left">
                                    <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="29">
                                                <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                            <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangGuanWenDang%>"></asp:Label>
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
                    <td>
                        <table width="90%">
                            <tr>
                                <td style="text-align: right">
                                    <span><strong>
                                        <asp:Label ID="LB_UserName" runat="server"
                                            Visible="False"></asp:Label>
                                        <asp:Label ID="LB_ProjectID" runat="server"  Visible="False"></asp:Label>

                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label> </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 30px">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaLei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="40%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        Height="1px" PageSize="20" Width="100%" CellPadding="4" ForeColor="#333333" ShowHeader="false"
                                        GridLines="None">
                                        <Columns>
                                            <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="RelatedType" HeaderText="大类">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                                DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="Author" HeaderText="作者">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
