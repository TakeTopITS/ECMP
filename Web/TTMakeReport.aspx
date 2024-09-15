<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTMakeReport.aspx.cs" Inherits="TTMakeReport" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>泰顶报表设计中心</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
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
                                                        <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FenXiMoXingSheJi%>"></asp:Label>
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
                                <table width="100%" cellpadding="0" cellspacing="0">
                                    <tr>
                                        <td width="300" style="padding: 5px 5px 5px 5px;">
                                            <table width="100%" cellpadding="0" cellspacing="0" class="bian">
                                                <tr>
                                                    <td colspan="2">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="40%" align="center" style="font-size: smaller;">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,FenXiLeiXing%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="60%" align="center" style="font-size: smaller;">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,FenXiMoXing%>"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2">
                                                        <table width="100%">
                                                            <tr>
                                                                <td class="tdLeft" align="center" width="40%" style="padding: 1px 1px 1px 1px;">
                                                                    <asp:ListBox ID="LLB_ReportType" runat="server" AutoPostBack="True" Width="100%" SelectionMode="Multiple"
                                                                        Height="350" DataTextField="Type" DataValueField="Type" OnSelectedIndexChanged="LLB_ReportType_SelectedIndexChanged"></asp:ListBox>
                                                                </td>
                                                                <td class="tdRight" align="center" width="60%" style="padding: 1px 1px 1px 1px;">
                                                                    <asp:ListBox ID="LLB_ReportTemplate" runat="server" AutoPostBack="True" Width="100%" SelectionMode="Multiple"
                                                                        Height="350px" DataTextField="TemName" DataValueField="ID" OnSelectedIndexChanged="LLB_ReportTemplate_SelectedIndexChanged"></asp:ListBox>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="tdLeft" colspan="2" style="padding: 1px 1px 1px 1px; border-bottom: solid 1px #D8D8D8; border-right: solid 1px #D8D8D8;">
                                                        <table style="width: 300px;" cellpadding="3" cellspacing="0">
                                                            <tr>
                                                                <td class="tdLeft" align="right" width="50px">

                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label>
                                                                </td>
                                                                <td class="tdLeft" width="110">
                                                                    <asp:Label ID="LB_TemID" runat="server" Font-Size="10pt"></asp:Label>
                                                                </td>
                                                                <td class="tdRight" align="center" width="210">
                                                                    <asp:DropDownList ID="DL_DesignerType" AutoPostBack="true" runat="server" OnSelectedIndexChanged="DL_DesignerType_SelectedIndexChanged" Visible="false">
                                                                        <asp:ListItem>HTML5</asp:ListItem>
                                                                    </asp:DropDownList>
                                                                    <asp:HyperLink ID="HL_ReportDesigner" runat="server" NavigateUrl="~/TTReportDesigner.aspx"
                                                                        Target="_blank" Font-Names="宋体" Font-Size="10pt" Enabled="False">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,MoXingSheJi%>"></asp:Label>
                                                                    </asp:HyperLink>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdLeft" align="right" width="50">

                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>
                                                                </td>
                                                                <td colspan="2" class="tdRight" align="left" style="width: 320px;">
                                                                    <asp:TextBox Width="90%" ID="TB_TemName" runat="server"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="formItemBgStyle" align="right">
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuiShu %>"></asp:Label></td>
                                                                <td colspan="2">
                                                                    <asp:Label ID="LB_BelongDepartCode" runat="server"></asp:Label>
                                                                    <asp:Label ID="LB_BelongDepartName" runat="server"></asp:Label>

                                                                    <asp:Button ID="BT_BelongDepartment" runat="server" Text="<%$ Resources:lang,XuanZhe%>" />
                                                                    <cc1:ModalPopupExtender ID="BT_BelongDepartment_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_CloseTree3" DynamicServicePath="" Enabled="True" PopupControlID="Panel3" TargetControlID="BT_BelongDepartment" Y="150">
                                                                    </cc1:ModalPopupExtender>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td class="tdLeft" align="right" width="50">

                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,MiaoShu%>"></asp:Label>
                                                                </td>
                                                                <td colspan="2" class="tdRight" style="width: 320px;" align="left">
                                                                    <asp:TextBox ID="TB_TemComment" runat="server" Height="58px" Width="90%" TextMode="MultiLine"></asp:TextBox>
                                                                </td>
                                                            </tr>
                                                            <tr>
                                                                <td colspan="3" class="tdRight" style="text-align: center; padding: 2px 0px 2px 5px; width: 370px;">
                                                                    <asp:Button ID="BT_DeleteTem" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" Enabled="false"
                                                                        OnClick="BT_DeleteTem_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />
                                                                    &nbsp;&nbsp;
                                                                <asp:Button ID="BT_UpdateTem" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" Enabled="false"
                                                                    OnClick="BT_UpdateTem_Click" />
                                                                    &nbsp;&nbsp;
                                                                <asp:Button ID="BT_NewTem" runat="server" Text="<%$ Resources:lang,XinZeng%>" CssClass="inpu" OnClick="BT_NewTem_Click" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                        <td style="padding: 5px 5px 5px 5px;">

                                            <table>
                                                <tr>
                                                     <td> <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XinMoBan%>"></asp:Label> </td>
                                                     <td> <asp:TextBox ID="TB_NewTemName" Width="250" runat="server"></asp:TextBox>
                                                     </td>
                                                      <td> <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label> </td>
                                                     <td> 
                                                         <asp:DropDownList ID="DL_ReportType" DataValueField="Type" DataTextField="Type" runat="server">
                                                         </asp:DropDownList>
                                                     </td>
                                                     <td>
                                                         <asp:Button ID="BT_CopyTemplate" runat="server" CssClass="inpu" Text="<%$ Resources:lang,FuZhi%>" OnClick="BT_CopyTemplate_Click" />
                                                     </td>
                                                </tr>
                                            </table>

                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                <tr>
                                                    <td width="7">
                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                    </td>
                                                    <td>
                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                            <tr>
                                                                <td width="8%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="30%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="20%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FenXiMoXing%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="10%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ChuangJianZhe%>"></asp:Label></strong>
                                                                </td>
                                                                <td width="15%" align="center">
                                                                    <strong>
                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,ChuangJianShiJian%>"></asp:Label></strong>
                                                                </td>
                                                                <td align="center" width="10%">&nbsp;
                                                                </td>
                                                                <td align="center">&nbsp;</td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                    <td width="6" align="right">
                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                    </td>
                                                </tr>
                                            </table>
                                            <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="True" AutoGenerateColumns="false"
                                                PageSize="10" ShowHeader="false" Height="1px" OnItemCommand="DataGrid1_ItemCommand"
                                                OnPageIndexChanged="DataGrid1_PageIndexChanged" Width="100%" Font-Bold="False"
                                                Font-Italic="False" Font-Overline="False" Font-Strikeout="False" Font-Underline="False"
                                                CellPadding="4" ForeColor="#333333" GridLines="None">
                                                <Columns>
                                                    <asp:BoundColumn DataField="ID" HeaderText="ID">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="报表文件">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_ReportName" CommandName="Open" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"ReportName") %>'
                                                                CssClass="inpuLongest" Width="99%" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                    </asp:TemplateColumn>
                                                    <asp:BoundColumn DataField="TemName" HeaderText="模板">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                    </asp:BoundColumn>
                                                    <asp:HyperLinkColumn DataNavigateUrlField="CreatorCode" DataNavigateUrlFormatString="TTUserInforSimple.aspx?UserCode={0}"
                                                        DataTextField="CreatorName" HeaderText="上传者" Target="_blank">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:HyperLinkColumn>
                                                    <asp:BoundColumn DataField="CreateTime" HeaderText="创建时间">
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                    </asp:BoundColumn>
                                                    <asp:TemplateColumn HeaderText="可视人员">
                                                        <ItemTemplate>
                                                            <asp:Button ID="BT_VisualMember" CommandName="Select" runat="server" Text='可视人员'
                                                                CssClass="inpuLong" />
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    </asp:TemplateColumn>
                                                    <asp:TemplateColumn HeaderText="Delete">
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="LBT_Delete" CommandName="Delete" runat="server" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                        </ItemTemplate>
                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
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
                            </td>
                        </tr>
                    </table>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popwindow" name="fixedDivNoConfirm"
                    style="z-index: 9999; width: 500px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label27" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px;">

                        <table width="100%">
                            <tr>
                                <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                    valign="top" align="left">
                                    <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td width="165px" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;">
                                    <table style="width: 165px; height: 53px">
                                        <tr>
                                            <td style="width: 165; text-align: center;" valign="top">
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
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BuMenRenYuan%>"></asp:Label></strong>
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
                                                    Width="100%" Height="1px" CellPadding="4" ForeColor="#333333" GridLines="None"
                                                    ShowHeader="False">
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="部门人员：">
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_UserCode" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserCode") %>'
                                                                    CssClass="inpu" />
                                                                <asp:Button ID="BT_UserName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>'
                                                                    CssClass="inpu" />
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" />
                                                            <HeaderStyle Font-Bold="True" Font-Italic="False" Font-Overline="False" Font-Size="Small"
                                                                Font-Strikeout="False" Font-Underline="False" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                </asp:DataGrid>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>

                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer layui-layer-iframe" id="popVisualWindow"
                    style="z-index: 9999; width: 800px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                    <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                        <asp:Label ID="Label13" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                    </div>
                    <div id="popwindow_content" class="layui-layer-content" style="text-align: left; overflow: auto; padding: 0px 5px 0px 5px;">

                        <strong>
                            <table>
                                <tr>
                                    <td>
                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BaoBiao%>"></asp:Label>：
                                    </td>
                                    <td>
                                        <asp:Label ID="LB_ReportID" runat="server"> </asp:Label>
                                    </td>
                                    <td>
                                        <asp:TextBox ID="TB_ReportName" Width="300px" runat="server"></asp:TextBox>
                                    </td>
                                    <td>
                                        <asp:Button ID="BT_UpdateReportName" CssClass="inpu" runat="server" Text="<%$ Resources:lang,GengMing%>" OnClick="BT_UpdateReportName_Click" />
                                    </td>
                                    <td>
                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,DeKeShiRenYuanSheZhi%>"></asp:Label>：
                                    </td>
                                </tr>
                            </table>
                        </strong>
                        <hr />
                        <table width="600px" cellpadding="0" cellspacing="0" class="bian">
                            <tr>
                                <td align="left" style="padding: 5px 5px 0px 5px; border-right: solid 1px #D8D8D8; vertical-align: top;" width="500px">
                                    <table width="100%">
                                        <tr>
                                            <td width="90%">
                                                <asp:Repeater ID="RP_ReportRelatedUser" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_UserName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"UserName") %>' Width="70px" />
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </td>
                                            <td>
                                                <asp:Button ID="BT_Select" runat="server" CssClass="inpu" OnClick="BT_Select_Click" Text="<%$ Resources:lang,XuanZe%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <asp:CheckBox ID="CB_MSM" runat="server" Text="<%$ Resources:lang,FaXinXi%>" />
                                                <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,FaYouJian%>" />
                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,TongZhi%>"></asp:Label>
                                                <asp:TextBox ID="TB_Message" runat="server" CssClass="shuru" Width="150px"></asp:TextBox>
                                                <asp:Button ID="BT_Send" runat="server" CssClass="inpu" Enabled="False" OnClick="BT_Send_Click" Text="<%$ Resources:lang,FaSong%>" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                <asp:Label ID="LB_DepartString" runat="server" Visible="false"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <div id="popwindow_footer" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                        <a class="layui-layer-btn notTab" onclick="return popClose();">
                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                    </div>
                    <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                </div>

                <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>

                <asp:Panel ID="Panel3" runat="server" CssClass="modalPopup" Style="display: none;">
                    <div class="modalPopup-text" style="width: 420px; height: 400px; overflow: auto;">
                        <table>
                            <tr>
                                <td style="width: 360px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                    <asp:TreeView ID="TreeView3" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView3_SelectedNodeChanged"
                                        ShowLines="True" Width="220px">
                                        <RootNodeStyle CssClass="rootNode" />
                                        <NodeStyle CssClass="treeNode" />
                                        <LeafNodeStyle CssClass="leafNode" />
                                        <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                    </asp:TreeView>
                                </td>
                                <td style="width: 60px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                    <asp:ImageButton ID="IMBT_CloseTree3" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
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
        <p>
            <asp:Label ID="LB_Sql" runat="server" Visible="false"></asp:Label>
        </p>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
