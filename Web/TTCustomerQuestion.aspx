<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTCustomerQuestion.aspx.cs"
    Inherits="TTCustomerQuestion" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () { if (top.location != self.location) { } else { CloseWebPage(); }

           

        });

    </script>

</head>
<body>

    <form id="form1" runat="server">
        <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <table width="100%" border="0" cellpadding="0" cellspacing="3" class="zi">
                    <tr>
                        <td width="18%" align="right" class="formItemBgStyle">
                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                        </td>
                        <td width="82%" class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_Company" runat="server" Style="width: 250px;"></asp:TextBox>
                            &nbsp;<font color="#FF0000">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formItemBgStyle">
                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LianXiRen%>"></asp:Label>：
                        </td>
                        <td width="82%" class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_ContactPerson" runat="server" Style="width: 100px;"></asp:TextBox>
                            &nbsp;<font color="#FF0000">*</font> &nbsp;&nbsp;</td>
                    </tr>
                    <tr>
                        <td align="right" class="formItemBgStyle">
                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_PhoneNumber" runat="server" Style="width: 150px;"></asp:TextBox>
                            &nbsp;<font color="#FF0000">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formItemBgStyle">Email：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_EMail" runat="server" Style="width: 220px;"></asp:TextBox>
                            &nbsp;<font color="#FF0000">*</font>
                        </td>
                    </tr>

                    <tr>
                        <td align="right" class="formItemBgStyle">
                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LianXiDiZhi%>"></asp:Label>：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_Address" runat="server" Style="width: 250px;"></asp:TextBox>
                            <font color="#FF0000">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formItemBgStyle">
                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YouZhengBianMa%>"></asp:Label>：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_PostCode" runat="server" Style="width: 100px;"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" class="formItemBgStyle">
                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WenTiLeiBie%>"></asp:Label>：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:DropDownList ID="DL_CustomerQuestionType" runat="server" Width="200px" DataTextField="Type"
                                DataValueField="Type" CssClass="DDList">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" class="formItemBgStyle">
                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WenTiMiaoShu%>"></asp:Label>：
                        </td>
                        <td class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_Question" runat="server" Rows="5" Style="width: 300px;" TextMode="MultiLine"></asp:TextBox>
                            &nbsp;<font color="#FF0000">*</font>
                        </td>
                    </tr>
                    <tr>
                        <td align="right" valign="top" class="formItemBgStyle">
                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YanZhengMa%>"></asp:Label>：</td>
                        <td align="left" class="formItemBgStyle" align="left">
                            <asp:TextBox ID="TB_CheckCode" runat="server" Style="width: 50px;"></asp:TextBox>
                            <asp:Image ID="IM_CheckCode" runat="server" Height="23px" src="TTCheckCode.aspx" Style="width: 100px;" />
                        </td>
                    </tr>
                    <tr>
                        <td class="formItemBgStyle"></td>
                        <td class="formItemBgStyle" align="left">
                            <asp:Button ID="BT_Summit" runat="server" CssClass="inpu" OnClick="BT_Summit_Click" Text="<%$ Resources:lang,TiJiao%>" />
                            <asp:Label ID="LB_Message" runat="server" ForeColor="Red"></asp:Label>
                        </td>
                    </tr>
                </table>
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
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
