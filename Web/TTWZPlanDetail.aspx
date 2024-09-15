<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPlanDetail.aspx.cs" Inherits="TTWZPlanDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>领料计划明细编辑</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script type="text/javascript">

        $(function () {

            ControlStatusCloseChange();

        });

        function ControlStatusChange(objProgress, objIsMark) {

            $("#BT_NewEdit").attr("class", "inpu");
            $("#BT_NewEdit").removeAttr("disabled");

            if (objProgress == "录入" && objIsMark == "0") {
                $("#BT_NewDelete").attr("class", "inpu");
                $("#BT_NewDelete").removeAttr("disabled");                            //删除
            }
            else {
                $("#BT_NewDelete").attr("disabled", "disabled");
                $("#BT_NewDelete").removeClass("inpu");                          //删除
            }
        }

        function ControlStatusCloseChange() {
            $("#BT_NewEdit").attr("disabled", "disabled");
            $("#BT_NewEdit").removeClass("inpu");
            $("#BT_NewDelete").attr("disabled", "disabled");
            $("#BT_NewDelete").removeClass("inpu");
        }

        function LoadProjectList() {
            document.getElementById("BT_RelaceLoad").click();
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JiHuaMingXi%>"></asp:Label>
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
                                                <table style="width: 100%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr style="display: none;">
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
                                                                        <%--<input type="button" value="返回" id="Button1" class="inpu" onclick="window.location.href = 'TTWZPlanList.aspx'" />--%>
                                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                                            type="button" value="关闭" />
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td colspan="7" style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：<asp:Button ID="BT_NewEdit" runat="server" Text="<%$ Resources:lang,BianJi%>" OnClick="BT_NewEdit_Click" CssClass="inpu" />&nbsp;
                                                                        <asp:Button ID="BT_NewDelete" runat="server" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_NewDelete_Click" CssClass="inpu" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,JiHuaMingXiJiLu%>"></asp:Label>&nbsp;
                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_ShowRecordCount" runat="server" Text="**"></asp:Label><asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <input id="Button1" class="inpu" onclick="window.returnValue = false; CloseLayer();"
                                                                            type="button" value="关闭" />
                                                                        <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 200px;">
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1600px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="5">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="5" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="7%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,WuZhiMingCheng%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HanShuanDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HuaSuanShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,YiGongShuLiang%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,QueKouShuLiang%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,QueKouHanShuan%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,YiJiaoBianHao%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,PingKuBiaoZhi%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,YuanDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="4%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
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
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="8" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_PickPlanDetailList_ItemCommand" OnPageIndexChanged="DG_PickPlanDetailList_PageIndexChanged">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,CaoZhao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("Progress")+"|"+Eval("IsMark") %>' CommandName="click" CssClass="notTab">操作</asp:LinkButton>
                                                                                            <%--<asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("ObjectCode")+"|"+Eval("PlanNumber")+"|"+Eval("Remark") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>
                                                                                            <%--<asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="del" CssClass="notTab" Visible='<%# (Eval("Progress").ToString()=="录入" && Eval("IsMark").ToString()=="0") ? true : false %>'>删除</asp:LinkButton>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="7%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>

                                                                                    <asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="PlanUnit" HeaderText="计划单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertUnit" HeaderText="换算单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCost" HeaderText="预计费用">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Remark" HeaderText="备注">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--   <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>--%>

                                                                                    <asp:BoundColumn DataField="ReceivedNumber" HeaderText="已供数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ShortNumber" HeaderText="缺口数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="ShortConver" HeaderText="缺口换算">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="ContractCode" HeaderText="合同编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="TurnCode" HeaderText="移交编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="StoreSign" HeaderText="平库标志">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="OldCode" HeaderText="原代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                    </asp:BoundColumn>
                                                                                </Columns>
                                                                                <FooterStyle BackColor="#505CD1" Font-Bold="True" ForeColor="White" />
                                                                                <EditItemStyle BackColor="#2461BF" />
                                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                                <ItemStyle CssClass="itemStyle" />
                                                                                <HeaderStyle BackColor="#505CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
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
                                                                            <RootNodeStyle CssClass="rootNode" />
                                                                            <NodeStyle CssClass="treeNode" />
                                                                            <LeafNodeStyle CssClass="leafNode" />
                                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor ="Red" />
                                                                        </asp:TreeView>
                                                                    </td>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1200px;">

                                                                            <table border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td align="center">
                                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label>:
                                                                                        <asp:TextBox ID="TB_WZCode" runat="server"></asp:TextBox>
                                                                                    </td>

                                                                                    <td align="left">
                                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                                        <asp:TextBox ID="TB_WZName" runat="server"></asp:TextBox>
                                                                                    </td>

                                                                                    <td align="left">
                                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                                        <asp:TextBox ID="TB_WZCriterion" runat="server"></asp:TextBox>
                                                                                    </td>

                                                                                    <td align="center">
                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                                                                        <asp:TextBox ID="TB_WZGrade" runat="server"></asp:TextBox>
                                                                                    </td>

                                                                                    <td align="left">
                                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                                        <asp:TextBox ID="TB_WZModel" runat="server"></asp:TextBox>
                                                                                    </td>
                                                                                    <td align="left">
                                                                                        <asp:Button ID="BT_Find" CssClass="inpu" runat="server" Text="查询" OnClick="BT_Find_Click" />
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
                                                                                                <td width="4%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="14%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="10%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,HuanSuanDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,HuanSuanXiShu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label></strong>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%#Eval("ObjectCode")+"|"+Eval("Model")+"|"+Eval("Grade")+"|"+Eval("Unit")+"|"+Eval("ConvertUnit")+"|"+Eval("ConvertRatio") %>' CommandName="add" CssClass="notTab">
                                                                                                <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,XinZeng%>"></asp:Label>
                                                                                            </asp:LinkButton>
                                                                                            <%--<asp:Button ID="LB_Add" runat="server" CssClass="inpu" Text="选择" CommandName="add" CommandArgument='<%#Eval("ObjectCode")+"|"+Eval("Model")+"|"+Eval("Grade")+"|"+Eval("Unit")+"|"+Eval("ConvertUnit")+"|"+Eval("ConvertRatio") %>' />--%>
                                                                                            <%--<asp:LinkButton ID="LB_Add" runat="server" CommandArgument='<%#Eval("ObjectCode")+"|"+Eval("Model")+"|"+Eval("Grade")+"|"+Eval("Unit")+"|"+Eval("ConvertUnit")+"|"+Eval("ConvertRatio") %>' CommandName="add">选择</asp:LinkButton>--%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="14%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="14%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,WuZiMingChen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
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
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ReferDesc" HeaderText="对照描述">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,DuiZhaoMiaoShu%>"></asp:Label>
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
                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DuiZhaoBiaoZhun%>"></asp:Label>
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

                <asp:HiddenField ID="HF_NewID" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
                <asp:HiddenField ID="HF_NewIsMark" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="btnSave" />
                <asp:PostBackTrigger ControlID="btnPlan" />
                <asp:PostBackTrigger ControlID="btnConvert" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
