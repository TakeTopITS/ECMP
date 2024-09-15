<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTWZPurchasePlanList.aspx.cs" Inherits="TTWZPurchasePlanList" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>采购文件</title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js"></script>
    <script src="js/allAHandler.js"></script>
    <script src="js/My97DatePicker/WdatePicker.js"></script>
    <script language="javascript">

        $(function () {

        });


        function AlertProjectPage(url) {

            popShowByURLForFixedSize(url, '', 1200, 500);

        }



        function ClickReport(obj) {
            var url = "TTWZSelectorMember.aspx";

            popShowByURLForFixedSize(url + (url.indexOf("?") == -1 ? "?" : "&") + "ctrlId=" + "HF_UpLoaderPurchaseCode" + "&ctrlName=" + "HF_UpLoaderCodeName", '选择专家', 800, 500);

            window.parent.document.getElementById("BT_Report").click();
        }




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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaiGouJiHua%>"></asp:Label>
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
                                                <table style="width: 80%;" cellpadding="2" cellspacing="0" class="formBgStyle">
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="6">
                                                            <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label>：<asp:DropDownList ID="DDL_SearchProgress" runat="server" OnSelectedIndexChanged="DDL_SearchProgress_SelectedIndexChanged" AutoPostBack="true">

                                                                <asp:ListItem Text="<%$ Resources:lang,TiJiao%>" Value="提交" />
                                                                <asp:ListItem Text="<%$ Resources:lang,ShangBao%>" Value="上报" />
                                                                <asp:ListItem Text="<%$ Resources:lang,PiZhun%>" Value="批准" />
                                                                <asp:ListItem Text="<%$ Resources:lang,XunJia%>" Value="询价" />
                                                                <asp:ListItem Text="<%$ Resources:lang,PingBiao%>" Value="评标" />
                                                                <asp:ListItem Text="<%$ Resources:lang,BaoPi%>" Value="报批" />
                                                                <asp:ListItem Text="<%$ Resources:lang,JueCe%>" Value="决策" />
                                                            </asp:DropDownList>&nbsp;
                                                            <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label>：<asp:TextBox ID="TXT_SearchProjectCode" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>：<asp:TextBox ID="TXT_SearchPurchaseName" runat="server"></asp:TextBox>&nbsp;
                                                            <asp:Button ID="BT_Search" CssClass="inpu" runat="server" Text="<%$ Resources:lang,ChaXun%>" OnClick="BT_Search_Click" />
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="6">
                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,JiLuCaoZuo%>"></asp:Label>：
                                                            <asp:Button ID="BT_NewSetVolume" runat="server" Text="<%$ Resources:lang,ZuJuan%>" CssClass="inpu" OnClick="BT_NewSetVolume_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewReport" runat="server" Text="<%$ Resources:lang,ShangBao%>" CssClass="inpu" OnClick="BT_NewReport_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewReportReturn" runat="server" Text="<%$ Resources:lang,ShangBaoTuiHui%>" CssClass="inpu" OnClick="BT_NewReportReturn_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewEnquiry" runat="server" Text="<%$ Resources:lang,XunJia%>" CssClass="inpu" OnClick="BT_NewEnquiry_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewEnquiryReturn" runat="server" Text="<%$ Resources:lang,XunJiaTuiHui%>" CssClass="inpu" OnClick="BT_NewEnquiryReturn_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewAssessment" runat="server" Text="<%$ Resources:lang,PingBiao%>" CssClass="inpu" OnClick="BT_NewAssessment_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewDecisionRecord" runat="server" Text="<%$ Resources:lang,JueCeJiLu%>" CssClass="inpu" OnClick="BT_NewDecisionRecord_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewApproval" runat="server" Text="<%$ Resources:lang,BaoPi%>" CssClass="inpu" OnClick="BT_NewApproval_Click" Enabled="false" />&nbsp;
                                                            <asp:Button ID="BT_NewApprovalReturn" runat="server" Text="<%$ Resources:lang,BaoPiTuiHui%>" CssClass="inpu" OnClick="BT_NewApprovalReturn_Click" Enabled="false" />&nbsp;

                                                            <asp:Button ID="BT_NewScaling" runat="server" Text="<%$ Resources:lang,DingBiao%>" CssClass="inpu" OnClick="BT_NewScaling_Click" Enabled="false" Visible="false" />&nbsp;
                                                            <asp:HyperLink ID="HL_NewScaling" runat="server" Text="<%$ Resources:lang,DingBiao%>" Target="_blank"></asp:HyperLink>

                                                            <asp:Button ID="BT_RelaceLoad" runat="server" Text="<%$ Resources:lang,ChongXinJiaZaiLieBiao%>" OnClick="BT_RelaceLoad_Click" CssClass="inpu" Style="display: none;" />


                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td class="formItemBgStyle" colspan="6">
                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,CaiGouWenJianJiLu%>"></asp:Label>&nbsp;&nbsp;
                                                            <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,Gong%>"></asp:Label><asp:Label ID="LB_RecordCount" runat="server" Text="*"></asp:Label><asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,Tiao%>"></asp:Label>
                                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,LieBiaoPaiXu%>"></asp:Label>：
                                                            <asp:Button ID="BT_SortPurchaseCode" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>" CssClass="inpu" OnClick="BT_SortPurchaseCode_Click" />&nbsp;
                                                            <asp:Button ID="BT_SortProjectCode" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>" CssClass="inpu" OnClick="BT_SortProjectCode_Click" />&nbsp;
                                                            <asp:Button ID="BT_SortPurchaseStartTime" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>" CssClass="inpu" OnClick="BT_SortPurchaseStartTime_Click" />
                                                            <asp:HiddenField ID="HF_SortPurchaseCode" runat="server" />
                                                            <asp:HiddenField ID="HF_SortProjectCode" runat="server" />
                                                            <asp:HiddenField ID="HF_SortPurchaseStartTime" runat="server" />
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top" style="padding-top: 5px;">
                                                <div style="width: 2200px;">
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
                                                                                <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,CaiGouBianHao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,XiangMuBianMa%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,CaiGouGongChengShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,CaiGouJingLi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,WeiTuoDaiLiRen%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,ZhaoBiaoZhuGuan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShangJiLingDao%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,CaiGouFangShi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="3%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,PingBiaoWenJian%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,MingXiTiaoShu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,YuJiFeiYong%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="right">
                                                                            <strong>
                                                                                <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,JueCeZongJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,GongFangBianHaoYi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,GongFangBianHaoEr%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,GongFangBianHaoSan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,GongFangBianHaoSi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,GongFangBianHaoWu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,GongFangBianHaoLiu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,JiJianJianDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,JiaGeJianShen%>"></asp:Label></strong>
                                                                        </td>


                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuanJiaYi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ZhuanJiaEr%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuanJiaSan%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label></strong>
                                                                        </td>

                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianYi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianEr%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSan%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianWu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="left">
                                                                            <strong>
                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianLiu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,JueCeRiQi%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,JinDu%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="2%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,ShiYongBiaoJi%>"></asp:Label></strong>
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
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>

                                                                    <asp:LinkButton ID="LinkButton8" runat="server" CommandArgument='<%# DataBinder.Eval(Container.DataItem,"PurchaseCode") %>' CommandName="click" CssClass="notTab">
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label>
                                                                    </asp:LinkButton>

                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseCode" HeaderText="采购编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,WenJianMingCheng%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseName").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="ProjectCode" HeaderText="项目编码">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BianZhiRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%#DataBinder.Eval(Container.DataItem, "MarkTime", "{0:yyyy/MM/dd}")%>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="PurchaseEngineerName" HeaderText="采购工程师">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseManagerName" HeaderText="采购经理">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="DecisionName" HeaderText="委托代理人">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TenderCompetentName" HeaderText="招标主管">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="UpLeaderName" HeaderText="上级领导">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PurchaseMethod" HeaderText="采购方式">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhaoBiaoWenJian%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# Eval("PurchaseDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("PurchaseDocument").ToString(), 190) %></a>

                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="3%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,PingBiaoWenJian%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# Eval("AssessmentDocumentURL") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("AssessmentDocument").ToString(), 190) %></a>

                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="RowNumber" HeaderText="明细条数">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="PlanMoney" HeaderText="预计费用">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="TotalMoney" HeaderText="决策总价">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Right" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,GongFangBianHaoYi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode1Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierCode2Name" HeaderText="供方编号2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GongFangBianHaoEr%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode2Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierCode3Name" HeaderText="供方编号3">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,GongFangBianHaoSan%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode3Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierCode4Name" HeaderText="供方编号4">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,GongFangBianHaoSi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode4Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierCode5Name" HeaderText="供方编号5">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,GongFangBianHaoWu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode5Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <%--<asp:BoundColumn DataField="SupplierCode6Name" HeaderText="供方编号6">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                            </asp:BoundColumn>--%>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,GongFangBianHaoLiu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("SupplierCode6Name").ToString(), 190) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="DisciplinarySupervisionName" HeaderText="纪检监督">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ControlMoneyName" HeaderText="价格监审">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ExpertCode1Name" HeaderText="专家1">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ExpertCode2Name" HeaderText="专家2">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="ExpertCode3Name" HeaderText="专家3">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BaoJiaKaiShi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("PurchaseStartTime").ToString(),10) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,BaoJiaJieZhi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ConvertPurchaseEndTimeToNull(ShareClass.StringCutByRequire(Eval("PurchaseEndTime").ToString(),10)) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>

                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianYi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL1") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument1").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianEr%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL2") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument2").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSan%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL3") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument3").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianSi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL4") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument4").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianWu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL5") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument5").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,TouBiaoWenJianLiu%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <a href='<%# DataBinder.Eval(Container.DataItem,"TenderDocumentURL6") %>' class="notTab" target="_blank"><%# ShareClass.StringCutByRequire(Eval("TenderDocument6").ToString(), 190) %></a>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:TemplateColumn>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                                <HeaderTemplate>
                                                                    <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,JueCeRiQi%>"></asp:Label>
                                                                </HeaderTemplate>
                                                                <ItemTemplate>
                                                                    <%# ShareClass.StringCutByRequire(Eval("DecisionTime").ToString(),10) %>
                                                                </ItemTemplate>
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Progress" HeaderText="进度">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="2%" />
                                                            </asp:BoundColumn>
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
                                                <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <asp:HiddenField ID="HF_PurchaseCode" runat="server" />
                <asp:HiddenField ID="HF_Progress" runat="server" />
                <asp:HiddenField ID="HF_TenderCompetent" runat="server" />
                <asp:HiddenField ID="HF_PurchaseEngineer" runat="server" />
                <asp:HiddenField ID="HF_IsMark" runat="server" />
                <asp:HiddenField ID="HF_PlanMoney" runat="server" />
                <asp:HiddenField ID="HF_NewPurchaseCode" runat="server" />

                <asp:HiddenField ID="HF_UpLoaderPurchaseCode" runat="server" />
                <asp:HiddenField ID="HF_UpLoaderCodeName" runat="server" />
                <asp:Button ID="BT_Report" runat="server" Text="Button" OnClick="BT_Report_Click" Style="display: none;" />

            </ContentTemplate>
        </asp:UpdatePanel>
    </form>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script></html>
