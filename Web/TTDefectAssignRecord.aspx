<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTDefectAssignRecord.aspx.cs" Inherits="TTDefectAssignRecord" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">$(function () { if (top.location != self.location) { } else { CloseWebPage(); } });</script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <table cellpadding="0" cellspacing="0" width="100%" class="bian">
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FenPaiJiLu%>"></asp:Label>
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
                            <td align="center">
                                <table border="0" style="width: 80%">
                                    <tr>
                                        <td style="height: 44px; text-align: center">
                                            <asp:Label ID="LB_Title" runat="server" Font-Bold="False" Font-Names="Arial,宋体" Font-Size="16pt"></asp:Label>
                                            <br />

                                            (<asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>)

                                     <br />

                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:DataList ID="DataList2" runat="server" Width="100%" CellPadding="0" ForeColor="#333333">
                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                <ItemStyle BackColor="#EFF3FB" />
                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                <ItemTemplate>
                                                    <table style="width: 100%;" class="bian" cellpadding="4" cellspacing="0">
                                                        <tr>
                                                            <td style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiLuBianHao%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 15%; text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"ID") %>
                                                            </td>
                                                            <td style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LuXianBianHao%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 15%; text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"RouteNumber") %>
                                                            </td>
                                                            <td style="width: 15%; text-align: right;">
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                            </td>
                                                            <td style="width: 25%; font-size: 10pt; text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"Status") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GongZuoYaoQiu%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="3" style="text-align: left">
                                                                <b>
                                                                    <%# DataBinder.Eval(Container.DataItem,"Operation") %></b>
                                                            </td>
                                                            <td colspan="2" style="text-align: left">

                                                                <a href='TTRelatedDIYBusinessForm.aspx?RelatedType=ReqRecord&RelatedID=<%# DataBinder.Eval(Container.DataItem,"ID") %>&IdentifyString=<%#ShareClass .GetWLTemplateIdentifyString( ShareClass. getBusinessFormTemName("DefectRecord",Eval("ID").ToString ()))%>'>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:Label>

                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"BeginDate","{0:yyyy/MM/dd}") %>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,FenPaiRen%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left; font-size: 10pt">
                                                                <%# DataBinder.Eval(Container.DataItem,"AssignManName") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShouLiRen%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"OperatorCode") %>
                                                                <%# DataBinder.Eval(Container.DataItem,"OperatorName") %>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShouLiRenShiJian%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;">
                                                                <%# DataBinder.Eval(Container.DataItem,"OperationTime","{0:yyyy/MM/dd}") %>
                                                            </td>
                                                            <td style="text-align: right;">
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,QianJiLu%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left; font-size: 10pt">
                                                                <%# DataBinder.Eval(Container.DataItem,"PriorID") %>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right">
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GongZuoRiZhi%>"></asp:Label>：
                                                            </td>
                                                            <td colspan="5" style="text-align: left">
                                                                <b><%# DataBinder.Eval(Container.DataItem,"OperatorContent") %> </b>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td colspan="6" style="text-align: right; height: 15px;"></td>
                                                        </tr>
                                                    </table>
                                                </ItemTemplate>
                                            </asp:DataList>
                                        </td>
                                    </tr>
                                </table>
                                <br />
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
