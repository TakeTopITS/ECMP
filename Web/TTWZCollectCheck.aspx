<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZCollectCheck.aspx.cs" Inherits="TTWZCollectCheck" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>收料单列表</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script language="javascript">
        $(function () { 



        });

    </script>
    <style type="text/css">
        .auto-style1 {
            border-style: none;
            background-image: url('ImagesSkin/butbj.jpg');
            width: 71px;
            text-align: center;
            margin-left: 0px;
            margin-right: 0px;
            font-size: 12px;
            color: #000000;
            font-family: "microsoft yahei";
            margin: 2px 0;
            cursor: pointer;
        }
    </style>
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
                                                            <asp:Label ID="Label1" runat="server" Text="收料单材检"></asp:Label>
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
                                            <td class="formItemBgStyle" width="100%">
                                                <asp:Label ID="Label70" runat="server" Text="列表查询："></asp:Label>

                                                <asp:Label ID="LB_CheckRecord" runat="server" Text="*"></asp:Label>&nbsp;<asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：
                                                
                                               <asp:DropDownList ID="DDL_Progress" runat="server">
                                                   <%--    <asp:ListItem Text="<%$ Resources:lang,CaiJian%>" Value="材检" />--%>
                                                   <asp:ListItem Text="" Value="" />
                                                   <asp:ListItem Text="<%$ Resources:lang,CaiJian%>" Value="材检" />
                                                   <asp:ListItem Text="<%$ Resources:lang,KaiPiao%>" Value="开票" />


                                               </asp:DropDownList>&nbsp;
                                                          
                                                            
                                                            <asp:Button ID="BT_Search" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />



                                                &nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：&nbsp;
                                                            <asp:Button ID="BT_SortCollectCode" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShouLiaoDanHao%>" OnClick="BT_SortCollectCode_Click" />&nbsp;
                                                            <asp:Button ID="BT_SortTicketTime" runat="server" CssClass="inpu" Text="<%$ Resources:lang,KaiPiaoRiQi%>" OnClick="BT_SortTicketTime_Click" />&nbsp;
                                                            <asp:Button ID="BT_SortCompactCode" runat="server" CssClass="auto-style1" Text="<%$ Resources:lang,HeTongBianHao%>" OnClick="BT_SortCompactCode_Click" />
                                                <asp:HiddenField ID="HF_SortCollectCode" runat="server" />
                                                <asp:HiddenField ID="HF_SortTicketTime" runat="server" />
                                                <asp:HiddenField ID="HF_SortCompactCode" runat="server" />
                                            </td>
                                        </tr>

                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 3300px;">
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
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShouLiaoDanHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,KuBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ShouLiaoFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label82" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,YingShouShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ShiShouShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,ShiGouDanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ShiGouJinE%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,ShuiLv%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ShuiJin%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,YunFei%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,QiTa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,HeTongYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,HuanSuanShuLiang%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <%-- <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,FaPiaoHaoMa%>"></asp:Label></strong>
                                                                        </td>--%>


                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,BaoGuanYuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ShouLiaoRiQi%>"></asp:Label></strong>
                                                                        </td>


                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,QingKuanDanHao%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,CaiWuShenHe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,BaoXiaoJinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShuanBiaoJi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                            <td width="6" align="right">
                                                                <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DG_Collect" runat="server" AllowPaging="true" AutoGenerateColumns="False" OnPageIndexChanged="DG_Collect_PageIndexChanged"
                                                        CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="10" ShowHeader="false"
                                                        Width="100%" OnItemCommand="DG_Collect_ItemCommand">
                                                        <Columns>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <asp:LinkButton ID="LinkButton3" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CollectCode") %>' CommandName="select" CssClass="notTab">选择</asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CollectCode") %>' CommandName="ticket" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="材检" ? true : false %>'>材检</asp:LinkButton>
                                                                    <asp:LinkButton ID="LinkButton2" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"CollectCode") %>' CommandName="notTicket" CssClass="notTab" Visible='<%# Eval("Progress").ToString()=="开票" ? true : false %>'>材检退回</asp:LinkButton>

                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="CollectCode" HeaderText="收料单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CompactCode" HeaderText="合同编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="StoreRoom" HeaderText="库别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CollectMethod" HeaderText="收料方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="TicketTime" HeaderText="开票日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,KaiPiaoRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "TicketTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="PlanDetailID" HeaderText="计划编号" Visible="false">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <%--<asp:BoundColumn DataField="ObjectName" HeaderText="物资名称">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="5%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("ObjectName").ToString(), 192) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Model" HeaderText="规格型号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Criterion" HeaderText="标准">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="UnitName" HeaderText="计量单位">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 5) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CheckTime" HeaderText="材检日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CollectNumber" HeaderText="应收数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualNumber" HeaderText="实收数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualPrice" HeaderText="实购单价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ActualMoney" HeaderText="实购金额">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemTemplate>
                                                                    <%# (decimal.Parse ( Eval("Ratio").ToString().Trim ())*100).ToString ().Replace(".00","") + '%' %>
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center"  Width="2%"/>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="RatioMoney" HeaderText="税金">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Freight" HeaderText="运费">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="OtherObject" HeaderText="其它">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TicketNumber" HeaderText="发票号码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ContacterName" HeaderText="合同员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanCode" HeaderText="计划编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ObjectCode" HeaderText="物资代码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ConvertNumber" HeaderText="换算数量">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="SupplierCode" HeaderText="供方编号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <%--<asp:BoundColumn DataField="CheckCode" HeaderText="检号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>

                                                            <asp:BoundColumn DataField="SafekeeperName" HeaderText="保管员">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="CollectTime" HeaderText="收料日期">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="RequestCode" HeaderText="请款单号">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>

                                                            <asp:BoundColumn DataField="FinanceApprove" HeaderText="财务审核">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PayProcess" HeaderText="报销进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="IsMark" HeaderText="结算标记">
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

                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <asp:Label ID="Label53" runat="server" Text="检号记录："></asp:Label>

                                                <asp:Label ID="LB_CheckCodeRecord" runat="server" Text="*"></asp:Label>&nbsp;<asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>

                                                <asp:Label ID="LB_CollectSql" runat="server" Visible="False"></asp:Label>

                                            </td>
                                        </tr>
                                        <tr>
                                            <td class="formItemBgStyle" style="text-align: left; width: 100%;">

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
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,HeTongBianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JiHuaBianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,WuZiDaiMa%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,WuZiMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,GuiGeXingHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,BiaoZhun%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,JiLiangDanWei%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,CaiJianYuan%>"></asp:Label></strong>
                                                                    </td>

                                                                    <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,CaiJianZiLiao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label></strong>
                                                                    </td>
                                                                 
                                                                    <td width="3%" align="right">
                                                                        <strong>
                                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,HeTongShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,DaoHuoMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DaoHuoGuiGeXingHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="3%" align="right">
                                                                        <strong>
                                                                            <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,DaoHuoShuLiang%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,ShengChanChangJia%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,LuPiHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ZhiXingBiaoZhun%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="4%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,JiaoHuoZhuangTai%>"></asp:Label></strong>
                                                                    </td>
                                                                       <td width="3%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="5%" align="left">
                                                                        <strong>
                                                                            <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,BeiZhu%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="2%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
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
                                                    Width="100%" OnPageIndexChanged="DataGrid1_PageIndexChanged">
                                                    <Columns>

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
                                                        <asp:BoundColumn DataField="CheckerName" HeaderText="计量单位">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:BoundColumn>

                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,JianHao%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# ShareClass.StringCutByRequire(Eval("CheckCode").ToString(), 8) %>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="CheckerName" HeaderText="材检员">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:BoundColumn>

                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,CaiJianZiLiao%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <a href='<%# Eval("CheckDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("CheckDocument").ToString(), 190) %></a>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                        <%-- <asp:BoundColumn DataField="CheckDocument" HeaderText="材检资料">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                        </asp:BoundColumn>--%>

                                                        <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <a href='<%# Eval("ReinspectionRecordURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("ReinspectionRecord").ToString(), 190) %></a>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>

                                                        <%--  <asp:TemplateColumn>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,FuYanJiLu%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# ShareClass.StringCutByRequire(Eval("ReinspectionRecord").ToString(), 8) %>
                                                            </ItemTemplate>
                                                        </asp:TemplateColumn>--%>

                                                      

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
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                            <HeaderTemplate>
                                                                <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,CaiJianRiQi%>"></asp:Label>
                                                            </HeaderTemplate>
                                                            <ItemTemplate>
                                                                <%# ShareClass.StringCutByRequire(Eval("CheckerDate").ToString(), 190) %>
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

                                                <asp:Label ID="LB_CompactDetailSql" runat="server"  Visible ="false" ></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
            </ContentTemplate>
        </asp:UpdatePanel>
        <p>
            &nbsp;</p>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
