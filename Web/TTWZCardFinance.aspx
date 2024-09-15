<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCardFinance.aspx.cs" Inherits="TTWZCardFinance" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>财务凭证明细手动编辑</title>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiWuPingZhengBianJi%>"></asp:Label>
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
                                            <td class="formItemBgStyle">
                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuSuanJinE%>"></asp:Label>：<asp:TextBox ID="TXT_PlanMoney" runat="server"></asp:TextBox>&nbsp;
                                                <asp:Button ID="BT_CalcPrice" runat="server" Text="<%$ Resources:lang,JiSuan%>" OnClick="BT_CalcPrice_Click" CssClass="inpu" />&nbsp;
                                                <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YuSuanDanJia%>"></asp:Label>：<asp:TextBox ID="TXT_PlanPrice" runat="server"></asp:TextBox>&nbsp;
                                                <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="BT_Edit_Click" CssClass="inpu" />&nbsp;
                                                <asp:Button ID="BT_Confirm" runat="server" Text="<%$ Resources:lang,BianJiQueRen%>" OnClick="BT_Confirm_Click" CssClass="inpu" />&nbsp;
                                                <asp:Button ID="BT_Import" runat="server" Text="<%$ Resources:lang,DaoChu%>" OnClick="BT_Import_Click" CssClass="inpu" />&nbsp;
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:ListBox ID="LB_Card" name="LB_Card" runat="server" Width="180px" Height="300px"
                                                                DataTextField="CardName" DataValueField="CardCode" AutoPostBack="true" OnSelectedIndexChanged="LB_Card_SelectedIndexChanged"></asp:ListBox>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <div style="width: 2200px;">
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
                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YiJiaoDanHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiaFangKuBie%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LingLiaoDanHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LingLiaoFangShi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="7%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KaiPiaoShuLiang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ShiLingShuLiang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,KaiPiaoDanJia%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_TurnDetail" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_TurnDetail_ItemCommand">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("ActualNumber")+"|"+Eval("PlanMoney") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>
                                                                                <asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="del" CssClass="notTab">删除</asp:LinkButton>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="TurnCode" HeaderText="移交单号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="PickingUnit" HeaderText="领料单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("PickingUnit").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="StoreRoom" HeaderText="甲方库别">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PickingCode" HeaderText="领料单号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PickingMethod" HeaderText="领料方式">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="NoCode" HeaderText="No编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("NoCode").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PickingPlanCode" HeaderText="计划编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="TicketNumber" HeaderText="开票数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ActualNumber" HeaderText="实领数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="TicketPrice" HeaderText="开票单价">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="TicketMoney" HeaderText="开票金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="TicketTime" HeaderText="开票日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <%--<asp:BoundColumn DataField="PickingTime" HeaderText="领料日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%#DataBinder.Eval(Container.DataItem, "PickingTime", "{0:yyyy/MM/dd}")%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="MaterialPersonName" HeaderText="材料员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
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
                                            <td class="formItemBgStyle">
                                                <table class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,PingZhengBianHao%>"></asp:Label>：<asp:TextBox ID="TXT_CardCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td class="formItemBgStyle">
                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,YiJiaoDanHao%>"></asp:Label>：<asp:TextBox ID="TXT_TurnCode" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="2">NoCode：<asp:TextBox ID="TXT_NoCode" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="2">
                                                            <asp:Button ID="BT_Add" runat="server" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_Add_Click" CssClass="inpu" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle">
                                                <div style="width: 2200px;">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YiJiaoDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JiaFangKuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,LingLiaoDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,LingLiaoFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="7%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,KaiPiaoShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ShiLingShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,KaiPiaoDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_TurnDetailNoCode" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_TurnDetailNoCode_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID")+"|"+Eval("TurnCode") %>' CommandName="edit">
                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:Button runat="server" Text="编辑" CssClass="inpu" CommandArgument='<%# Eval("ID")+"|"+Eval("TurnCode") %>' CommandName="edit" />--%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="TurnCode" HeaderText="移交单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PickingUnit" HeaderText="领料单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PickingUnit").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="甲方库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PickingCode" HeaderText="领料单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PickingMethod" HeaderText="领料方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="NoCode" HeaderText="No编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("NoCode").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PickingPlanCode" HeaderText="计划编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="TicketNumber" HeaderText="开票数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualNumber" HeaderText="实领数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TicketPrice" HeaderText="开票单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TicketMoney" HeaderText="开票金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="TicketTime" HeaderText="开票日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PickingTime" HeaderText="领料日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PickingTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="MaterialPersonName" HeaderText="材料员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
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
                    </div>
                </div>
                <asp:HiddenField ID="HF_TurnDetailID" runat="server" />
                <asp:HiddenField ID="HF_TurnDetailIDEdit" runat="server" />
                <asp:HiddenField ID="HF_ActualNumber" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Add" />
                <asp:PostBackTrigger ControlID="BT_Edit" />
                <asp:PostBackTrigger ControlID="BT_Confirm" />
                <asp:PostBackTrigger ControlID="BT_Import" />
                <asp:PostBackTrigger ControlID="BT_CalcPrice" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
