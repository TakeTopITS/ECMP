<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectDetailView.aspx.cs"
    Inherits="TTProjectDetailView" %>

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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMuXinXi%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="center" style="padding-top: 5px;">
                                            <asp:HyperLink ID="HL_BusinessForm" runat="server" Text="<%$ Resources:lang,XiangGuanYeWuDan%>"></asp:HyperLink>

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding-top: 5px">
                                <asp:DataList ID="DataList1" runat="server" Height="1px" CellPadding="0" ForeColor="#333333"
                                    Width="99%">
                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                    <HeaderTemplate>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LiXiangRen%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XiangMuE%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,FeiYongHeSuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GongShiYuSuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,RenLiYuSuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KaiShiRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JieShuRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZhiDingRiQi%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                    </HeaderTemplate>
                                    <HeaderStyle Font-Bold="True" ForeColor="black" />
                                    <ItemTemplate>
                                        <table cellpadding="5" cellspacing="0" border="0" width="100%">
                                            <tr>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem ,"ProjectID") %><br />
                                                    <%#DataBinder .Eval (Container .DataItem ,"ProjectCode") %>
                                                </td>
                                                <td style="width: 25%; padding-left: 5px; text-align: left;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"ProjectName") %>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"UserName") %>
                                                </td>
                                                <td style="width: 8%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"ProjectAmount") %>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"Budget") %>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"ManHour") %>
                                                </td>
                                                <td style="width: 6%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem,"ManNumber") %>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder .Eval (Container .DataItem, "BeginDate","{0:yyyy/MM/dd}") %>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder.Eval(Container.DataItem, "EndDate", "{0:yyyy/MM/dd}")%>
                                                </td>
                                                <td style="width: 7%; text-align: center;" class="tdLeft">
                                                    <%#DataBinder.Eval(Container.DataItem, "MakeDate", "{0:yyyy/MM/dd}")%>
                                                </td>
                                                <td style="width: 5%; text-align: center;" class="tdRight">
                                                    <%#DataBinder .Eval (Container .DataItem, "Status") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 60px; text-align: center; font-size: 10pt;" class="tdLeft">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,XiangXiYaoQiu%>"></asp:Label>
                                                </td>
                                                <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                    <span style="font-size: 9pt"></span>
                                                    <%#DataBinder .Eval (Container .DataItem,"ProjectDetail") %>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="width: 60px; text-align: center; font-size: 10pt" class="tdLeft">
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YanShouBiaoZhun%>"></asp:Label>
                                                </td>
                                                <td colspan="10" style="text-align: left; padding-left: 5px" class="tdRight">
                                                    <span style="font-size: 9pt"></span>
                                                    <%#DataBinder .Eval (Container .DataItem,"AcceptStandard") %>
                                                </td>
                                            </tr>
                                        </table>
                                    </ItemTemplate>
                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                    <ItemStyle CssClass="itemStyle" />
                                </asp:DataList>
                                <table cellpadding="5" cellspacing="0" border="0" width="95%">
                                    <tr>
                                        <td colspan="11" class="tdTopLine">&nbsp;
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
