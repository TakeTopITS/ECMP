<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseDetailView.aspx.cs" Inherits="TTWZPurchaseDetailView" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购清单</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">

        $(function () { 

        });

 

        function LoadProjectList() {
            document.getElementById("BT_RelaceLoad").click();
        }


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
                                                            <asp:Label ID="Label1" runat="server" Text="采购清单"></asp:Label> 
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                 
                                                    <tr style="height: 300px;">
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 2000px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                               
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuanYeLeiBie%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BiaoDuan%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="7%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WuZhiMingChen%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,CaiGouShuLiang%>"></asp:Label> </strong>
                                                                                                </td>

                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label79" runat="server" Text="换算单位"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShengCanChangJia%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,JueCheDanJia%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JueCheJingE%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_PurchaseDetail" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                                Width="100%" OnPageIndexChanged="DG_PurchaseDetail_PageIndexChanged">
                                                                                <Columns>
                                                                                   
                                                                                    <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ZhuanYeLeiBie%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("MajorType").ToString(), 5) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BiaoDuan%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Tenders").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="SerialNumber" HeaderText="序号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,WuZhiMingChen%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Grade").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PurchaseNumber" HeaderText="采购数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="换算单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShengCanChangJia%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GuiGeaShuBianHao%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("StandardCode").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ApplyMoney" HeaderText="决策单价">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="TotalMoney" HeaderText="决策金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                
                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            </asp:DataGrid>
                                                                        </div>
                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                  
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseDetailID" runat="server" />
                <asp:HiddenField ID="HF_ConvertRatio" runat="server" />
                <asp:HiddenField ID="HF_Market" runat="server" />
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
            </ContentTemplate>
            <Triggers>
               
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
