<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZTurnDetailEdit.aspx.cs" Inherits="TTWZTurnDetailEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>移交单明细编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">
        //var jquery = jQuery.noConflict();
        //jquery(function () {

        //    jquery("#TXT_TicketNumber").blur(function () {
        //        //开票数量
        //        var decimalTicketNumber = jquery("#TXT_TicketNumber").val();
        //        var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
        //        if (!pattern.exec(decimalTicketNumber)) {
        //            alert("换算数量，请输入小数!");
        //            return;
        //        }
        //        jquery("#TXT_ActualNumber").val(decimalTicketNumber);
        //        var decimalTicketPrice = jquery("#TXT_TicketPrice").val();
        //        if (pattern.exec(decimalTicketPrice)) {
        //            var varResult = parseFloat(decimalTicketNumber) * parseFloat(decimalTicketPrice);
        //            jquery("#TXT_TicketMoney").val(varResult);
        //        }
        //    });


        //    jquery("#TXT_TicketPrice").blur(function () {
        //        //开票单价
        //        var decimalTicketPrice = jquery("#TXT_TicketPrice").val();
        //        var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
        //        if (!pattern.exec(decimalTicketPrice)) {
        //            alert("计划数量，请输入小数!");
        //            return;
        //        }
        //        var decimalActualNumber = jquery("#TXT_ActualNumber").val();
        //        if (pattern.exec(decimalActualNumber)) {
        //            var varResult = parseFloat(decimalActualNumber) * parseFloat(decimalTicketPrice);
        //            jquery("#TXT_TicketMoney").val(varResult);
        //        }
        //    });

        //    jquery("#TXT_ActualNumber").blur(function () {
        //        //实领数量
        //        var decimalActualNumber = jquery("#TXT_ActualNumber").val();
        //        var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
        //        if (!pattern.exec(decimalActualNumber)) {
        //            alert("计划数量，请输入小数!");
        //            return;
        //        }
        //        var decimalTicketPrice = jquery("#TXT_TicketPrice").val();
        //        if (pattern.exec(decimalTicketPrice)) {
        //            var varResult = parseFloat(decimalActualNumber) * parseFloat(decimalTicketPrice);
        //            jquery("#TXT_TicketMoney").val(varResult);
        //        }
        //    });

        //   

        //});




        $(function () { 

            $("#TXT_TicketNumber").blur(function () {
                //开票数量
                var decimalTicketNumber = $("#TXT_TicketNumber").val();
                var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
                if (!pattern.exec(decimalTicketNumber)) {
                    alert("换算数量，请输入小数!");
                    return;
                }
                $("#TXT_ActualNumber").val(decimalTicketNumber);
                var decimalTicketPrice = jquery("#TXT_TicketPrice").val();
                if (pattern.exec(decimalTicketPrice)) {
                    var varResult = parseFloat(decimalTicketNumber) * parseFloat(decimalTicketPrice);
                    $("#TXT_TicketMoney").val(varResult);
                }
            });


            $("#TXT_TicketPrice").blur(function () {
                //开票单价
                var decimalTicketPrice = $("#TXT_TicketPrice").val();
                var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
                if (!pattern.exec(decimalTicketPrice)) {
                    alert("计划数量，请输入小数!");
                    return;
                }
                var decimalActualNumber = $("#TXT_ActualNumber").val();
                if (pattern.exec(decimalActualNumber)) {
                    var varResult = parseFloat(decimalActualNumber) * parseFloat(decimalTicketPrice);
                    $("#TXT_TicketMoney").val(varResult);
                }
            });

            $("#TXT_ActualNumber").blur(function () {
                //实领数量
                var decimalActualNumber = $("#TXT_ActualNumber").val();
                var pattern = "/^\d+(\d|(\.[1-9]{1,2}))$/";
                if (!pattern.exec(decimalActualNumber)) {
                    alert("计划数量，请输入小数!");
                    return;
                }
                var decimalTicketPrice = $("#TXT_TicketPrice").val();
                if (pattern.exec(decimalTicketPrice)) {
                    var varResult = parseFloat(decimalActualNumber) * parseFloat(decimalTicketPrice);
                    $("#TXT_TicketMoney").val(varResult);
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YiJiaoDanMingXiBianJi%>"></asp:Label>
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
                                                                    <td colspan="2" class="formItemBgStyle">
                                                                        <table class="formBgStyle">
                                                                            <tr>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LingLiaoFangShi%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DDL_PickingMethod" runat="server"
                                                                                        OnSelectedIndexChanged="DDL_PickingMethod_SelectedIndexChanged" AutoPostBack="true">
                                                                                        <asp:ListItem Text="<%$ Resources:lang,LanPiao%>" Value="蓝票" />
                                                                                        <asp:ListItem Text="<%$ Resources:lang,HongPiao%>" Value="红票" />
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_NoCode" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ShiLingShuLiang%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_ActualNumber" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="BT_Actual" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_Actual_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,KaiPiaoShuLiang%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_TicketNumber" runat="server"></asp:TextBox>
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,KaiPiaoDanJia%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_TicketPrice" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="BT_Money" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_Money_Click" />
                                                                                </td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label>：</td>
                                                                                <td class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TXT_TicketMoney" runat="server"></asp:TextBox>&nbsp;<asp:Button ID="BT_Price" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_Price_Click" />
                                                                                </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" colspan="6" style="text-align: center;">
                                                                                    <asp:Button ID="btnSave" runat="server" Text="<%$ Resources:lang,BaoCun%>" OnClick="btnSave_Click" CssClass="inpu" />&nbsp;
                                                                                    <asp:Button ID="btnReset" runat="server" Text="<%$ Resources:lang,QuXiao%>" OnClick="btnReset_Click" CssClass="inpu" />
                                                                                    &nbsp;
                                                                                    <asp:Button ID="btnSign" runat="server" CssClass="inpu" Text="<%$ Resources:lang,QianShou%>" OnClick="btnSign_Click" />
                                                                                    &nbsp;&nbsp;
                                                                                    <asp:Button ID="btnAccetance" runat="server" CssClass="inpu" Text="验收" OnClick="btnAccetance_Click" Enabled="false" />
                                                                                    &nbsp;&nbsp;
                                                                                    <asp:Button ID="btnFinish" runat="server" CssClass="inpu" Text="完成" OnClick="btnFinish_Click" Enabled="false" />
                                                                                    &nbsp;&nbsp;
                                                                                    <asp:Button ID="btnCheck" runat="server" CssClass="inpu" Text="核销" OnClick="btnCheck_Click" Enabled="false" />
                                                                                    &nbsp;&nbsp;
                                                                                    <asp:Button ID="btnCancelCheck" runat="server" CssClass="inpu" Text="取消核销" OnClick="btnCancelCheck_Click" Enabled="false" />
                                                                                      &nbsp;&nbsp;
                                                                                    <asp:Button ID="BT_NewDetailBrowse" runat="server" Text="<%$ Resources:lang,MingXiLiuLan%>" CssClass="inpu" OnClick="BT_NewDetailBrowse_Click" Enabled="false" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:ListBox ID="LB_Turn" name="LB_Turn" runat="server" Width="180px" Height="500px"
                                                                            DataTextField="TurnCode" DataValueField="TurnCode" AutoPostBack="true" OnSelectedIndexChanged="LB_Turn_SelectedIndexChanged"></asp:ListBox>
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
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,YiJiaoDanHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="7%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiaFangKuBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,LingLiaoDanHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,LingLiaoFangShi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="7%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiPiaoShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShiLingShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,KaiPiaoDanJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,KaiPiaoJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,CaiLiaoYuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_TurnDetail" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_TurnDetail_ItemCommand" OnPageIndexChanged="DG_TurnDetail_PageIndexChanged">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton ID="LBT_Edit" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab" > <asp:Label ID="LB_Edit" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                                            <%--  <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="virturl" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="签收" ? true : false %>'>
                                                                                                <asp:Label ID="LB_Virturl" runat="server" Text="<%$ Resources:lang,ShangZhang%>"></asp:Label></asp:LinkButton>--%>
                                                                                            <asp:LinkButton ID="LBT_Virturl" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="virturl" CssClass="notTab" > <asp:Label ID="LB_Virturl" runat="server" Text="<%$ Resources:lang,ShangZhang%>"></asp:Label></asp:LinkButton>
                                                                                            <asp:LinkButton ID="LBT_CancelVirturl" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="cancelVirturl" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="领料" ? true : false %>'> <asp:Label ID="LB_CancelVirturl" runat="server" Text="<%$ Resources:lang,QuXiaoShangZhang%>"></asp:Label></asp:LinkButton>

                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="TurnCode" HeaderText="移交单号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="PickingUnit" HeaderText="领料单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoDanWei%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("PickingUnit").ToString(), 192) %>
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
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,NoBianHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("NoCode").ToString(), 192) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PickingPlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="PickingTime" HeaderText="领料日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,LingLiaoRiQi%>"></asp:Label>
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
                                                                        <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
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
                <asp:HiddenField ID="HF_ID" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="btnReset" />
                <asp:PostBackTrigger ControlID="BT_Money" />
                <asp:PostBackTrigger ControlID="BT_Price" />
                <asp:PostBackTrigger ControlID="BT_Actual" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
