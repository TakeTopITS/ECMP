<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTNoticeDoc.aspx.cs" Inherits="TTNoticeDoc" %>

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
          
            <table cellpadding="0" cellspacing="0" width="98%">
                <tr>
                    <td style="text-align: left; height: 10px;">
                        <table style="width: 100%">
                            <tr>
                                <td colspan="4" style="text-align: left; height: 2px;">
                                    <asp:DropDownList ID="DL_DocType" runat="server" DataTextField="Type" DataValueField="Type"
                                        Width="96px">
                                    </asp:DropDownList>
                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label>:<asp:TextBox ID="TB_HazyFind" runat="server" Width="208px"></asp:TextBox><asp:Button
                                        ID="BT_HazyFind" runat="server" CssClass="inpu" OnClick="BT_HazyFind_Click" Text="<%$ Resources:lang,MoHuChaXun%>" />
                                    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;<asp:HyperLink ID="HL_UploadDoc" runat="server"
                                        NavigateUrl="TTPublishNotice.aspx" Target="_blank">---><asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FaBuGongGao%>"></asp:Label></asp:HyperLink>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td style="width: 98%; text-align: left;">
                        <asp:Label ID="LB_DocOwner" runat="server" Font-Bold="True"  Width="184px"></asp:Label>
                         
                           <asp:Label ID="LB_UserCode" runat="server"  Visible="False" ></asp:Label>
                        <asp:Label ID="LB_UserName" runat="server" 
                            Visible="False"></asp:Label>
                        <asp:Label ID="LB_ProjectID" runat="server"  Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                            <tr>
                                <td width="7">
                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                <td>
                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                        <tr>

                                            <td width="8%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                            </td>
                                            <td width="10%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                            </td>
                                            <td width="32%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                            </td>
                                            <td width="15%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZuoZhe%>"></asp:Label></strong>
                                            </td>
                                            <td width="15%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShangChuanZhe%>"></asp:Label></strong>
                                            </td>
                                            <td width="20%" align="center">
                                                <strong>
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShangChuanShiJian%>"></asp:Label></strong>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td width="6" align="right">
                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                            </tr>
                        </table>
                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" GridLines="None" ShowHeader="false"
                            Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="20" Width="100%">
                            <Columns>
                                <asp:BoundColumn DataField="DocID" HeaderText="序号">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="DocType" HeaderText="类型">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                </asp:BoundColumn>
                                <asp:HyperLinkColumn DataNavigateUrlField="Address" DataNavigateUrlFormatString="{0}"
                                    DataTextField="DocName" HeaderText="文件名" Target="_blank">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="32%" />
                                </asp:HyperLinkColumn>
                                <asp:BoundColumn DataField="Author" HeaderText="作者">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                </asp:BoundColumn>
                                <asp:HyperLinkColumn DataNavigateUrlField="UploadManCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                    DataTextField="UploadManName" HeaderText="上传者" Target="_blank">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                </asp:HyperLinkColumn>
                                <asp:BoundColumn DataField="UploadTime" HeaderText="上传时间">
                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                </asp:BoundColumn>
                                <asp:BoundColumn DataField="Address" Visible="False"></asp:BoundColumn>
                            </Columns>
                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            <ItemStyle CssClass="itemStyle" />
                            
                        </asp:DataGrid>
                    </td>
                </tr>
            </table>
            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
