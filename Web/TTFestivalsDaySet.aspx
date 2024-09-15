<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTFestivalsDaySet.aspx.cs" Inherits="TTFestivalsDaySet" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style>
        .festivalsset {
            display: flex;
        }

        .year-war {
            flex: 0 200px;
        }

        .year label {
            width: 80px;
        }

        .year select {
            width: 120px;
        }

        .festivals select {
            width: 100%;
            height: 610px;
        }

        .datas {
            flex: 1;
            padding-left: 20px;
        }

        .moth select {
            width: 120px;
        }

        #cal_days td, #cal_exchange td {
            vertical-align: middle;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:HiddenField ID="hid_exchange_date" runat="server"></asp:HiddenField>
                <asp:HiddenField ID="hid_year_date" runat="server"></asp:HiddenField>
                <div id="AboveDiv">
                    <table id="AboveTable" cellpadding="0" width="100%" cellspacing="0" class="bian">
                        <tr>
                            <td colspan="2" height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <table width="345" border="0" align="left" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="29">
                                                        <%-- <img src="ImagesSkin/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                    </td>
                                                    <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FESTIVALSDAYTITLE%>"></asp:Label>
                                                    </td>
                                                    <td width="5">
                                                        <%--    <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td style="padding: 5px 5px 5px 5px" valign="top" align="left">
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td style="text-align: left;" colspan="2">
                                            <table style="width: 100%;" cellpadding="0" cellspacing="0">
                                                <tr>
                                                    <td width="30%">
                                                        <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 100%;">
                                                            <tr>
                                                                <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,FESTIVALSDAYYEAR%>"></asp:Label>：
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="ddl_year" runat="server" AutoPostBack="True" CssClass="DDList" OnSelectedIndexChanged="ddl_year_SelectedIndexChanged"></asp:DropDownList>
                                                                </td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:Label ID="Label5" runat="server" Text="复制到"></asp:Label></td>
                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                    <asp:DropDownList ID="ddl_copy" runat="server" AutoPostBack="True" CssClass="DDList"></asp:DropDownList></td>
                                                                <td style="text-align: center;" class="formItemBgStyle">
                                                                    <asp:Button ID="btn_copy" runat="server" Text="复制" OnClick="btn_copy_Click" />
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,FESTIVALSDAY%>"></asp:Label>：
                                                                </td>
                                                                <td class="formItemBgStyle festivals" style="text-align: left;" colspan="4">
                                                                    <asp:ListBox ID="lb_festivals" runat="server" DataTextField="Type" DataValueField="SortNumber" AutoPostBack="True" OnSelectedIndexChanged="lb_festivals_SelectedIndexChanged"></asp:ListBox>
                                                                </td>
                                                            </tr>
                                                        </table>

                                                    </td>
                                                    <td align="center" style="padding: 0px 0px 0px 5px;">
                                                        <div id="AssetListDivID" style="width: 100%; height: 800px; overflow: auto;">
                                                            <table class="formBgStyle" cellpadding="3" cellspacing="0" style="width: 100%;">
                                                                <tr>
                                                                    <td style="width: 80px; text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FESTIVALSDAYMONTH%>"></asp:Label>：
                                                                    </td>
                                                                    <td style="text-align: left;" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="ddl_moths" runat="server" CssClass="DDList" AutoPostBack="True" OnSelectedIndexChanged="ddl_moths_SelectedIndexChanged">
                                                                            <asp:ListItem Value="1" Text="一月"></asp:ListItem>
                                                                            <asp:ListItem Value="2" Text="二月"></asp:ListItem>
                                                                            <asp:ListItem Value="3" Text="三月"></asp:ListItem>
                                                                            <asp:ListItem Value="4" Text="四月"></asp:ListItem>
                                                                            <asp:ListItem Value="5" Text="五月"></asp:ListItem>
                                                                            <asp:ListItem Value="6" Text="六月"></asp:ListItem>
                                                                            <asp:ListItem Value="7" Text="七月"></asp:ListItem>
                                                                            <asp:ListItem Value="8" Text="八月"></asp:ListItem>
                                                                            <asp:ListItem Value="9" Text="九月"></asp:ListItem>
                                                                            <asp:ListItem Value="10" Text="十月"></asp:ListItem>
                                                                            <asp:ListItem Value="11" Text="十一月"></asp:ListItem>
                                                                            <asp:ListItem Value="12" Text="十二月"></asp:ListItem>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label2" runat="server" Text="节日"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:Calendar ID="cal_days" runat="server" ShowNextPrevMonth="False" ShowTitle="False" Height="300px" Width="100%" OnSelectionChanged="Calendar1_SelectionChanged" OnDayRender="Calendar1_DayRender"></asp:Calendar>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label4" runat="server" Text="调休"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left;">
                                                                        <asp:Calendar ID="cal_exchange" runat="server" ShowNextPrevMonth="False" ShowTitle="False" Height="300px" Width="100%" OnSelectionChanged="cal_exchange_SelectionChanged" OnDayRender="cal_exchange_DayRender"></asp:Calendar>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </table>
                                            <br />

                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                    </table>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>

