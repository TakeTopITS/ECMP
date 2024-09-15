<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractMainContentView.aspx.cs" Inherits="TTConstractMainContentView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview() {
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
        <form id="form1" runat="server">
            <div style="width: 100%;">

                <table style="width: 90%; text-align: right;">
                    <tr>

                        <td style="padding-left: 10px;">
                            <a href="#" onclick="preview()">
                                <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                            </a>
                        </td>

                    </tr>
                </table>

                <!--startprint1-->
                <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                    Width="900px">
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                    <HeaderTemplate>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <table cellpadding="4" cellspacing="0" width="100%">
                            <tr>
                                <td style="text-align: left;">
                                    <%#DataBinder .Eval (Container .DataItem ,"MainContent") %>
                                </td>
                            </tr>
                        </table>
                    </ItemTemplate>
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                    <ItemStyle CssClass="itemStyle" />
                </asp:DataList>
                <!--endprint1-->
            </div>
        </form>
    </center>
</body>
</html>
