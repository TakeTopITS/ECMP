<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsMainPlanBusinessObjectMaterialDetailDataReport.aspx.cs" Inherits="TTGoodsMainPlanBusinessObjectMaterialDetailDataReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



        });

        function preview1() {
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
                    <div>
                        <table width="100%">
                            <tr>
                                <td width="" align="right">
                                    <a href="#" onclick="preview1()">
                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                    </a>
                                </td>

                            </tr>
                        </table>
                        <!--startprint1-->
                        <table style="width: 1248px;">
                            <tr>
                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                    <br />
                                    <br />

                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YeWuDanCaiLiaoTongJiBaoBiao%>"></asp:Label>

                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%; text-align: center;">
                                    <table style="width: 100%;">
                                        <tr>
                                            <td style="text-align: center;">
                                                <asp:Label ID="LB_PlanVersion" runat="server"></asp:Label>
                                                <br />
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:CheckBox ID="CB_OnOrder" runat="server" Text="<%$ Resources:lang,ZaiTuLiang%>" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CB_OnProduction" runat="server" Text="<%$ Resources:lang,ZaiChanLiang%>" />
                                                        </td>
                                                        <td>
                                                            <asp:CheckBox ID="CB_OnLine" runat="server" Text="<%$ Resources:lang,ZaiXianLiang%>" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <br />
                                            </td>
                                        </tr>
                                        <tr style="display: none;">
                                            <td style="text-align: left;">
                                                <asp:Label ID="LB_UserCode" runat="server"
                                                    Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server"
                                                    Visible="False"></asp:Label>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                            <td></td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%;">
                                    <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>

                                                        <td width="10%" align="center"><strong>
                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YeWuLeiXing %>"></asp:Label></strong></td>
                                                        <td width="4%" align="center"><strong>
                                                            <asp:Label ID="Label80" runat="server" Text="ID"></asp:Label></strong></td>

                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XuQiuLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,KuChengLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ChuKuLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChaoLingLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,QianLiaoLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="7%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,YiCaiGouWeiRuKu%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TuiLiaoLiang%>"></asp:Label></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                        ShowHeader="false" Height="1px"
                                        Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="源类型">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetRelatedBusinessTypeAndName(Eval("RelatedType").ToString(),Eval("RelatedID").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="RelatedID" HeaderText="ID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="TotalRequireNumber" HeaderText="需求量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="库存量">
                                                <ItemTemplate>
                                                    <%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="TotalCheckOutNumber" HeaderText="出库量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="MoreThanCheckOutNumber" HeaderText="超领量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="LessThanCheckInNumber" HeaderText="欠料量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="已订购未入库量">
                                                <ItemTemplate>
                                                    <%#   GetGoodsNoCheckInNumberByHavePurchase(Eval("RelatedType").ToString(),Eval("RelatedID").ToString(),Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString(),Eval("TotalCheckInNumber").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="7%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="TotalReturnNumber" HeaderText="退料数量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                        </Columns>
                                        <ItemStyle CssClass="itemStyle" />
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                        </table>

                        <!--endprint1-->
                    </div>
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
