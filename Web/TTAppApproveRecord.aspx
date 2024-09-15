<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAppApproveRecord.aspx.cs" Inherits="TTAppApproveRecord" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    

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
                                    <a href="TTAppWorkFlow.aspx" target="_parent">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <img src="ImagesSkin/return.png" alt="" width="29" height="31" />
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                </td>
                                                <td width="5">
                                                    <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                </td>
                                            </tr>
                                        </table>
                                    </a>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>
                        <br />
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <h3>
                                        <asp:Label ID="LB_WorkFlow" runat="server"></asp:Label></h3>
                                </td>
                            </tr>
                            <tr>
                                <td align="center">
                                    <asp:DataList ID="DataList1" runat="server" Width="90%" CellPadding="0" CellSpacing="0"
                                        ForeColor="#333333">
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <ItemTemplate>
                                            <table cellpadding="2" cellspacing="2" style="width: 90%" class="bian">
                                                <tr>
                                                    <td style="width: 90px; text-align: right;">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShenPiRen%>" />：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <a href='TTUserInforSimple.aspx?UserCode=<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            target="_blank">
                                                            <%# DataBinder.Eval(Container.DataItem,"UserName") %></a>
                                                    </td>
                                                    <td style="text-align: right;">
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,Operation%>" />：
                                                    </td>
                                                    <td style="text-align: left;">
                                                        <%# DataBinder.Eval(Container.DataItem,"Operation") %>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td style="text-align: right">
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,Comment%>" />：
                                                    </td>
                                                    <td colspan="3" style="text-align: left">
                                                        <%# DataBinder.Eval(Container.DataItem,"Content") %>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ItemTemplate>
                                        
                                        <ItemStyle CssClass="itemStyle" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    </asp:DataList>&nbsp;
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="LB_UserName" runat="server"  
                                        Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserCode" runat="server"  
                                        Visible="False"></asp:Label>
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
