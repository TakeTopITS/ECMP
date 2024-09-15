<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsTransferOrder.aspx.cs" Inherits="TTGoodsTransferOrder" %>

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,DiaoBoDan%>"></asp:Label>
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
                                <td align="right" style="padding: 5px 5px 0px 5px;">
                                    <table width="100%">
                                        <tr>
                                            <td wiidth="60%" align="center">
                                                <table>
                                                    <tr>
                                                        <td align="left">（
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="Label211" runat="server" Text="<%$ Resources:lang,CangKu %>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_FindWareHouse" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td align="left">
                                                            <asp:Label ID="Label212" runat="server" Text="<%$ Resources:lang,KeHu %>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:TextBox ID="TB_CustomerName" runat="server" Width="120px"></asp:TextBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_FindAll" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun %>" OnClick="BT_FindAll_Click" />）
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right">
                                                <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>


                                                        <td align="center" width="5%">
                                                            <strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="18%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label158" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="24%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,YuanYin%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="15%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label95" runat="server" Text="<%$ Resources:lang,kehu%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong></strong>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td width="6" align="right">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                        ShowHeader="false" Height="1px" OnItemCommand="DataGrid5_ItemCommand" OnPageIndexChanged="DataGrid5_PageIndexChanged"
                                        PageSize="25" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                        <Columns>
                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:ButtonColumn>
                                            <asp:TemplateColumn HeaderText="Delete">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:TemplateColumn>
                                            <asp:BoundColumn DataField="ShipmentNO" HeaderText="ShipmentNO">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="GSHOName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="18%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ApplicationReason" HeaderText="出库原因">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="24%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="CustomerName" HeaderText="客户">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="打印">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                <ItemTemplate>
                                                    <a href='TTGoodsTransferOrderView.aspx?ShipmentNO=<%# DataBinder.Eval(Container.DataItem,"ShipmentNO") %>' target="_blank">
                                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
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
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label2" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="60%" align="center">
                                        <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_GSHOName" runat="server" Width="96%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label110" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                                    <asp:DropDownList ID="DL_ShipmentType" runat="server">
                                                        <asp:ListItem Value="Transfer" Text="<%$ Resources:lang,DiaoBo%>" />
                                                    </asp:DropDownList>
                                                    <asp:Label ID="LB_ShipmentNO" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                                    <asp:TextBox ID="TB_Applicant" runat="server" Width="96%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" ataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KeHu%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Customer" runat="server" DataTextField="CustomerName" DataValueField="CustomerCode">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ChuKuCangKu%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_WHName" runat="server" Width="150px"></asp:TextBox>
                                                    <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseWH" Enabled="True" PopupControlID="Panel13" TargetControlID="TB_WHName" Y="15">
                                                    </cc1:ModalPopupExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_ShipTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ShipTime">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YuanYin%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_ShipmentReason" runat="server" Width="98%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label156" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <table>
                                                        <tr>
                                                            <td align="right">
                                                                <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                    <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="left">
                                                                <NickLee:NumberBox ID="NB_RelatedID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                                <asp:TextBox ID="TB_RelatedCode" runat="server" Visible="false" Width="99%"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Button ID="BT_RelatedProject" runat="server" Text="<%$ Resources:lang,XiangMu%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="TB_RelatedProject_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_RelatedProject" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" style="text-align: left"></td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
                            </table>
                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="6" align="right" style="padding-bottom: 5px;">
                                        <asp:Button ID="BT_CreateDetail" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="left">
                                        <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                            <tr>
                                                <td colspan="6" align="left" class="page_topbj">
                                                    <asp:Label ID="Label162" runat="server" Text="<%$ Resources:lang,DiaoBoDan%>"></asp:Label>
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="6">
                                                    <table width="110%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                        </td>

                                                                        <td align="center" width="5%"><strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="12%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,BaoXiuQiTian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,CunFangWeiZhi%>"></asp:Label></strong>
                                                                        </td>

                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                        Height="1px" OnItemCommand="DataGrid1_ItemCommand" Width="110%" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None">
                                                        <Columns>
                                                            <asp:ButtonColumn CommandName="Update" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 alt='修改' /&gt;&lt;/div&gt;">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:ButtonColumn>
                                                            <asp:TemplateColumn HeaderText="Delete">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WarrantyPeriod" HeaderText="保修期（天）">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SN" HeaderText="序列号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ToPosition" HeaderText="存放位置">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
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
                                        <br />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>
                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label6" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table align="center" width="100%">
                                <tr>
                                    <td width="40%" class="formItemBgStyle">
                                        <table align="center" width="100%" cellpadding="1" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                                <td align="left" width="25%" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                        <asp:ListItem Value="GoodsCONRecord" Text="<%$ Resources:lang,ChuHuoTongZhiDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsSARecord" Text="<%$ Resources:lang,XiaoShouShenQingDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsSORecord" Text="<%$ Resources:lang,XiaoShouDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPARecord" Text="<%$ Resources:lang,LingLiaoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPFRecord" Text="<%$ Resources:lang,BuLiaoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPURRecord" Text="<%$ Resources:lang,TuiHuoDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsPDRecord" Text="<%$ Resources:lang,ShengChanDanJiLu%>" />
                                                        <asp:ListItem Value="GoodsBOMRecord" Text="<%$ Resources:lang,BOMJiLu%>" />
                                                        <asp:ListItem Value="GoodsBORecord" Text="<%$ Resources:lang,JieChuDanJiLu%>" />
                                                    </asp:DropDownList></td>
                                                <td align="right" width="15%" class="formItemBgStyle">ID:</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                    <asp:Label ID="LB_SourceRelatedID" runat="server" Visible="False" Text="0"></asp:Label>
                                                    <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,XuLieHao%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_SN" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: right;">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong%>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShuLiang%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress="" Visible="false"
                                                        PositiveColor="" Width="85px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName"
                                                        Width="64px">
                                                    </asp:DropDownList>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,BaoXiuQi%>"></asp:Label>：</td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="NB_WarrantyPeriod" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="85px">0</NickLee:NumberBox>
                                                    天</td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">
                                                    <asp:TextBox ID="TB_Manufacturer" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,CangKu%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" align="Left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_InWareHouse" runat="server" AutoPostBack="True" DataTextField="WHName" DataValueField="WHName" OnSelectedIndexChanged="DL_InWareHouse_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="Label1345346" runat="server" Text="存放仓位"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:DropDownList ID="DL_WHPosition" runat="server" DataTextField="PositionName" DataValueField="PositionName">
                                                                </asp:DropDownList>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,LaiYuanWeiZhi%>"></asp:Label>：
                                                </td>
                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TB_FromPosition" runat="server" Width="90%"></asp:TextBox>
                                                                <asp:Label ID="LB_FromGoodsID" runat="server"></asp:Label>
                                                            </td>
                                                            <td></td>
                                                            <td>
                                                                <asp:Label ID="Label228" runat="server" Text="出库仓位"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <asp:TextBox ID="TB_FromWHPosition" runat="server" Width="90%"></asp:TextBox>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_Comment" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td width="60%" class="formItemBgStyle">

                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label157" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                                            </td>
                                                            <td align="right">
                                                                <asp:DropDownList ID="DL_SourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SourceType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                    <asp:ListItem Value="GoodsPD" Text="生产作业单" />
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right">ID:</td>
                                                            <td align="left">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SourceID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Precision="0" Width="35px">0</NickLee:NumberBox>
                                                            </td>
                                                            <td align="left">

                                                                <asp:Button ID="BT_SelectPD" runat="server" Text="生产作业单" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="BT_SelectPD_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground"
                                                                    CancelControlID="IMBT_ClosePD" Enabled="True" PopupControlID="Panel8" TargetControlID="BT_SelectPD" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>

                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc1:TabPanel ID="TabPanel2" runat="server">

                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,LiaoPinKuCunLieBiao%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,QXQYCKDLP %>"></asp:Label>：

                                                <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">

                                                    <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                        <tr>

                                                            <td width="7">

                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                            <td>

                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                    <tr>

                                                                        <td width="12%" align="center"><strong>
                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>

                                                                        <td width="14%" align="center"><strong>
                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>

                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong> </td>

                                                                        <td width="14%" align="center"><strong>
                                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>

                                                                        <td width="10%" align="center"><strong>
                                                                            <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>

                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong> </td>

                                                                        <td align="center"><strong>
                                                                            <asp:Label ID="Label227" runat="server" Text="仓位"></asp:Label>
                                                                        </strong>
                                                                        </td>

                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td width="6" align="right">

                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>

                                                    <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                        Height="1px" Width="150%" OnItemCommand="DataGrid2_ItemCommand" CellPadding="4"
                                                        ForeColor="#333333" GridLines="None">
                                                        <Columns>

                                                            <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>

                                                            <asp:TemplateColumn HeaderText="代码">

                                                                <ItemTemplate>

                                                                    <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode") %>' />
                                                                </ItemTemplate>

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                            </asp:TemplateColumn>

                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                DataTextField="GoodsName" HeaderText="名称" Target="_blank">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                            </asp:HyperLinkColumn>

                                                            <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="Price" HeaderText="单价">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Position" HeaderText="地址">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WHPosition" HeaderText="仓位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                            </asp:BoundColumn>
                                                        </Columns>

                                                        <EditItemStyle BackColor="#2461BF" />

                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                        <ItemStyle CssClass="itemStyle" />

                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    </asp:DataGrid>
                                                </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel6" runat="server" TabIndex="1">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label runat="server" Text="<%$ Resources:lang,QXQYRKDLP %>"></asp:Label>：

                                                    <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">

                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                            <tr>

                                                                <td width="7">

                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>

                                                                <td>

                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                        <tr>

                                                                            <td width="15%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="20%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label134535" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>

                                                                            <td width="35%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="150%" OnItemCommand="DataGrid9_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">

                                                            <Columns>

                                                                <asp:TemplateColumn HeaderText="代码">

                                                                    <ItemTemplate>

                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateColumn>

                                                                <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}"
                                                                    DataTextField="ItemName" HeaderText="名称" Target="_blank">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <EditItemStyle BackColor="#2461BF" />

                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />

                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel8" runat="server" TabIndex="7">

                                                <HeaderTemplate>
                                                    <asp:Label runat="server" Text="生产作业单"></asp:Label>:

                                                                        <asp:Label ID="LB_PDID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <br />

                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                        <tr>
                                                            <td></td>
                                                            <td align="right" widt="20%">

                                                                <asp:Button ID="BT_PDMRPExpend" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,MRPZhanKai %>" OnClick="BT_PDMRPExpend_Click" />
                                                            </td>

                                                            <td align="center" width="20%">

                                                                <asp:HyperLink ID="HL_GoodsMaterialIssueOrder" runat="server" Target="_blank" Text="<%$ Resources:lang,TLFLD %>"></asp:HyperLink>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                            width="200%">

                                                            <tr>

                                                                <td width="7">

                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                </td>

                                                                <td>

                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                        <tr>

                                                                            <td align="center" width="10%">

                                                                                <strong>
                                                                                    <asp:Label ID="Label111" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center" width="10%">

                                                                                <strong>
                                                                                    <asp:Label ID="Label113" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center" width="20%">

                                                                                <strong>
                                                                                    <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%">

                                                                                <strong>
                                                                                    <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong>
                                                                            </td>

                                                                            <td align="center" width="8%">

                                                                                <strong>
                                                                                    <asp:Label ID="Label116" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td align="right" width="6">

                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid16" runat="server" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid16_ItemCommand"
                                                            ShowHeader="False"
                                                            Width="200%">

                                                            <Columns>

                                                                <asp:TemplateColumn HeaderText="编号">

                                                                    <ItemTemplate>

                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>

                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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

                                                        <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                            <tr>

                                                                <td width="7">

                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                                <td>

                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                        <tr>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label117" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>

                                                                            <td width="14%" align="center"><strong>
                                                                                <asp:Label ID="Label118" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>


                                                                            <td width="14%" align="center"><strong>
                                                                                <asp:Label ID="Label120" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>


                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label122" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label124" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label123" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label></strong> </td>

                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label125" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label></strong> </td>

                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label126" runat="server" Text="<%$ Resources:lang,GongYi %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid17" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="200%" OnItemCommand="DataGrid17_ItemCommand" CellPadding="4"
                                                            ForeColor="#333333" GridLines="None">

                                                            <Columns>

                                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="False">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>

                                                                <asp:TemplateColumn HeaderText="代码">

                                                                    <ItemTemplate>

                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode") %>' />
                                                                    </ItemTemplate>

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>

                                                                <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsInforView.aspx?GoodsID={0}"
                                                                    DataTextField="ItemName" HeaderText="名称" Target="_blank">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                </asp:HyperLinkColumn>


                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
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

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <EditItemStyle BackColor="#2461BF" />

                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                            <ItemStyle CssClass="itemStyle" />

                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                        </cc1:TabContainer>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewDetail" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewDetail_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 6px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_CloseINWH" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 273px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 220px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                            ShowLines="True" Width="220px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel8" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td>
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="100%">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label152" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="25%">
                                                                <strong>
                                                                    <asp:Label ID="Label153" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label154" runat="server" Text="<%$ Resources:lang,ShengChanShiJian%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label155" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid18" runat="server" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid18_ItemCommand"
                                            ShowHeader="false"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_PDID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"PDID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="PDName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ProductionDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="生产时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <ItemStyle CssClass="itemStyle" />
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePD" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
