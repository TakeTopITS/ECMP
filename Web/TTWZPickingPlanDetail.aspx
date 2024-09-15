<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPickingPlanDetail.aspx.cs" Inherits="TTWZPickingPlanDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料计划明细编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript">
        //var jquery = jQuery.noConflict();
        $(function () { 

            //$("#TXT_ConvertPlanNumber").change(function () {
            //    //debugger;
            //    alert("TXT_ConvertPlanNumber");
            //    var decimalConvertPlanNumber = $("#TXT_ConvertPlanNumber").val();
            //    var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
            //    if (!pattern.exec(decimalConvertPlanNumber)) {
            //        alert("换算数量，请输入小数!");
            //    }
            //    var decimalConvertRatio = $("#HF_ConvertRatio").val();

            //    var varResult = decimalConvertPlanNumber * decimalConvertRatio;
            //    $("#TXT_PlanNumber").val(varResult);
            //});


            //$("#TXT_PlanNumber").change(function () {
            //    //debugger;
            //    alert("TXT_PlanNumber");
            //    var decimalPlanNumber = $("#TXT_PlanNumber").val();
            //    var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
            //    if (!pattern.exec(decimalPlanNumber)) {
            //        alert("计划数量，请输入小数!");
            //    }
            //    var decimalConvertRatio = $("#HF_ConvertRatio").val();

            //    var varResult = decimalPlanNumber * decimalConvertRatio;
            //    $("#TXT_ConvertPlanNumber").val(varResult);
            //});


           

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoJiHuaMingXiBianJi%>"></asp:Label>
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
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PlanNumber" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="btnPlan" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>" CssClass="inpu" OnClick="btnPlan_Click" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label></td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ConvertPlanNumber" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="btnConvert" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>" CssClass="inpu" OnClick="btnConvert_Click" />
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Remark" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnSave_Click" />&nbsp;
                                                                        <input type="button" value="返回" id="Button1" class="inpu" onclick="window.location.href = 'TTWZPlanList.aspx'" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:ListBox ID="LB_PickingPlan" name="LB_PickingPlan" runat="server" Width="180px" Height="300px"
                                                                            DataTextField="PlanName" DataValueField="PlanCode" AutoPostBack="true" OnSelectedIndexChanged="LB_PickingPlan_SelectedIndexChanged"></asp:ListBox>
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
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,HuaSuanShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YuanDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
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
                                                                            <asp:DataGrid ID="DG_PickPlanDetailList" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_PickPlanDetailList_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Button runat="server" CssClass="inpu" Text="<%$ Resources:lang,BianJi%>" CommandName="edit" CommandArgument='<%#Eval("ID")+"|"+Eval("ObjectCode")+"|"+Eval("PlanNumber") %>' />
                                                                                            <asp:Button runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" CommandName="del" CommandArgument='<%# Eval("ID") %>' />
                                                                                            <%--<asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("ObjectCode")+"|"+Eval("PlanNumber") %>' CommandName="edit">编辑</asp:LinkButton>
                                                                                            <asp:LinkButton ID="LB_Del" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del">删除</asp:LinkButton>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCost" HeaderText="预计费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="OldCode" HeaderText="原代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
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
                                                                        <div style="width: 1000px;">
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
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,WuZhiMingChen%>"></asp:Label></strong>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Button ID="LB_Add" runat="server" CssClass="inpu" Text="选择" CommandName="add" CommandArgument='<%#Eval("ObjectCode")+"|"+Eval("Model")+"|"+Eval("Grade")+"|"+Eval("Unit")+"|"+Eval("ConvertUnit")+"|"+Eval("ConvertRatio") %>' />
                                                                                            <%--<asp:LinkButton ID="LB_Add" runat="server" CommandArgument='<%#Eval("ObjectCode")+"|"+Eval("Model")+"|"+Eval("Grade")+"|"+Eval("Unit")+"|"+Eval("ConvertUnit")+"|"+Eval("ConvertRatio") %>' CommandName="add">选择</asp:LinkButton>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,WuZhiMingChen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 190) %>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ReferDesc").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="ReferStandard" HeaderText="对照标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ReferStandard").ToString(), 190) %>
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
                <asp:HiddenField ID="HF_PickingPlanDetailID" runat="server" />
                <asp:HiddenField ID="HF_ConvertRatio" runat="server" />
                <asp:HiddenField ID="HF_Market" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="LB_PickingPlan" />
                <asp:PostBackTrigger ControlID="btnPlan" />
                <asp:PostBackTrigger ControlID="btnConvert" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
