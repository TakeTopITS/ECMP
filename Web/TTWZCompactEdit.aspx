<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactEdit.aspx.cs" Inherits="TTWZCompactEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合同编辑</title>
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongBianJi%>"></asp:Label>
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
                        <td style="padding: 0px 5px 5px 5px;" valign="top">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td valign="top" style="padding-top: 5px;">
                                        <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                    <table class="formBgStyle" width="100%">
                                                        <tr>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_CompactCode" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XuFangBianMa%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_ProjectCode" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_SupplierCode" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_CompactName" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_CompactText" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_MarkTime" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoQianRiQi%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_SingTime" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_CompactMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouLiaoJinE%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_CollectMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QingKuanJinE%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_RequestMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MoQingJinE%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_NotRequestMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_BeforePayMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuFuYuE%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_BeforePayBalance" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:TextBox ID="TXT_Compacter" runat="server"></asp:TextBox>
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label>：</td>
                                                            <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TXT_ControlMoney" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: center" class="formItemBgStyle" colspan="8">
                                                                <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;&nbsp;
                                                                <input type="button" value="返回" id="BT_Return" class="inpu" onclick="window.location.href = 'TTWZCompactList.aspx'" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </div>
        <asp:HiddenField ID="HF_CompactCode" runat="server" />
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
