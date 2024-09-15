<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTConstractDIYQueryReport.aspx.cs" Inherits="TTConstractDIYQueryReport" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <%--    <style type="text/css">
        #AboveDiv {
            min-width: 2200px;
            width: expression (document.body.clientWidth <= 2200? "2200px" : "auto" ));
        }
    </style>--%>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview() {
            bdhtml = window.document.body.innerHTML;
            sprnstr = "<!--startprint1-->";
            eprnstr = "<!--endprint1-->";
            prnhtml = bdhtml.substr(bdhtml.indexOf(sprnstr) + 18);
            prnhtml = prnhtml.substring(0, prnhtml.indexOf(eprnstr));
            window.document.body.innerHTML = prnhtml;
            window.print();
            document.body.innerHTML = bdhtml;
            return false;
        }

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
                    <div id="AboveDiv" style="padding: 5px 5px 5px 5px;">
                        <div style="text-align: left;">
                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td style="text-align: right; width: 10%;" class="formItemBgStyle">
                                        <asp:Label ID="Label2" runat="server" Text="SQLCode"></asp:Label>：
                                    </td>
                                    <td class="formItemBgStyle" style="width: 80%;">
                                        <asp:TextBox ID="TB_SQLCode" runat="server" Width="99%" Height="600px" TextMode="MultiLine"></asp:TextBox>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right; width: 10%;">&nbsp;</td>
                                    <td class="formItemBgStyle" style="width: 80%; text-align: left;">
                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YGZYGDMCYAQKLBNSYDeleteUpdateDropInsertAlterYuJu%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right; width: 10%;">&nbsp;</td>
                                    <td class="formItemBgStyle" style="width: 80%;">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                </td>
                                                <td align="center" width="100px">
                                                    <asp:Button ID="BT_ExportToExcel" runat="server" CssClass="inpu" OnClick="BT_ExportToExcel_Click" Text="<%$ Resources:lang,DaoChuDaoExcel%>" />
                                                </td>
                                                <td width="140px"><a href="#" onclick="preview()">
                                                    <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                </a></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <br />
                        <!--startprint1-->

                        <table width="100%" cellpadding="0" cellspacing="0">
                            <tr>
                                <td colspan="2" style="width: 100%; height: 80px; font-size: xx-large;" align="center">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongChaXunBaobiao%>"></asp:Label>
                                    <br />
                                </td>
                            </tr>

                            <tr>
                                <td align="left">
                                    <asp:Label ID="Label3" Text="<%$ Resources:lang,ZongFengShu%>" runat="server"></asp:Label>
                                    :
                                    <asp:Label ID="LB_CopyNumber" runat="server"></asp:Label>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="LB_PrintTime" runat="server"></asp:Label>
                                </td>
                            </tr>

                            <tr>
                                <td colspan="2">
                                    <asp:DataGrid ID="DataGrid1" runat="server" CellPadding="4" ForeColor="#333333" GridLines="Both" Height="1px" ShowHeader="true" Width="100%" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center">
                                    </asp:DataGrid>
                                    <br />
                                    <br />
                                </td>
                            </tr>
                        </table>
                        <!--endprint1-->
                    </div>

                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_ExportToExcel" />
                </Triggers>
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
