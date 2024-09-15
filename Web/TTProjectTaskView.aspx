<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectTaskView.aspx.cs"
    Inherits="TTProjectTaskView" %>

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

            aHandler();

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
                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,RenWuXiangXiXinXi%>"></asp:Label>
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
                <td valign="top">
                    <table width="98%">
                        <tr>
                            <td style="text-align: center; height: 18px;">
                                <asp:DataList ID="DataList1" runat="server" Height="1px" Width="100%" CellPadding="0"
                                    CellSpacing="0">
                                    <ItemTemplate>
                                        <table class="formBgStyle" style="width: 98%;" cellpadding="3" cellspacing="0">
                                            <tr>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"TaskID") %>
                                                </td>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label>:
                                                </td>
                                                <td style="width: 30%;" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"MakeManName") %>
                                                </td>
                                                <td style="width: 20%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%" class="formItemBgStyle" align="left">
                                                    <a href='<%#"TTProjectDetailView.aspx?ProjectID="+DataBinder.Eval(Container.DataItem,"ProjectID")%>'
                                                        target="_blank">
                                                        <%# DataBinder.Eval(Container.DataItem,"ProjectID") %></a>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label>:
                                                </td>
                                                <td colspan="5" style="text-align: left" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Task") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%;" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>:
                                                </td>
                                                <td style="width: 30%" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"EndDate","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YuSuan%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Budget") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; height: 18px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%; height: 18px" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Expense") %>
                                                </td>
                                                <td style="width: 10%; height: 18px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuSuanRenLi%>"></asp:Label>:
                                                </td>
                                                <td style="width: 30%; height: 18px" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"ManHour") %>
                                                </td>
                                                <td style="width: 10%; height: 18px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ShiJiRenLi%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%; height: 18px" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"RealManHour") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%;" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Priority") %>
                                                </td>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label>:
                                                </td>
                                                <td style="width: 30%;" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %>
                                                    %
                                                </td>
                                                <td style="width: 10%; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>:
                                                </td>
                                                <td style="width: 20%;" class="formItemBgStyle" align="left">
                                                    <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <ItemStyle />
                                </asp:DataList>
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
