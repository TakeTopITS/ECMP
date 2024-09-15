<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMailDesktop.aspx.cs" Inherits="MailDesktop"
    ValidateRequest="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>邮件管理</title>
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

    <form id="form1" runat="server">
        <div id="AboveDiv">
            <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YouJianLieBiao%>"></asp:Label>
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
                    <td valign="top" style="padding: 5px 5px 5px 5px;">
                        <table width="98%" cellpadding="0" cellspacing="0">
                            <tr valign="top">
                                <td colspan="2">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="40%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,WenJianJiaMingCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YouJianZongShu%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YouJianShuLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WenJianJiaDaXiao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:GridView ID="FolderView" runat="server" AutoGenerateColumns="False" Width="100%"
                                        OnRowCommand="FolderView_RowCommand" OnRowDataBound="FolderView_RowDataBound"
                                        ShowHeader="false" OnRowDeleting="FolderView_RowDeleting" DataKeyNames="FolderID"
                                        CaptionAlign="Left" HorizontalAlign="Left" ShowFooter="True" CellPadding="4"
                                        GridLines="None" ForeColor="#333333">
                                        <%-- <FooterStyle ForeColor="White" BackColor="#507CD1" Font-Bold="True"></FooterStyle>--%>
                                        <SelectedRowStyle BorderColor="CornflowerBlue" />
                                        <RowStyle BackColor="#EFF3FB" />
                                        <Columns>
                                            <asp:TemplateField HeaderText="文件夹名称">
                                                <ItemTemplate>
                                                    <a href='TTViewMail.aspx?FolderID=<%#DataBinder.Eval(Container.DataItem,"FolderID") %>'>
                                                        <%#DataBinder.Eval(Container.DataItem,"Name") %></a>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Left" CssClass="itemBorder" Width="40%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="邮件总数">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem,"Total") %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="邮件数量">
                                                <ItemTemplate>
                                                    <%# DataBinder.Eval(Container.DataItem,"NoReader") %>
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="15%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="文件夹大小">
                                                <ItemTemplate>
                                                    <%# (int)DataBinder.Eval(Container.DataItem,"Contain")/1024 %>KB
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="10%" />
                                            </asp:TemplateField>
                                            <asp:TemplateField HeaderText="操作">
                                                <ItemTemplate>
                                                    <asp:HyperLink ID="EditBtn" Text="<%$ Resources:lang,ChongMingMing%>" Target="Desktop" runat="server" Visible='<%# (bool)DataBinder.Eval(Container.DataItem,"Flag") %>'
                                                        NavigateUrl='<%# "TTMailRenameFolder.aspx?FolderID=" + DataBinder.Eval(Container.DataItem,"FolderID")%>'></asp:HyperLink>&nbsp;&nbsp;&nbsp;
                                            <asp:ImageButton ID="DeleteBtn" runat="server" CommandName="delete" Visible='<%# (bool)DataBinder.Eval(Container.DataItem,"Flag") && ((int)DataBinder.Eval(Container.DataItem,"Total") > 0 ? false : true) %>'
                                                ImageUrl="~/Images/delete.gif" AlternateText="删除文件夹" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"FolderID") %>' />&nbsp;&nbsp;&nbsp;
                                                </ItemTemplate>
                                                <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="20%" />
                                            </asp:TemplateField>
                                        </Columns>
                                        <AlternatingRowStyle BackColor="White" />
                                        <PagerStyle HorizontalAlign="Center" />
                                        <EditRowStyle BorderColor="CornflowerBlue" BorderWidth="1px" BackColor="#2461BF" />
                                    </asp:GridView>
                                </td>
                            </tr>
                            <tr>
                                <td align="left">
                                    <asp:Button ID="NewFolderBtn" runat="server" Text="<%$ Resources:lang,XinJianWenJianJia%>" CssClass="inpu" OnClick="NewFolderBtn_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
