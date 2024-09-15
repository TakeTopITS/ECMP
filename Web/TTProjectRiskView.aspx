<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectRiskView.aspx.cs"
    Inherits="TTProjectRiskView" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
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

    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>

                    <table style="width: 100%;" cellpadding="0" cellspacing="0" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="240px" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%></td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuFengXian%>"></asp:Label>
                                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label><asp:Label ID="LB_UserName"
                                                            runat="server"  Height="20px"  Width="70px"
                                                            Visible="False"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td valign="top" style="padding: 5px 0px 5px 0px;">
                                <table style="width: 100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="text-align: center;">
                                            <asp:DataList ID="DataList1" runat="server" Width="98%" CellPadding="0" CellSpacing="0">
                                                <ItemTemplate>
                                                    <table class="bian" style="width: 100%;" cellpadding="4" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 130px; text-align: right;">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 100px; text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem ,"ID") %>
                                                            </td>
                                                            <td style="width: 128px; text-align: right;"></td>
                                                            <td style="text-align: center"></td>
                                                            <td style="text-align: right; width: 209px;"></td>
                                                            <td style="text-align: left"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 130px; text-align: right; height: 21px;">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="5" style="height: 21px; text-align: left;">
                                                                <%#DataBinder .Eval (Container .DataItem ,"Risk") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 130px; text-align: right;">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="5" style="text-align: left">
                                                                <%#DataBinder .Eval (Container .DataItem ,"Detail") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 130px; text-align: right;"></td>
                                                            <td colspan="5" style="text-align: left"></td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 130px; height: 20px; text-align: right;">
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>:
                                                            </td>
                                                            <td style="height: 20px; text-align: left;" colspan="2">
                                                                <%#DataBinder.Eval(Container.DataItem, "EffectDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td style="width: 83px; height: 20px; text-align: right;">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,FaXianRiQi%>"></asp:Label>：<td style="height: 20px; text-align: left; width: 212px;" colspan="2">
                                                                    <%#DataBinder .Eval (Container .DataItem ,"FindDate","{0:yyyy/MM/dd}") %>
                                                                </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="width: 130px; text-align: right;">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <%#DataBinder .Eval (Container .DataItem ,"Status") %>
                                                            </td>
                                                            <td colspan="2" style="text-align: center">
                                                                <span style="color: #0000ff;"><a href="TTDocumentTreeView.aspx?RelatedType=Risk&RelatedID=<%#DataBinder .Eval (Container .DataItem ,"ID")%>"
                                                                    target="_blank">
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiangGuanWenJian%>"></asp:Label></a>

                                                              
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td style="text-align: left;">
                                            <asp:Label ID="LB_RiskID" runat="server"  Visible="False"></asp:Label>
                                            <asp:Label ID="LB_ProjectID" runat="server"  Visible="False"></asp:Label>
                                        </td>
                                    </tr>

                                </table>
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
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
