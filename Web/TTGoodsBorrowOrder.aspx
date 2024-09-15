<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsBorrowOrder.aspx.cs" Inherits="TTGoodsBorrowOrder" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        /*#AboveDiv {
            min-width: 1200px;
            width: expression (document.body.clientWidth <= 1200? "1200px" : "auto" ));
        }*/
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ShangPinJieChu%>"></asp:Label>
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
                                    <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="padding: 5px 5px 5px 5px;">

                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                        width="100%">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong>
                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="20%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                        </td>
                                                        <td width="30%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JieChuYuanYin%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="10%">
                                                            <strong>
                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                            <asp:ButtonColumn ButtonType="LinkButton" CommandName="Assign" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                            </asp:ButtonColumn>
                                            <asp:BoundColumn DataField="BorrowNO" HeaderText="BorrowNO">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="BOName" HeaderText="名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="Applicant" HeaderText="申请人">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ApplicationReason" HeaderText="出库原因">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="打印">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                <ItemTemplate>
                                                    <a href='TTGoodsBorrowOrderView.aspx?BorrowNO=<%# DataBinder.Eval(Container.DataItem,"BorrowNO") %>' target="_blank">
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
                            <asp:Label ID="Label111" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">
                            <table width="100%" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td align="center" style="width: 60%;">
                                        <table width="99%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr>
                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                </td>
                                                <td style="width: 30%; text-align: left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_BOName" runat="server" Width="99%"></asp:TextBox>
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Applicant" runat="server" Width="96%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JieChuShiJian%>"></asp:Label>： </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_BorrowTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_BorrowTime">
                                                    </cc1:CalendarExtender>
                                                </td>

                                                <td style="text-align: right" width="15%" class="formItemBgStyle">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" ataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="LB_BorrowNO" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieChuYuanYin%>"></asp:Label>
                                                    ：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_BorrowReason" runat="server" Width="98%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;" align="left">
                                                    <table>
                                                        <tr>

                                                            <td align="left">
                                                                <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                    <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                    <asp:ListItem Value="Constract" Text="<%$ Resources:lang,HeTong%>" />
                                                                </asp:DropDownList>
                                                            </td>

                                                            <td align="left">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RelatedID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Precision="0" Width="53px" Visible="false">0</NickLee:NumberBox>
                                                                <asp:TextBox ID="TB_RelatedCode" runat="server" Width="80" Visible="false"></asp:TextBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Button ID="BT_RelatedProject" runat="server" Text="<%$ Resources:lang,XiangMu%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="TB_RelatedProject_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_RelatedProject" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                                <asp:Button ID="BT_RelatedConstract" runat="server" Text="<%$ Resources:lang,HeTong%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="BT_RelatedConstract_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_RelatedConstract" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left;" align="left">
                                                    <asp:DropDownList ID="DL_Status" runat="server">
                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                        <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                        <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                        <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Width="100%"></asp:Label>
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" cellpadding="0" cellspacing="0" align="center">

                                <tr>
                                    <td align="right" style="padding-bottom: 5px;">
                                        <asp:Button ID="BT_CreateDetail" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" />
                                    </td>
                                </tr>

                                <tr>

                                    <td>

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
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>


                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                            <td width="7%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="10%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="6%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="6%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="6%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YiTui %>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>

                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong>
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

                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="物料代码">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名称">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Number" HeaderText="数量">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Price" HeaderText="单价">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ReturnNumber" HeaderText="已退">

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
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label112" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 99%; height: 580px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label113" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table align="center" width="100%">

                                <tr>

                                    <td width="40%" class="formItemBgStyle">

                                        <table align="center" width="100%" cellpadding="1" cellspacing="0" class="formBgStyle">

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>：
                                                </td>

                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">

                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="50%"></asp:TextBox>
                                                    <asp:Label ID="LB_ID" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>：
                                                </td>

                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">

                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="70%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">

                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">

                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,XuLieHao %>"></asp:Label>：</td>

                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">

                                                    <asp:TextBox ID="TB_SN" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">

                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">

                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>：
                                                </td>

                                                <td colspan="3" class="formItemBgStyle" style="text-align: right;">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>

                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />

                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong %>" />
                                                </td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">

                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="3" style="text-align: left;">

                                                    <asp:TextBox ID="TB_Brand" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>：
                                                </td>

                                                <td style="text-align: left" class="formItemBgStyle">

                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="80px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: right">

                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                    ：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList>

                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="85px" Visible="False" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>

                                            <tr style="display: none;">

                                                <td class="formItemBgStyle" style="text-align: right"></td>

                                                <td class="formItemBgStyle" colspan="3" style="text-align: left">

                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <td width="60%" class="formItemBgStyle">

                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">

                                            <cc1:TabPanel ID="TabPanel2" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,LiaoPinKuCunLieBiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,QXQYCKDSP %>"></asp:Label>：
                                                    <div id="GoodsListDivID" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="12%"><strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td align="center" width="14%"><strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td align="center" width="14%"><strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label214" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>

                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong></td>

                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong></td>
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
                                                                <asp:BoundColumn DataField="Manufacturer" HeaderText="品牌">
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
                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,QXQYRKDSP %>"></asp:Label>：
                                                    <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                            <td width="20%" align="center"><strong>
                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>

                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                            <td width="35%" align="center"><strong>
                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
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
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
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
                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label103" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%">

                                <tr>

                                    <td align="left" style="width: 100px; height: 6px; text-align: right;">

                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,LiuChengMuBan %>"></asp:Label>： </td>

                                    <td align="left" style="width: 550px; height: 6px">

                                        <asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                            Width="194px">
                                        </asp:DropDownList><asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：<asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="物料借出" Text="<%$ Resources:lang,LiaoPingJieChu%>" />
                                        </asp:DropDownList><asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                            Target="_blank">
                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,MoBanWeiHu %>"></asp:Label>
                                        </asp:HyperLink><asp:Button ID="BT_Reflash" runat="server" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,ShuaXin %>" CssClass="inpu" /></td>
                                </tr>

                                <tr>

                                    <td align="left" colspan="2" style="height: 6px; text-align: right;">

                                        <table width="100%">

                                            <tr>

                                                <td align="left" style="width: 550px; height: 27px"><span style="font-size: 10pt">（<asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXingXi %>"></asp:Label>：</span><asp:CheckBox ID="CB_SMS" runat="server"
                                                    Font-Size="10pt" Text="短信" /><asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian %>" /><span style="font-size: 10pt">) </span>

                                                    <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing %>" CssClass="inpu" />
                                                    <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                        TargetControlID="BT_SubmitApply" PopupControlID="Panel3" BackgroundCssClass="modalBackground" Y="150"
                                                        DynamicServicePath="">
                                                    </cc1:ModalPopupExtender>

                                                    <asp:Label ID="Label71" runat="server" Visible="False"></asp:Label><asp:Label ID="Label72" runat="server" Visible="False"></asp:Label></td>
                                            </tr>

                                            <tr>

                                                <td align="center" style="height: 22px; text-align: left;">

                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao %>"></asp:Label>： </td>
                                            </tr>

                                            <tr>

                                                <td align="center">

                                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                                        <tr>

                                                            <td width="7">

                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                            <td>

                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                                    <tr>

                                                                        <td width="10%" align="center"><strong>

                                                                            <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                                        <td width="50%" align="center"><strong>

                                                                            <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,GongZuoLiu %>"></asp:Label></strong> </td>

                                                                        <td width="20%" align="center"><strong>

                                                                            <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShenQingShiJian %>"></asp:Label></strong> </td>

                                                                        <td width="10%" align="center"><strong>

                                                                            <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label></strong> </td>

                                                                        <td width="10%" align="center"><strong></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>

                                                            <td width="6" align="right">

                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                        </tr>
                                                    </table>

                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                                        PageSize="5" Width="98%" CellPadding="4" ShowHeader="False" ForeColor="#333333"
                                                        GridLines="None">

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

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="50%" />
                                                            </asp:HyperLinkColumn>

                                                            <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                            </asp:BoundColumn>

                                                            <asp:TemplateColumn HeaderText="状态">
                                                                <ItemTemplate>
                                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                            </asp:TemplateColumn>

                                                            <asp:TemplateColumn>

                                                                <ItemTemplate>

                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                                        Target="_blank"><img  class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                                </ItemTemplate>

                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label115" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
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
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 620px; height: 400px; overflow: auto;">
                            <table width="100%">
                                <tr>
                                    <td style="padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="7%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="17%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="8%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="7%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="10%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="10%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,YiFangDanWei%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="False" OnItemCommand="DataGrid3_ItemCommand"
                                            Height="1px" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                            <Columns>

                                                <asp:TemplateColumn HeaderText="合同号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ConstractCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ConstractCode") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="ConstractCode" DataNavigateUrlFormatString="TTConstractView.aspx?ConstractCode={0}"
                                                    DataTextField="ConstractName" HeaderText="合同名称" Target="_blank">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="17%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Type" HeaderText="类型">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
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

                                        <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close1" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
