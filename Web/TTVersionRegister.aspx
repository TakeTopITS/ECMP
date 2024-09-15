<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTVersionRegister.aspx.cs"
    Inherits="TTVersionRegister" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        a:link {
            font-size: 12px;
            text-decoration: none;
            color: #000000;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

        });

    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <div style="position: relative; top: 70px;">
                        <table style="width: 980px">
                            <tr>
                                <td style="width: 980px; height: 40px; text-align: center;">

                                    <asp:ImageButton ID="IMB_Logo" runat="server" ImageUrl="~/Logo/logo.gif" OnClick="IMB_Logo_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 980px; height: 40px; text-align: center;">
                                    <span style="font-size: 10pt">
                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,QJXMDXLHFSGSQKF%>"></asp:Label>
                                    </span>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 980px; text-align: center; height: 216px;">
                                    <center>
                                        <asp:Label ID="LB_ErrorMsg" runat="server" ></asp:Label>
                                        <br />
                                        <br />
                                        <table style="width: 560px; text-align: left;">
                                            <tr style="font-size: 10pt">
                                                <td style="width: 100px; text-align: right;">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LB_MySN" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2" style="height: 15px; text-align: right"></td>
                                            </tr>
                                            <tr>
                                                <td></td>
                                                <td style="text-align: left; height: 21px;">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,QJNSDDZCMSRXMDKZRHDJZCAN%>"></asp:Label><span style="font-size: 10pt"><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuCe%>"></asp:Label>
                                                    </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuWuQi%>"></asp:Label>
                                                </td>
                                                <td>
                                                    <asp:Label ID="LB_ServerName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuCeMa%>"></asp:Label>
                                                </td>
                                                <td style="height: 1px; color: #006699; text-decoration: underline;">
                                                    <asp:TextBox ID="TB_RegisterCode" runat="server" Style="width: 80%;"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right">&nbsp;</td>
                                                <td>
                                                    <asp:Button ID="BT_Register" runat="server" Text="<%$ Resources:lang,ZhuCe%>" Width="55px" OnClick="BT_Register_Click" /><span
                                                        style="font-size: 10pt"> </span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right">&nbsp;</td>
                                                <td>
                                                    <br />
                                                    <asp:Label ID="LB_LicenseNumber" runat="server" Font-Size="9pt" ForeColor="Red" Width="78%"></asp:Label>
                                                </td>
                                            </tr>
                                           
                                            <tr>
                                                <td style="text-align: left; height: 17px;" colspan="2"></td>
                                            </tr>
                                            <tr>

                                                <td colspan="2" align="center"><span style="font-size: 10pt">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:ImageButton ID="IMB_Copyright" runat="server" Width="24" Height="24" ImageUrl="~/ImagesSkin/copyright.png"/></td>
                                                            <td>
                                                                <asp:Label ID="LB_Copyright" runat="server" Text="Copyright© 泰顶拓鼎（TakeTop Software） 2006-2026 <a href=https://www.taketopits.com>www.taketopits.com</a>"></asp:Label></td>
                                                        </tr>
                                                    </table>


                                                </span></td>
                                            </tr>
                                        </table>
                                    </center>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 980px; text-align: center; height: 26px;">&nbsp;</td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
