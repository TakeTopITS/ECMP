<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPickingPlanDetailReplace.aspx.cs" Inherits="TTWZPickingPlanDetailReplace" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>材料代用</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

        });

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
        </asp:ScriptManager>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <div>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiLiaoDaiYong%>"></asp:Label>
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
                                <td style="padding: 0px 5px 5px 5px;" valign="top">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:ListBox ID="LB_PickingPlan" name="LB_PickingPlan" runat="server" Width="180px" Height="300px"
                                                                            DataTextField="PlanName" DataValueField="PlanCode" AutoPostBack="true" OnSelectedIndexChanged="LB_PickingPlan_SelectedIndexChanged"></asp:ListBox>
                                                                        <br />
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuanCaiLiaoDaiMa%>"></asp:Label>：<asp:TextBox ID="TXT_OldObjectCode" runat="server"></asp:TextBox>
                                                                        <asp:HiddenField ID="HF_PickingPlanDetailID" runat="server" />
                                                                        <br />
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JieYongCaiLiaoDaiMa%>"></asp:Label>：<asp:TextBox ID="TXT_ObjectCode" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="BT_Replace" runat="server" Text="<%$ Resources:lang,TiHuan%>" CssClass="inpu" OnClick="BT_Replace_Click" />
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1500px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="6%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="12%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WuZhiMingChen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="12%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YuanDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_PickPlanDetailList" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_PickPlanDetailList_ItemCommand" OnPageIndexChanged="DG_PickPlanDetailList_PageIndexChanged">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("ObjectCode") %>' CommandName="edit">
                                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                                            <%--<asp:Button runat="server" CssClass="inpu" Text="编辑" CommandName="edit" CommandArgument='<%#Eval("ID")+"|"+Eval("ObjectCode") %>' />--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="12%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(),12) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCost" HeaderText="预计费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(),12) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="OldCode" HeaderText="原代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                
                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            </asp:DataGrid>
                                                                        </div>
                                                                        <asp:Label ID="LB_PickPlanDetailSql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="width: 180px">
                                                                        <asp:TreeView ID="TV_Type" runat="server" ShowLines="True" NodeWrap="True" OnSelectedNodeChanged="TV_Type_SelectedNodeChanged">
                                                                            <RootNodeStyle CssClass="rootNode" /><NodeStyle CssClass="treeNode" /><LeafNodeStyle CssClass="leafNode" /><SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                                        </asp:TreeView>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1200px;">
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
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="12%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HuanSuanDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,HuanSuanXiShu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_ObjectList" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_ObjectList_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("ObjectCode") %>' CommandName="edit">
                                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,XuanZe%>"></asp:Label></asp:LinkButton>
                                                                                            <%--<asp:Button runat="server" CssClass="inpu" Text="选择" CommandName="edit" CommandArgument='<%# Eval("ObjectCode") %>' />--%>
                                                                                            
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(),12) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(),6) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Model").ToString(),6) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertUnitName" HeaderText="换算单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertRatio" HeaderText="换算系数">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ReferDesc" HeaderText="对照描述">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ReferDesc").ToString(),6) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="ReferStandard" HeaderText="对照标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ReferStandard").ToString(),6) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                
                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                            </asp:DataGrid>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
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
                </div>
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Replace" />
                <asp:PostBackTrigger ControlID="LB_PickingPlan" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
