<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWorkPlanOneStepTransferCurrentMonthPlanToTask.aspx.cs" Inherits="TTWorkPlanOneStepTransferCurrentMonthPlanToTask" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        <!--
        body {
            font-size: 14px;
            line-height: 21px;
            color: #333333;
            bgcolor: #FFFFFF;
            margin-top: 10px;
        }

        .huizi {
            font-size: 44px;
            color: #666666;
        }
        -->
    </style>

    <script type="text/javascript" language="javascript">

        $(function () { if (top.location != self.location) { } else { CloseWebPage(); } });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="697" height="220" border="0" align="center" cellpadding="0" cellspacing="0">
            <tr>
                <td valign="top">
                    <table width="100%" border="0" cellspacing="4" cellpadding="3">
                        <tr>
                            <td class="huizi" style="text-align: center; padding-top: 100px; padding-bottom: 30px; color: red; ">
                                <br />
                                <br />

                                <asp:Label ID="LB_Message" Style="line-height:150%" runat="server"></asp:Label>
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
