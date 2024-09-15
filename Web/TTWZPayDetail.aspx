<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPayDetail.aspx.cs" Inherits="TTWZPayDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>付款明细</title>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,FuKuanMingXi%>"></asp:Label>
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
                                <td>
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td>
                                                <table style="width: 80%;" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle">
                                                            <table class="formBgStyle" width="40%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaFuKuan%>"></asp:Label> </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PlanMoney" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left; display: none;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label></td>
                                                                    <td style="text-align: left; display: none;" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DDL_UseWay" runat="server">
                                                                            <asp:ListItem Text="" Value=""/>
                                                                            <asp:ListItem Text="<%$ Resources:lang,FuCaiLiaoKuan%>" Value="付材料款"/>
                                                                            <asp:ListItem Text="<%$ Resources:lang,FuSheBeiKuan%>" Value="付设备款"/>
                                                                            <asp:ListItem Text="<%$ Resources:lang,FuQiTaKuan%>" Value="付其它款"/>
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: center" class="formItemBgStyle" colspan="4">
                                                                        <asp:Button ID="BT_Save" runat="server" Text="<%$ Resources:lang,BaoCun%>" CssClass="inpu" OnClick="BT_Save_Click" />&nbsp;
                                                                        <asp:Button ID="BT_Reset" runat="server" Text="<%$ Resources:lang,QuXiao%>" CssClass="inpu" OnClick="BT_Reset_Click" />&nbsp;
                                                                        <asp:Button ID="BT_MoreAdd" runat="server" Text="<%$ Resources:lang,HeTongBiaoZhu%>" CssClass="inpu" OnClick="BT_MoreAdd_Click" />&nbsp;
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr style="height: 350px;">
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
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YingFuKuanID%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,BaoXiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="left">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="right">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiHuaFuKuan%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JieKuanRen%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="8%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,FuKuanJingDu%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_PayDetail" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_PayDetail_ItemCommand" OnPageIndexChanged="DG_PayDetail_PageIndexChanged">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="del" CssClass="notTab"> </asp:LinkButton>
                                                                                <%--<asp:Button ID="Button3" runat="server" CssClass="inpu" Text="删除" CommandName="del" CommandArgument='<%# Eval("ID") %>' />--%>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="edit" CssClass="notTab"> </asp:LinkButton>
                                                                                <%--<asp:Button ID="Button4" runat="server" CssClass="inpu" Text="编辑" CommandName="edit" CommandArgument='<%# Eval("ID") %>' />--%>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PayID" HeaderText="应付款ID">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="RequestCode" HeaderText="请款单号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CancelTime" HeaderText="报销日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <%--<asp:BoundColumn DataField="Supplier" HeaderText="供应商">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>--%>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <%# ShareClass.StringCutByRequire(Eval("Supplier").ToString(), 190) %>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="PlanMoney" HeaderText="计划付款">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BorrowerName" HeaderText="借款人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UseWay" HeaderText="用途">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PayProcess" HeaderText="付款进度">
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
                                                            <asp:Label ID="LB_PayDetailSql" runat="server" Visible="False"></asp:Label>

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
                                                                                    <td width="5%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label> </strong>
                                                                                    </td>

                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiGouJingE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShuiJing%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YongFei%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,JieKuanJingE%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,LiaoDanZhangShu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JieKuanRen%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,QingKuanRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,CaiWuShenHe%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,BaoXiaoRiQi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,YiFuKuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,QianKuan%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,JingDu%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FuKuanBiaoZhi%>"></asp:Label></strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WanChenBiaoJi%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                    <td width="4%" align="center">
                                                                                        <strong>
                                                                                            <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label> </strong>
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                        </td>
                                                                        <td width="6" align="right">
                                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                                <asp:DataGrid ID="DG_Request" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                    CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                    Width="100%" OnItemCommand="DG_Request_ItemCommand">
                                                                    <Columns>
                                                                        <asp:TemplateColumn>
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                            <HeaderTemplate>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label> 
                                                                            </HeaderTemplate>
                                                                            <ItemTemplate>
                                                                                <input type="checkbox" name="cb_Request_Code" value='<%#Eval("RequestCode") %>' />&nbsp;
                                                                                <%--<asp:Button ID="Button3" runat="server" CssClass="inpu" Text="添加" CommandName="add" CommandArgument='<%# Eval("RequestCode") %>' />--%>
                                                                                <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%#Eval("RequestCode") %>' CommandName="add" CssClass="notTab"> </asp:LinkButton>
                                                                            </ItemTemplate>
                                                                        </asp:TemplateColumn>
                                                                        <asp:BoundColumn DataField="RequestCode" HeaderText="请款单号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="SupplierName" HeaderText="供方编号">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="UseWay" HeaderText="用途">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ActualMoney" HeaderText="实购金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="RatioMoney" HeaderText="税金">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Freight" HeaderText="运费">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="OtherObject" HeaderText="其它">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BorrowMoney" HeaderText="借款金额">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="RowNumber" HeaderText="料单张数">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BorrowerName" HeaderText="借款人">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="RequestTime" HeaderText="请款日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="ApproverName" HeaderText="财务审核">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="CancelTime" HeaderText="报销日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="BeforePayMoney" HeaderText="预付款">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="PayMoney" HeaderText="已付款">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Arrearage" HeaderText="欠款">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="IsPay" HeaderText="付款标志">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                        </asp:BoundColumn>
                                                                        <asp:BoundColumn DataField="IsFinisth" HeaderText="完成标记">
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
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PayDetailID" runat="server" />
                <asp:HiddenField ID="HF_PayID" runat="server" />
            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
