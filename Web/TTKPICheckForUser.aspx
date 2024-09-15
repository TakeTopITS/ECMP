<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTKPICheckForUser.aspx.cs"
    Inherits="TTKPICheckForUser" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>部门设置</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1400px;
            width: expression (document.body.clientWidth <= 1400? "1400px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="lhgdialog/lhgcore.min.js"></script>
    <script type="text/javascript" src="lhgdialog/lhgdialog.min.js"> </script>
    <script type="text/javascript">
        function opim(id, chatterName, htmlText) {

            var dg = new J.dialog({ id: id, title: chatterName, width: 730, height: 420, btnBar: false, cancelBtn: false, page: htmlText, autoPos: { left: 'center', top: 'top' }, fixed: false, left: 'center', top: 'top', rang: true });

            dg.ShowDialog();
        }
    </script>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuanGongKPISheZhi%>"></asp:Label>
                                                        </td>
                                                        <td width="5">
                                                            <%-- <img src="ImagesSkin/main_top_r.jpg" width="5" height="31" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td>&nbsp;
                                            </td>
                                            <td align="left">
                                                <asp:Button ID="BT_CloseAllUserPastKPI" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,GBSYDQJX%>"
                                                    OnClick="BT_CloseAllUserPastKPI_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td width="220px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                align="left" rowspan="2" valign="top">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="220px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="left" rowspan="2" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                valign="top" width="200px">
                                                <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                    ShowLines="True" Width="200px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td valign="top" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8"
                                                align="left">
                                                <table style="width: 100%; text-align: left;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="height: 26px;" class="formItemBgStyle">
                                                            <table style="width: 100%;">
                                                                <tr>
                                                                    <td colspan="4" align="right">
                                                                        <asp:Button ID="BT_CreateKPICheck" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateKPICheck_Click" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                        ： </td>
                                                                    <td>
                                                                        <asp:Label ID="LB_KPICheckID" runat="server"></asp:Label>
                                                                        <asp:TextBox ID="TB_KPICheckName" runat="server" Width="300px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td>

                                                                        <asp:TextBox ID="DLC_StartTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_StartTime">
                                                                        </ajaxToolkit:CalendarExtender>

                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                                    </td>
                                                                    <td>

                                                                        <asp:TextBox ID="DLC_EndTime" ReadOnly="false" runat="server"></asp:TextBox>
                                                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_EndTime">
                                                                        </ajaxToolkit:CalendarExtender>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZiPingZongFen%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalSelfPoint" runat="server" Width="53px" Enabled="false">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,LingDaoPingZongFen%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalLeaderPoint" runat="server" Enabled="False" Width="53px">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,DiSanFangPingZongFen%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalThirdPartPoint" runat="server" Enabled="False" Width="53px">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,XiTongZongPingFen%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <NickLee:NumberBox ID="NB_TotalSqlPoint" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,RenShiPingFen%>"></asp:Label></td>
                                                                    <td>
                                                                        <NickLee:NumberBox ID="NB_TotalHRPoint" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                                                    <td>
                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZongFen%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <NickLee:NumberBox ID="NB_TotalPoint" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                                                </tr>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_Status" runat="server">
                                                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,HuoDong%>" />
                                                                            <asp:ListItem Value="关闭" Text="<%$ Resources:lang,GuanBi%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                    <td>&nbsp;
                                                                    </td>
                                                                    <td>&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 26px;">
                                                            <asp:Button ID="BT_UpdateKPICheck" runat="server" CssClass="inpu" Enabled="False"
                                                                OnClick="BT_UpdateKPICheck_Click" Text="<%$ Resources:lang,BaoCun%>" />
                                                            &nbsp;
                                                        <asp:Button ID="BT_DeleteKPICheck" runat="server" CssClass="inpu" Enabled="False" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                            OnClick="BT_DeleteKPICheck_Click" Text="<%$ Resources:lang,ShanChu%>" />
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                        <asp:Button ID="BT_CopyFromPriorKPI" runat="server" Enabled="False" Text="<%$ Resources:lang,CSYCKHFZJXZBHDSFPHRY%>"
                                                            Width="280px" OnClick="BT_CopyFromPriorKPI_Click" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <table width="100%" align="center" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td class="formItemBgStyle" style="height: 26px;">
                                                            <b>
                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMen%>"></asp:Label>：<asp:Label ID="LB_DepartCode" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhiCheng%>"></asp:Label>：<asp:Label ID="LB_Position" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuanGong%>"></asp:Label>：<asp:Label ID="LB_UserCode" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="LB_UserName" runat="server"></asp:Label>
                                                                &nbsp;<asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KPILieBiao%>"></asp:Label>：</b>&nbsp;
                                                        </td>
                                                        <td class="formItemBgStyle" style="height: 26px;">（<asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,quanzhong%>"></asp:Label>：<b>
                                                            <asp:Label ID="LB_Weight" runat="server" Text="0"></asp:Label></b>）
                                                        </td>
                                                        <td align="right" style="width: 30%; padding-bottom: 5px;" class="formItemBgStyle">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td colspan="3">
                                                            <table width="100%" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                               <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label>
                                                                                    </strong>
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <strong>KPI</strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,QuanZhong%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LingDaoPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DiSanFangPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XiTongPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="10%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,RenShiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label27" runat="server" Text="总评分"></asp:Label></strong>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                                                OnItemCommand="DataGrid2_ItemCommand"
                                                                AllowCustomPaging="false" ShowHeader="False"
                                                                Width="100%">
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <ItemStyle CssClass="itemStyle" />
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
                                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="KPI" HeaderText="KPI">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Weight" HeaderText="权重">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:BoundColumn DataField="SelfPoint" HeaderText="自评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LeaderPoint" HeaderText="领导评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ThirdPartPoint" HeaderText="第三方评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SqlPoint" HeaderText="系统评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="HRPoint" HeaderText="人事评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Point" HeaderText="总评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                            <td valign="top" style="width: 220px; border-left: solid 1px #D8D8D8; text-align: left;"
                                                rowspan="2">

                                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer2" runat="server" ActiveTabIndex="0" Width="100%">
                                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="职称模板">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhiChengMuBan%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="全部模板">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,QuanBuMuBan%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <asp:TreeView ID="TreeView4" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView4_SelectedNodeChanged"
                                                                ShowLines="True" Width="220px">
                                                                <RootNodeStyle CssClass="rootNode" />
                                                                <NodeStyle CssClass="treeNode" />
                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                            </asp:TreeView>

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


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label44" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;">
                                <tr>
                                    <td style="padding-top: 5px;">
                                        <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                            cellspacing="0">
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 10%; text-align: right">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:Label ID="LB_KPIID" runat="server"></asp:Label>
                                                    <asp:TextBox ID="TB_KPI" runat="server" Width="90%"></asp:TextBox>
                                                    *
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:DropDownList ID="DL_KPIType" runat="server" DataTextField="Type" DataValueField="Type"
                                                        Width="150px">
                                                    </asp:DropDownList>
                                                    *&nbsp; &nbsp;<asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,QuanZhong%>"></asp:Label>：<NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_Weight" runat="server" Width="53px">0.00</NickLee:NumberBox>
                                                    &nbsp; &nbsp;
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GongShi%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Formula" runat="server" Height="50px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,SQLDaiMa%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_SqlCode" runat="server" Height="80px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                    <br />
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DanWeiFenZhi%>"></asp:Label>：</td>
                                                            <td>
                                                                <NickLee:NumberBox ID="NB_UnitSqlPoint" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px" Amount="1">1.00</NickLee:NumberBox>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <br />
                                                    （<asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,YGZKPIKSSJKPIJSSJBKPIZDM%>"></asp:Label><br />
                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,DaiMaShiLi%>"></asp:Label>：Select Count(*) * 5 From T_Project Where Status = &#39;<asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,JieAn%>"></asp:Label>&#39; and PMCode = &#39;[TAKETOPKPIUSERCODE]&#39; and to_char(BeginDate,'yyyymmdd') &gt;= &#39;[TAKETOPKPISTARTTIME]&#39; and to_char(EndDate,'yyyymmdd') &lt;= &#39;[TAKETOPKPIENDTIME]&#39;
                                                                        <br />
                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ZWDBDWFZKYSJYQTSZQD%>"></asp:Label>）</td>
                                            </tr>


                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LaiYuan%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Source" runat="server" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <asp:TextBox ID="TB_Target" runat="server" Height="40px" TextMode="MultiLine" Width="90%"></asp:TextBox>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="text-align: right;">
                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShunXuHao%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle">
                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_SortNubmer" runat="server" Precision="0" Width="53px">0</NickLee:NumberBox>
                                                    &nbsp;&nbsp;&nbsp;
                                                    <asp:HyperLink ID="HL_RelatedUser" runat="server" Text="<%$ Resources:lang,XQDSFPHR%>"></asp:HyperLink>

                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <br />

                                        <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
                                        </b>
                                    </td>
                                </tr>
                            </table>


                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popKPICheckWindow"
                        style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_titl1e">
                            <asp:Label ID="Label64" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;">
                                <tr>
                                    <td>
                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <asp:Label ID="Label48" runat="server"></asp:Label>
                                        <asp:TextBox ID="TB_KPICheckNameNew" runat="server" Width="300px"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                    </td>
                                    <td>

                                        <asp:TextBox ID="DLC_StartTimeNew" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender3" runat="server" TargetControlID="DLC_StartTimeNew">
                                        </ajaxToolkit:CalendarExtender>

                                    </td>
                                    <td>
                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                    </td>
                                    <td>

                                        <asp:TextBox ID="DLC_EndTimeNew" ReadOnly="false" runat="server"></asp:TextBox>
                                        <ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender4" runat="server" TargetControlID="DLC_EndTimeNew">
                                        </ajaxToolkit:CalendarExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZiPingZongFen%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalSelfPointNew" runat="server" Width="53px" Enabled="false">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,LingDaoPingZongFen%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalLeaderPointNew" runat="server" Enabled="False" Width="53px">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,DiSanFangPingZongFen%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_TotalThirdPartPointNew" runat="server" Enabled="False" Width="53px">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label>
                                    </td>
                                    <td>
                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,XiTongZongPingFen%>"></asp:Label>：</td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_TotalSqlPointNew" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,RenShiPingFen%>"></asp:Label></td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_TotalHRPointNew" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                    <td>
                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ZongFen%>"></asp:Label>：</td>
                                    <td>
                                        <NickLee:NumberBox ID="NB_TotalPointNew" runat="server" Enabled="False" MaxAmount="1000000000000" MinAmount="-1000000000000" Width="53px">0.00</NickLee:NumberBox>
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,Fen%>"></asp:Label></td>
                                </tr>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <asp:DropDownList ID="DL_StatusNew" runat="server">
                                            <asp:ListItem Value="处理中" Text="<%$ Resources:lang,HuoDong%>" />
                                            <asp:ListItem Value="关闭" Text="<%$ Resources:lang,GuanBi%>" />
                                        </asp:DropDownList>
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton1" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewKPICheck_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>

                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

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
