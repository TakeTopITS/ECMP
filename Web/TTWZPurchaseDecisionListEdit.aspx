<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseDecisionListEdit.aspx.cs" Inherits="TTWZPurchaseDecisionListEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购评标</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <%--    <script src="js/allAHandler.js"></script>--%>
    <script language="javascript">

        $(function () { 



        });

        // 选择供应商
        function OpenPurchaseDecisionDetail(tag) {
            var url = "TTWZPurchaseDecisionDetail.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + id + "&ctrlName=" + name, '选择决策', 900, 500);	

        }
 
        function LoadParentLit() {


            if (navigator.userAgent.indexOf("Firefox") >= 0) {


                window.parent.LoadProjectList();

            }
            else {


                window.parent.LoadProjectList();

            }

            CloseLayer();
        }



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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouPingBiao%>"></asp:Label>
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

                                    <table width="70%" cellpadding="0" cellspacing="0" class="formBgStyle">

                                        <tr>
                                            <td class="formItemBgStyle">

                                                <asp:Literal ID="LT_PurchaseDocument" runat="server"></asp:Literal>


                                            </td>
                                            <td class="formItemBgStyle">

                                                <asp:Literal ID="LT_AssessmentDocument" runat="server"></asp:Literal>

                                            </td>
                                            <td class="formItemBgStyle">

                                                <asp:Literal ID="LT_Supplier1" runat="server"></asp:Literal>

                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Literal ID="LT_Supplier2" runat="server"></asp:Literal>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Literal ID="LT_Supplier3" runat="server"></asp:Literal>
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Literal ID="LT_Supplier4" runat="server"></asp:Literal>
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Literal ID="LT_Supplier5" runat="server"></asp:Literal>
                                            </td>
                                            <td class="formItemBgStyle">
                                                <asp:Literal ID="LT_Supplier6" runat="server"></asp:Literal>
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
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZBXZCYPBJL%>"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label>：<asp:TextBox ID="TXT_PurchaseCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Button ID="BT_Assessment" runat="server" Text="<%$ Resources:lang,PingBiao%>" CssClass="inpu" Enabled="true" OnClick="BT_Assessment_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,PingBiaoYiJian%>"></asp:Label>：<asp:TextBox ID="TXT_Suggest" runat="server" TextMode="MultiLine" Width="600px" Height="50px"></asp:TextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiaoDuanXuanZe%>"></asp:Label>：
                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,BiaoDuanYi%>"></asp:Label>：
                                                <asp:DropDownList ID="DL_Supplier1" runat="server" DataTextField="SupplierName" DataValueField="SupplierCode" >
                                                </asp:DropDownList>
                                                <%-- <asp:TextBox ID="TXT_Supplier1" runat="server" Width="80"></asp:TextBox><asp:Button ID="Button2" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier1_Click" />&nbsp;--%>
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiaoDuanEr%>"></asp:Label>：
                                                 <asp:DropDownList ID="DL_Supplier2" runat="server" DataTextField="SupplierName" DataValueField="SupplierCode">
                                                 </asp:DropDownList>
                                                <%--  <asp:TextBox ID="TXT_Supplier2" runat="server" Width="80"></asp:TextBox>--%>
                                                <%--    <asp:Button ID="Button3" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier2_Click" />&nbsp;--%>
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,BiaoDuanSan%>"></asp:Label>：
                                                  <asp:DropDownList ID="DL_Supplier3" runat="server" DataTextField="SupplierName" DataValueField="SupplierCode">
                                                  </asp:DropDownList>
                                                <%-- <asp:TextBox ID="TXT_Supplier3" runat="server" Width="80"></asp:TextBox><asp:Button ID="Button4" runat="server" Text="▼" CssClass="inpu" OnClick="BT_SelectSupplier3_Click" />&nbsp;--%>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,PingBiaoRen%>"></asp:Label>：<asp:TextBox ID="TXT_ExpertCode" runat="server" Width="80"></asp:TextBox>

                                             <%--   <asp:HiddenField ID="HF_Supplier1" runat="server" />
                                                <asp:HiddenField ID="HF_Supplier2" runat="server" />
                                                <asp:HiddenField ID="HF_Supplier3" runat="server" />--%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
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
