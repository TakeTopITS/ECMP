<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsAfterSaleServiceManage.aspx.cs"
    Inherits="TTGoodsAfterSaleServiceManage" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1650px;
            width: expression (document.body.clientWidth <= 1650? "1650px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }



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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShouHouGuanLi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:Label ID="Label15" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td valign="top" style="padding: 5px 5px 5px 5px;">
                                    <table style="font-size: 10pt; width: 100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" align="left" style="padding-top: 4px;">
                                                <table width="100%" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td align="right" style="width: 5%; padding-top: 5px;">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" style="width: 10%; padding-top: 5px;">
                                                            <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"
                                                                Width="99%" CssClass="DDList">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td width="12%" style="text-align: right;">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ChuKuKaiShiShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" width="10%">
                                                            <asp:TextBox ID="DLC_StartTime" ReadOnly="false" Width="99%" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1"
                                                                runat="server" TargetControlID="DLC_StartTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td style="width: 10%; text-align: right;">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" width="10%">
                                                            <asp:TextBox ID="DLC_EndTime" ReadOnly="false" Width="99%" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4"
                                                                runat="server" TargetControlID="DLC_EndTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td width="5%">
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>"
                                                                OnClick="BT_Find_Click" />
                                                        </td>
                                                        <td style="text-align: right;" width="7%">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" width="10%">
                                                            <asp:TextBox ID="TB_GoodsSN" Width="99%" runat="server"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: right;" width="5%">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" width="10%">
                                                            <asp:TextBox ID="TB_CustomerName" Width="98%" runat="server"></asp:TextBox>

                                                        </td>
                                                        <td align="left" width="5%">
                                                            <asp:Button ID="BT_FindByGoodsSN" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>"
                                                                OnClick="BT_FindByGoodsSN_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 98%; text-align: left;" valign="top">
                                                <asp:Label ID="LB_GoodsOwner" runat="server"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Font-Bold="False" Font-Size="9pt"
                                                    Visible="False" Width="57px"></asp:Label>
                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False" Width="63px"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Font-Bold="False" Font-Size="9pt"
                                                    Visible="False" Width="59px"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" align="center" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%--    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <%-- <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ChangJia%>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <%-- <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ChuKuDan%>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <%-- <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ChuKuKeHu%>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <%--  <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ChuKuShiJian%>"></asp:Label></strong>
                                                                    </td>--%>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,DaoQiShiJian%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhongDuanKeHu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="center">
                                                                        <strong>&nbsp;</strong>
                                                                    </td>
                                                                    <td width="12%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>&nbsp;</strong>
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
                                                    ShowHeader="false" Height="1px" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                    OnItemCommand="DataGrid1_ItemCommand"
                                                    Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" AllowPaging="True"
                                                    PageSize="25">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="15%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <%-- <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                        </asp:BoundColumn>--%>
                                                        <%--<asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>--%>
                                                        <%-- <asp:BoundColumn DataField="ShipmentNO" HeaderText="出库单号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>--%>
                                                        <%-- <asp:HyperLinkColumn DataNavigateUrlField="CustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                            DataTextField="CustomerName" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:HyperLinkColumn>--%>
                                                        <%-- <asp:BoundColumn DataField="ShipTime" HeaderText="出库时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>--%>
                                                        <asp:BoundColumn DataField="WarrantyPeriod" HeaderText="保修期">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="WarrantyEndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="FinalCustomerCode" DataNavigateUrlFormatString="TTCustomerInfoView.aspx?CustomerCode={0}"
                                                            DataTextField="FinalCustomerName" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="SN" DataNavigateUrlFormatString="TTMakeCustomer.aspx?RelatedType=GOODS&RelatedID={0}"
                                                            Text="New" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:TemplateColumn HeaderText="系列号">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_GoodsSN" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"SN") %>'
                                                                    class="inpuLong" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                        </asp:TemplateColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="SN" DataNavigateUrlFormatString="TTGoodsAfterServiceToTask.aspx?GoodsSN={0}" Text="售后" Target="_blank">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:HyperLinkColumn>

                                                    </Columns>

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText=""
                                                        CssClass="notTab" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="width: 1200px; text-align: Center;">
                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,Di%>"></asp:Label>：<asp:Label
                                                    ID="LB_PageIndex" runat="server"></asp:Label>
                                                &nbsp;<asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YeGong%>"></asp:Label>
                                                <asp:Label ID="LB_TotalPageNumber" runat="server"></asp:Label>
                                                &nbsp;<asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,Ye%>"></asp:Label>
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td valign="top" width="170" style="padding: 5px 2px  0px 5px; border-left: solid 1px #D8D8D8">
                                    <table cellpadding="0" cellspacing="0" style="width: 170px;">
                                        <tr>
                                            <td>
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td width="7">
                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                        </td>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                                    ShowHeader="false" Width="170px" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="客户：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_CustomerCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"CustomerCode") %>' />
                                                                <asp:Button ID="BT_CustomerName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"CustomerName") %>' />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td style="width: 220px; border-left: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 98%; height: 550px; position: absolute; overflow: hidden;
                        display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label13" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%">
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShouHouRenWu%>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="9%"><strong>
                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="12%"><strong>
                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,RenWu%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,YouXianJi%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="8%"><strong>
                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%"><strong>
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,WanChengChengDu%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FeiYong%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="7%"><strong>
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False"
                                            ShowHeader="False" OnItemCommand="DataGrid10_ItemCommand"
                                            Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None">

                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_TaskID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"TaskID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                    <ItemStyle CssClass="itemBorder" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Task" HeaderText="任务">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Priority" HeaderText="优先级">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="BeginDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="开始时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="EndDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="结束时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Budget" HeaderText="预算">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="FinishPercent" HeaderText="完成程度">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Expense" HeaderText="费用">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <EditItemStyle BackColor="#2461BF" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <ItemStyle CssClass="itemStyle" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText=""
                                                CssClass="notTab" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid></td>
                                </tr>
                                <tr>
                                    <td align="left">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,LingYongPeiJian%>"></asp:Label>：
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShangPinMing%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center"><strong>
                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="10%" align="center"><strong>
                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YiChuKu%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                            Height="30px" Width="100%" ID="DataGrid11">

                                            <Columns>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>
                                            <ItemStyle CssClass="itemStyle"></ItemStyle>
                                            <PagerStyle HorizontalAlign="Center"></PagerStyle>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab"
                            href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000;
                        opacity: 0.3; filter: alpha(opacity=30); display: none;">
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
