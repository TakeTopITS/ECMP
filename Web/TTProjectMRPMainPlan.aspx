<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTProjectMRPMainPlan.aspx.cs" Inherits="TTProjectMRPMainPlan" %>

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
                                                <table border="0" align="left" cellpadding="0" cellspacing="0" style="height: 31px; width: 345px">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="right" style="padding: 5px 5px 0px 5px;">
                                                <asp:Button ID="BT_CreateMain" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateMain_Click" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="center">
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
                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                 

                                                                    <td align="center" width="5%">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="30%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaMing%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                    <%-- <td align="center" width="5%">
                                                                                    <strong></strong>
                                                                                </td>--%>
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

                                                        <asp:BoundColumn DataField="PlanVerID" HeaderText="PlanVerID">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                        </asp:BoundColumn>


                                                        <asp:BoundColumn DataField="PlanVerName" HeaderText="计划名">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="BelongDepartName" HeaderText="归属部门">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="CreatorName" HeaderText="申请人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:BoundColumn>

                                                        <asp:TemplateColumn HeaderText="状态">
                                                            <ItemTemplate>
                                                                <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:TemplateColumn>
                                                        <%-- <asp:TemplateColumn HeaderText="打印">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        <ItemTemplate>
                                                                            <a href='TTGoodsShipmentOrderView.aspx?ShipmentNO=<%# DataBinder.Eval(Container.DataItem,"ShipmentNO") %>' target="_blank">
                                                                                <img src="ImagesSkin/print.gif" alt="打印" border="0" /></a>
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>--%>
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
                            <table width="95%" cellpadding="3" cellspacing="0" class="formBgStyle">
                                <tr>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：</td>
                                    <td colspan="3" class="formItemBgStyle" style="text-align: left">
                                        <asp:DropDownList ID="DL_PlanType" runat="server">
                                            <asp:ListItem Value="PROJECT" Text="<%$ Resources:lang,XiangMu%>"></asp:ListItem>
                                        </asp:DropDownList>
                                        <asp:Label ID="LB_PlanVerID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaMing%>"></asp:Label>：</td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:TextBox ID="TB_PlanVerName" runat="server" Width="96%"></asp:TextBox>
                                    </td>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label>：</td>
                                    <td align="left" class="formItemBgStyle">
                                        <asp:TextBox ID="TB_BelongDepartName" runat="server" Width="125px"></asp:TextBox>
                                        <cc1:ModalPopupExtender ID="TB_BelongDepartName_ModalPopupExtender" runat="server"
                                            Enabled="True" TargetControlID="TB_BelongDepartName" PopupControlID="Panel1"
                                            CancelControlID="IMBT_Close" BackgroundCssClass="modalBackground" Y="150">
                                        </cc1:ModalPopupExtender>
                                        <asp:Label ID="LB_BelongDepartCode" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right" width="15%">
                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZhiDingZhe%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="width: 30%; text-align: left">
                                        <asp:TextBox ID="TB_CreatorName" runat="server" Width="40%" Enabled="false"></asp:TextBox>
                                        <asp:Label ID="LB_CreatorCode" runat="server" Visible="false"></asp:Label>
                                    </td>
                                    <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiDingShiJian%>"></asp:Label>： </td>
                                    <td class="formItemBgStyle" style="text-align: left">
                                        <asp:Label ID="LB_CreateTime" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">
                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：</td>
                                    <td colspan="3" align="left" class="formItemBgStyle">
                                        <asp:DropDownList ID="DL_Status" runat="server">
                                            <asp:ListItem Value="UNFinished" Text="<%$ Resources:lang,WeiWang%>"></asp:ListItem>
                                            <asp:ListItem Value="Finished" Text="<%$ Resources:lang,WanCheng%>"></asp:ListItem>
                                            <asp:ListItem Value="Cancel" Text="<%$ Resources:lang,QuXiao%>"></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>

                                </tr>
                                <tr>
                                    <td class="formItemBgStyle" style="text-align: right">&nbsp;</td>
                                    <td class="formItemBgStyle" colspan="3" style="text-align: left">

                                        <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql2" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql3" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                <tr>
                                    <td align="left" class="page_topbj">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaMingXi%>"></asp:Label>：
                                    </td>
                                    <td colspan="5" align="Left" class="page_topbj">
                                        <table class="page_topbj">
                                            <tr>
                                                <td align="right">
                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,Cong%>"></asp:Label>
                                                    <asp:Label ID="Label514" runat="server" Text="<%$ Resources:lang,JiHuaHao%>"></asp:Label></td>
                                                <td>
                                                    <NickLee:NumberBox ID="NB_FromPlanVerID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="60px">0</NickLee:NumberBox></td>
                                                <td>
                                                    <asp:Button ID="BT_CopyDetailFromPlan" runat="server" CssClass="inpu" Enabled="False" Text="复制" OnClick="BT_CopyDetailFromPlan_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6" align="right" style="padding-bottom: 5px;">
                                        <asp:Button ID="BT_CreateDetail" runat="server" Text="<%$ Resources:lang,New %>" CssClass="inpuYello" OnClick="BT_CreateDetail_Click" />
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="6">
                                        <table width="130%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td width="7">
                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                </td>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>

                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                            </td>


                                                            <td align="center" width="5%"><strong>
                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong> </td>


                                                            <td width="7%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>Bom</strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,WanChengShuLiang%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,WeiWanShuLiang%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhiDingShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhiXingShiJian%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JiaoHuoShiJian%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="5%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuanLianLeiXing%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="6%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiLuID%>"></asp:Label></strong>
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
                                            Height="1px" OnItemCommand="DataGrid1_ItemCommand" Width="130%" CellPadding="4"
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
                                                <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:ButtonColumn CommandName="BOM" Text="&lt;div&gt;&lt;img src=ImagesSkin/BOM.png border=0 width=24 height=24 alt='BOM' /&gt;&lt;/div&gt;">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:ButtonColumn>
                                                <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="FinishedNumber" HeaderText="完成数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="UnFinishedNumber" HeaderText="未完数量">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="CreateDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="制定时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="PlanStartDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="执行时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="DeliveryDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发货时间">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="SourceType" HeaderText="关联类型">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="SourceRecordID" HeaderText="记录ID">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
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

                            <table cellpadding="0" cellspacing="0" width="100%">
                                <tr>
                                    <td colspan="6" align="left">

                                        <table align="center" width="100%">
                                            <tr>
                                                <td width="40%" class="formItemBgStyle">
                                                    <table align="center" width="100%" cellpadding="1" cellspacing="0" class="formBgStyle">
                                                        <tr>
                                                            <td width="100px" align="right" class="formItemBgStyle">
                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                                            <td align="left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_RecordSourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_RecordSourceType_SelectedIndexChanged">
                                                                    <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>"></asp:ListItem>
                                                                    <asp:ListItem Value="GoodsPJRecord" Text="<%$ Resources:lang,XiangMuWuZiJiLu%>"></asp:ListItem>
                                                                </asp:DropDownList></td>
                                                            <td align="right" class="formItemBgStyle">ID:</td>
                                                            <td align="left" colspan="2" class="formItemBgStyle">
                                                                <NickLee:NumberBox ID="NB_RecordSourceID" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="30px">0</NickLee:NumberBox>
                                                                <asp:Label ID="LB_ID" runat="server" Visible="false"></asp:Label>
                                                                <asp:Label ID="LB_SourceRelatedID" runat="server" Visible="False" Text="0"></asp:Label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                <asp:DropDownList ID="DL_GoodsType" runat="server" DataTextField="Type" DataValueField="Type"></asp:DropDownList>

                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DaiMa%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_GoodsCode" runat="server" Width="80%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_GoodsName" runat="server" Width="90%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,XingHao%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_ModelNumber" runat="server" Width="99%"></asp:TextBox>
                                                            </td>
                                                        </tr>

                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuiGe%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: right;" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_Spec" runat="server" Height="50px" TextMode="MultiLine" Width="99%"></asp:TextBox>
                                                                <asp:Button ID="BT_FindGoods" runat="server" CssClass="inpu" OnClick="BT_FindGoods_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                                <asp:Button ID="BT_Clear" runat="server" CssClass="inpu" OnClick="BT_Clear_Click" Text="<%$ Resources:lang,QingKong%>" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,PinPai%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                                <asp:TextBox ID="TB_Brand" runat="server" Width="99%"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_PlanNumber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Width="53px">0.00</NickLee:NumberBox>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WanChengShuLiang%>"></asp:Label>：
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_FinishedNUmber" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                    PositiveColor="" Width="85px">0.00</NickLee:NumberBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td style="text-align: right" class="formItemBgStyle">
                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,DanWei%>"></asp:Label>：
                                                            </td>
                                                            <td style="text-align: left" class="formItemBgStyle">
                                                                <asp:DropDownList ID="DL_Unit" runat="server" DataTextField="UnitName" DataValueField="UnitName">
                                                                </asp:DropDownList>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right">BomVerID:&nbsp;</td>
                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                <asp:DropDownList ID="DL_BomVerID" runat="server" DataTextField="VerID" AutoPostBack="true" DataValueField="VerID" OnSelectedIndexChanged="DL_BomVerID_SelectedIndexChanged">
                                                                </asp:DropDownList>
                                                                <asp:Button ID="BT_GoodsBOM" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaKanBOM%>"></asp:Button>
                                                                <cc1:ModalPopupExtender ID="ModalPopupExtender1" runat="server"
                                                                    Enabled="True" TargetControlID="BT_GoodsBOM" PopupControlID="Panel4"
                                                                    CancelControlID="IMBT_CloseBOM" BackgroundCssClass="modalBackground" Y="150">
                                                                </cc1:ModalPopupExtender>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JiHuaKaiShiShiJian%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                <asp:TextBox ID="DLC_PlanStartDate" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender1" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_PlanStartDate">
                                                                </cc1:CalendarExtender>
                                                            </td>
                                                            <td class="formItemBgStyle" style="text-align: right">
                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,FaHuoShiJian%>"></asp:Label>：</td>
                                                            <td class="formItemBgStyle" style="text-align: left">
                                                                <asp:TextBox ID="DLC_DeliveryDate" runat="server" Width="100px" ReadOnly="false"></asp:TextBox>
                                                                <cc1:CalendarExtender ID="CalendarExtender4" runat="server" Format="yyyy-MM-dd" TargetControlID="DLC_DeliveryDate">
                                                                </cc1:CalendarExtender>
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
                                                                        <td class="formItemBgStyle" style="text-align: right">
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：</td>
                                                                        <td class="formItemBgStyle" style="text-align: left">
                                                                            <table>
                                                                                <tr>
                                                                                    <td width="15%" align="right">
                                                                                        <asp:DropDownList ID="DL_SourceType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_SourceType_SelectedIndexChanged">

                                                                                            <asp:ListItem Value="GoodsPJ" Text="<%$ Resources:lang,XiangMu%>"></asp:ListItem>
                                                                                        </asp:DropDownList>
                                                                                    </td>
                                                                                    <td align="right">ID:</td>
                                                                                    <td width="15%" align="left">
                                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SourceID" runat="server" OnBlur="" OnFocus="" OnKeyPress=""
                                                                                            PositiveColor="" Precision="0" Width="35px">0</NickLee:NumberBox>
                                                                                    </td>
                                                                                    <td align="left">

                                                                                        <asp:Button ID="BT_SelectPJ" runat="server" Text="<%$ Resources:lang,XiangMu%>" />
                                                                                        <cc1:ModalPopupExtender ID="BT_SelectPJ_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_ClosePJ" Enabled="True" PopupControlID="Panel6" TargetControlID="BT_SelectPJ" Y="150">
                                                                                        </cc1:ModalPopupExtender>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
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
                                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>
                                                                                                <td width="14%" align="center"><strong>
                                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>
                                                                                                <td width="10%" align="center"><strong>
                                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong> </td>
                                                                                                <td width="14%" align="center"><strong>
                                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>
                                                                                                <td width="10%" align="center"><strong>
                                                                                                    <asp:Label ID="Label215" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                                                <td align="center"><strong>
                                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShuLiang %>"></asp:Label></strong> </td>
                                                                                                <td align="center"><strong>
                                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>

                                                                                                <td align="center"><strong>
                                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DiZhi %>"></asp:Label></strong> </td>
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
                                                                <asp:Label runat="server" Text="<%$ Resources:lang,QXQLP %>"></asp:Label>：
                                                                        <div id="Div2" style="width: 100%; height: 300px; overflow: auto;">
                                                                            <table width="150%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="15%" align="center"><strong>
                                                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong> </td>
                                                                                                <td width="20%" align="center"><strong>
                                                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong> </td>

                                                                                                <td width="10%" align="center"><strong>
                                                                                                    <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>

                                                                                                <td width="35%" align="center"><strong>
                                                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong> </td>
                                                                                                <td width="10%" align="center"><strong>
                                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong> </td>
                                                                                                <td width="20%" align="center"><strong>
                                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,DanJia %>"></asp:Label></strong> </td>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Brand" HeaderText="厂家">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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

                                                        <cc1:TabPanel ID="TabPanel4" runat="server" TabIndex="21">
                                                            <HeaderTemplate>
                                                                <asp:Label runat="server" Text="<%$ Resources:lang,XiangMu%>"></asp:Label>:
                                                                        <asp:Label ID="LB_ProjectID" runat="server"></asp:Label>&#160;<asp:Label runat="server" Text="<%$ Resources:lang,MingXi%>"></asp:Label>：
                                                            </HeaderTemplate>
                                                            <ContentTemplate>
                                                                <br />
                                                                <div id="Div1" style="width: 100%; height: 300px; overflow: auto;">
                                                                    <table width="200%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                        <tr>
                                                                            <td width="7">
                                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                            </td>
                                                                            <td>
                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                    <tr>
                                                                                        <td align="center" width="6%">
                                                                                            <strong>
                                                                                                <table border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td>
                                                                                                            <asp:CheckBox ID="CB_CheckProductionDetailItem" runat="server" OnCheckedChanged="CB_CheckProductionDetailItem_CheckedChanged" AutoPostBack="True" /></td>
                                                                                                        <td>
                                                                                                            <asp:ImageButton ID="IB_AdProductionDetailItem" runat="server" ImageUrl="Images/plus.gif" OnClick="IB_AdProductionDetailItem_Click" />
                                                                                                        </td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </strong></td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemID" runat="server" Text="<%$ Resources:lang,ID %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemCode" runat="server" Text="<%$ Resources:lang,Code %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="15%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemName" runat="server" Text="<%$ Resources:lang,Name %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="4%" align="center"><strong>
                                                                                            <asp:Label ID="Label333" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label></strong></td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildBomVersion" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemNumber" runat="server" Text="<%$ Resources:lang,Number %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label23331" runat="server" Text="<%$ Resources:lang,YuCaiGouLiang%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,YuRuKuLiang%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,YuChuKuLiang%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,YuShengChanLiang %>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemProcess" runat="server" Text="<%$ Resources:lang,KuChengLiang%>"></asp:Label></strong>
                                                                                        </td>
                                                                                        <td width="6%" align="center">
                                                                                            <strong>
                                                                                                <asp:Label ID="LB_dgChildItemUnit" runat="server" Text="<%$ Resources:lang,Unit %>"></asp:Label></strong>
                                                                                        </td>

                                                                                    </tr>
                                                                                </table>
                                                                            </td>
                                                                            <td width="6" align="right">
                                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                    <asp:DataGrid ID="DataGrid10" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid10_ItemCommand"
                                                                        Width="200%" ShowHeader="False" BorderColor="#7FC4ED" BorderStyle="Solid" BorderWidth="1px">
                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                        <ItemStyle CssClass="itemStyle" HorizontalAlign="Center" />
                                                                        <Columns>
                                                                            <asp:TemplateColumn>
                                                                                <ItemTemplate>
                                                                                    <asp:CheckBox ID="CB_CheckItem" runat="server" />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:TemplateColumn HeaderText="编号">
                                                                                <ItemTemplate>
                                                                                    <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="物料类型">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass.GetItemType(Eval("ItemCode").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="Number" HeaderText="数量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="AleadyPurchased" HeaderText="已采购量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="AleadyCheckIn" HeaderText="已入库量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="AleadyCheckOut" HeaderText="已出库量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:BoundColumn DataField="AleadyProduction" HeaderText="已生产量">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>
                                                                            <asp:TemplateColumn HeaderText="库存量">
                                                                                <ItemTemplate>
                                                                                    <%# ShareClass.GetMaterialsStockNumber(Eval("ItemCode").ToString()) %>
                                                                                </ItemTemplate>
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:TemplateColumn>
                                                                            <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                            </asp:BoundColumn>


                                                                        </Columns>
                                                                    </asp:DataGrid>
                                                                </div>
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

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_NewDetail" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewDetail_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label114" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer layui-layer-iframe" id="popBOMWindow" name="fixedDivNoConfirm"
                        style="z-index: 9999; width: 400px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label71" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table>
                                <tr>
                                    <td style="width: 380px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                            ShowLines="True" Width="380px">
                                            <RootNodeStyle CssClass="rootNode" />
                                            <NodeStyle CssClass="treeNode" />
                                            <LeafNodeStyle CssClass="leafNode" />
                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                        </asp:TreeView>
                                    </td>
                                </tr>
                            </table>
                        </div>

                        <div id="popwindow_footer11" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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

                    <asp:Panel ID="Panel6" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 550px; height: 350px; overflow: auto;">
                            <table width="100%">
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
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGProjectID" runat="server" Text="<%$ Resources:lang,ProjectID%>" /></strong>
                                                            </td>
                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Lb_DGProjectCode" runat="server" Text="<%$ Resources:lang,ProjectCode%>" /></strong>
                                                            </td>
                                                            <td width="30%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGProjectName" runat="server" Text="<%$ Resources:lang,ProjectName%>" /></strong>
                                                            </td>
                                                            <td width="25%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGPM" runat="server" Text="<%$ Resources:lang,PM%>" /></strong>
                                                            </td>

                                                            <td width="15%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="LB_DGStatus" runat="server" Text="<%$ Resources:lang,Status%>" /></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                                <td width="6" align="right">
                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid8_ItemCommand"
                                            AllowCustomPaging="false" ShowHeader="False"
                                            Width="100%">
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <ItemStyle CssClass="itemStyle" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="编号">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_ProjectID" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ProjectID") %>'
                                                            CssClass="inpu" />
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ProjectCode" HeaderText="项目代码">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="ProjectName" HeaderText="项目名称">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="PMName" HeaderText="项目经理">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="25%" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass.GetStatusHomeNameByRequirementStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                        </asp:DataGrid>
                                    </td>
                                    <td style="width: 50px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_ClosePJ" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Panel ID="Panel4" runat="server" CssClass="modalPopup" Style="display: none;">
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
                                        <asp:ImageButton ID="IMBT_CloseBOM" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
