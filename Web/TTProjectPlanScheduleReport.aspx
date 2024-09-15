<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectPlanScheduleReport.aspx.cs" Inherits="TTProjectPlanScheduleReport" %>

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
    <form id="form1" runat="server">
        <div>
            <table style="width:100%;">
                <tr>
                    <td style="width:40%; text-align:left;">
                        <asp:LinkButton ID="LinkButton_Up" runat="server" OnClick="LinkButton2_Click"> <<< 上一页 </asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;   
                        <asp:LinkButton ID="LinkButton_Down" runat="server" OnClick="LinkButton1_Click"> >>> 下一页 </asp:LinkButton>
                        &nbsp;&nbsp;&nbsp;&nbsp;   
                    </td>
                    <td style="text-align:right;">
                        <a href="#" onclick="preview1()">
                            <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                    </td>
                </tr>
            </table>
        </div>
       
        <div>
            <!--startprint1-->
            <asp:Label ID="LB_ReportTable" runat="server" Text="this is table string"></asp:Label>
            <!--endprint1-->
        </div>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
