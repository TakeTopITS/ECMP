<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTGoodsMRPExtend.aspx.cs" Inherits="TTGoodsMRPExtend" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        #AboveDiv {
            min-width: 1900px;
            width: expression (document.body.clientWidth <= 1900? "1900px" : "auto" ));
        }

        /*.auto-style1 {
            height: 35px;
        }

        .auto-style2 {
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
        }*/
    </style>

    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            window.document.getElementById("TabContainer1").style.visibility = "visible";
            window.document.getElementById("TabContainer1_TabPanel1").style.visibility = "visible";

            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <%--  <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,MRPZhanKaiYunSuan%>"></asp:Label>
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
                                <td style="padding: 5px 5px 5px 5px;">
                                    <table width="100%" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td class="formItemBgStyle" style="margin-top: 5px">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td style="text-align: left;" colspan="6">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" />
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="9%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="30%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JiHuaMing%>"></asp:Label></strong>
                                                                                </td>
                                                                                <td width="20%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,GuiShuBuMen%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="9%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,ShenQingRen%>"></asp:Label></strong>
                                                                                </td>

                                                                                <td width="9%" align="center">
                                                                                    <strong>
                                                                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong>
                                                                                </td>
                                                                                <%-- <td align="center" width="5%">
                                                                                    <strong></strong>
                                                                                </td>--%>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid5" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                                                                ShowHeader="false" Height="1px" OnItemCommand="DataGrid5_ItemCommand" OnPageIndexChanged="DataGrid5_PageIndexChanged"
                                                                PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="单号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_PlanVerID" CommandName="PlanID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"PlanVerID") %>' />
                                                                        </ItemTemplate>
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="PlanVerName" HeaderText="计划名">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="left" Width="30%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BelongDepartName" HeaderText="归属部门">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="CreatorName" HeaderText="申请人">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="状态">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                    </asp:TemplateColumn>
                                                                </Columns>
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="0" cellspacing="0" width="100%">
                                        <tr>
                                            <td align="left" class="page_topbj">
                                                <table>
                                                    <tr>
                                                        <td>
                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,JiHuaMingXi%>"></asp:Label>：
                                                        </td>
                                                        <td>
                                                            <asp:Label ID="LB_PlanVerID" runat="server"></asp:Label>
                                                            <asp:Label ID="LB_PlanVerName" runat="server"></asp:Label>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,MRPBanBen%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_PlanMRPVersionID" runat="server" AutoPostBack="True" DataTextField="PlanMRPVerID" DataValueField="ID" OnSelectedIndexChanged="DL_PlanMRPVersionID_SelectedIndexChanged" Width="70px">
                                                                        </asp:DropDownList>

                                                                    </td>
                                                                    <td>
                                                                        <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：
                                                                    </td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_VersionType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_VersionType_SelectedIndexChanged">
                                                                            <asp:ListItem Value="BACKUP" Text="<%$ Resources:lang,BeiYong%>" />
                                                                            <asp:ListItem Value="ACTIVE" Text="<%$ Resources:lang,HuoDong%>" />
                                                                            <asp:ListItem Value="FINISHED" Text="<%$ Resources:lang,WanCheng%>" />
                                                                        </asp:DropDownList>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhanKaiLeiXing%>"></asp:Label>：</td>
                                                                    <td>
                                                                        <asp:DropDownList ID="DL_ExpendType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ExpendType_SelectedIndexChanged">
                                                                            <asp:ListItem Text="<%$ Resources:lang,FengKai%>" Value="PART" />
                                                                            <asp:ListItem Text="<%$ Resources:lang,TongChou%>" Value="WHOLE" />
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td>
                                                            <table>
                                                                <tr>
                                                                    <td>
                                                                        <asp:Label ID="Label87" runat="server" Text="<%$ Resources:lang,BaoHan%>"></asp:Label>
                                                                        ：</td>
                                                                    <td>
                                                                        <asp:CheckBox ID="CB_OnOrder" runat="server" Text="<%$ Resources:lang,ZaiTuLiang%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="CB_OnProduction" runat="server" Text="<%$ Resources:lang,ZaiChanLiang%>" />
                                                                    </td>
                                                                    <td>
                                                                        <asp:CheckBox ID="CB_OnLine" runat="server" Text="<%$ Resources:lang,ZaiXianLiang%>" />
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>

                                                        <td>
                                                            <img id="IMG_Waiting" src="Images/Processing.gif" alt="Loading,please wait..." style="text-align: center; display: none;" />

                                                            <asp:Button ID="BT_MRPExtend" runat="server" CommandName="MRPExtend" CssClass="auto-style2" OnClick="BT_MRPExtend_Click" OnClientClick="javascript:document.getElementById('IMG_Waiting').style.display = 'block';" Text="<%$ Resources:lang,ZhanKaiJiSuan%>" />
                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>

                                                        <td>（<asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ZengJiaMRPJiHuaBanBen%>"></asp:Label>：</td>
                                                        <td>
                                                            <NickLee:NumberBox ID="NB_NewVerID" runat="server" Amount="1" MaxAmount="1000000000000" MinAmount="1" Precision="0" Width="30px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">1</NickLee:NumberBox>
                                                        </td>
                                                        <td>
                                                            <asp:Button ID="BT_Add" runat="server" CssClass="inpu" Text="<%$ Resources:lang,XinZeng%>" OnClick="BT_Add_Click" /></td>
                                                        <td style="padding-left: 5px;">
                                                            <asp:Button ID="BT_Delete" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ShanChu%>" OnClick="BT_Delete_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" />）

                                                        </td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                    <tr>
                                                        <td align="right">
                                                            <asp:Label ID="Label89" runat="server" Text="<%$ Resources:lang,TiaoJian%>"></asp:Label>：</td>
                                                        <td>
                                                            <asp:DropDownList ID="DL_BusinessType" runat="server" AutoPostBack="True">
                                                                <asp:ListItem Value="Project" Text="<%$ Resources:lang,XiangMu%>" />
                                                                <asp:ListItem Value="SaleOrder" Text="<%$ Resources:lang,XiaoShouDan%>" />
                                                                <asp:ListItem Value="Other" Text="<%$ Resources:lang,QiTa%>" />
                                                            </asp:DropDownList>

                                                        </td>
                                                        <td>ID:<NickLee:NumberBox ID="NB_BusinessID" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" Precision="0" Width="60px" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor=""></NickLee:NumberBox>
                                                            RecordID:<NickLee:NumberBox ID="NB_BusinessRecordID" runat="server" Amount="0" MaxAmount="1000000000000" MinAmount="0" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="60px"></NickLee:NumberBox>
                                                            <asp:Button ID="BT_Find" runat="server" CssClass="inpu" OnClick="BT_Find_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                                        </td>

                                                        <td colspan="5">
                                                            <asp:HyperLink ID="HL_PurchasePlanView" runat="server" Target="_blank"> PO<img src="ImagesSkin/print.gif" alt="打印" border="0" /></asp:HyperLink>
                                                            &nbsp;<asp:HyperLink ID="HL_ProductionPlanView" runat="server" Target="_blank"> PD<img src="ImagesSkin/print.gif" alt="打印" border="0" /></asp:HyperLink>
                                                            &nbsp;<asp:HyperLink ID="HL_OutsourcePlanView" runat="server" Target="_blank"> OUT<img src="ImagesSkin/print.gif" alt="打印" border="0" /></asp:HyperLink>
                                                            &nbsp; 1.<asp:HyperLink ID="HL_MainPlanBusinessObjectMateriaDetailReport" runat="server" Target="_blank" Text="<%$ Resources:lang,YeWuDanCaiLiaoTongJiBaoBiao%>"></asp:HyperLink>
                                                            &nbsp; 2.<asp:HyperLink ID="HL_MainPlanMateriaDetailReport" runat="server" Target="_blank" Text="<%$ Resources:lang,ZhuJiHuaCaiLiaoTongJiBaoBiao%>"></asp:HyperLink>
                                                        </td>

                                                       <td colspan="2" style="padding-top: 5px; text-align: center;">
                                                              <asp:HyperLink ID="HL_TranferToProjectplan" runat="server" Target="_blank" Enabled="false">
                                                                --><asp:Label ID="Label95" runat="server" Text="转成项目计划"></asp:Label>
                                                            </asp:HyperLink>

                                                         
                                                        </td>

                                                        <td style="padding-top: 5px;">
                                                             <asp:HyperLink ID="HL_RelatedProjectPlanGantt" runat="server" Target="_blank">
                                                                --><asp:Label ID="Label94" runat="server" Text="<%$ Resources:lang,GanTeTu%>"></asp:Label>
                                                            </asp:HyperLink>
                                                        </td>

                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                        <td>&nbsp;</td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="left" style="padding: 5px 5px 5px 5px;">
                                    <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="1" Width="100%">
                                        <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="计划内容" TabIndex="0">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,JiHuaNeiRong%>"></asp:Label>

                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,BanHao %>"></asp:Label></strong></td>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center"><strong>
                                                                                    <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                <td width="9%" align="center"><strong>
                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                <td width="15%" align="center"><strong>
                                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label90" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>Bom</strong> </td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,JiHuaShuLiang %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,WanChengShuLiang %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,WeiWanShuLiang %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,KaiShiShiJian %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,JiaoHuoShiJian %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="15%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="BomVerID" HeaderText="BomVerID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanNumber" HeaderText="计划数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="FinishedNumber" HeaderText="完成数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="UnFinishedNumber" HeaderText="未完数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="PlanStartDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="计划开始时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="DeliveryDate" DataFormatString="{0:yyyy/MM/dd}" HeaderText="发货时间">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>

                                            </ContentTemplate>

                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="采购需求计划" TabIndex="1">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,CaiGouXuQiuJiHua%>"></asp:Label>

                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label></strong></td>
                                                                                <td width="4%" align="center"><strong>
                                                                                    <asp:Label ID="Label80" runat="server" Text="SourceID"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center"><strong>
                                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label91" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,SunHaoLv %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,SunHaoLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,KuChengLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label></strong></td>
                                                                                <td width="5%"></td>
                                                                                <td width="4%" align="center"><strong>
                                                                                    <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="0" OnItemCommand="DataGrid2_ItemCommand"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                     <asp:TemplateColumn HeaderText="源类型">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetMRPFormTypeAndName(Eval("SourceType").ToString(),Eval("SourceRecordID").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="SourceRecordID" HeaderText="SourceID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="库存量">
                                                                        <ItemTemplate><%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求数量">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="NB_PORequireNumber" Width="98%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireNumber") %>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsPurchaseOrderDetailViewByPurchasePlan.aspx?SourceType=PurchasePlan&SourceID={0}"
                                                                        DataTextField="OrderNumber" Target="_blank" HeaderText="下单数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="下单时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_POOrderTime" Width="99%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"OrderTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_POOrderTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_PORequireTime" Width="99%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_PORequireTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="保存">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Save" CommandName="Save" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" Width="5%" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>

                                            </ContentTemplate>

                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="作业需求计划" TabIndex="2">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,ZuoYeXuQiuJiHua%>"></asp:Label>

                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label></strong></td>
                                                                                <td width="4%" align="center"><strong>
                                                                                    <asp:Label ID="Label84" runat="server" Text="SourceID"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label></strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label></strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label></strong></td>
                                                                                <td width="12%" align="center"><strong>
                                                                                    <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label></strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label92" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,SunHaoLv %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,SunHaoLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,KuChengLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label></strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label></strong></td>
                                                                                <td width="5%"></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label></strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4" OnItemCommand="DataGrid3_ItemCommand"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                     <asp:TemplateColumn HeaderText="源类型">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetMRPFormTypeAndName(Eval("SourceType").ToString(),Eval("SourceRecordID").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="SourceRecordID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="库存量">
                                                                        <ItemTemplate><%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %></ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求数量">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="NB_PDRequireNumber" Width="99%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireNumber") %>'></asp:TextBox>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsProductionOrderDetailViewByProductionPlan.aspx?SourceType=ProductionPlan&SourceID={0}"
                                                                        DataTextField="OrderNumber" Target="_blank" HeaderText="下单数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="下单时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_PDOrderTime" Width="98%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"OrderTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_PDOrderTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_PDRequireTime" Width="98%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_PDRequireTime" Enabled="True"></ajaxToolkit:CalendarExtender>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="保存">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Save" CommandName="Save" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" Width="5%" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>
                                                                <EditItemStyle BackColor="#2461BF" />
                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                <ItemStyle CssClass="itemStyle" />
                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid></td>
                                                    </tr>
                                                </table>

                                            </ContentTemplate>

                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel5" runat="server" HeaderText="委外需求计划" TabIndex="3">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,WeiWaiXuQiuJiHua%>"></asp:Label>

                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
                                                            <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                <tr>
                                                                    <td width="7">
                                                                        <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                    <td>
                                                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                            <tr>
                                                                                <td width="8%" align="center"><strong>
                                                                                    <asp:Label ID="Label85" runat="server" Text="<%$ Resources:lang,LaiYuan %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="4%" align="center"><strong>
                                                                                    <asp:Label ID="Label86" runat="server" Text="SourceID"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,DaiMa %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="7%" align="center"><strong>
                                                                                    <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,XingHao %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="12%" align="center"><strong>
                                                                                    <asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,GuiGe %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="6%" align="center"><strong>
                                                                                    <asp:Label ID="Label93" runat="server" Text="<%$ Resources:lang,PinPai %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,SunHaoLv %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,SunHaoLiang %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,KuChengLiang %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,XuQiuShuLiang %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,YiXiaDanLiang %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,XiaDanShiJian %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,XuQiuShiJian %>"></asp:Label>
                                                                                </strong></td>
                                                                                <td width="5%"></td>
                                                                                <td width="5%" align="center"><strong>
                                                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,DanWei %>"></asp:Label>
                                                                                </strong></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td width="6" align="right">
                                                                        <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                </tr>
                                                            </table>
                                                            <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" ShowHeader="False"
                                                                Height="1px" Width="100%" CellPadding="4" OnItemCommand="DataGrid4_ItemCommand"
                                                                ForeColor="#333333" GridLines="None">
                                                                <Columns>
                                                                    <asp:TemplateColumn HeaderText="源类型">
                                                                        <ItemTemplate>
                                                                            <%# ShareClass. GetMRPFormTypeAndName(Eval("SourceType").ToString(),Eval("SourceRecordID").ToString()) %>
                                                                        </ItemTemplate>
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="8%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="SourceRecordID" HeaderText="ID">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ID" HeaderText="编号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemCode" HeaderText="代码">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ItemName" HeaderText="名称">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="ModelNumber" HeaderText="型号">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="7%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Specification" HeaderText="规格">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="Brand" HeaderText="品牌">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="6%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossRate" HeaderText="损耗率">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:BoundColumn DataField="LossNumber" HeaderText="损耗量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                    <asp:TemplateColumn HeaderText="库存量">
                                                                        <ItemTemplate>
                                                                            <%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %><%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %><%#   GetGoodsInventoryNumber(Eval("ItemCode").ToString(),Eval("ModelNumber").ToString(),Eval("Specification").ToString(),Eval("Unit").ToString()) %>
                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求数量">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="NB_PDRequireNumber" Width="99%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireNumber") %>'></asp:TextBox>

                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTGoodsProductionOrderDetailViewByProductionPlan.aspx?SourceType=ProductionPlan&SourceID={0}"
                                                                        DataTextField="OrderNumber" Target="_blank" HeaderText="下单数量">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:HyperLinkColumn>
                                                                    <asp:TemplateColumn HeaderText="下单时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_PDOrderTime" Width="98%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"OrderTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender1" runat="server" TargetControlID="DLC_PDOrderTime" Enabled="True"></ajaxToolkit:CalendarExtender>

                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="需求时间">
                                                                        <ItemTemplate>
                                                                            <asp:TextBox ID="DLC_PDRequireTime" Width="98%" runat="server" Text='<%# DataBinder.Eval(Container.DataItem,"RequireTime") %>'></asp:TextBox><ajaxToolkit:CalendarExtender Format="yyyy-MM-dd" ID="CalendarExtender2" runat="server" TargetControlID="DLC_PDRequireTime" Enabled="True"></ajaxToolkit:CalendarExtender>

                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:TemplateColumn HeaderText="保存">
                                                                        <ItemTemplate>
                                                                            <asp:Button ID="BT_Save" CommandName="Save" runat="server" CssClass="inpu" Text="<%$ Resources:lang,BaoCun%>" />

                                                                        </ItemTemplate>

                                                                        <ItemStyle CssClass="itemBorder" Width="5%" HorizontalAlign="Center" />
                                                                    </asp:TemplateColumn>
                                                                    <asp:BoundColumn DataField="Unit" HeaderText="单位">
                                                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                    </asp:BoundColumn>
                                                                </Columns>

                                                                <EditItemStyle BackColor="#2461BF" />

                                                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />

                                                                <ItemStyle CssClass="itemStyle" />

                                                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                            </asp:DataGrid>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </ContentTemplate>

                                        </cc1:TabPanel>

                                        <cc1:TabPanel ID="TabPanel4" runat="server" TabIndex="4">
                                            <HeaderTemplate>
                                                <asp:Label ID="Label88" runat="server" Text="<%$ Resources:lang,GongZuoLiuDingYi%>"></asp:Label>

                                            </HeaderTemplate>

                                            <ContentTemplate>
                                                <table width="100%" cellpadding="0" cellspacing="0" align="center">
                                                    <tr>
                                                        <td colspan="6">
                                                            <table cellpadding="3" cellspacing="0" class="formBgStyle" width="100%">
                                                                <tr style="font-size: 10pt">
                                                                    <td class="formItemBgStyle" colspan="2" style="height: 10px; text-align: left"><strong>
                                                                        <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GongZuoLiuShenQing%>"></asp:Label>：</strong> </td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                                                            <asp:ListItem Value="计划审批" Text="<%$ Resources:lang,JiHuaShengPi%>" />
                                                                        </asp:DropDownList><asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,GongZuoLiuMuBan%>"></asp:Label>：<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName"
                                                                            Width="144px">
                                                                        </asp:DropDownList><asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx"
                                                                            Target="_blank">
                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                                                        </asp:HyperLink><asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click"
                                                                            Text="<%$ Resources:lang,ShuaXin%>" /></td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,MingCheng%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="TB_WLName" runat="server" Width="387px"></asp:TextBox></td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,ShuoMing%>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:TextBox ID="TB_Description" runat="server" Height="48px" TextMode="MultiLine"
                                                                            Width="441px"></asp:TextBox></td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td class="formItemBgStyle" style="text-align: right;"></td>
                                                                    <td class="formItemBgStyle" style="text-align: left; height: 19px;">（<asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoChuLiXinXi%>"></asp:Label>：<asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" /><asp:CheckBox
                                                                        ID="CB_Mail" runat="server" Font-Size="10pt" Text="<%$ Resources:lang,YouJian%>" /><span style="font-size: 10pt">) </span>
                                                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" /><cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel1" BackgroundCssClass="modalBackground" Y="150"
                                                                            DynamicServicePath="">
                                                                        </cc1:ModalPopupExtender>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr style="font-size: 10pt;">
                                                                    <td style="height: 14px; text-align: left">
                                                                        <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,DuiYingShenPiJiLu%>"></asp:Label>： </td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td style="height: 11px; text-align: left">
                                                                        <table background="ImagesSkin/main_n_bj.jpg" border="0" cellpadding="0" cellspacing="0"
                                                                            width="100%">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                <td>
                                                                                    <table border="0" cellpadding="0" cellspacing="0" width="100%">
                                                                                        <tr>
                                                                                            <td align="center" width="9%"><strong>
                                                                                                <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="55%"><strong>
                                                                                                <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="15%"><strong>
                                                                                                <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="9%"><strong>
                                                                                                <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong></td>
                                                                                            <td align="center" width="9%"><strong></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td align="right" width="6">
                                                                                    <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid8" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                                                            ForeColor="#333333" GridLines="None" Height="1px" PageSize="5" ShowHeader="False"
                                                                            Width="100%">
                                                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                            <EditItemStyle BackColor="#2461BF" />
                                                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                            <ItemStyle CssClass="itemStyle" />
                                                                            <Columns>
                                                                                <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                                                                    DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="55%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:TemplateColumn HeaderText="状态">
                                                                                    <ItemTemplate></ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="9%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=审核&WLID={0}") %>'
                                                                                            Target="_blank"><img class="noBorder" src="ImagesSkin/Doc.gif" /></asp:HyperLink>
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="9%" />
                                                                                </asp:TemplateColumn>
                                                                            </Columns>
                                                                        </asp:DataGrid></td>
                                                                </tr>
                                                                <tr style="font-size: 10pt">
                                                                    <td style="text-align: right">
                                                                        <asp:Label ID="Label82" runat="server" Visible="False"></asp:Label><asp:Label ID="Label83" runat="server" Visible="False"></asp:Label></td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>

                                            </ContentTemplate>

                                        </cc1:TabPanel>
                                    </cc1:TabContainer>
                                </td>
                            </tr>
                        </table>
                    </div>

                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;"
                        Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button
                                            ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>

                    <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql1" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_Sql5" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_GoodsOwner" runat="server" Visible="False"></asp:Label>
                    <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>


                </ContentTemplate>
            </asp:UpdatePanel>
            <div style="position: absolute; left: 50%; top: 50%;">
                <asp:UpdateProgress ID="TakeTopUp" runat="server" AssociatedUpdatePanelID="UpdatePanel1">
                    <ProgressTemplate>
                        <img src="Images/Processing.gif" alt="Loading,please wait..." />
                    </ProgressTemplate>
                </asp:UpdateProgress>
            </div>
        </form>
    </center>
</body>
<script type="text/javascript" language="javascript">var cssDirectory = '<%=Session["CssDirectory"] %>'; var oLink = document.getElementById('mainCss'); oLink.href = 'css/' + cssDirectory + '/' + 'bluelightmain.css';</script>
</html>
