<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTViewMail.aspx.cs" Inherits="TTViewMail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>查看邮件列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

            aHandler();

        });

    </script>

</head>
<body>
    <form id="form1" runat="server">
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
                                            <asp:Label ID="LB_Folder" runat="server" Font-Bold="False" Font-Size="10pt" Text="<%$ Resources:lang,WenJianJia%>"></asp:Label>
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
                <td style="padding: 5px 5px 5px 5px;">
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
                                                    <td width="5%" align="center">
                                                        <strong></strong>
                                                    </td>
                                                    <td width="35%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label> </strong>
                                                    </td>
                                                    <td width="30%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FaJianRen%>"></asp:Label> </strong>
                                                    </td>
                                                    <td width="15%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label> </strong>
                                                    </td>
                                                    <td width="15%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,YouJianDaXiao%>"></asp:Label> </strong>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td width="6" align="right">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:GridView ID="MailView" runat="server" AutoGenerateColumns="False" Width="100%"
                                    ShowHeader="false" DataKeyNames="MailID" CellPadding="4" ForeColor="#333333"
                                    GridLines="None">
                                    <%-- <FooterStyle ForeColor="White" BackColor="#507CD1" Font-Bold="True"></FooterStyle>--%>
                                    <SelectedRowStyle BorderColor="CornflowerBlue" />
                                    <RowStyle BackColor="#EFF3FB" />
                                    <Columns>
                                        <asp:TemplateField>
                                            <ItemTemplate>
                                                <asp:CheckBox ID="checkMail" runat="server" Checked="false" />
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="主题">
                                            <ItemTemplate>
                                                <a href='TTMailReader.aspx?MailID=<%# DataBinder.Eval(Container.DataItem,"MailID") %>&FolderID=<%# DataBinder.Eval(Container.DataItem,"FolderID") %>'>
                                                    <%# DataBinder.Eval(Container.DataItem,"Title") %></a>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="发件人">
                                            <ItemTemplate>
                                                <a href='TTMailReader.aspx?MailID=<%# DataBinder.Eval(Container.DataItem,"MailID") %>&FolderID=<%# DataBinder.Eval(Container.DataItem,"FolderID") %>'>
                                                    <%# DataBinder.Eval(Container.DataItem,"FromAddress") %>
                                                </a>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="创建时间">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem,"SenderDate")%>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="邮件大小">
                                            <ItemTemplate>
                                                <%# DataBinder.Eval(Container.DataItem,"Contain") %>B&nbsp;<asp:Image runat="server"
                                                    ID="AttachmentFlag" ImageUrl="Images/attach.gif" Visible='<%# (bool)DataBinder.Eval(Container.DataItem,"AttachmentFlag") %>' />
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                        </asp:TemplateField>
                                    </Columns>
                                    <AlternatingRowStyle BackColor="White" />
                                    <PagerStyle HorizontalAlign="Center"  />
                                    <EditRowStyle BorderColor="CornflowerBlue" BorderWidth="1px" BackColor="#2461BF" />
                                </asp:GridView>
                            </td>
                        </tr>
                        <tr style="line-height: 2;">
                            <td align="left" style="height: 25px">
                                <asp:CheckBox ID="CheckMail" runat="server" Text="<%$ Resources:lang,XuanZeSuoYouYouJian%>" Width="100%" AutoPostBack="true"
                                    OnCheckedChanged="CheckMail_CheckedChanged" />
                            </td>
                            <td align="right" style="height: 25px">
                                <asp:Button ID="DeleteBtn" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="DeleteBtn_Click" />&nbsp;
                            <asp:Button ID="MoveBtn" runat="server" Text="<%$ Resources:lang,YiDongDao%>" CssClass="inpu" OnClick="MoveBtn_Click" /><asp:DropDownList
                                ID="FolderList" runat="server" Width="220px">
                            </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
