<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractFormView.aspx.cs" Inherits="TTConstractFormView" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            font-family: 微软雅黑,宋体;
            font-size: 1em;
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview1() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

    </script>
</head>
<body>
    <center>
        <form id="form2" runat="server">
            <div style="position: relative; top: 10px;">
                <table width="100%">
                    <tr>
                        <td width="" align="right">
                            <a href="#" onclick="preview1()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                            </a>
                        </td>
                    </tr>
                </table>
                <!--startprint1-->
                <table style="width: 980px;">
                    <%-- <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                            <table width="100%">
                                <tr>

                                    <td style="height: 100px; font-size: xx-large; text-align: center; vertical-align: middle;">

                                        <asp:Image ID="IM_SaleContractHead" runat="server" ImageUrl="Logo/FormHead.png" Width="100%" />

                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>--%>
                    <tr>
                        <td style="text-align: center; width: 100%;">
                            <asp:DataList ID="DataList20" runat="server" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td colspan="3" style="text-align: center; font-size: xx-large; padding-bottom: 40px;">

                                                <%#DataBinder.Eval(Container.DataItem, "Type")%>
                                                
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label1" runat="server" Text="合同编号"></asp:Label>：
                                                <%#DataBinder.Eval(Container.DataItem, "ConstractCode")%>
                                            </td>

                                            <td style="text-align: left" colspan="2">
                                                <%#DataBinder.Eval(Container.DataItem, "ConstractName")%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label6" runat="server" Text="供方"></asp:Label>：
                                                <%#DataBinder.Eval(Container.DataItem, "PartA")%>
                                            </td>

                                            <td style="text-align: left" colspan="2">
                                                <asp:Label ID="Label9" runat="server" Text="签订地点"></asp:Label>：
                                                  <%#DataBinder.Eval(Container.DataItem, "Exception")%>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td style="text-align: left;">
                                                <asp:Label ID="Label10" runat="server" Text="需方"></asp:Label>：
                                                <%#DataBinder.Eval(Container.DataItem, "PartB")%>
                                            </td>

                                            <td style="text-align: left" colspan="2">
                                                <asp:Label ID="Label11" runat="server" Text="签订时间"></asp:Label>：
                                               <%#DataBinder.Eval(Container.DataItem, "SignDate", "{0:yyyy/MM/dd}")%>
                                            </td>
                                        </tr>

                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>

                    <tr>
                        <td style="text-align: center; width: 100%;">
                            <asp:DataList ID="DataList1" runat="server" Width="100%" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td style="text-align: left;">

                                                <%#DataBinder.Eval(Container.DataItem, "MainContent")%>
                                            </td>


                                        </tr>

                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                </table>
                <!--endprint1-->
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
