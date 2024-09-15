<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZReduceList.aspx.cs" Inherits="TTWZReduceList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>减值列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script language="javascript">

        $(function () { 

           

            ControlStatusCloseChange();

        });



        function ClickTotal(obj) {
            $.dialog({
                lock: true,
                content: "年数：<input type='text' id='txt_TotalYear' />",
                ok: function () {
                    //alert($("#txtReason").val());
                    //alert(obj);

                    $("#HF_TotalReduceCode").val(obj);
                    $("#HF_TotalYear").val($("#txt_TotalYear").val());
                    document.getElementById("BT_Total").click();
                },
                cancel: true
            });
        }



        function ControlStatusChange(objProgress) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");
            $("#BT_NewDelete").attr("class", "inpu");
            $("#BT_NewDelete").removeAttr("disabled");

            //alert(objProgress);
            if (objProgress == "编制") {
                $("#BT_NewTotal").attr("class", "inpu");
                $("#BT_NewTotal").removeAttr("disabled");                            //统计
                $("#BT_NewSubmit").attr("class", "inpu");
                $("#BT_NewSubmit").removeAttr("disabled");                          //提交
                $("#BT_NewCheck").attr("disabled", "disabled");
                $("#BT_NewCheck").removeClass("inpu");                         //检测
                $("#BT_NewExecute").attr("disabled", "disabled");
                $("#BT_NewExecute").removeClass("inpu");                         //执行
                $("#BT_NewCalc").attr("disabled", "disabled");
                $("#BT_NewCalc").removeClass("inpu");                         //计算
            }
            else if (objProgress == "批准") {
                $("#BT_NewTotal").attr("disabled", "disabled");
                $("#BT_NewTotal").removeClass("inpu");                            //统计
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");                          //提交
                $("#BT_NewCheck").attr("class", "inpu");
                $("#BT_NewCheck").removeAttr("disabled");                         //检测
                $("#BT_NewExecute").attr("class", "inpu");
                $("#BT_NewExecute").removeAttr("disabled");                         //执行
                $("#BT_NewCalc").attr("disabled", "disabled");
                $("#BT_NewCalc").removeClass("inpu");                            //计算
            }
            else if (objProgress == "生效") {
                $("#BT_NewTotal").attr("disabled", "disabled");
                $("#BT_NewTotal").removeClass("inpu");                            //统计
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");                          //提交
                $("#BT_NewCheck").attr("disabled", "disabled");
                $("#BT_NewCheck").removeClass("inpu");                            //检测
                $("#BT_NewExecute").attr("disabled", "disabled");
                $("#BT_NewExecute").removeClass("inpu");                            //执行
                $("#BT_NewCalc").attr("class", "inpu");
                $("#BT_NewCalc").removeAttr("disabled");                         //生效
            }
            else {
                $("#BT_NewEdit").attr("disabled", "disabled");
                $("#BT_NewEdit").removeClass("inpu");
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");
                $("#BT_NewTotal").attr("disabled", "disabled");
                $("#BT_NewTotal").removeClass("inpu");
                $("#BT_NewSubmit").attr("disabled", "disabled");
                $("#BT_NewSubmit").removeClass("inpu");
                $("#BT_NewCheck").attr("disabled", "disabled");
                $("#BT_NewCheck").removeClass("inpu");                            //检测
                $("#BT_NewExecute").attr("disabled", "disabled");
                $("#BT_NewExecute").removeClass("inpu");
                $("#BT_NewCalc").attr("disabled", "disabled");
                $("#BT_NewCalc").removeClass("inpu");
            }

        }



        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
            $("#BT_NewTotal").attr("disabled", "disabled");
            $("#BT_NewTotal").removeClass("inpu");
            $("#BT_NewSubmit").attr("disabled", "disabled");
            $("#BT_NewSubmit").removeClass("inpu");
            $("#BT_NewCheck").attr("disabled", "disabled");
            $("#BT_NewCheck").removeClass("inpu");
            $("#BT_NewExecute").attr("disabled", "disabled");
            $("#BT_NewExecute").removeClass("inpu");
            $("#BT_NewCalc").attr("disabled", "disabled");
            $("#BT_NewCalc").removeClass("inpu");
        }

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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JianZhiLieBiao%>"></asp:Label>
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
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 40%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_ReduceCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:DropDownList ID="DDL_StoreRoom" runat="server"
                                                                DataTextField="StockCode" DataValueField="StockCode">
                                                            </asp:DropDownList>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiHuaJianZhi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_PlanMoney" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_MainLeader" runat="server" />
                                                            <asp:TextBox ID="TXT_MainLeader" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnPurchaseManager" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_MainLeader', 'TXT_MainLeader')" />
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_Remark" runat="server" Width="400"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinJian%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                            <asp:Button ID="BT_ReduceEdit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_ReduceEdit_Click" />&nbsp;
                                                            <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" Visible="false" />&nbsp;
                                                            <asp:Button ID="BT_Cancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Cancel_Click" />&nbsp;
                                                            <asp:TextBox ID="TXT_Year" runat="server" Width="20" Visible="false"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_TotalYear" runat="server" />
                                                            <asp:HiddenField ID="HF_TotalReduceCode" runat="server" />
                                                            <asp:Button ID="BT_Total" runat="server" Text="<%$ Resources:lang,TongJi%>" CssClass="inpu" OnClick="BT_Total_Click" style="display:none;" />&nbsp;
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_ExportStoreEffect" runat="server" Text="<%$ Resources:lang,DCSXJZJH%>" CssClass="inpuLong" OnClick="BT_ExportStoreEffect_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportStore" runat="server" Text="<%$ Resources:lang,DaoChuJianZhiKuCun%>" CssClass="inpuLong" OnClick="BT_ExportStore_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportStoreComplete" runat="server" Text="<%$ Resources:lang,DCWCJZJH%>" CssClass="inpuLong" OnClick="BT_ExportStoreComplete_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportSend" runat="server" Text="<%$ Resources:lang,DCJZFLD%>" CssClass="inpuLong" OnClick="BT_ExportSend_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewTotal" runat="server" Text="<%$ Resources:lang,TongJi%>" CssClass="inpu" OnClick="BT_NewTotal_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewSubmit" runat="server" Text="<%$ Resources:lang,TiJiao%>" CssClass="inpu" OnClick="BT_NewSubmit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCheck" runat="server" Text="<%$ Resources:lang,JianCha%>" CssClass="inpu" OnClick="BT_NewCheck_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewExecute" runat="server" Text="<%$ Resources:lang,ZhiXing%>" CssClass="inpu" OnClick="BT_NewExecute_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCalc" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_NewCalc_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;" class="formItemBgStyle">
                                                <div style="width: 2000px; height:390px;">
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
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaJianZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ZhiXingRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,KuCunZongE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,TongJiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,TongJiKuCun%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,TongJiBiLi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,TongJiJianZhi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,TongJiJingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="10%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="3" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <input value='<%#Eval("ReduceCode") %>' name="cb_ReduceCode" type="checkbox" checked="checked" />
                                                                    <asp:LinkButton runat="server" CommandArgument='<%# Eval("ReduceCode")+"|"+Eval("Process") %>' CommandName="click" CssClass="notTab">
                                                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                    <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="del" CssClass="notTab">删除</asp:LinkButton>--%>
                                                                    <%--<asp:Button runat="server" Text="减值库存" CssClass="inpu" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="store" Visible="false" />--%>
                                                                    <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="total" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="编制" ? true : false %>'>统计</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="编制" ? true : false %>'>提交</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="check" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="批准" ? true : false %>'>检查</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="execute" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="批准" ? true : false %>'>执行</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ReduceCode") %>' CommandName="calc" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="生效" ? true : false %>'>计算</asp:LinkButton>--%>
                                                                    
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ReduceCode" HeaderText="减值编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PlanTime" HeaderText="计划日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PlanTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="计划减值">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ExcuteTime" HeaderText="执行日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DetailNumber" HeaderText="明细条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreTotalMoney" HeaderText="库存总额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreDownMoney" HeaderText="减值金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CleanMoney" HeaderText="净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalNumber" HeaderText="统计条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalStore" HeaderText="统计库存">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalRatio" HeaderText="统计比例">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalDownMoney" HeaderText="统计减值">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalCleanMoney" HeaderText="统计净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="Remark" HeaderText="说明">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Process" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MainLeaderName" HeaderText="主管领导">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MarkerName" HeaderText="编制人">
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
                                                <asp:Label ID="LB_ReduceSql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td align="left" class="formItemBgStyle">
                                                <table style="width: 40%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,KuCunID%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_ID" runat="server" ReadOnly="true"></asp:TextBox>
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,JianZhiBiLi%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:TextBox ID="TXT_DownRatio" runat="server"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;" class="formItemBgStyle">
                                                <div style="width: 2600px; ">
                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td width="7">
                                                                <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                            </td>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,KuCunID%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,NianChuRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,NianChuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,NianChuDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,NianChuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,RuKuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,RuKuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,MoCiRuKu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ChuKuShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ChuKuJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,MoCiChuKu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,KuCunShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,KuCunDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,KuCunJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,JianZhiBiLi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,JianZhiJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="4%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,JingE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,JianZhiBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,JianZhiBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,JiYaBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Store" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_Store_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <%--<asp:Button runat="server" CssClass="inpu" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" Text="修改" />--%>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"ID") %>' CommandName="edit" CssClass="notTab">修改</asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ID" HeaderText="库存ID">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StockCode" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="YearTime" HeaderText="年初日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,NianChuRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "YearTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="YearNumber" HeaderText="年初数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="YearPrice" HeaderText="年初单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="YearMoney" HeaderText="年初金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="InNumber" HeaderText="入库数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="InMoney" HeaderText="入库金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="EndInTime" HeaderText="末次入库">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,MoCiRuKu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "EndInTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="OutNumber" HeaderText="出库数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OutPrice" HeaderText="出库金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="EndOutTime" HeaderText="末次出库">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,MoCiChuKu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "EndOutTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="StoreNumber" HeaderText="库存数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StorePrice" HeaderText="库存单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreMoney" HeaderText="库存金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="GoodsCode" HeaderText="货位号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,HuoWeiHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("GoodsCode").ToString(), 8) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownRatio" HeaderText="减值比例">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownMoney" HeaderText="减值金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CleanMoney" HeaderText="净额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownCode" HeaderText="减值编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DownDesc" HeaderText="减值标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyCode" HeaderText="积压编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyDesc" HeaderText="积压标记">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
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
                <asp:HiddenField ID="HF_StockCode" runat="server" />

                <asp:HiddenField ID="HF_NewReduceCode" runat="server" />
                <asp:HiddenField ID="HF_NewProcess" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnOK" />
                <asp:PostBackTrigger ControlID="BT_Cancel" />
                <asp:PostBackTrigger ControlID="BT_Total" />
                <asp:PostBackTrigger ControlID="BT_Edit" />
                <asp:PostBackTrigger ControlID="BT_ExportStoreEffect" />
                <asp:PostBackTrigger ControlID="BT_ExportStore" />
                <asp:PostBackTrigger ControlID="BT_ExportStoreComplete" />
                <asp:PostBackTrigger ControlID="BT_ExportSend" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
