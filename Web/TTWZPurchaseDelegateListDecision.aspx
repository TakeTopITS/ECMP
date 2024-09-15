<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseDelegateListDecision.aspx.cs" Inherits="TTWZPurchaseDelegateListDecision" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购文件-采购决策</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">

        $(function () { 

           

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
                    <div id="AboveDiv">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouJueCe%>"></asp:Label>
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
                                <td>
                                    <table class="formBgStyle">
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,CaiGouJueCe%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BiaoDuanXuanZe%>"></asp:Label>：
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BiaoDuanYi%>"></asp:Label>：<asp:TextBox ID="TXT_SupplierCode1" runat="server" Width="50"></asp:TextBox><asp:Button ID="Button2" runat="server" Text="<%$ Resources:lang,XuanZe%>" CssClass="inpu" />&nbsp;
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiaoDuanEr%>"></asp:Label>：<asp:TextBox ID="TXT_SupplierCode2" runat="server" Width="50"></asp:TextBox><asp:Button ID="Button3" runat="server" Text="<%$ Resources:lang,XuanZe%>" CssClass="inpu" />&nbsp;
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BiaoDuanSan%>"></asp:Label>：<asp:TextBox ID="TXT_SupplierCode3" runat="server" Width="50"></asp:TextBox><asp:Button ID="Button4" runat="server" Text="<%$ Resources:lang,XuanZe%>" CssClass="inpu" />&nbsp;
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="BT_Decision" runat="server" Text="<%$ Resources:lang,JueCe%>" CssClass="inpu" Enabled="true"  />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JueCeYiJian%>"></asp:Label>：<asp:TextBox ID="TXT_Suggest" runat="server" TextMode="MultiLine" Width="600px" Height="50px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JueCeRen%>"></asp:Label>：<asp:TextBox ID="TXT_ExpertCode" runat="server" Width="50"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JueCeRiQi%>"></asp:Label>：<asp:TextBox ID="TextBox1" runat="server" Width="50"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                type="button" value="关闭" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
