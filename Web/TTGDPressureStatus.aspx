<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGDPressureStatus.aspx.cs" Inherits="TTGDPressureStatus" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
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
                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShiYaBaoZhuangTai%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <div style="display:none;">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>：<asp:DropDownList ID="DDL_GDProject" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_GDProject_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                </div>
                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShiYaBaoHao%>"></asp:Label>：<asp:DropDownList ID="DDL_Pressure" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DDL_Pressure_SelectedIndexChanged"></asp:DropDownList>&nbsp;
                                                <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />&nbsp;
                                                
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 100%;">

                                                    <asp:Repeater ID="RT_List" runat="server">
                                                        <HeaderTemplate>
                                                            <table width="100%">
                                                                <tr align="center">
                                                                    <td rowspan="3">Testloop No.</td>
                                                                    <td colspan="4">Welding</td>
                                                                    <td colspan="4">RT</td>
                                                                    <td colspan="8">Other NDT</td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td colspan="2">BW</td>
                                                                    <td colspan="2">Not BW</td>
                                                                    <td colspan="2">100% RT</td>
                                                                    <td colspan="2">Not 100% RT</td>
                                                                    <td colspan="2">PT</td>
                                                                    <td colspan="2">MT</td>
                                                                    <td colspan="2">PWHT</td>
                                                                    <td colspan="2">PMI</td>
                                                                </tr>
                                                                <tr align="center">
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                    <td>Plan</td>
                                                                    <td>Comp.</td>
                                                                </tr>
                                                        </HeaderTemplate>
                                                        <ItemTemplate>
                                                            <tr align="center">
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PressurePackNo")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "BWPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "BWComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "NotBWPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "NotBWComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "RTPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "RTComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "NotRTPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "NotRTComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PTPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PTComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "MTPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "MTComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PWHTPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PWHTComp")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PMIPlan")%></td>
                                                                <td><%#DataBinder.Eval(Container.DataItem, "PMIComp")%></td>
                                                            </tr>
                                                        </ItemTemplate>
                                                        <FooterTemplate>
                                                            <tr align="center">
                                                                <td>Total：<asp:Label ID="Label1" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label2" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label3" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label4" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label5" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label6" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label7" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label8" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label9" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label10" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label11" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label12" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label13" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label14" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label15" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label16" runat="server" Text="0"></asp:Label></td>
                                                                <td><asp:Label ID="Label17" runat="server" Text="0"></asp:Label></td>
                                                            </tr>
                                                            <tr align="center">
                                                                <td>Precent Progress：</td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label18" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label19" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label20" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label21" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label22" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label23" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label24" runat="server" Text="0"></asp:Label></td>
                                                                <td>&nbsp;</td>
                                                                <td><asp:Label ID="Label25" runat="server" Text="0"></asp:Label></td>
                                                            </tr>
                                                            </table>
                                                        </FooterTemplate>
                                                    </asp:Repeater>
                                                    
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
