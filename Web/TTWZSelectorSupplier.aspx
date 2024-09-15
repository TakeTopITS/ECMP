<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZSelectorSupplier.aspx.cs" Inherits="TTWZSelectorSupplier" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>供应商</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>

    <script type="text/jscript" language="javascript">
        //复选框全选
        function ChooseAll(item) {
            $("input[name=dlCode]").each(function () {
                if (item.checked == true) {
                    $(this).attr("checked", "checked");
                } else {
                    $(this).removeAttr("checked");
                }
            });
        }

        //多选择按钮判断
        function chooseUpdate() {
            var str = "";
            $("input[name=dlCode]").each(function () {
                if ($(this).attr("checked")) {
                    str = str + $(this).attr("id"); //+ ","; // 整个以,隔开
                }
            });
            if (str == "") {
                alert('请选择记录项！');
                return false;
            }
            else {
                clickMember(str);
            }
        }

        function clickMember(str) {
            var strs = str.split('|');
            var id = getUrlParam("ctrlId");
            var name = getUrlParam("ctrlName");
            if (id != "") {
                window.parent.document.getElementById(id).value = strs[0];
            }
            if (name != "") {
                window.parent.document.getElementById(name).value = strs[1];
            }
            CloseLayer();
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">
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
                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
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
                                                <td class="formItemBgStyle" width="100%" align="left" style="color: red; padding-left: 20px;">
                                                    <asp:Label ID="LB_TotalNumber" runat="server"></asp:Label>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="formItemBgStyle" width="100%">
                                                    <div style="width: 3700px;">
                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                            <tr>
                                                                <td width="7">
                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                </td>
                                                                <td>
                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                        <tr>
                                                                            <td width="1%" align="center">
                                                                                <strong>&nbsp;<%--<input id='checkAll' type="checkbox" onclick="ChooseAll(this)" />--%></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,GongFangBianHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuGongWuZi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiBie%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,DengJiRiQi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,FuShenRiQi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ZhiBaoGongChengShi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,FuShenZiLiao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,FuShenJieLun%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,ZeRenGongChengShi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,DanWeiDianHua%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="left">
                                                                                <strong>QQ</strong>
                                                                            </td>
                                                                            <td width="3%" align="left">
                                                                                <strong>E-mail</strong>
                                                                            </td>
                                                                            <td width="4%" align="left">
                                                                                <strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,RuWangWenJian%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label></strong>
                                                                            </td>
                                                                            <td width="2%" align="center">
                                                                                <strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="使用标记"></asp:Label></strong>
                                                                            </td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                                <td width="6" align="right">
                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                </td>
                                                            </tr>
                                                        </table>
                                                        <asp:DataGrid ID="DG_List" runat="server" AllowPaging="False" AutoGenerateColumns="False"
                                                            CellPadding="4" ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="false"
                                                            Width="100%">
                                                            <Columns>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    <HeaderTemplate>
                                                                        &nbsp;
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <input id='<%# Eval("SupplierCode")+"|"+Eval("SupplierName") %>' type="radio" name="dlCode" />
                                                                        <%--<input id='<%# Eval("SupplierCode")+"|"+Eval("SupplierName") %>' type="checkbox" name="dlCode" />--%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="SupplierNumber" HeaderText="供方编号">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,GongYingShang%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("SupplierName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuGongWuZi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("MainSupplier").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="Grade" HeaderText="级别">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                </asp:BoundColumn>
                                                                <%--<asp:BoundColumn DataField="ApproveTime" HeaderText="登记日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,DengJiRiQi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ApproveTime").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <%--<asp:BoundColumn DataField="ReviewDate" HeaderText="复审日期">
                                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                        </asp:BoundColumn>--%>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,FuShenRiQi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ReviewDate").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="QualityEngineerName" HeaderText="质保工程师">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,FuShenZiLiao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <a href='<%# Eval("ReviewDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("ReviewDocument").ToString(), 8) %></a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,FuShenJieLun%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ReviewResult").ToString(), 7) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="AuditorName" HeaderText="责任工程师">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="3%" />
                                                                </asp:BoundColumn>
                                                                <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                </asp:BoundColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,ShenPiWenJian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <a href='<%# Eval("ApprovalDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("ApprovalDocument").ToString(), 190) %></a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TuiJianDanWei%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("PushUnit").ToString(), 192) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TuiJianRen%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("PushPersonName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,WuZiZhuGuan%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("CompetentMaterialsName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,HeTongJianShen%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ContractWhoseName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,ZhuGuanLingDao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("CompetentLeadershipName").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,KaiHuHang%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("OpeningBank").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,ZhangHao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("AccountNumber").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShuiHao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("RateNumber").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,DanWeiDiZhi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("UnitAddress").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,YouBian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ZipCode").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,FaRenDaiBiao%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("PersonDelegate").ToString(), 9) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,DanWeiDianHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("UnitPhone").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("DelegateAgent").ToString(), 9) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,LianXiDianHua%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("ContactPhone").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShouJi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("Mobile").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                    <HeaderTemplate>
                                                                        QQ
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("QQ").ToString(), 13) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                    <HeaderTemplate>
                                                                        E-mail
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%# ShareClass.StringCutByRequire(Eval("Email").ToString(), 190) %>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="4%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,RuWangWenJian%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <a href='<%# Eval("InDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("InDocument").ToString(), 8) %></a>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:TemplateColumn>
                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                    <HeaderTemplate>
                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShenQingRiQi%>"></asp:Label>
                                                                    </HeaderTemplate>
                                                                    <ItemTemplate>
                                                                        <%#DataBinder.Eval(Container.DataItem, "InTime", "{0:yyyy/MM/dd}")%>
                                                                    </ItemTemplate>
                                                                </asp:TemplateColumn>
                                                                <asp:BoundColumn DataField="IsMark" HeaderText="使用标记">
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
                                                <td class="formItemBgStyle">
                                                    <div style="text-align: left">
                                                        <input id="btnOk" class="inpu" onclick="return chooseUpdate()" type="button" value="确定" />
                                                        &nbsp;
                                                        <input id="btnClose()" class="inpu" onclick="window.returnValue = false;CloseLayer();"
                                                            type="button" value="关闭" />
                                                        <asp:TextBox ID="TextBox1" runat="server" Visible="false"></asp:TextBox>
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
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
