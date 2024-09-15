<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsIssueOrderViewForProduction.aspx.cs" Inherits="TTGoodsIssueOrderViewForProduction" %>


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
    <center>
        <form id="form2" runat="server">
            <div style="position: relative; top: 50px;">
                <table style="width: 980px;">
                    <tr>
                        <td style="width: 100%; height: 80px; font-size: xx-large; text-align: center;">

                            <table width="100%">
                                <tr>
                                    <td width="200px">
                                        <%--<img src="Logo/FormLogo.png" />--%>
                                         <asp:Image ID="Img_BarCode" runat="server" />
                                    </td>
                                    <td width="600px" style="font-size: xx-large; text-align: center;" class="auto-style1">
                                        <br />
                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GongDanFaLiaoDan%>"></asp:Label>
                                        <br />
                                    </td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                        </td>

                    </tr>
                    <tr>

                        <td style="text-align: center; width: 980px;">
                            <asp:DataList ID="DataList1" runat="server" Width="980px" CellPadding="0" CellSpacing="0">
                                <ItemTemplate>
                                    <table class="bian" style="width: 100%; border-collapse: collapse; margin: 0px auto;" cellpadding="4"
                                        cellspacing="0">
                                        <tr>
                                            <td style="text-align: right;">
                                                <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "PDID")%>
                                            </td>
                                            <td style="width: 106px; text-align: right">
                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                            </td>
                                            <td colspan="3" style="text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "PDName")%>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left">
                                                <%# Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "ProductionDate")).ToString("yyyy/MM/dd")%>
                                            </td>
                                            <td style="width: 121px; text-align: right">
                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangGuan%>"></asp:Label>：
                                            </td>
                                            <td style="text-align: left" colspan="2">

                                                <%#DataBinder.Eval(Container.DataItem, "RelatedType")%>
                                                ID: <%#DataBinder.Eval(Container.DataItem, "RelatedID")%>
                                            </td>
                                        </tr>

                                        <%--                                        <tr>
                                            <td style="text-align: right">
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                            </td>
                                            <td colspan="5" style="height: 18px; text-align: left">
                                                <%#DataBinder.Eval(Container.DataItem, "Status")%>
                                            </td>
                                        </tr>--%>
                                    </table>
                                </ItemTemplate>
                            </asp:DataList>
                        </td>
                    </tr>
                    <tr>
                        <td  style="text-align: left; width: 70%;">
                            <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                width="100%">
                                <tr>
                                    <td width="7">
                                        <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                    </td>
                                    <td>
                                        <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                            <tr>
                                                <td align="center" width="5%">
                                                    <strong>
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                </td>

                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="15%">
                                                    <strong>
                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="10%">
                                                    <strong>
                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="20%">
                                                    <strong>
                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                </td>
                                                <td align="center" width="8%">
                                                    <strong>
                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                </td>

                                                <td align="center" width="8%">
                                                    <strong>
                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="right" width="6">
                                        <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                    </td>
                                </tr>
                            </table>
                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px"
                                ShowHeader="False"
                                Width="100%">
                                <Columns>
                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                    </asp:BoundColumn>
                                    <asp:BoundColumn DataField="Number" HeaderText="数量">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:BoundColumn>
                                </Columns>
                                
                                <ItemStyle CssClass="itemStyle" />
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                            </asp:DataGrid>
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <table>
                                            <tr>
                                                <td>
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,FaLiaoQingDan%>"></asp:Label>：</td>
                                                <td>
                                                    <asp:Button runat="server" Text="MRP展开" CssClass="inpuLong" ID="BT_PDMRPExpend" OnClick="BT_PDMRPExpend_Click"></asp:Button></td>

                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                <tr>

                                    <td width="7">

                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                    <td>

                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                            <tr>

                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong> </td>

                                                <td width="14%" align="center"><strong>
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong> </td>

                                                <td align="center" width="10%">

                                                    <strong>
                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                </td>

                                                <td width="14%" align="center"><strong>
                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong> </td>

                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong> </td>

                                                <td width="6%" align="center"><strong>
                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong> </td>

                                                <td width="6%" align="center"><strong>
                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong> </td>

                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiaDanShiJian%>"></asp:Label></strong> </td>

                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XuQiuShiJian%>"></asp:Label></strong> </td>

                                                <td width="10%" align="center"><strong>
                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GongYi%>"></asp:Label></strong> </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <td width="6" align="right">

                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                </tr>
                            </table>

                            <asp:DataGrid ID="DataGrid17" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                Height="1px" Width="100%" CellPadding="4"
                                ForeColor="#333333" GridLines="None">

                                

                                <Columns>

                                    <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>


                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                        DataTextField="ItemName" HeaderText="名称" Target="_blank">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                    </asp:HyperLinkColumn>

                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="Type" HeaderText="类型">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="Number" HeaderText="数量">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="OrderTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="下单时间">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="RequireTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="需求时间">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>

                                    <asp:BoundColumn DataField="DefaultProcess" HeaderText="工艺">

                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                </Columns>

                                <EditItemStyle BackColor="#2461BF" />

                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                <ItemStyle CssClass="itemStyle" />

                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                            </asp:DataGrid>

                            <br />
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <table width="80%">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;" width="100px">
                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DiYiLianBaiLian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShengChan%>"></asp:Label></td>
                                                <td class="formItemBgStyle" style="text-align: right;" width="150px">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DiErLianHongLian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,CaiWu%>"></asp:Label></td>
                                                <td class="formItemBgStyle" style="text-align: right;" width="150px">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DiSanLianHuangLian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CangKu%>"></asp:Label></td>
                                                <td class="formItemBgStyle" style="text-align: right;" width="150px">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DiSiLianLanLian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,TongJi%>"></asp:Label></td>
                                            </tr>
                                        </table>

                                    </td>

                                </tr>
                            </table>
                            <br />
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <table width="80%">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CangGuan%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShenHe%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                                <td class="formItemBgStyle" style="text-align: left;" width="150px">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhiBiao%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left;"></td>
                                            </tr>
                                        </table>

                                    </td>

                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
