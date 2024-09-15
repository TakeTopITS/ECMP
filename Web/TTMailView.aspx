<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailView.aspx.cs" Inherits="TTMailView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查看邮件</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            

        });

    </script>

</head>
<body>

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
                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                        </td>
                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanYouJian%>"></asp:Label>
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
                <td valign="top" style="padding: 10px 5px 10px 5px;">
                    <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                        <tr>
                            <td style="width: 69px" align="right" class="formItemBgStyle">
                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FaJianRen%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="From" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ShouJianRen%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="To" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChaoSong%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="CC" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <asp:TextBox ID="Title" runat="server" Width="300px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="formItemBgStyle">
                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YouJianGeShi%>"></asp:Label>:
                            </td>
                            <td align="left" class="formItemBgStyle">
                                <input id="HtmlCB" type="checkbox" runat="server" disabled="disabled" /><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HTMLGeShi%>"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" valign="top" class="formItemBgStyle">
                                <table style="width: 100%; table-layout: fixed;">
                                    <tr>
                                        <td style="width: 100%;">
                                            <strong>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,NeiRong%>"></asp:Label>: </strong>
                                    </tr>
                                </table>
                            </td>
                            <td class="formItemBgStyle">
                                <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Width="100%">
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                    <ItemTemplate>
                                        <table style="width: 100%;" cellpadding="4" cellspacing="0">
                                            <tr>
                                                <td style="width: 100%" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Body") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    
                                    <ItemStyle CssClass="itemStyle" />
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                </asp:DataList>
                                <br />
                            </td>
                        </tr>
                    </table>
                    <asp:Panel ID="Panel_Attachment" runat="server" Style="width: 100%;" Visible="False">
                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                            <tr>
                                <td style="width: 69px;" align="right" valign="top" class="formItemBgStyle">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YouJianFuJian%>"></asp:Label>:
                                </td>
                                <td align="left" class="formItemBgStyle">
                                    <table width="90%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="70%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianMing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WenJianLeiXing%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WenJianDaXiao%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="AttachView" runat="server" AutoGenerateColumns="False" Width="90%"
                                        DataKeyNames="AttachmentID" ShowHeader="false" CellPadding="4"
                                        ForeColor="#333333" GridLines="None">
                                        <FooterStyle ForeColor="White" BackColor="#507CD1" Font-Bold="True"></FooterStyle>
                                        <SelectedRowStyle Font-Bold="True" ForeColor="#333333" BackColor="#D1DDF1" BorderColor="CornflowerBlue" />
                                        <RowStyle CssClass="itemStyle" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="文件名称">
                                                <ItemTemplate>
                                                    <a href='<%#DataBinder.Eval(Container.DataItem,"Url") %>' target="_blank">
                                                        <%#DataBinder.Eval(Container.DataItem,"Name") %></a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" CssClass="itemBorder" Width="70%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件类型">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem,"Type") %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件大小">
                                                <ItemTemplate>
                                                    <%# (int)DataBinder.Eval(Container.DataItem,"Contain")/1024 %>KB
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BorderColor="CornflowerBlue" BackColor="White" BorderStyle="Solid"
                                            BorderWidth="1px" />
                                        <PagerStyle HorizontalAlign="Center"  />
                                        <EditRowStyle BorderColor="CornflowerBlue" BorderWidth="1px" BackColor="#2461BF" />
                                    </asp:GridView>
                                </td>
                            </tr>
                        </table>
                    </asp:Panel>
                    <br />
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
