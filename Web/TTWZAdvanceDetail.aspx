<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZAdvanceDetail.aspx.cs" Inherits="TTWZAdvanceDetail" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>预付计划明细</title>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,YuFuJiHuaMingXi%>"></asp:Label>
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
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px; font-size: 12px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle" width="40%">
                                                                <tr>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TXT_PayMoney" runat="server"></asp:TextBox>
                                                                    </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label>：</td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
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
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px; font-size: 12px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle">
                                                                        <div style="width: 1500px;" id="KeyManage1">
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
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuFuKuanID%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="13%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="9%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="13%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YongTu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="8%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,YuFuJinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_AdvanceDetail" runat="server" AllowPaging="true" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_AdvanceDetail_ItemCommand" OnPageIndexChanged="DG_AdvanceDetail_PageIndexChanged">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="edit" CssClass="notTab">
                                                                                                <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BianJi%>"></asp:Label></asp:LinkButton>
                                                                                            <asp:LinkButton runat="server" CommandArgument='<%# Eval("ID") %>' CommandName="del" CssClass="notTab">
                                                                                                <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ShanChu%>"></asp:Label></asp:LinkButton>

                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="AdvanceCode" HeaderText="预付款ID">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ContractCode" HeaderText="合同编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ContractName" HeaderText="合同名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ContractName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="ContractMoney" HeaderText="合同金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="EffectTime" HeaderText="生效日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%#DataBinder.Eval(Container.DataItem, "EffectTime", "{0:yyyy/MM/dd}")%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="SupplierName" HeaderText="供应商">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="13%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PayMoney" HeaderText="预付款">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="UseWay" HeaderText="用途">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PayProgress" HeaderText="预付进度">
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
                                                                        <asp:Label ID="LB_AdvanceDetailSql" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="left" style="width: 45%; padding: 5px 5px 5px 5px; font-size: 12px;" class="formItemBgStyle" valign="top">
                                                            <table class="formBgStyle">
                                                                <tr>
                                                                    <td class="formItemBgStyle" colspan="2">
                                                                        <div style="width: 3600px;">
                                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                <tr>
                                                                                    <td width="7">
                                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                                    </td>
                                                                                    <td>
                                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                            <tr>
                                                                                                <td width="2%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YuFuKuanBianMa%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,XuFangBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,XiangMuBianHao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="6%" align="left">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,HeTongJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShouLiaoJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,QingKuanJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,MoQingJinE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,CaoQianRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,PiZhunRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="2%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="2%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,CaiJianBiaoZhi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="2%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,YuFuKuan%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="right">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YuFuYuE%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,YuFuBiaoZhi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="2%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                                                </td>
                                                                                                <td width="3%" align="center">
                                                                                                    <strong>
                                                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </table>
                                                                                    </td>
                                                                                    <td width="6" align="right">
                                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                                    </td>
                                                                                </tr>
                                                                            </table>
                                                                            <asp:DataGrid ID="DG_Compact" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                                                CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                                                Width="100%" OnItemCommand="DG_Compact_ItemCommand">
                                                                                <Columns>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>

                                                                                            <input type="checkbox" name="cb_Compact_Code" value='<%#Eval("CompactCode") %>' />
                                                                                            <asp:LinkButton runat="server" CommandArgument='<%#Eval("CompactCode") %>' CommandName="add">
                                                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,XinZeng%>"></asp:Label></asp:LinkButton>

                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="NeedCode" HeaderText="需方编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="SupplierName" HeaderText="供方编号">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="CompactName" HeaderText="合同名称">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,HeTongMingCheng%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("CompactName").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="CompactText" HeaderText="合同文本">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,HeTongWenBen%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <a href='<%# Eval("CompactTextURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("CompactText").ToString(), 190) %></a>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="RowNumber" HeaderText="明细条数">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CompactMoney" HeaderText="合同金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CollectMoney" HeaderText="收料金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="RequestMoney" HeaderText="请款金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="NotRequestMoney" HeaderText="末请金额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="MarkTime" HeaderText="编制日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%#DataBinder.Eval(Container.DataItem, "MarkTime", "{0:yyyy/MM/dd}")%>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <%--<asp:BoundColumn DataField="SingTime" HeaderText="草签日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,CaoQianRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("SingTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="ControlMoneyName" HeaderText="价格监审">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="VerifyTime" HeaderText="审核日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ShenHeRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("VerifyTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="JuridicalPersonName" HeaderText="法人代表">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ApproveTime" HeaderText="批准日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,PiZhunRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ApproveTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="DelegateAgentName" HeaderText="委托代理人">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="EffectTime" HeaderText="生效日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ShengXiaoRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("EffectTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="CompacterName" HeaderText="合同员">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="ReceiveTime" HeaderText="签收日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,QianShouRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("ReceiveTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="SafekeepName" HeaderText="保管员">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="CheckIsMark" HeaderText="材检标志">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <%--<asp:BoundColumn DataField="CancelTime" HeaderText="核销日期">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                                    </asp:BoundColumn>--%>
                                                                                    <asp:TemplateColumn>
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                        <HeaderTemplate>
                                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,HeXiaoRiQi%>"></asp:Label>
                                                                                        </HeaderTemplate>
                                                                                        <ItemTemplate>
                                                                                            <%# ShareClass.StringCutByRequire(Eval("CancelTime").ToString(), 190) %>
                                                                                        </ItemTemplate>
                                                                                    </asp:TemplateColumn>
                                                                                    <asp:BoundColumn DataField="BeforePayMoney" HeaderText="预付款">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="BeforePayBalance" HeaderText="预付余额">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="PayIsMark" HeaderText="预付标志">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                                    </asp:BoundColumn>
                                                                                    <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
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
                <asp:HiddenField ID="HF_AdvanceDetailID" runat="server" />
                <asp:HiddenField ID="HF_AdvanceCode" runat="server" />
            </ContentTemplate>
            <Triggers>
                <asp:PostBackTrigger ControlID="BT_Save" />
                <asp:PostBackTrigger ControlID="BT_Reset" />
                <asp:PostBackTrigger ControlID="BT_MoreAdd" />
            </Triggers>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
