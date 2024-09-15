<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCompactCheckListNew.aspx.cs" Inherits="TTWZCompactCheckListNew" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>合同-材检页面</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 

           

        });


        function LoadProjectList() {
            //alert("调用成功");
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,HeTongCaiJian%>"></asp:Label>
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
                                                        <td class="formItemBgStyle" width="100%">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LieBiaoCaoZuo%>"></asp:Label>：&nbsp;
                                                            <asp:Button ID="BT_NewRecordDelete" runat="server" CssClass="inpu" Enabled="false" Text="<%$ Resources:lang,JiLuShanChu%>" OnClick="BT_NewRecordDelete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"/>&nbsp;
                                                            <asp:Button ID="BT_NewCheckCodeEdit" runat="server" CssClass="inpu" Enabled="false" Text="<%$ Resources:lang,JianHaoBianJi%>" OnClick="BT_NewCheckCodeEdit_Click" />&nbsp;
                                                            <asp:Button ID="BT_NewCheckCodeReturn" runat="server" CssClass="inpu" Enabled="false" Text="<%$ Resources:lang,JianHaoTuiHui%>" OnClick="BT_NewCheckCodeReturn_Click" />&nbsp;
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：&nbsp;
                                                            <asp:Button ID="BT_SortPlanCode" runat="server" CssClass="inpu" Text="<%$ Resources:lang,JiHuaBianHao%>" OnClick="BT_SortPlanCode_Click" />&nbsp;
                                                            <asp:Button ID="BT_SortObjectName" runat="server" CssClass="inpu" Text="<%$ Resources:lang,WuZiMingCheng%>" OnClick="BT_SortObjectName_Click" />&nbsp;
                                                            <asp:HiddenField ID="HF_SortPlanCode" runat="server" />
                                                            <asp:HiddenField ID="HF_SortObjectName" runat="server" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,JianHaoJiLu%>"></asp:Label>&nbsp;
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_CheckRecord" runat="server" Text="*"></asp:Label><asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LieBiaoChaXun%>"></asp:Label>：
                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label>：<asp:DropDownList ID="DDL_Compact" runat="server"></asp:DropDownList>&nbsp;
                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>：<asp:DropDownList ID="DDL_Check" runat="server"></asp:DropDownList>&nbsp;
                                                            <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />

                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" style="display:none;" />

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <div style="width: 3600px;">
                                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                    <tr>
                                                                        <td width="7">
                                                                            <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                        </td>
                                                                        <td>
                                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                <tr>
                                                                                    <td width="1%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,HeTongShuLiang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DaoHuoMingCheng%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,DaoHuoGuiGeXingHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,DaoHuoShuLiang%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,LuPiHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,ZhiXingBiaoZhun%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JiaoHuoZhuangTai%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="3%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaiJianZiLiao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="5%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="2%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DataGrid1" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="1%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>

                                                                                <asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="click" CssClass="notTab">
                                                                                    <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></asp:LinkButton>
                                                                                <%--<asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("StandardCode")+"|"+Eval("Factory")+"|"+Eval("Remark") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>

                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ProjectName").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 9) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Grade").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CompactNumber" HeaderText="合同数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DaoHuoMingCheng%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ArrivalGoodsName").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,DaoHuoGuiGeXingHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ArrivalGoodsModel").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="ArrivalGoodsNumber" HeaderText="到货数量">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,LuPiHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("BatchNo").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,ZhiXingBiaoZhun%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ExecutionStandard").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JiaoHuoZhuangTai%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("DeliveryStatus").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="Checker" HeaderText="材检员">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>

                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("CheckerDate").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        
                                                                        <asp:BoundColumn DataField="CheckDocument" HeaderText="材检资料">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                        </asp:BoundColumn>
                                                                        
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("ReinspectionRecord").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>

                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>

                                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>
                                                                    </Columns>
                                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                    <EditItemStyle BackColor="#2461BF" />
                                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                    
                                                                    <ItemStyle CssClass="itemStyle" />
                                                                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                                                                </asp:DataGrid>
                                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" width="100%">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" width="5%">
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" width="95%">
                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,HeTongMingXiJiLu%>"></asp:Label>&nbsp;
                                                                        <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_CompactNumber" runat="server" Text="*"></asp:Label><asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                                        <asp:Button ID="BT_NewCompactCheck" runat="server" CssClass="inpu" Text="<%$ Resources:lang,HeTongCaiJian%>" OnClick="BT_NewCompactCheck_Click" />&nbsp;
                                                                        <asp:Button ID="BT_NewCompactCheckReturn" runat="server" CssClass="inpuLong" Text="<%$ Resources:lang,HeTongCaiJianTuiHui%>" OnClick="BT_NewCompactCheckReturn_Click" />&nbsp;
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" width="5%">
                                                                        <asp:ListBox ID="LB_Compact" name="LB_Compact" runat="server" Width="180px" Height="300px"
                                                                            DataTextField="CompactCode" DataValueField="CompactCode" AutoPostBack="true" OnSelectedIndexChanged="LB_Compact_SelectedIndexChanged"></asp:ListBox>
                                                                    </td>
                                                                    <td class="formItemBgStyle" width="95%">
                                                                        <div style="width: 1800px;">
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
                                                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,HeTongShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,HeTongDanJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="5%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,CaiJianBiaoZhi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ShouLiaoShuLiang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,ShouLiaoZongE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                                                </td>

                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,DaYinBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_CompactDetail" runat="server" AllowPaging="false" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="20" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_CompactDetail_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID") %>' CommandName="add" CssClass="notTab">
                                                                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,XinZeng%>"></asp:Label></asp:LinkButton>
                                                                                            <%--<asp:LinkButton ID="LB_Edit" runat="server" CommandArgument='<%#Eval("ID")+"|"+Eval("StandardCode")+"|"+Eval("Factory")+"|"+Eval("Remark") %>' CommandName="edit" CssClass="notTab">编辑</asp:LinkButton>--%>

                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 9) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Model").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Criterion").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Grade").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactNumber" HeaderText="合同数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactPrice" HeaderText="合同单价">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactMoney" HeaderText="合同金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label83" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="IsCheck" HeaderText="材检标志">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:BoundColumn DataField="CollectNumber" HeaderText="收料数量">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CollectMoney" HeaderText="收料金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>

                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label84" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Factory").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,GuiGeShuBianHao%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("StandardCode").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>

                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label86" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("Remark").ToString(), 8) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>

                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsPrint" HeaderText="打印标记">
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
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_NewID" runat="server" />
                <asp:HiddenField ID="HF_NewProgress" runat="server" />
                <asp:HiddenField ID="HF_NewCompactDetailID" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
