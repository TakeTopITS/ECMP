<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsSaleOrderDetail.aspx.cs" Inherits="TTGoodsSaleOrderDetail" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XiaoShouDingDan%>"></asp:Label>
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
                                <td>

                                    <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                        <tr>
                                            <td class="formItemBgStyle" align="center">
                                                <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right" width="10%">
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 20%; text-align: left">
                                                            <asp:TextBox ID="TB_SOName" runat="server" Width="98%"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XiaoShouYuan%>"></asp:Label>：</td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="TB_SalesCode" runat="server" Width="80px"></asp:TextBox>
                                                            <asp:Label ID="LB_SalesName" runat="server"></asp:Label>
                                                            <asp:Label ID="LB_SOID" runat="server" Visible="false"></asp:Label>
                                                        </td>
                                                    </tr>
                                                    <tr>

                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：
                                                        </td>
                                                        <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                            <asp:DropDownList ID="DL_Customer" runat="server" DataTextField="CustomerName" DataValueField="CustomerCode">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="width: 106px; text-align: left">

                                                            <asp:TextBox ID="DLC_SaleTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_SaleTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YuJiDaoHuoShiJian%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left">
                                                            <asp:TextBox ID="DLC_ArrivalTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                            <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_ArrivalTime">
                                                            </ajaxToolkit:CalendarExtender>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left; width: 106px;">
                                                            <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Enabled="False" OnBlur="" OnFocus=""
                                                                OnKeyPress="" PositiveColor="" Width="85px" Precision="3">
                                                                0.000
                                                            </NickLee:NumberBox>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DL_CurrencyType" runat="server" ataTextField="Type" DataValueField="Type"
                                                                Height="25px" Width="100px" AutoPostBack="True">
                                                            </asp:DropDownList>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                            <asp:TextBox ID="TB_Comment" runat="server" Width="90%"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: left; width: 106px;">
                                                            <asp:DropDownList ID="DL_SOStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SOStatus_SelectedIndexChanged">
                                                                <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                                <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                                <asp:ListItem Value="销售中" Text="<%$ Resources:lang,XiaoShouZhong%>" />
                                                                <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                                <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td class="formItemBgStyle" style="text-align: right">
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：
                                                        </td>
                                                        <td align="left" class="formItemBgStyle">
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_RelatedType" runat="server" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged" AutoPostBack="true">
                                                                            <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                            <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="LB_RelatedID" runat="server" Text="<%$ Resources:lang,GuanLianDuiXiangID%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RelatedID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                            PositiveColor="" Precision="0" Width="40px">0</NickLee:NumberBox>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Button ID="BT_Select" Visible="false" runat="server" Text="<%$ Resources:lang,XuanZe%>" />
                                                                        <cc1:ModalPopupExtender ID="TB_Select_ModalPopupExtender" runat="server" Enabled="True"
                                                                            TargetControlID="BT_Select" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                                                            BackgroundCssClass="modalBackground" Y="150">
                                                                        </cc1:ModalPopupExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="text-align: right"></td>
                                                        <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                            <asp:Button ID="BT_UpdateSO" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_UpdateSO_Click"
                                                                Text="<%$ Resources:lang,BaoCun%>" />

                                                            <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                            <asp:Label ID="LB_UserName" runat="server"
                                                                Visible="False"></asp:Label>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align: left; width: 100%; padding: 5px 5px 5px 5px;">
                                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="销售单明细">

                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,XiaoShouDanMingXi%>"></asp:Label>
                                                        </HeaderTemplate>

                                                        <ContentTemplate>
                                                            <table align="center" cellpadding="0" cellspacing="0" width="100%">

                                                                <tr>

                                                                    <td align="left">

                                                                        <asp:Label ID="LB_GoodsOwner" runat="server" Font-Bold="True" Width="100%"></asp:Label>
                                                                    </td>
                                                                </tr>

                                                                <tr>

                                                                    <td>

                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">

                                                                            <tr>

                                                                                <td width="7">

                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                </td>

                                                                                <td>

                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                        <tr>

                                                                                            <td align="center" width="8%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="10%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="15%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="8%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="15%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="8%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="8%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="5%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="7%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>

                                                                                            <td align="center" width="7%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YiFaHuo %>"></asp:Label>
                                                                                                </strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>

                                                                                <td align="right" width="6">

                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                            OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="5" ShowHeader="False"
                                                                            Width="100%">

                                                                            <Columns>
                                                                                <asp:TemplateColumn HeaderText="编号">
                                                                                    <ItemTemplate>

                                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                    </ItemTemplate>

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>
                                                                            
                                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="DeliveryNumber" HeaderText="已送货">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>

                                                                            <EditItemStyle BackColor="#2461BF" />

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <ItemStyle CssClass="itemStyle" />

                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <table width="100%">
                                                                <tr>
                                                                    <td width="60%">
                                                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">

                                                                            <tr>

                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                    ：
                                                                                </td>

                                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                                                </td>

                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                    ：
                                                                                </td>

                                                                                <td class="formItemBgStyle" style="text-align: left; width: 100px;">

                                                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Height="20px" Width="95%"></asp:TextBox>
                                                                                </td>

                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                    ：
                                                                                </td>

                                                                                <td class="formItemBgStyle" style="text-align: left">

                                                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="200px"></asp:TextBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <caption>
                                                                    =
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                            <asp:DropDownList ID="DL_Type" runat="server" AutoPostBack="True" DataTextField="Type" DataValueField="Type">
                                                                            </asp:DropDownList>
                                                                            <td class="formItemBgStyle" style="text-align: right"></td>
                                                                            <td class="formItemBgStyle" colspan="3" style="text-align: left"></td>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                            ：</td>
                                                                        <td class="formItemBgStyle" colspan="5" style="text-align: left">
                                                                            <asp:TextBox ID="TB_ModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" colspan="5" style="height: 15px; text-align: left;">
                                                                            <asp:TextBox ID="TB_Spec" runat="server" Height="48px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GouMaiLiYou %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" colspan="5" style="height: 1px; text-align: left;">
                                                                            <asp:TextBox ID="TB_SaleReason" runat="server" Height="42px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                                            <NickLee:NumberBox ID="NB_Number" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="80px">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                                            <NickLee:NumberBox ID="NB_Price" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="3" Width="85px">0.000</NickLee:NumberBox>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                            ： </td>
                                                                        <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                                            <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName" >
                                                                            </asp:DropDownList>
                                                                        </td>
                                                                        <td class="formItemBgStyle" style="text-align: right"></td>
                                                                        <td class="formItemBgStyle" style="text-align: left"></td>
                                                                        <td class="formItemBgStyle"></td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td class="formItemBgStyle" style="text-align: right"></td>
                                                                        <td class="formItemBgStyle" colspan="4" style="text-align: left">
                                                                            <asp:Button ID="BT_New" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_New_Click" Text="<%$ Resources:lang,XinZeng %>" />
                                                                            <asp:Button ID="BT_Update" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun %>" />
                                                                            <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Delete_Click" Text="<%$ Resources:lang,ShanChu %>" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>
                                                                        </td>
                                                                        <td class="formItemBgStyle"></td>
                                                                    </tr>
                                                                </caption>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel2" runat="server">

                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,GongZuoLiuDingYi%>"></asp:Label>
                                                        </HeaderTemplate>

                                                        <ContentTemplate>

                                                            <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">

                                                                <tr style="font-size: 10pt">

                                                                    <td class="formItemBgStyle" colspan="2" style="height: 10px; text-align: left">

                                                                        <strong>
                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GouMaiShenQingGongZuoLiu%>"></asp:Label>：</strong>
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    </td>

                                                                    <td class="formItemBgStyle" style="text-align: left">

                                                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                                                            <asp:ListItem Value="物料销售" Text="<%$ Resources:lang,LiaoPingXiaoShou%>" />
                                                                        </asp:DropDownList>

                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                                            Width="144px">
                                                                        </asp:DropDownList>

                                                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                            Target="_blank">
                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                        </asp:HyperLink>

                                                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click"
                                                                            Text="<%$ Resources:lang,ShuaXin%>" />
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                                    </td>

                                                                    <td class="formItemBgStyle" style="text-align: left">

                                                                        <asp:TextBox ID="TB_WLName" runat="server" Width="387px"></asp:TextBox>
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：
                                                                    </td>

                                                                    <td class="formItemBgStyle" style="text-align: left">

                                                                        <asp:TextBox ID="TB_Description" runat="server" Height="48px" TextMode="MultiLine"
                                                                            Width="441px"></asp:TextBox>
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td class="formItemBgStyle" style="text-align: right;"></td>

                                                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">（<asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoChuLiXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" />

                                                                        <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian%>" />

                                                                        <span style="font-size: 10pt">) </span>

                                                                        <asp:Button ID="BT_SubmitApply" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" />

                                                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" Y="150"
                                                                            DynamicServicePath="" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_SubmitApply">
                                                                        </cc1:ModalPopupExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                            <table cellpadding="0" cellspacing="0" width="100%">

                                                                <tr style="font-size: 10pt;">

                                                                    <td style="height: 14px; text-align: left">
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu%>"></asp:Label>：
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td style="height: 11px; text-align: left">

                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">

                                                                            <tr>

                                                                                <td width="7">

                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                                </td>

                                                                                <td>

                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                        <tr>

                                                                                            <td align="center" width="10%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="55%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="15%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="10%">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td align="center" width="10%">

                                                                                                <strong></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>

                                                                                <td align="right" width="6">

                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>

                                                                        <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False"
                                                                            Width="100%">

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <EditItemStyle BackColor="#2461BF" />

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />



                                                                            <ItemStyle CssClass="itemStyle" />

                                                                            <Columns>

                                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                                                                </asp:HyperLinkColumn>

                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:TemplateColumn>

                                                                                    <ItemTemplate>

                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                                                            Target="_blank"><img class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                                                    </ItemTemplate>

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid>
                                                                    </td>
                                                                </tr>

                                                                <tr style="font-size: 10pt">

                                                                    <td style="text-align: right">

                                                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>

                                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="关联合同">

                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>
                                                        </HeaderTemplate>

                                                        <ContentTemplate>

                                                            <table align="center" cellpadding="0" cellspacing="0" width="100%">

                                                                <tr>

                                                                    <td align="left">

                                                                        <asp:Label ID="Label1" runat="server" Font-Bold="True" Width="100%"></asp:Label>
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

                                                                                            <td width="7%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,HeTongDaiMa %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="17%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,HeTongMingCheng %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="5%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="5%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="8%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,QianDingRiQi %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="7%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="5%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,BiZhong %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="10%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JiaFangDanWei %>"></asp:Label></strong>
                                                                                            </td>

                                                                                            <td width="10%" align="center">

                                                                                                <strong>
                                                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,YiFangDaiWei %>"></asp:Label></strong>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>

                                                                                <td width="6" align="right">

                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>

                                                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                            Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">

                                                                            <Columns>

                                                                                <asp:BoundColumn DataField="ConstractCode" HeaderText="合同代码">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractView.aspx?ConstractCode={0}"
                                                                                    DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                                                </asp:HyperLinkColumn>

                                                                                <asp:BoundColumn DataField="Type" HeaderText="类型">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate>
                                                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                </asp:TemplateColumn>

                                                                                <asp:BoundColumn DataField="SignDate" HeaderText="签订日期" DataFormatString="{0:yyyy/MM/dd}">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="Currency" HeaderText="币种">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="PartA" HeaderText="甲方单位">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>

                                                                                <asp:BoundColumn DataField="PartB" HeaderText="乙方单位">

                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                </asp:BoundColumn>
                                                                            </Columns>



                                                                            <ItemStyle CssClass="itemStyle" />

                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                            <EditItemStyle BackColor="#2461BF" />

                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />

                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                        </asp:DataGrid>

                                                                        <asp:Label ID="Label4" runat="server" Visible="False"></asp:Label>

                                                                        <asp:Label ID="Label5" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                            Visible="False" Width="57px"></asp:Label>

                                                                        <asp:Label ID="Label6" runat="server" Font-Bold="False" Font-Size="9pt"
                                                                            Visible="False" Width="57px"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                </cc1:TabContainer>
                                            </td>

                                        </tr>
                                    </table>

                                </td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        &nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" /> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
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
