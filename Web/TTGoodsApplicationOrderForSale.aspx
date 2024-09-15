<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsApplicationOrderForSale.aspx.cs" Inherits="TTGoodsApplicationOrderForSale" %>

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
            min-width: 1180px;
            width: expression (document.body.clientWidth <= 1180? "1180px" : "auto" ));
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiaoShouLingYongShenQing%>"></asp:Label>
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
                                <td align="left" style="padding: 5px 5px 5px 5px" valign="top">
                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                        <tr>
                                            <td width="7">
                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                            </td>
                                            <td>
                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                        </td>
                                                        <td width="5%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                        </td>
                                                        <td width="10%" align="center">
                                                            <strong>
                                                                <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                        </td>
                                                        <td align="center" width="5%">
                                                            <strong>
                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="35%"><strong>
                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center" width="20%">
                                                            <strong>
                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label></strong>
                                                        </td>
                                                        <td align="center" width="20%"><strong>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                        </strong></td>
                                                        <td align="center">&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td align="right" width="6">
                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                            </td>
                                        </tr>
                                    </table>
                                    <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged" PageSize="25" ShowHeader="false" Width="100%">
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
                                            <asp:BoundColumn DataField="AAID" HeaderText="AAID">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="GAAName" HeaderText="申请名称">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="35%" />
                                            </asp:BoundColumn>
                                            <asp:BoundColumn DataField="ApplyTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="申请时间">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                            </asp:BoundColumn>
                                            <asp:TemplateColumn HeaderText="状态">
                                                <ItemTemplate>
                                                    <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                </ItemTemplate>
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="打印">
                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                <ItemTemplate>
                                                    <a href='TTGoodsApplicationOrderViewForSale.aspx?AAID=<%# DataBinder.Eval(Container.DataItem,"AAID") %>' target="_blank">
                                                        <img src="ImagesSkin/print.gif" alt="打印" border="0" />
                                                    </a>
                                                </ItemTemplate>
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                        <EditItemStyle BackColor="#2461BF" />
                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />

                                        <ItemStyle CssClass="itemStyle" />
                                    </asp:DataGrid>
                                    <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>


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
                            <table cellpadding="0" cellspacing="0" style="width: 100%;">
                                <tr>
                                    <td align="center" style="width: 60%;">
                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 98%;">
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;" width="15%">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle" style="width: 35%">
                                                    <asp:TextBox ID="TB_GAAName" runat="server" Width="95%"></asp:TextBox>
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: right;" width="20%">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Type" runat="server">
                                                        <asp:ListItem Text="<%$ Resources:lang,XiaoShouLingYong%>" Value="SALE" />
                                                    </asp:DropDownList>
                                                    <asp:Label ID="LB_AAID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShenQingYuanYin%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle" colspan="3">
                                                    <asp:TextBox ID="TB_ApplyReason" runat="server" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>
                                                    ：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_TotalAmount" runat="server" Enabled="false" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="100px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>
                                                    ：</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_CurrencyType" runat="server" AutoPostBack="True" DataTextField="Type" DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_ApplyTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_ApplyTime">
                                                    </cc1:CalendarExtender>
                                                </td>
                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,YaoQiuWanChengShiJian%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="DLC_FinishTime" runat="server" ReadOnly="false"></asp:TextBox>
                                                    <cc1:CalendarExtender ID="CalendarExtender2" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_FinishTime">
                                                    </cc1:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                                    <asp:ListItem Text="<%$ Resources:lang,QiTa%>" Value="Other" />
                                                                    <asp:ListItem Text="<%$ Resources:lang,XiangMu%>" Value="Project" />
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="LB_RelatedID" runat="server" Text="ID:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <NickLee:NumberBox ID="NB_RelatedID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="40px">0</NickLee:NumberBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZe%>" Visible="False" />
                                                                <cc1:ModalPopupExtender ID="TB_Select_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_Select" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td align="right" class="formItemBgStyle">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label>
                                                    ： </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_ApplicantCode" runat="server" Width="96px"></asp:TextBox>
                                                    <asp:Label ID="LB_ApplicantName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_Status" runat="server" OnSelectedIndexChanged="DL_Status_SelectedIndexChanged">
                                                        <asp:ListItem Text="<%$ Resources:lang,XinJian%>" Value="新建" />
                                                        <asp:ListItem Text="<%$ Resources:lang,ShenPiZhong%>" Value="处理中" />
                                                        <asp:ListItem Text="<%$ Resources:lang,WanCheng%>" Value="完成" />
                                                        <asp:ListItem Text="<%$ Resources:lang,QuXiao%>" Value="取消" />
                                                    </asp:DropDownList>
                                                    <td class="formItemBgStyle" style="text-align: right"></td>
                                                    <td class="formItemBgStyle" style="text-align: left"></td>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
                                    </td>
                                </tr>
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

                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>



                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,LiaoPinDaiMa %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,LiaoPinMingCheng %>"></asp:Label></strong> </td>
                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong> </td>

                                                            <td width="15%" align="center"><strong>

                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong> </td>


                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label></strong> </td>

                                                            <td width="10%" align="center"><strong>

                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="30px"
                                            OnItemCommand="DataGrid2_ItemCommand" Width="110%" CellPadding="4" ShowHeader="False"
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

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="GoodsName" HeaderText="物料名">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Number" HeaderText="数量">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="出库">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:BoundColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>

                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
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

                            <table width="100%">
                                <tr>
                                    <td width="50%">
                                        <table cellpadding="3" cellspacing="0" class="formBgStyle" style="width: 100%;">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right;">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label>
                                                    ：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                        <asp:ListItem Value="Other"></asp:ListItem>
                                                        <asp:ListItem Value="GoodsSORecord"></asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:Label ID="LB_DetailID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                                <td align="right" class="formItemBgStyle">ID:</td>
                                                <td align="left" class="formItemBgStyle">
                                                    <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                    <asp:Label ID="LB_SourceRelatedID" runat="server" Text="0" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                </td>
                                                <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                    <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LiaoPinDaiMa %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left; height: 19px;">
                                                    <asp:TextBox ID="TB_GoodsCode" runat="server" Width="80px"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LiaoPinMingCheng %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left; height: 19px;">
                                                    <asp:TextBox ID="TB_GoodsName" runat="server" Width="80%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: right;">
                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun %>" />
                                                    &nbsp;<asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong %>" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left;">
                                                    <asp:TextBox ID="TB_Brand" runat="server" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="NB_Number" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="85px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                    ：</td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <NickLee:NumberBox ID="NB_Price" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Width="85px" Precision="3">0.000</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                    ： </td>
                                                <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" AutoPostBack="True" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr style="display: none;">
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" style="height: 1px; text-align: left;">
                                                    <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td align="left">

                                        <table width="100%">
                                            <tr>
                                                <td align="right">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>
                                                                ：
                                                            </td>
                                                            <td align="right">
                                                                <asp:DropDownList ID="DL_SourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SourceType_SelectedIndexChanged">
                                                                    <asp:ListItem Text="<%$ Resources:lang,QiTa%>" Value="Other" />
                                                                    <asp:ListItem Text="<%$ Resources:lang,XiaoShouDan%>" Value="GoodsSO" />
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td align="right">ID:</td>
                                                            <td align="left">
                                                                <NickLee:NumberBox ID="NB_SourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="35px">0</NickLee:NumberBox>
                                                            </td>
                                                            <td align="left">
                                                                <asp:Button ID="BT_SelectSO" runat="server" Text="<%$ Resources:lang,XiaoShouDan%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="BT_SelectSO_ModalPopupExtender1" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseSO" Enabled="True" PopupControlID="Panel2" TargetControlID="BT_SelectSO" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>

                                                </td>
                                            </tr>
                                        </table>

                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc1:TabPanel ID="TabPanel8" runat="server">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,LiaoPinKuCunLieBiao%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoXiaoShouDeLiaoPin %>"></asp:Label>
                                                    ：<asp:Label ID="Label2" runat="server" Visible="False"></asp:Label>
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="150%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="12%"><strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="14%"><strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="24%"><strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                            </strong></td>

                                                                            <td width="6%" align="center"><strong>
                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                            </strong></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False" Width="150%">
                                                            <Columns>

                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_GoodsCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"GoodsCode") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Spec" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="24%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Manufacturer" HeaderText="厂家">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="TotalNumber" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="UnitName" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel6" runat="server" TabIndex="1">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,LPCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoXRuKuDeLiaoPin %>"></asp:Label>
                                                    ：
                                                    
                                                    <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="150%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="15%"><strong>
                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="20%"><strong>
                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                            </strong></td>

                                                                            <td width="15%" align="center"><strong>
                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>

                                                                            <td align="center" width="35%"><strong>
                                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center"><strong>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid9" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid9_ItemCommand" ShowHeader="False" Width="150%">
                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="代码">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ItemCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ItemCode").ToString().Trim() %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                </asp:TemplateColumn>
                                                                <asp:HyperLinkColumn DataNavigateUrlField="ItemCode" DataNavigateUrlFormatString="TTItemInforView.aspx?ItemCode={0}" DataTextField="ItemName" HeaderText="名称" Target="_blank">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                </asp:HyperLinkColumn>

                                                                <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                </asp:BoundColumn>
                                                            </Columns>

                                                            <ItemStyle CssClass="itemStyle" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                        </asp:DataGrid>
                                                    </div>
                                                </ContentTemplate>
                                            </cc1:TabPanel>
                                            <cc1:TabPanel ID="TabPanel3" runat="server" TabIndex="2">
                                                <HeaderTemplate>
                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,XiaoShouDan%>"></asp:Label>
                                                    :
                                                    <asp:Label ID="LB_SOID" runat="server"></asp:Label>
                                                    &nbsp;<asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>
                                                    ：
                                                </HeaderTemplate>
                                                <ContentTemplate>
                                                    <br />
                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="200%">
                                                            <tr>
                                                                <td width="7">
                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                                </td>
                                                                <td>
                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                        <tr>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="30%"><strong>
                                                                                <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td width="10%" align="center"><strong>
                                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,YiChuKu %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="10%"><strong>
                                                                                <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>
                                                                            </strong></td>
                                                                            <td align="center" width="8%"><strong>
                                                                                <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                            </strong></td>

                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td align="right" width="6">
                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid7_ItemCommand" ShowHeader="False" Width="200%">

                                                            <Columns>
                                                                <asp:TemplateColumn HeaderText="编号">
                                                                    <ItemTemplate>
                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                    </ItemTemplate>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="GoodsCode" HeaderText="代码">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="GoodsName" HeaderText="名称">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="CheckOutNumber" HeaderText="已出库">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Price" HeaderText="单价">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                </asp:BoundColumn>

                                                            </Columns>
                                                            <EditItemStyle BackColor="#2461BF" />
                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                            <ItemStyle CssClass="itemStyle" />
                                                            <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />
                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        </asp:DataGrid>
                                                        <asp:Label ID="LB_Sql7" runat="server" Visible="False"></asp:Label>
                                                        <asp:Label ID="LB_Sql8" runat="server" Visible="False"></asp:Label>
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
                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>
                                        ： </td>
                                    <td align="left" style="width: 550px; height: 6px">
                                        <asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName">
                                        </asp:DropDownList>
                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>
                                        ： 
                                                                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                                                                            <asp:ListItem Text="<%$ Resources:lang,ChuHuoShengQing%>" Value="出货申请" />
                                                                                        </asp:DropDownList>
                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Target="_blank">
                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,MoBanWeiHu%>"></asp:Label>
                                        </asp:HyperLink>
                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,ShuaXin%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="left" colspan="2" style="height: 6px; text-align: right;">
                                        <table width="100%">
                                            <tr>
                                                <td align="left" style="width: 550px; height: 27px"><span style="font-size: 10pt">（<asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXingXi%>"></asp:Label>
                                                    ：</span><asp:CheckBox ID="CB_SMS" runat="server" Text="短信" />
                                                    <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian%>" />
                                                    <span style="font-size: 10pt">) </span>
                                                    <asp:Button ID="BT_SubmitApply" runat="server" CssClass="inpu" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" />
                                                    <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" DynamicServicePath="" Enabled="True" PopupControlID="Panel1" TargetControlID="BT_SubmitApply" Y="150">
                                                    </cc1:ModalPopupExtender>
                                                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td align="center" style="height: 22px; text-align: left;">
                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>
                                                    ： </td>
                                            </tr>
                                            <tr>
                                                <td align="center">
                                                    <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0" width="98%">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                    <tr>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="50%"><strong>
                                                                            <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="20%"><strong>
                                                                            <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="10%"><strong>
                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>
                                                                        </strong></td>
                                                                        <td align="center" width="10%"><strong></strong></td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td align="right" width="6">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False" Width="98%">
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle CssClass="notTab" HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" />

                                                        <ItemStyle CssClass="itemStyle" />
                                                        <Columns>
                                                            <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}" DataTextField="WLName" HeaderText="工作流" Target="_blank">
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
                                                                    <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>' Target="_blank"><img  class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            </asp:TemplateColumn>
                                                        </Columns>
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                        <br />
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

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
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
                    <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
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
                                    <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;">
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
                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="25%">
                                                                <strong>
                                                                    <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="15%">
                                                                <strong>
                                                                    <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="20%">
                                                                <strong>
                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,XiaoShouShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%">
                                                                <strong>
                                                                    <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,YeWuYuan%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="15%">
                                                                <strong>
                                                                    <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid6" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid6_ItemCommand"
                                            ShowHeader="false"
                                            Width="100%">
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="单号">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_SOID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"SOID") %>' />
                                                    </ItemTemplate>
                                                </asp:TemplateColumn>

                                                <asp:HyperLinkColumn DataNavigateUrlField="SOID" DataNavigateUrlFormatString="TTGoodsSaleOrderDetail.aspx?SOID={0}"
                                                    DataTextField="SOName" HeaderText="名称" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="25%" />
                                                </asp:HyperLinkColumn>

                                                <asp:BoundColumn DataField="Amount" HeaderText="总金额">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="SaleTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="销售时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:BoundColumn>
                                                <asp:HyperLinkColumn DataNavigateUrlField="SalesCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                    DataTextField="SalesName" HeaderText="业务员" Target="_blank">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                </asp:HyperLinkColumn>
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
                                        <asp:ImageButton ID="IMBT_CloseSO" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
