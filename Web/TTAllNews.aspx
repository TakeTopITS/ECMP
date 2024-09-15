<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAllNews.aspx.cs" Inherits="TTAllNews" %>

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
                <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                    <tr>
                        <td colspan="2" height="31" class="page_topbj">
                            <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="left">
                                        <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                            <tr>
                                                <td width="29">
                                                    <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                </td>
                                                <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ChaKanSuoYouXinWen%>"></asp:Label>
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
                        <td width="200">
                            <table width="100" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td>
                                        <asp:ListBox ID="LLB_News" runat="server" Height="850px" Width="220px" DataTextField="Title"
                                            CssClass="listborder" margin="-2" DataValueField="ID" OnSelectedIndexChanged="LLB_News_SelectedIndexChanged"
                                            AutoPostBack="True"></asp:ListBox>
                                    </td>
                                </tr>
                            </table>
                        </td>
                        <td align="left" valign="top">
                            <table width="100%" cellpadding="5" cellspacing="0">
                                <tr>
                                    <td style="font-weight: bold; color: #394f66; background-image: url('ImagesSkin/titleBG.jpg')">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XinWenBiaoTi%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TB_NewsTitle" runat="server"></asp:TextBox>
                                                </td>
                                                <td>&nbsp;</td>
                                                <td>
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XinWenNeiRong%>"></asp:Label>：
                                                </td>
                                                <td>
                                                    <asp:TextBox ID="TB_NewsContent" runat="server"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="BT_Find" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Find_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuTi%>"></asp:Label>：<asp:Label ID="LB_ID" runat="server"></asp:Label>
                                        &nbsp;<asp:Label ID="LB_Title" runat="server"></asp:Label>
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:DataList ID="DataList1" runat="server">
                                            <ItemTemplate>
                                                <table style="width: 100%;">
                                                    <tr>
                                                        <td style="width: 100%;">
                                                            <%#DataBinder .Eval (Container .DataItem ,"Content") %>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YueDuGuoDeRen%>"></asp:Label>:<br />
                                        <asp:Repeater ID="Repeater1" runat="server">
                                            <ItemTemplate>
                                                <asp:Label Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' runat="server"></asp:Label>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </td>
                                </tr>
                            </table>
                            <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
