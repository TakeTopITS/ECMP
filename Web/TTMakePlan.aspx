<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakePlan.aspx.cs" Inherits="TTMakePlan" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>制定计划</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1100px;
            width: expression (document.body.clientWidth <= 1100? "1100px" : "auto" ));
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" src="js/layer/layer/layer.js"></script>
    <script type="text/javascript" src="js/popwindow.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

            setTreeviewHigh();
        });


        function setTreeviewHigh() {

            document.getElementById('TreeView1').style.height = ($(document).height() - 55) + "px";

        }
    </script>
</head>
<body onresize='javascript:setTreeviewHigh();'>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,ZhiDingJiHua%>"></asp:Label>
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
                                <td valign="top">
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td style="border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px; overflow: auto; width: 200px;"
                                               valign="top" align="left">
                                                <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                    ShowLines="True" Width="200px">
                                                    <RootNodeStyle CssClass="rootNode" />
                                                    <NodeStyle CssClass="treeNode" />
                                                    <LeafNodeStyle CssClass="leafNode" />
                                                    <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                </asp:TreeView>
                                            </td>
                                            <td align="left" valign="top">

                                                <table cellpadding="0" cellspacing="0" width="100%">
                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_Create_Click" />
                                                        </td>
                                                    </tr>

                                                    <tr>
                                                        <td align="right" class="formItemBgStyle" style="padding: 5px 5px 5px 5px;">
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
                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                  
                                                                                <td width="5%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,JiHua%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="12%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="7%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ShangJiPingFen%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="6%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="5%" align="center">
                                                                                    <strong></strong>
                                                                                </td>

                                                                                <td width="5%" align="center">
                                                                                    <strong></strong>
                                                                                </td>


                                                                                <td width="3%" align="center">
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
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AllowPaging="True" AutoGenerateColumns="False" OnItemCommand="DataGrid4_ItemCommand"
                                                                Height="1px" OnPageIndexChanged="DataGrid4_PageIndexChanged" PageSize="20" Width="100%"
                                                                ShowHeader="false" CellPadding="4" ForeColor="#333333" GridLines="None">

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

                                                                    <asp:BoundColumn DataField="PlanID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanType" HeaderText="类型">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="PlanID" DataNavigateUrlFormatString="TTPlanDetail.aspx?PlanID={0}"
                                                                        DataTextField="PlanName" HeaderText="计划" Target="_blank">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:BoundColumn DataField="StartTime" HeaderText="开始时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="EndTime" HeaderText="结束时间" DataFormatString="{0:yyyy/MM/dd}">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="SubmitTime" HeaderText="提交时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ScoringBySelf" HeaderText="自评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ScoringByLeader" HeaderText="上级评分">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                    </asp:BoundColumn>

                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass.GetStatusHomeNameByPlanStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn HeaderText="Target">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Target" CommandName="Target" runat="server" Text="关键目标"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="Leader">
                                                                        <ItemTemplate>
                                                                            <asp:LinkButton ID="LBT_Leader" CommandName="Leader" runat="server" Text="相关领导"></asp:LinkButton>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>

                                                                    <asp:TemplateColumn>
                                                                        <ItemTemplate>
                                                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.PlanID", "TTPlanRelatedDoc.aspx?PlanID={0}") %>'
                                                                                Target="_blank"><img src="ImagesSkin/Doc.gif"   style="border-width:0px"/></asp:HyperLink>
                                                                        </ItemTemplate>
                                                                        <ItemStyle HorizontalAlign="Center" CssClass="itemBorder" Width="3%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                            <asp:Label ID="LB_Sql4" runat="server" Visible="False"></asp:Label>
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
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
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

                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label1" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 100%;">

                                <tr>

                                    <td style="padding-top: 5px;">

                                        <table class="formBgStyle" style="width: 98%; text-align: left;" cellpadding="3"
                                            cellspacing="0">
                                            <tr>
                                                <td style="height: 28px; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JiHuaLeiXing%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="3">

                                                    <asp:DropDownList ID="DL_PlanType" runat="server" DataTextField="Type"
                                                        DataValueField="Type">
                                                    </asp:DropDownList>
                                                    <asp:Label ID="LB_SelectedPlanID" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="width: 90px; text-align: right">
                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FuJiHua%>"></asp:Label>：
                                                </td>
                                                <td class="formItemBgStyle" colspan="3">

                                                    <asp:TextBox ID="TB_ParentPlanName" runat="server" Width="90%"></asp:TextBox><cc1:modalpopupextender
                                                        id="TB_ParentPlanName_ModalPopupExtender" runat="server" enabled="True" targetcontrolid="TB_ParentPlanName"
                                                        popupcontrolid="Panel1" cancelcontrolid="IMBT_Close" backgroundcssclass="modalBackground" y="150"
                                                        dynamicservicepath="">
                                                    </cc1:modalpopupextender>
                                                    <asp:Label ID="LB_ParentPlanID" runat="server" Visible="False"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" style="height: 28px; text-align: right">
                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaMingCheng%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="3">

                                                    <asp:TextBox ID="TB_PlanName" runat="server" Width="90%"></asp:TextBox><asp:Label
                                                        ID="LB_PlanID" runat="server" Visible="false"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right; height: 23px;" class="formItemBgStyle">
                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle" colspan="3">

                                                    <ckeditor:ckeditorcontrol id="HE_PlanDetail" runat="server" height="180px" width="90%" visible="False" />

                                                    <ckeditor:ckeditorcontrol runat="server" id="HT_PlanDetail" width="90%" height="180px" visible="False" />
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiShiShiJian%>"></asp:Label>：
                                                </td>

                                                <td style="height: 12px; text-align: left;" class="formItemBgStyle">

                                                    <asp:TextBox ID="DLC_StartTime" runat="server"></asp:TextBox>

                                                    <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender4"
                                                        runat="server" targetcontrolid="DLC_StartTime" enabled="True">
                                                    </ajaxtoolkit:calendarextender>
                                                </td>

                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JieShuShiJian%>"></asp:Label>：
                                                </td>

                                                <td style="height: 12px; text-align: left;" class="formItemBgStyle">

                                                    <asp:TextBox ID="DLC_EndTime" runat="server"></asp:TextBox>

                                                    <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender1"
                                                        runat="server" targetcontrolid="DLC_EndTime" enabled="True">
                                                    </ajaxtoolkit:calendarextender>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>

                                                <td style="text-align: left;" class="formItemBgStyle">

                                                    <asp:DropDownList ID="DL_Status" runat="server" Enabled="False">

                                                        <asp:ListItem Value="新建" Text="<%$ Resources:lang,XinJian%>" />

                                                        <asp:ListItem Value="待审核" Text="<%$ Resources:lang,DaiShenHe%>" />

                                                        <asp:ListItem Value="批准" Text="<%$ Resources:lang,PiZhun%>" />

                                                        <asp:ListItem Value="完成" Text="<%$ Resources:lang,WanCheng%>" />
                                                    </asp:DropDownList>
                                                </td>

                                                <td style="height: 12px; text-align: right;" class="formItemBgStyle">
                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,TiJiaoShiJian%>"></asp:Label>：
                                                </td>

                                                <td style="height: 12px; text-align: left;" class="formItemBgStyle">
                                                    <asp:Label ID="LB_SubmitTime" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td style="text-align: right;" class="formItemBgStyle"></td>
                                                <td colspan="3" class="formItemBgStyle">
                                                    <asp:Button ID="BT_SubmitApprove" runat="server" CssClass="inpu" Enabled="false"
                                                        Text="<%$ Resources:lang,TiJiaoShenHe%>" OnClick="BT_SubmitApprove_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>


                            </table>

                        </div>

                        <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="BT_New" runat="server" class="layui-layer-btn notTab" OnClick="BT_New_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton><a class="layui-layer-btn notTab" onclick="return popClose();"><asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popTargetWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title1">
                            <asp:Label ID="Label18" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content1" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Button ID="BT_CreateTarget" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateTarget_Click" />
                                    </td>
                                </tr>
                                <tr>

                                    <td>

                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
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
                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                  
                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="55%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="20%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                </td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid1_ItemCommand" ShowHeader="False" Width="100%">

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

                                                <asp:BoundColumn DataField="ID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>
                                                <asp:BoundColumn DataField="Target" HeaderText="目标">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="进度">

                                                    <ItemTemplate>

                                                        <asp:Label ID="LB_TargetProgress" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"Progress")%> '></asp:Label>%
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                </asp:TemplateColumn>
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

                        </div>


                        <div id="popwindow_footer1" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popLeaderWindow" name="noConfirm"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title2">
                            <asp:Label ID="Label33" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content2" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 98%; text-align: left;">
                                <tr>
                                    <td align="right" class="formItemBgStyle">
                                        <asp:Button ID="BT_CreateLeader" runat="server" Text="<%$ Resources:lang,New%>" CssClass="inpuYello" OnClick="BT_CreateLeader_Click" />
                                    </td>
                                </tr>

                                <tr>

                                    <td style="padding: 5px 2px 3px 4px;">

                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                </td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BianJi %>" /></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShanChu %>" /></strong>
                                                                    </td>
                                                                 
                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="15%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LingDaoDaiMa%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="15%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,LingDaoMingCheng%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="15%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="15%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiaRuRiQi%>"></asp:Label></strong>
                                                            </td>

                                                            <td width="10%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                </td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" GridLines="None"
                                            OnItemCommand="DataGrid2_ItemCommand" ShowHeader="False" Width="100%">
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

                                                <asp:BoundColumn DataField="ID" HeaderText="编号">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="LeaderCode" HeaderText="领导代码">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="LeaderName" HeaderText="领导名称">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="Actor" HeaderText="角色">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:BoundColumn DataField="JoinTime" DataFormatString="{0:yyyy/MM/dd}" HeaderText="加入日期">

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%"></ItemStyle>
                                                </asp:BoundColumn>

                                                <asp:TemplateColumn HeaderText="状态">
                                                    <ItemTemplate>
                                                        <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <HeaderStyle BackColor="#507CD1" BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px"
                                                Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer2" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popTargetDetailWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title3">
                            <asp:Label ID="Label35" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content3" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                <tr style="display: none;">
                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle">

                                        <asp:Label ID="LB_TargetID" runat="server"></asp:Label>
                                    </td>
                                </tr>

                                <tr>

                                    <td class="formItemBgStyle" style="width: 100px; text-align: right">
                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,MuBiao%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle">

                                        <asp:TextBox ID="TB_Target" runat="server" Width="45%"></asp:TextBox>

                                        <asp:DropDownList ID="DL_UserKPI" runat="server" AutoPostBack="True"
                                            DataTextField="KPI" DataValueField="KPI" OnSelectedIndexChanged="DL_UserKPI_SelectedIndexChanged">
                                        </asp:DropDownList>
                                    </td>
                                </tr>

                                <tr>

                                    <td style="width: 100px; text-align: right" class="formItemBgStyle">
                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：
                                    </td>

                                    <td class="formItemBgStyle">

                                        <nicklee:numberbox maxamount="1000000000000" minamount="-1000000000000" id="NB_Progress" runat="server" precision="0" width="50px" onblur=""
                                            onfocus="" onkeypress="" positivecolor="">
                                            0</nicklee:numberbox>
                                        %
                                    </td>
                                </tr>
                            </table>

                        </div>

                        <div id="popwindow_footer3" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton3" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewTarget_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>

                            <asp:LinkButton ID="LinkButton1" OnClick="LBT_CloseTargetDetailWindow_Click" OnClientClick="return popClose();" runat="server" CssClass="layui-layer-btn notTab" Text="<%$ Resources:lang,GuanBi%>"></asp:LinkButton>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>



                    <div class="layui-layer layui-layer-iframe" id="popLeaderDetailWindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title4">
                            <asp:Label ID="Label37" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content4" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                            <table style="width: 95%;">

                                <tr>

                                    <td align="left">

                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle">

                                            <tr style="display: none;">

                                                <td style="width: 20%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle">

                                                    <asp:Label ID="LB_LeaderID" runat="server"></asp:Label>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LingDao%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle">

                                                    <asp:Label ID="LB_LeaderCode" runat="server"></asp:Label><asp:Label ID="LB_LeaderName"
                                                        runat="server"></asp:Label>（--&gt;<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,CongYouBianXuanQu%>"></asp:Label>）
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="text-align: right">
                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JueSe%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle">

                                                    <asp:TextBox ID="TB_Actor" runat="server" Width="60%"></asp:TextBox>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td style="width: 15%; text-align: right" class="formItemBgStyle">
                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiaRuShiJian%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle">

                                                    <asp:TextBox ID="DLC_JoinTime" runat="server"></asp:TextBox>

                                                    <ajaxtoolkit:calendarextender format="yyyy-MM-dd" id="CalendarExtender2"
                                                        runat="server" targetcontrolid="DLC_JoinTime" enabled="True">
                                                    </ajaxtoolkit:calendarextender>
                                                </td>
                                            </tr>

                                            <tr>

                                                <td class="formItemBgStyle" style="width: 15%; text-align: right">
                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label>：
                                                </td>

                                                <td class="formItemBgStyle">

                                                    <asp:Label ID="LB_LeaderStatus" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>

                                    <td style="width: 170px; border-right: solid 1px #D8D8D8;" align="center">

                                        <table width="170px" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">

                                            <tr>

                                                <td width="7">

                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" />
                                                </td>

                                                <td>

                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">

                                                        <tr>

                                                            <td width="5%" align="center">

                                                                <strong>
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>

                                                <td width="6" align="right">

                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" />
                                                </td>
                                            </tr>
                                        </table>

                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" OnItemCommand="DataGrid3_ItemCommand"
                                            Width="170px" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                            ShowHeader="False">

                                            <Columns>

                                                <asp:TemplateColumn HeaderText="部门人员：">

                                                    <ItemTemplate>

                                                        <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                            CssClass="inpu" /><asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                CssClass="inpu" />
                                                    </ItemTemplate>

                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>

                                            <EditItemStyle BackColor="#2461BF" />

                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                            <ItemStyle CssClass="itemStyle" />

                                            <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />

                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                        </asp:DataGrid>
                                    </td>

                                    <td style="width: 220px; border-right: solid 1px #D8D8D8;" valign="top" align="left">

                                        <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
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

                        <div id="popwindow_footer4" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <asp:LinkButton ID="LinkButton4" runat="server" class="layui-layer-btn notTab" OnClick="BT_NewLeader_Click" Text="<%$ Resources:lang,BaoCun%>"></asp:LinkButton>
                            <asp:LinkButton ID="LBT_CloseChangeWindow" OnClick="LBT_CloseLeaderDetailWindow_Click" OnClientClick="return popClose();" runat="server" CssClass="layui-layer-btn notTab" Text="<%$ Resources:lang,GuanBi%>"> </asp:LinkButton>
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
