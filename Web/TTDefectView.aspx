<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDefectView.aspx.cs" Inherits="TTDefectView" %>


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
                                                <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QueXianXiangXiXinXi%>"></asp:Label>
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
                    <td align="center" width="100%">

                        <br />
                        <asp:DataList ID="DataList1" runat="server" CellPadding="0" ForeColor="#333333" Width="90%">
                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                            <ItemTemplate>
                                <table width="100%" cellpadding="5" cellspacing="0" class="bian">
                                    <tr>
                                        <td style="width: 12.5%; text-align: right;">
                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                        </td>
                                        <td style="width: 12.5%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"DefectID") %>
                                        </td>
                                        <td style="width: 12.5%; text-align: right;">
                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                        </td>
                                        <td style="width: 12.5%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"DefectType") %>
                                        </td>
                                        <td style="width: 12.5%; text-align: right;">
                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                        </td>
                                        <td style="width: 12.5%" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"ApplicantCode") %><%# DataBinder.Eval(Container.DataItem,"ApplicantName") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,QueXianMingCheng%>"></asp:Label>：
                                        </td>
                                        <td style="" colspan="5" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"DefectName") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QueXianNeiRong%>"></asp:Label>：
                                        </td>
                                        <td colspan="5" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"DefectDetail") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>：
                                        </td>
                                        <td colspan="5" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"AcceptStandard") %>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: right;">
                                            <span style="font-size: 9pt">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoQiuJieShuShiJian%>"></asp:Label>：</span>
                                        </td>
                                        <td align="left">
                                            <%# DataBinder.Eval(Container.DataItem, "DefectFinishedDate", "{0:yyyy/MM/dd}")%>
                                        </td>
                                        <td style="text-align: right;">
                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                        </td>
                                        <td style="width: 86px" align="left">
                                            <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                        </td>
                                        <td style="width: 86px" align="left">
                                            <a href='TTDefectAssignRecord.aspx?DefectID=<%# DataBinder.Eval(Container.DataItem,"DefectID") %>'
                                                target="_blank">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
                                            </a>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>

                            <ItemStyle BackColor="#EFF3FB" />
                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                        </asp:DataList>
                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>&nbsp;
                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>

                    </td>
                </tr>
            </table>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
