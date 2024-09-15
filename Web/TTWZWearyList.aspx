<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZWearyList.aspx.cs" Inherits="TTWZWearyList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>积压列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/dialog/lhgdialog.min.js"></script>
    <script type="text/javascript">
        //复选框全选
        function ChooseAll(item) {
            var inputs = document.all.tags("INPUT");
            for (var i = 0; i < inputs.length; i++) // 遍历页面上所有的 input 
            {
                if (inputs[i].type == "checkbox") {
                    inputs[i].checked = item.checked;
                }
            }
        }

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

                    $("#HF_TotalWearyCode").val(obj);
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiYaLieBiao%>"></asp:Label>
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
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label>：
                                                        </td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_WearyCode" runat="server" ReadOnly="true"></asp:TextBox><font color="red">*<asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiTongZiDongShengCheng%>"></asp:Label></font>
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
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:HiddenField ID="HF_MainLeader" runat="server" />
                                                            <asp:TextBox ID="TXT_MainLeader" runat="server"></asp:TextBox>&nbsp;
                                                            <input type="button" id="btnPurchaseManager" class="inpu" runat="server" value="选择" onclick="SelectEmployee('TTWZSelectorMember.aspx', 'HF_MainLeader', 'TXT_MainLeader')" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: left" class="formItemBgStyle">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>：</td>
                                                        <td style="text-align: left" class="formItemBgStyle" colspan="3">
                                                            <asp:TextBox ID="TXT_Remark" runat="server" Width="400"></asp:TextBox>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_Create" runat="server" Text="<%$ Resources:lang,XinZeng%>" CssClass="inpu" OnClick="BT_Create_Click" />&nbsp;
                                                            <asp:Button ID="BT_Edit" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Edit_Click" />&nbsp;
                                                            <asp:Button ID="btnOK" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="btnOK_Click" Visible="false" />&nbsp;
                                                            <asp:Button ID="BT_Cancel" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Cancel_Click" />&nbsp;
                                                            <asp:TextBox ID="TXT_Year" runat="server" Width="20" Visible="false"></asp:TextBox>
                                                            <asp:HiddenField ID="HF_TotalYear" runat="server" />
                                                            <asp:HiddenField ID="HF_TotalWearyCode" runat="server" />
                                                            <asp:Button ID="BT_Total" runat="server" Text="<%$ Resources:lang,TongJi%>" CssClass="inpu" OnClick="BT_Total_Click" Style="display: none;" />&nbsp;
                                                            
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_ExportWearyEffect" runat="server" Text="<%$ Resources:lang,DaoChuShengXiaoJiYaJiHua%>" CssClass="inpuLong" OnClick="BT_ExportWearyEffect_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportWeary" runat="server" Text="<%$ Resources:lang,DaoChuJiYaMingXi%>" CssClass="inpuLong" OnClick="BT_ExportWeary_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportWearyComplete" runat="server" Text="<%$ Resources:lang,DaoChuWanChengJiYaJiHua%>" CssClass="inpuLong" OnClick="BT_ExportWearyComplete_Click" />&nbsp;
                                                            <asp:Button ID="BT_ExportSend" runat="server" Text="<%$ Resources:lang,DaoChuJiYaFaLiaoDan%>" CssClass="inpuLong" OnClick="BT_ExportSend_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                            <asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" CssClass="inpu" OnClick="BT_NewEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" CssClass="inpu" OnClick="BT_NewDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewTotal" runat="server" Text="<%$ Resources:lang,TongJi%>" CssClass="inpu" OnClick="BT_NewTotal_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewSubmit" runat="server" Text="<%$ Resources:lang,TiJiao%>" CssClass="inpu" OnClick="BT_NewSubmit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewExecute" runat="server" Text="<%$ Resources:lang,ZhiXing%>" CssClass="inpu" OnClick="BT_NewExecute_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCalc" runat="server" Text="<%$ Resources:lang,JiSuan%>" CssClass="inpu" OnClick="BT_NewCalc_Click" />&nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
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
                                                                            <strong><input id='checkAll' type="checkbox" onclick="ChooseAll(this)" style="display: none;" /><asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiYaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiYaZongE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="6%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JiYaYuE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ShengYuTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="13%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="8%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_List" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_List_ItemCommand" OnPageIndexChanged="DG_List_PageIndexChanged">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderTemplate>
                                                                    &nbsp;
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <input value='<%#Eval("WearyCode") %>' name="cb_WearyCode" type="checkbox" checked="checked" />
                                                                    <asp:LinkButton ID="LinkButton5" runat="server" CommandArgument='<%# Eval("WearyCode")+"|"+Eval("Process") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                    <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="del" CssClass="notTab">删除</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton4" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="total" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="编制" ? true : false %>'>统计</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="submit" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="编制" ? true : false %>'>提交</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="execute" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="批准" ? true : false %>'>执行</asp:LinkButton>--%>
                                                                    <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"WearyCode") %>' CommandName="calc" CssClass="notTab" Visible='<%# Eval("Process").ToString()=="生效" ? true : false %>'>计算</asp:LinkButton>--%>
                                                                    
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="WearyCode" HeaderText="积压编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="PlanTime" HeaderText="计划日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JiHuaRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "PlanTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="WearyTotalMoney" HeaderText="积压总额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RowNumber" HeaderText="明细条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="6%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="WearyBalance" HeaderText="积压余额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OverNumber" HeaderText="剩余条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="Remark" HeaderText="说明">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Process" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MainLeaderName" HeaderText="主管领导">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="MarkerName" HeaderText="编制人">
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
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_WearyCode" runat="server" />

                <asp:HiddenField ID="HF_NewWearyCode" runat="server" />
                <asp:HiddenField ID="HF_NewProcess" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnOK" />
                <asp:PostBackTrigger ControlID="BT_Cancel" />
                <asp:PostBackTrigger ControlID="BT_Total" />
                <asp:PostBackTrigger ControlID="BT_ExportWearyEffect" />
                <asp:PostBackTrigger ControlID="BT_ExportWeary" />
                <asp:PostBackTrigger ControlID="BT_ExportSend" />
                <asp:PostBackTrigger ControlID="BT_ExportWearyComplete" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
