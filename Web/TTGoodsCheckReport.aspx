
<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsCheckReport.aspx.cs"
    Inherits="TTGoodsCheckReport" %>

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
                   <div id="AboveDiv">
                        <table style="width: 980px;">

                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                </td>
                                <td>
                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                </td>
                                <td colspan="4">
                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：</td>
                                <td>
                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="190px"></asp:TextBox>
                                </td>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：</td>
                                <td colspan="4">
                                    <asp:TextBox ID="TB_Spec" runat="server" Width="99%"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: right;" width="10%">
                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                </td>
                                <td width="30%">

                                    <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2"
                                        runat="server" TargetControlID="DLC_StartTime">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                                <td style="text-align: right;" width="15%">
                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                </td>
                                <td colspan="4" width="20%">
                                    <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                        runat="server" TargetControlID="DLC_EndTime">
                                    </ajaxToolkit:CalendarExtender>
                                </td>
                               
                            </tr>
                            <tr>
                                <td style="text-align: right;">
                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,WeiZhi%>"></asp:Label>：
                                </td>
                                <td align="left">
                                        <table><tr><td>
                                            <asp:TextBox ID="TB_WHName" runat="server" Width="150px"></asp:TextBox>
                                            <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseWH" Enabled="True" PopupControlID="Panel13" TargetControlID="TB_WHName" Y="15">
                                            </cc1:ModalPopupExtender>
                                            </td>
                                            <td  style="text-align: right">
                                                <asp:Label ID="Label1345346" runat="server" Text="仓位"></asp:Label> :
                                            </td>
                                            <td>
                                            <asp:DropDownList ID="DL_WHPosition" runat="server" DataTextField="PositionName" DataValueField="PositionName">
                                            </asp:DropDownList>
                                            </td>
                                            </tr>
                                        </table>
                                </td>
                          
                                <td>
                                    <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                    &nbsp;</td>
                                <td>
                                    <asp:Button ID="BT_Export" runat="server" CssClass="inpu" OnClick="BT_Export_Click" Text="<%$ Resources:lang,DaoChu%>" />
                                 </td>
                                <td>
                                     <a href="#" onclick="preview1()">
                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>

                                </td>
                            </tr>

                        </table>

                        <hr />
                        <!--startprint1-->
                        <table style="width: 99%;">
                            <tr>
                                <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">
                                    <br />
                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinPanDianBaoBiao%>"></asp:Label>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td style="text-align: left;" colspan="4">
                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                    &nbsp;
                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZongShu%>"></asp:Label>：<asp:Label ID="LB_TotalAmount" runat="server"></asp:Label>

                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                    <asp:Label ID="LB_UserName" runat="server"
                                        Visible="False"></asp:Label>

                                    <asp:Label ID="LB_Sql" runat="server"></asp:Label>

                                </td>
                                <td></td>
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
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="12%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="18%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,HanShui%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="6%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="8%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DiZhi%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center">
                                                            <strong>
                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
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
                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="编号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:HyperLinkColumn DataNavigateUrlField="GoodsCode" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsCode={0}"
                                                DataTextField="GoodsName" HeaderText="名称" Target="_blank">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                            </asp:HyperLinkColumn>
                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="18%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="IsTaxPrice" HeaderText="含税">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Position" HeaderText="地址">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BuyTime" HeaderText="购买时间" DataFormatString="{0:yyyy/MM/dd}">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
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

                    <asp:Panel ID="Panel13" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="BT_Export" />
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
