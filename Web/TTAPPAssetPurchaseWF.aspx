<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTAPPAssetPurchaseWF.aspx.cs" Inherits="TTAPPAssetPurchaseWF" %>

<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0; minimum-scale=0.1; user-scalable=1" />

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />

    <style type="text/css">
        body {
            /*margin-top: 5px;*/
            /*background-image: url(Images/login_bj.jpg);*/
            background-repeat: repeat-x;
            font: normal 100% Helvetica, Arial, sans-serif;
        }
    </style>

    <style type="text/css">
        #AboveDiv {
            max-width: 1024px;
            width: expression (document.body.clientWidth >= 1024? "1024px" : "auto" ));
            min-width: 277px;
            width: expression (document.body.clientWidth <= 277? "277px" : "auto" ));
        }
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
             /*  if (top.location != self.location) { } else { CloseWebPage(); }*/

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
                    <table id="AboveTable" cellpadding="0" cellspacing="0" width="100%" class="bian">
                        <tr>
                            <td height="31" class="page_topbj">
                                <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td align="left">
                                            <%-- <a href="TTAPPRegularWLMain.aspx" target ="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">--%>
                                            <a href="javascript:window.history.go(-1)" target="_top" onclick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';">
                                                <table width="245" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <img src="ImagesSkin/return.png" alt="" width="29" height="31" /></td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titleziAPP">
                                                            <asp:Label runat="server" Text="<%$ Resources:lang,Back%>" />
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%></td>
                                                    </tr>
                                                </table>
                                                <img id="IMG_Waiting" src="Images/Processing.gif" alt="请稍候，处理中..." style="display: none;" />
                                            </a>
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
                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                <tr>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                    </td>
                                                    <td width="5%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                    </td>
                                                    <td width="10%" align="center">
                                                        <strong>
                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,FaQiShengQing%>" /></strong>
                                                    </td>
                                                    <td align="center" width="15%">
                                                        <strong>
                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label></strong>
                                                    </td>
                                                    <td align="center" width="30%">
                                                        <strong>
                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                    </td>
                                                    <td align="center">
                                                        <strong>
                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                    </td>
                                                    <%--    <td align="center" width="5%"></td>--%>
                                                </tr>
                                            </table>
                                        </td>
                                        <td align="right" width="6">
                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                        </td>
                                    </tr>
                                </table>
                                <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid5_ItemCommand"
                                    OnPageIndexChanged="DataGrid5_PageIndexChanged" PageSize="25" ShowHeader="false"
                                    Width="100%">
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
                                        <asp:BoundColumn DataField="POID" HeaderText="POID">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                        </asp:BoundColumn>
                                        <asp:BoundColumn DataField="POName" HeaderText="名称">
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                        </asp:BoundColumn>
                                        <asp:TemplateColumn HeaderText="状态">
                                            <ItemTemplate>
                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                            </ItemTemplate>
                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
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

                    <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label32" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="200%" cellpadding="0" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td class="formItemBgStyle" align="center">
                                        <table width="98%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                            <tr style="display: none;">
                                                <td class="formItemBgStyle" style="text-align: right" width="15%">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,DanHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="width: 20%; text-align: left">
                                                    <asp:Label ID="LB_POID" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_POName" runat="server" Width="98%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaiGouYuanDaiMa%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_PurManCode" runat="server" Width="80px"></asp:TextBox>
                                                    <asp:Label ID="LB_PurManName" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaiGouShiJian%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="width: 106px; text-align: left">

                                                    <asp:TextBox ID="DLC_PurTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_PurTime">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuJiDaoHuoShiJian%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="DLC_ArrivalTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                    <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_ArrivalTime">
                                                    </ajaxToolkit:CalendarExtender>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZongJinE%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 106px;">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Amount" runat="server" Enabled="False" OnBlur="" OnFocus=""
                                                        OnKeyPress="" PositiveColor="" Width="85px">
                                                                0.00
                                                    </NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BiBie%>"></asp:Label>
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
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <asp:TextBox ID="TB_Comment" runat="server" Width="95%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left; width: 106px;">
                                                    <asp:DropDownList ID="DL_POStatus" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_POStatus_SelectedIndexChanged">
                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />
                                                        <asp:ListItem Value="处理中" Text="<%$ Resources:lang,ShenPiZhong%>" />
                                                        <asp:ListItem Value="采购中" Text="<%$ Resources:lang,CaiGouZhong%>" />
                                                        <asp:ListItem Value="取消" Text="<%$ Resources:lang,QuXiao%>" />
                                                        <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuanLian%>"></asp:Label>：
                                                </td>
                                                <td align="left" class="formItemBgStyle">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:DropDownList ID="DL_RelatedType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="DL_RelatedType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                                    <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td>
                                                                <asp:Label ID="LB_RelatedID" runat="server" Text="ID:"></asp:Label>
                                                            </td>
                                                            <td>
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_RelatedID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Precision="0" Width="40px">0</NickLee:NumberBox>
                                                            </td>
                                                            <td>
                                                                <asp:Button ID="BT_Select" runat="server" Text="<%$ Resources:lang,XuanZe%>" Visible="false" />
                                                                <cc1:ModalPopupExtender ID="TB_Select_ModalPopupExtender" runat="server" Enabled="True"
                                                                    TargetControlID="BT_Select" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                                                    BackgroundCssClass="modalBackground" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle">
                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0" Width="100%">
                                            <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="采购单明细">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,CaiGouDanMingXi%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <table align="center" cellpadding="0" cellspacing="0" width="100%">

                                                        <tr>
                                                            <td align="left" style="padding-bottom: 5px;">
                                                                <asp:Button ID="BT_CreateDetail" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" />
                                                            </td>
                                                        </tr>

                                                        <tr>

                                                            <td>

                                                                <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                    width="100%">

                                                                    <tr>

                                                                        <td width="7">

                                                                            <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>

                                                                        <td>

                                                                            <table border="0" cellpadding="0" cellspacing="0" width="100%">

                                                                                <tr>

                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                                    </td>


                                                                                    <td align="center" width="5%"><strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="10%"><strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong> </td>
                                                                                    <td align="center" width="13%"><strong>
                                                                                        <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>

                                                                                    <td align="center" width="8%"><strong>
                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,JinE %>"></asp:Label></strong> </td>
                                                                                    <td align="center"><strong>
                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ShenQingRen %>"></asp:Label></strong> </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>

                                                                        <td align="right" width="6">

                                                                            <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                    </tr>
                                                                </table>

                                                                <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                                    ShowHeader="False"
                                                                    Width="100%">
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

                                                                        <asp:BoundColumn DataField="AssetCode" HeaderText="代码">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="AssetName" HeaderText="名称">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Type" HeaderText="类型">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Spec" HeaderText="规格">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Number" HeaderText="数量">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Unit" HeaderText="单位">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Price" HeaderText="单价">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:BoundColumn DataField="Amount" HeaderText="金额">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:HyperLinkColumn DataNavigateUrlField="ApplicantCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                                            DataTextField="ApplicantName" HeaderText="申请人" Target="_blank">

                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                                        </asp:HyperLinkColumn>
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
                                                </ContentTemplate>
                                            </cc1:TabPanel>

                                            <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="关联合同">

                                                <HeaderTemplate>

                                                    <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,GuanLianHeTong%>"></asp:Label>
                                                </HeaderTemplate>

                                                <ContentTemplate>

                                                    <table align="center" cellpadding="0" cellspacing="0" width="98%">

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
                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,HeTongDaiMa%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="17%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="5%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="5%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="8%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,QianDingRiQi%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="7%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,JinE%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="5%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,BiZhong%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="10%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,JiaFangDanWei%>"></asp:Label></strong>
                                                                                    </td>

                                                                                    <td width="10%" align="center">

                                                                                        <strong>
                                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,YiFangDaiWei%>"></asp:Label></strong>
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
                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewMain" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewMain_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popDetailWindow" name="fixedDiv"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label83" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="200%">
                                <tr>
                                    <td width="50%">

                                        <table align="center" cellpadding="3" cellspacing="0" class="formBgStyle" width="98%">

                                            <tr>
                                                <td class="formItemBgStyle" style="width: 20%; text-align: right">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,shenqingren%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" style="text-align: left">
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:TextBox ID="TB_ApplicantCode" runat="server" Width="80px"></asp:TextBox></td>
                                                            <td>
                                                                <asp:Label ID="LB_ApplicantName" runat="server"></asp:Label></td>
                                                            <td>
                                                                <asp:Button ID="BT_SelectUser" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XuanZe %>" OnClick="BT_SelectUser_Click" /></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:DropDownList ID="DL_Type" runat="server" AutoPostBack="True" DataTextField="Type"
                                                        DataValueField="Type">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right"></td>

                                                <td class="formItemBgStyle" style="text-align: left"></td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>： </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:TextBox ID="TB_AssetCode" runat="server" Width="99%"></asp:TextBox></td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <asp:TextBox ID="TB_AssetName" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>：</td>

                                                <td class="formItemBgStyle" colspan="4" style="text-align: left">

                                                    <asp:TextBox ID="TB_ModelNumber" runat="server" Height="20px" Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>：
                                                </td>

                                                <td style="text-align: right" class="formItemBgStyle">

                                                    <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                    <br />

                                                    <asp:Button ID="BT_FindAsset" runat="server" CssClass="inpu" OnClick="BT_FindAsset_Click" Text="<%$ Resources:lang,ChaXun %>" />

                                                    <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong %>" />
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GouMaiLiYou %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" style="height: 1px; text-align: left;">

                                                    <asp:TextBox ID="TB_PurReason" runat="server" Height="42px" TextMode="MultiLine"
                                                        Width="99%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Number" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" style="text-align: left">

                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Price" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                        PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="2" style="text-align: left">
                                                    <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right"></td>
                                                <td class="formItemBgStyle" style="text-align: left"></td>
                                            </tr>
                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GongYingShang %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" style="height: 18px; text-align: left">

                                                    <asp:TextBox ID="TB_Supplier" runat="server" Width="20%"></asp:TextBox>
                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,DianHua %>"></asp:Label>：
                                                    <asp:TextBox ID="TB_SupplierPhone" runat="server" Width="20%"></asp:TextBox>
                                                    <asp:DropDownList ID="DL_VendorList" runat="server" AutoPostBack="True" DataTextField="VendorName" DataValueField="VendorCode" OnSelectedIndexChanged="DL_VendorList_SelectedIndexChanged">
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>

                                            <tr style="display: none;">

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhuangTai %>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="4" style="text-align: left">

                                                    <asp:DropDownList ID="DL_Status" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_Status_SelectedIndexChanged">

                                                        <asp:ListItem Value="新建" />

                                                        <asp:ListItem Value="采购中" />

                                                        <asp:ListItem Value="完成" />

                                                        <asp:ListItem Value="取消" />
                                                    </asp:DropDownList>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td>
                                        <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">

                                            <cc1:TabPanel ID="TabPanel6" runat="server" HeaderText="资产查询列表">

                                                <HeaderTemplate>
                                                    <asp:Label ID="Label513" runat="server" Text="<%$ Resources:lang,ZCCXLB%>"></asp:Label>
                                                </HeaderTemplate>
                                                <ContentTemplate>

                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,QingXuanQuYaoCaiGouDeZiChan%>"></asp:Label>：

                                                    <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">

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
                                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="20%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="10%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="35%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                                            </td>

                                                                            <td width="20%" align="center">

                                                                                <strong>
                                                                                    <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,DanJia%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>

                                                                <td width="6" align="right">

                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>

                                                        <asp:DataGrid ID="DataGrid7" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                            Height="1px" Width="100%" OnItemCommand="DataGrid7_ItemCommand" CellPadding="4"
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

                                                                <asp:BoundColumn DataField="SmallType" HeaderText="型号">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                </asp:BoundColumn>

                                                                <asp:BoundColumn DataField="PurchasePrice" HeaderText="采购单价">

                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
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
                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popAssignWindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 98%; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label48" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" colspan="2" style="height: 10px; text-align: left">

                                        <strong>
                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,GouMaiShenQingGongZuoLiu%>"></asp:Label>：</strong>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="资产采购" Text="<%$ Resources:lang,ZiChanCaiGou%>" />
                                        </asp:DropDownList>

                                        <asp:TextBox ID="TB_WLType" runat="server" Enabled="False" Width="59px">资产采购</asp:TextBox>

                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                            Width="144px">
                                        </asp:DropDownList>

                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                            Target="_blank">
                                            <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                        </asp:HyperLink>

                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click"
                                            Text="<%$ Resources:lang,ShuaXin%>" />
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_WLName" runat="server" Width="387px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle" style="text-align: left">

                                        <asp:TextBox ID="TB_Description" runat="server" Height="48px" TextMode="MultiLine"
                                            Width="441px"></asp:TextBox>
                                    </td>
                                </tr>

                                <tr style="font-size: 10pt">

                                    <td class="formItemBgStyle" style="text-align: right;"></td>

                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">（<asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoChuLiXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" />

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
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu%>"></asp:Label>：
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
                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="55%">

                                                                <strong>
                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="15%">

                                                                <strong>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong>
                                                            </td>

                                                            <td align="center" width="10%">

                                                                <strong>
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
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
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
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
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popDeparentUserSelectWindow" name="fixedDiv"
                        style="z-index: 9999; width: 220px; height: 500px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title22">
                            <asp:Label ID="Label169" runat="server"></asp:Label>
                        </div>
                        <div id="popwindow_content22" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table cellpadding="0" cellspacing="0">
                                <tr>

                                    <td style="border-right: solid 1px #D8D8D8;" valign="top" width="170">
                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                            width="170px">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                <td>
                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                        <tr>
                                                            <td align="center"><strong>
                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,BuMeRenYuan %>"></asp:Label></strong> </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td align="right" width="6">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                            ForeColor="#333333" GridLines="None" OnItemCommand="DataGrid3_ItemCommand" ShowHeader="False"
                                            Width="170px">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="部门人员：">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserCode" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>' /><asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <span class="layui-layer-setwin">
                            <asp:Button ID="BT_CloseSelectWindows" runat="server" CssClass="inpu" Text="<%$ Resources:lang,GuanBi%>" OnClick="BT_CloseSelectUser_Click" /></span>
                    </div>



                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
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

                    <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server"
                        Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
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
