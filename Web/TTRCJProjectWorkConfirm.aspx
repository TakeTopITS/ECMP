<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTRCJProjectWorkConfirm.aspx.cs" Inherits="TTRCJProjectWorkConfirm" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>确认实际工作</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }
    </style>


    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

            aHandler();

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
                    <div id="AboveDiv">
                        <table id="Table4" cellpadding="0" width="100%" cellspacing="0" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">确认工作量登记日志
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="left">
                                                <table width="180" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td>
                                                            <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">返回</asp:LinkButton>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 5px 5px 5px 5px" valign="top" width="100%">
                                    <table align="center" border="1" cellpadding="0" cellspacing="0" width="96%">
                                        <tr>
                                            <td>
                                                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" ShowHeaderWhenEmpty="True" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" OnRowDataBound="GridView2_RowDataBound">
                                                    <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                                                    <Columns>
                                                        <asp:BoundField DataField="ID" HeaderText="运算序号" />
                                                        <asp:BoundField DataField="ItemNo" HeaderText="序号" />
                                                        <asp:BoundField DataField="ItemName" HeaderText="定额号" />
                                                        <asp:BoundField DataField="WorkYear" HeaderText="工作年份" />
                                                        <asp:BoundField DataField="WorkMonth" HeaderText="工作月份" />
                                                        <asp:BoundField DataField="WorkNum" HeaderText="工作确认量" DataFormatString="{0:N3}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ComprehensivePriceAdjust" HeaderText="综合取费调整价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="TaxesPriceAdjust" HeaderText="税费调整价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceDeviceActual" HeaderText="设备实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMainMaterialActual" HeaderText="主材实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceWageActual" HeaderText="人工实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMaterialActual" HeaderText="材料实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemPriceMachineActual" HeaderText="机械实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemComprehensiveFeeActual" HeaderText="综合取费实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ItemTaxesActual" HeaderText="税费实际合价" DataFormatString="{0:N2}" HtmlEncode="False" />
                                                        <asp:BoundField DataField="ChangedByWho" HeaderText="登记人员" />
                                                        <asp:BoundField DataField="ChangedTime" HeaderText="登记时间" />
                                                        <asp:BoundField DataField="ChangedMemo" HeaderText="说明" />
                                                    </Columns>
                                                    <EditRowStyle BackColor="#999999" />
                                                    <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                                    <PagerSettings Mode="NextPreviousFirstLast" />
                                                    <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                                    <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                                                    <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                                    <SortedAscendingCellStyle BackColor="#E9E7E2" />
                                                    <SortedAscendingHeaderStyle BackColor="#506C8C" />
                                                    <SortedDescendingCellStyle BackColor="#FFFDF8" />
                                                    <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                                                </asp:GridView>
                                            </td>
                                        </tr>

                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 40%; top: 40%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="请稍候，处理中..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>

