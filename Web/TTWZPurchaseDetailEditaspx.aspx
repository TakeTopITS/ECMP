<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchaseDetailEditaspx.aspx.cs" Inherits="TTWZPurchaseDetailEditaspx" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购清单</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">
        //var jquery = jQuery.noConflict();
        //jquery(function () {

        //    jquery("#TXT_PlanMoney").blur(function () {
        //        //预算金额
        //        var decimalPlanMoney = jquery("#TXT_PlanMoney").val();
        //        var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
        //        if (!pattern.exec(decimalPlanMoney)) {
        //            alert("换算数量，请输入小数!");
        //            return;
        //        }
        //        var decimalActualNumber = jquery("#HF_ActualNumber").val();
        //        if (pattern.exec(decimalActualNumber)) {
        //            if (parseFloat(decimalActualNumber) > 0) {
        //                var varResult = parseFloat(decimalPlanMoney) / parseFloat(decimalActualNumber);
        //                jquery("#TXT_PlanPrice").val(varResult);
        //            }
        //        }
        //    });


        //   

        //});






        $(function () { 

            $("#TXT_PlanMoney").blur(function () {
                //预算金额
                var decimalPlanMoney = $("#TXT_PlanMoney").val();
                var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
                if (!pattern.exec(decimalPlanMoney)) {
                    alert("换算数量，请输入小数!");
                    return;
                }
                var decimalActualNumber = $("#HF_ActualNumber").val();
                if (pattern.exec(decimalActualNumber)) {
                    if (parseFloat(decimalActualNumber) > 0) {
                        var varResult = parseFloat(decimalPlanMoney) / parseFloat(decimalActualNumber);
                        $("#TXT_PlanPrice").val(varResult);
                    }
                }
            });


           

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouQingDan%>"></asp:Label>
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
                                                            <table class="formBgStyle" style="width: 60%;">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label> </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_SerialNumber" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,BiaoDuan%>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Tenders" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuanYeLeiBie%>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_MajorType" runat="server"></asp:TextBox>&nbsp;
                                                                        <input type="button" value="选择" id="BT_SelectMajor" class="inpu" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,CaiGouShuLiang%>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PurchaseNumber" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label> </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_ConvertNumber" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label> </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PlanMoney" runat="server"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShengCanChangJia%>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Factory" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label></td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_StandardCode" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,BieZhu%>"></asp:Label> </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_Remark" runat="server" Width="400px"></asp:TextBox>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="6" style="text-align: center;">
                                                                        <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />
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
                                                                        <asp:ListBox ID="LB_Purchase" name="LB_Purchase" runat="server" Width="180px" Height="300px"
                                                                            DataTextField="PurchaseCode" DataValueField="PurchaseCode" AutoPostBack="true" OnSelectedIndexChanged="LB_Purchase_SelectedIndexChanged"></asp:ListBox>
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
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaiGouDanHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <%--<td width="5%" align="center">
                                                                                                    <strong>计划编号</strong>
                                                                                                </td>--%>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XuHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,BiaoDuan%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="6%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhuanYeLeiBie%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaiGouShuLiang%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShengCanChangJia%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JueCheDanJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JueCheJingE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,DaYingBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_PurchaseDetail" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_PurchaseDetail_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit">
                                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label>编辑</asp:LinkButton>
                                                                                            <asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del">
                                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label>删除</asp:LinkButton>
                                                                                            <%--<asp:Button ID="Button3" runat="server" CssClass="inpu" CommandArgument='<%# Eval("ID") %>' CommandName="edit" Text="编辑" />--%>
                                                                                            <%--<asp:Button ID="Button1" runat="server" CssClass="inpu" CommandArgument='<%# Eval("ID") %>' CommandName="del" Text="删除" />--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="PlanDetailID" HeaderText="计划明细编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:BoundColumn DataField="SerialNumber" HeaderText="序号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Tenders" HeaderText="标段">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BiaoDuan%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Tenders").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="MajorType" HeaderText="专业类别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuanYeLeiBie%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("MajorType").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PurchaseNumber" HeaderText="采购数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Factory" HeaderText="生产厂家">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,ShengCanChangJia%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="StandardCode" HeaderText="规格书编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("StandardCode").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ApplyMoney" HeaderText="决策单价">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="TotalMoney" HeaderText="决策金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsPrint" HeaderText="打印标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
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
                                                                        <asp:ListBox ID="LB_PickingPlan" name="LB_PickingPlan" runat="server" Width="180px" Height="300px"
                                                                            DataTextField="PlanCode" DataValueField="PlanCode" AutoPostBack="true" OnSelectedIndexChanged="LB_PickingPlan_SelectedIndexChanged"></asp:ListBox>
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
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,WuZhiDaiMa%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <%--<td width="9%" align="center">
                                                                                                    <strong>物资名称</strong>
                                                                                                </td>--%>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,YuanDaiMa%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label> </strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_PickingPlanDetail" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_PickPlanDetailDetailList_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:Button ID="Button3" runat="server" CssClass="inpu" CommandArgument='<%# Eval("ID")+"|"+ Eval("ObjectCode")+"|"+Eval("ShortNumber")+"|"+Eval("ShortConver") %>' CommandName="add" Text="添加" />
                                                                                            <%--<asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%# Eval("ID")+"|"+ Eval("ObjectCode")+"|"+Eval("ShortNumber")+"|"+Eval("ShortConver") %>' CommandName="add">添加</asp:LinkButton>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label> 
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="OldCode" HeaderText="原代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
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
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseDetailID" runat="server" />
                <asp:HiddenField ID="HF_ConvertRatio" runat="server" />
                <asp:HiddenField ID="HF_Market" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
