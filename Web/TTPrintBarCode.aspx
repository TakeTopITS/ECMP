<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTPrintBarCode.aspx.cs" Inherits="TTPrintBarCode" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>

    <script type="text/javascript" language="javascript">
        function printpage11() {
            document.getElementById("print").style.display = "none";
            document.getElementById("print0").style.display = "none";
            window.print()
            CloseLayer();
        }

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div id="printDiv">


            <asp:Literal ID="LT_Result" runat="server"></asp:Literal>

            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="4">
                <ItemTemplate>
                    <table>
                        <tr>
                            <td>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("BarCode") %>' /><br />
                                <%# Eval("BusinessCode") %>
                            </td>
                        </tr>
                        <tr>
                            <td align="Left">
                                <%# Eval("BusinessName") %>
                            </td>
                        </tr>
                        <tr>
                            <td class="formItemBgStyle">&nbsp;
                            </td>
                            <td>&nbsp; </td>

                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>


        </div>

        <div id="divOver" style="text-align: center">
            <br />
            <p class="noprint">
                <input id="print" type="button" class="btn" value="确认打印" onclick="printpage11();" />
                <input id="print0" type="button" value="关闭" onclick="CloseLayer();" class="btn" />
            </p>
        </div>


    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>

