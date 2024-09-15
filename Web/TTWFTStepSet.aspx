<%@ Page Language="C#" AutoEventWireup="true" ValidateRequest="false" CodeFile="TTWFTStepSet.aspx.cs"
    Inherits="TTWFTStepSet" %>

<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .style1 {
            font-size: xx-small;
        }

        .auto-style1 {
            width: 12px;
        }
    </style>
    <script type="text/javascript" src="js/jquery-1.7.2.min.js"></script>
    <script type="text/javascript" src="js/allAHandler.js"></script>
    <script type="text/javascript" language="javascript">
        $(function () {

            window.document.getElementById("TabContainer1").style.visibility = "visible";

            if (top.location != self.location) { } else { CloseWebPage(); }

        });

        function AdjustDivHeight() {

            //document.getElementById("Div_TreeView1").style.height = document.documentElement.clientHeight + "px";
        }
    </script>

    <script type="text/javascript">

        var disPostion = 0;

        function SaveScroll() {
            disPostion = Div_TreeView1.scrollTop;
        }

        function RestoreScroll() {
            Sys.WebForms.PageRequestManager.getInstance().add_endRequest(EndRequestHandler);
        }

        function EndRequestHandler(sender, args) {
            Div_TreeView1.scrollTop = disPostion;
        }
    </script>
</head>
<body>

    <center>
        <form id="form1" runat="server">
            <%--              <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">--%>
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>

            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div style="padding-left: 5px;">
                        <table cellpadding="0" cellspacing="0" width="100%" class="bian">
                            <tr>
                                <td height="31" class="page_topbj">
                                    <table width="96%" border="0" align="center" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td align="left">
                                                <table width="350" border="0" align="left" cellpadding="0" cellspacing="0">
                                                    <tr>
                                                        <td width="29">
                                                            <%--<img src="Logo/main_top_l.jpg" alt="" width="29" height="31" />--%>
                                                        </td>
                                                        <td align="center" background="ImagesSkin/main_top_bj.jpg" class="titlezi">
                                                            <asp:Label ID="LB_WFTemplate" runat="server"></asp:Label>
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,GongZuoLiuBuZhouSeJi%>"></asp:Label>
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
                                    <table style="width: 100%; margin-top: 5px" cellpadding="0" cellspacing="0">
                                        <tr>
                                            <td style="text-align: left" valign="top">

                                                <asp:Label ID="LB_ProjectID0" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_ProjectID" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserCode" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_UserName" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_MakeUserCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td valign="top">
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
                                                                            <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,MingChen%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,ZuiShaoRenShu%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,ShiJian%>"></asp:Label>
                                                                            <span class="style1"></span></strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label9" runat="server" Text="<%$ Resources:lang,TiaoJian%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,ShiFouZiShen%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,BuMenXiangGuan%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,JianZhiShenPi%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,XiangMuXiangGuan%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,ZiXuanShenPiRen%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,ShenQingRenZiDongShenPi%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="7%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,YishenpiZheZiDongShenPi%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="6%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,XiaYiBuBiXu%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,XiaYiBuQueSheng%>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label73" runat="server" Text="<%$ Resources:lang,ZhanZhengTiJingDuYuGu %>"></asp:Label>
                                                                        </strong>
                                                                    </td>
                                                                    <td width="8%" align="center">
                                                                        <strong></strong>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </td>
                                                        <td width="6" align="right">
                                                            <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" />
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    ShowHeader="false" OnPageIndexChanged="DataGrid2_PageIndexChanged"
                                                    PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                    <Columns>
                                                        <asp:BoundColumn DataField="SortNumber" HeaderText="步序">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="4%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="StepName" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="limitedOperator" HeaderText="最少人数">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:HyperLinkColumn DataNavigateUrlField="StepID" DataNavigateUrlFormatString="TTWLTStepCondition.aspx?StepID={0}"
                                                            Target="_blank" Text="条件">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:HyperLinkColumn>
                                                        <asp:BoundColumn DataField="SelfReview" HeaderText="自审">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="DepartRelated" HeaderText="部门相关">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="PartTimeReview" HeaderText="允许兼职审批">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="ProjectRelated" HeaderText="项目相关">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="OperatorSelect" HeaderText="自选审批者">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AllowSelfPass" HeaderText="申请人自批">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="AllowPriorOperatorPass" HeaderText="已批者自批">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="7%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="NextStepMust" HeaderText="为下一步必须通过">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="6%" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="NextSortNumber" HeaderText="下一步">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:BoundColumn>
                                                        <asp:TemplateColumn>
                                                            <ItemTemplate>
                                                                <%# DataBinder.Eval(Container.DataItem,"FinishPercent") %> %
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                                        </asp:TemplateColumn>
                                                    </Columns>
                                                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <EditItemStyle BackColor="#2461BF" />
                                                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                    <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                                    <ItemStyle CssClass="itemStyle" />
                                                </asp:DataGrid>
                                                <asp:Label ID="LB_SqlWL" runat="server" Visible="False"></asp:Label>
                                                <asp:Label ID="LB_RelatedUserCode" runat="server" Visible="False"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left">
                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,BuXu%>"></asp:Label>
                                                <asp:Label ID="LB_SortNumber" runat="server"></asp:Label>
                                                <asp:Label ID="LB_StepName" runat="server"></asp:Label>
                                                <asp:Label ID="LB_StepID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ChengYuanHeDongZuo%>"></asp:Label>：
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left" valign="top">
                                                <cc1:TabContainer CssClass="ajax_tab_menu" ID="TabContainer1" runat="server" ActiveTabIndex="0"
                                                    Width="98%">
                                                    <cc1:TabPanel ID="TabPanel1" runat="server" HeaderText="步骤定义" TabIndex="0">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label69" runat="server" Text="<%$ Resources:lang,BuZhouDingYi%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 98%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td style="width: 12%; text-align: right;" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,BuXu %>"></asp:Label>： </td>
                                                                    <td style="width: 30%; text-align: left; height: 15px;" class="formItemBgStyle">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_SortNumber" runat="server" Width="43px" Precision="0" OnBlur=""
                                                                            OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox></td>
                                                                    <td style="width: 10%; text-align: right; height: 15px;" class="formItemBgStyle">
                                                                        <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,MingCheng %>"></asp:Label>： </td>
                                                                    <td style="width: 30%; text-align: left; height: 15px;" class="formItemBgStyle">
                                                                        <asp:TextBox ID="TB_StepName" runat="server" Width="98%"></asp:TextBox></td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,ZuiShaoRenShu %>"></asp:Label></td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_LimitedOperator" runat="server" Precision="0" Width="43px"
                                                                            OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox><span class="color: #FF0066;">（<span
                                                                                class="font-size: small;"><asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,XYHDYCYCBZDRSZH %>"></asp:Label></span>）</span> </td>
                                                                    <td style="text-align: right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,ZuiChiShiJian %>"></asp:Label>： </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_LimitedTime" runat="server" Precision="0" Width="43px"
                                                                                        OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Amount="4">4</NickLee:NumberBox>

                                                                                </td>
                                                                                <td style="width:50px;text-align:left;">
                                                                                    <asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,XiaoShi %>"></asp:Label>
                                                                                </td>

                                                                                <td >
                                                                                    <asp:Label ID="Label82" runat="server" Text="超"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <NickLee:NumberBox ID="NB_OverTimeHourNumber" runat="server" MaxAmount="1000000000000" MinAmount="0" Width="40px" Precision="0" Amount="24" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">24</NickLee:NumberBox>
                                                                                </td>

                                                                                <td>
                                                                                    <asp:Label ID="Label83" runat="server" Text="小时自动批准"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_OverTimeAutoAgree" runat="server">
                                                                                        <asp:ListItem Value="NO">NO</asp:ListItem>
                                                                                        <asp:ListItem Value="YES">YES</asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td style="text-align: right" class="formItemBgStyle"><span class="font-size: x-small;">
                                                                        <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,XiaYiBuQueSheng %>"></asp:Label>：</span> </td>
                                                                    <td style="text-align: left" class="formItemBgStyle">
                                                                        <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_NextSortNumber" runat="server" Precision="0" Width="43px"
                                                                            OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="">0</NickLee:NumberBox></td>
                                                                    <td style="text-align: right" class="formItemBgStyle"><span class="font-size: x-small;">
                                                                        <asp:Label ID="Label74" runat="server" Text="<%$ Resources:lang,XiaYiBuBiXu %>"></asp:Label>： </span></td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_NextStepMust" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES"></asp:ListItem>
                                                                            <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right"><span class="font-size: x-small;">
                                                                        <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ShiFouZiShen %>"></asp:Label>：</span></td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_SelfReview" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES"></asp:ListItem>
                                                                            <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label80" runat="server" Text="<%$ Resources:lang,YunShiWeiBenBuJiaJian %>"></asp:Label>：
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_AllowCurrentStepAddApprover" runat="server">
                                                                                        <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                                        <asp:ListItem Value="YES"></asp:ListItem>
                                                                                    </asp:DropDownList>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="Label81" runat="server" Text="<%$ Resources:lang,YunShiWeiXiaXiBuJiaJian %>"></asp:Label>：</td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_AllowNextStepAddApprover" runat="server">
                                                                                        <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                                        <asp:ListItem Value="YES"></asp:ListItem>
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,BuMenXiangGuan %>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" align="left">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_DepartRelated" runat="server" AutoPostBack="True">
                                                                                        <asp:ListItem Value="YES" />
                                                                                        <asp:ListItem Selected="True" Value="NO" />
                                                                                    </asp:DropDownList></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,YunXuJianZhiShenPi %>"></asp:Label>： </td>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_PartTimeReview" runat="server" AutoPostBack="True">
                                                                                        <asp:ListItem Value="YES" />
                                                                                        <asp:ListItem Selected="True" Value="NO" />
                                                                                    </asp:DropDownList></td>
                                                                                <td>
                                                                                    <asp:Label ID="Label79" runat="server" Text="<%$ Resources:lang,YXSJBMZJS %>"></asp:Label>： </td>
                                                                                <td>
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_DepartRelatedLevelNumber" runat="server" Precision="0" Width="43px"
                                                                                        OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Amount="100">100</NickLee:NumberBox>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,XiangMuXiangGuan %>"></asp:Label>： </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_ProjectRelated" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES" />
                                                                            <asp:ListItem Selected="True" Value="NO" />
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZiXuanShenPiZhe %>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" align="left">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_OperatorSelect" runat="server" AutoPostBack="True">
                                                                                        <asp:ListItem Value="YES" />
                                                                                        <asp:ListItem Selected="True" Value="NO" />
                                                                                    </asp:DropDownList></td>
                                                                                <td>&nbsp;</td>
                                                                                <td>&nbsp;</td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,ShiFouQianBuZiXuan %>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_IsPriorStepSelect" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES"></asp:ListItem>
                                                                            <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,YXSQRZDPZ %>"></asp:Label>：</td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_AllowSelfPass" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES"></asp:ListItem>
                                                                            <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,YXQBYPZZDPZ %>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <asp:DropDownList ID="DL_AllowPriorOperatorPass" runat="server" AutoPostBack="True">
                                                                            <asp:ListItem Value="YES"></asp:ListItem>
                                                                            <asp:ListItem Selected="True" Value="NO"></asp:ListItem>
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ZhanZhengTiJingDuYuGu %>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle" style="text-align: left">
                                                                        <NickLee:NumberBox ID="NB_FinishPercent" runat="server" MaxAmount="1000000000000" MinAmount="-1000000000000" OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Precision="0" Width="43px">0</NickLee:NumberBox>%</td>
                                                                    <td class="formItemBgStyle" style="text-align: right">
                                                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,TuiSongXiaoXi %>"></asp:Label>：</td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <asp:CheckBox ID="CB_SendSMS" runat="server" Checked="True" Text="<%$ Resources:lang,DuanXin %>" /><asp:CheckBox ID="CB_SendEMail" runat="server" Checked="True" Text="<%$ Resources:lang,YouJian %>" />&#160;&#160;
                                                                                <asp:HyperLink ID="HL_BusinessMember" runat="server" Target="_blank" Text="<%$ Resources:lang,QTJSXXCY %>" Style="text-decoration: none;"></asp:HyperLink></td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" style="text-align: right">&#160;</td>
                                                                    <td align="left" class="formItemBgStyle" colspan="3">
                                                                        <asp:Button ID="BT_Update" runat="server" CssClass="inpuLong" Enabled="False"
                                                                            OnClick="BT_Update_Click" Text="<%$ Resources:lang,BaoCun %>" /></td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel2" runat="server" HeaderText="步骤成员" TabIndex="1">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label70" runat="server" Text="<%$ Resources:lang,BuZhouChengYuan%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table width="100%">
                                                                <tr>
                                                                    <td style="width: 220px; border-right: solid 1px #D8D8D8; padding: 5px 0px 0px 5px"
                                                                        valign="top" align="left">
                                                                        <hr />
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing %>"></asp:Label>:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="LB_ActorGroupType" runat="server"></asp:Label>
                                                                                </td>
                                                                                <td>
                                                                                    <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,JueSeZhu %>"></asp:Label>:
                                                                                </td>
                                                                                <td>
                                                                                    <asp:HyperLink ID="HL_ActorGroup" runat="server" Target="_blank" ForeColor="Blue"></asp:HyperLink>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <hr />
                                                                        <table>
                                                                            <tr>
                                                                                <td width="70%">
                                                                                    <asp:TextBox ID="TB_WLActorGroup" runat="server" Width="99%"></asp:TextBox><br />
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <asp:Button ID="BT_WLNew" runat="server" Text="+" OnClick="BT_WLNew_Click" Style="width: 30px;" />
                                                                                </td>
                                                                                <td width="15%" align="center">
                                                                                    <asp:Button ID="BT_WLDelete" runat="server" Text="X" OnClick="BT_WLDelete_Click" Style="width: 30px;" />
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                        <hr />
                                                                        <div id="Div_TreeView1" style="overflow: auto; height: 550px;">
                                                                            <asp:TreeView ID="TreeView1" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView1_SelectedNodeChanged"
                                                                                ShowLines="True" Width="220px">
                                                                                <RootNodeStyle CssClass="rootNode" />
                                                                                <NodeStyle CssClass="treeNode" />
                                                                                <LeafNodeStyle CssClass="leafNode" />
                                                                                <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                            </asp:TreeView>
                                                                        </div>
                                                                        <asp:Label ID="LB_DepartString" runat="server" Visible="False"></asp:Label>
                                                                    </td>
                                                                    <td>
                                                                        <table width="100%" cellpadding="0" cellspacing="0">
                                                                            <tr>
                                                                                <td style="text-align: left;" valign="top">
                                                                                    <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                                        <tr>
                                                                                            <td width="7">
                                                                                                <img height="26" src="ImagesSkin/main_n_l.jpg" width="7" /></td>
                                                                                            <td>
                                                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                                    <tr>
                                                                                                        <td width="15%" align="center"><strong>
                                                                                                            <asp:Label ID="Label49" runat="server" Text="<%$ Resources:lang,CanYuJueSeZu %>"></asp:Label></strong></td>
                                                                                                        <td width="45%" align="center"><strong>
                                                                                                            <asp:Label ID="Label50" runat="server" Text="<%$ Resources:lang,GongZuo %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label51" runat="server" Text="<%$ Resources:lang,ChenDanJueSe %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label52" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong>
                                                                                                            <asp:Label ID="Label53" runat="server" Text="<%$ Resources:lang,ShiJianXiaoShi %>"></asp:Label></strong></td>
                                                                                                        <td width="10%" align="center"><strong></strong></td>
                                                                                                    </tr>
                                                                                                </table>
                                                                                            </td>
                                                                                            <td width="6" align="right">
                                                                                                <img alt="" height="26" src="ImagesSkin/main_n_r.jpg" width="6" /></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                                        ShowHeader="False" OnItemCommand="DataGrid1_ItemCommand" OnPageIndexChanged="DataGrid1_PageIndexChanged"
                                                                                        PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                                        <Columns>
                                                                                            <asp:HyperLinkColumn DataNavigateUrlField="IdentifyString" DataNavigateUrlFormatString="TTActorGroupDetail.aspx?IdentifyString={0}"
                                                                                                DataTextField="ActorGroup" HeaderText="参与角色组" Target="_blank">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                            </asp:HyperLinkColumn>
                                                                                            <asp:BoundColumn DataField="WorkDetail" HeaderText="工作">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="45%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Actor" HeaderText="承担角色">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="Requisite" HeaderText="必需">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:BoundColumn DataField="LimitedTime" HeaderText="时间(小时)">
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:BoundColumn>
                                                                                            <asp:TemplateColumn>
                                                                                                <ItemTemplate>
                                                                                                    <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                                </ItemTemplate>
                                                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                            </asp:TemplateColumn>
                                                                                        </Columns>
                                                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                                                        <EditItemStyle BackColor="#2461BF" />
                                                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                                                        <ItemStyle CssClass="itemStyle" />
                                                                                    </asp:DataGrid><asp:Label ID="LB_DetailID" runat="server" Visible="False"></asp:Label></td>
                                                                            </tr>
                                                                        </table>
                                                                        <br />
                                                                        <table width="100%" cellpadding="3" cellspacing="0" class="formBgStyle" style="vertical-align: top;">
                                                                            <tr>
                                                                                <td style="text-align: right" width="17%" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label54" runat="server" Text="<%$ Resources:lang,CanYuJueSeZu %>"></asp:Label>： </td>
                                                                                <td style="text-align: left;" width="40%" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_ActorGroup" runat="server" Width="126px" Enabled="False"></asp:TextBox></td>
                                                                                <td style="width: 10%; text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label55" runat="server" Text="<%$ Resources:lang,BiXu %>"></asp:Label>： </td>
                                                                                <td style="width: 200px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Requisite" runat="server" AutoPostBack="True">
                                                                                        <asp:ListItem Selected="True" Value="YES" />
                                                                                        <asp:ListItem Value="NO" />
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label56" runat="server" Text="<%$ Resources:lang,ZhuYaoGongZuoNeiRong %>"></asp:Label>： </td>
                                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_WorkDetail" runat="server" Height="60px" TextMode="MultiLine"
                                                                                        Width="95%"></asp:TextBox></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label57" runat="server" Text="<%$ Resources:lang,BuKeShiYu %>"></asp:Label>： </td>
                                                                                <td colspan="3" style="height: 4px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_FieldList" runat="server" Width="95%" Height="60px" TextMode="MultiLine"></asp:TextBox><br />
                                                                                    <asp:Label ID="Label58" runat="server" Text="<%$ Resources:lang,ZDJDYDHFK %>"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label59" runat="server" Text="<%$ Resources:lang,YunXuQuanDanBianJi %>"></asp:Label>：</td>
                                                                                <td colspan="3" style="text-align: left" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_AllowFullEdit" runat="server">
                                                                                        <asp:ListItem>NO</asp:ListItem>
                                                                                        <asp:ListItem>YES</asp:ListItem>
                                                                                    </asp:DropDownList>(<asp:HyperLink ID="HL_XMLFile" runat="server" Target="_blank">
                                                                                        ---&gt;<asp:Label ID="Label71" runat="server" Text="<%$ Resources:lang,ChaKanShuJuWenJian %>"></asp:Label>
                                                                                    </asp:HyperLink>) </td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label60" runat="server" Text="<%$ Resources:lang,KeBianJiYu %>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle" colspan="3" style="height: 4px; text-align: left">
                                                                                    <asp:TextBox ID="TB_EditFieldList" runat="server" Height="60px" TextMode="MultiLine" Width="95%"></asp:TextBox><br />
                                                                                    <asp:Label ID="Label61" runat="server" Text="<%$ Resources:lang,ZDJDYDHFK %>"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td class="formItemBgStyle" style="text-align: right">
                                                                                    <asp:Label ID="Label62" runat="server" Text="<%$ Resources:lang,BuKeKongYu %>"></asp:Label>： </td>
                                                                                <td class="formItemBgStyle" colspan="3" style="height: 4px; text-align: left">
                                                                                    <asp:TextBox ID="TB_CanNotNullFieldList" runat="server" Height="60px" TextMode="MultiLine" Width="95%"></asp:TextBox><br />
                                                                                    <asp:Label ID="Label63" runat="server" Text="<%$ Resources:lang,ZBXWKBJYZJDJDYDHFK %>"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label64" runat="server" Text="<%$ Resources:lang,QianMingYu %>"></asp:Label>： </td>
                                                                                <td colspan="3" style="height: 4px; text-align: left" class="formItemBgStyle">
                                                                                    <asp:TextBox ID="TB_SignPictureField" runat="server"
                                                                                        Width="95%"></asp:TextBox><br />
                                                                                    <asp:Label ID="Label65" runat="server" Text="<%$ Resources:lang,ZDJDYDHFK %>"></asp:Label></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label66" runat="server" Text="<%$ Resources:lang,YaoQiuShiJian %>"></asp:Label>： </td>
                                                                                <td style="text-align: left;" class="formItemBgStyle">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="TB_FinishedTime" runat="server" Precision="0" Width="43px"
                                                                                        OnBlur="" OnFocus="" OnKeyPress="" PositiveColor="" Amount="4">4</NickLee:NumberBox><asp:Label ID="Label68" runat="server" Text="<%$ Resources:lang,XiaoShi %>"></asp:Label></td>
                                                                                <td style="text-align: right;" class="formItemBgStyle">
                                                                                    <asp:Label ID="Label67" runat="server" Text="<%$ Resources:lang,JueSe %>"></asp:Label>： </td>
                                                                                <td style="width: 200px; text-align: left;" class="formItemBgStyle">
                                                                                    <asp:DropDownList ID="DL_Actor" runat="server">
                                                                                        <asp:ListItem Value="主办者" />
                                                                                        <asp:ListItem Value="协办者" />
                                                                                        <asp:ListItem Value="阅知者" />
                                                                                    </asp:DropDownList></td>
                                                                            </tr>

                                                                            <tr>
                                                                                <td style="width: 17%; text-align: right;" class="formItemBgStyle"></td>
                                                                                <td style="text-align: left;" class="formItemBgStyle" colspan="3">
                                                                                    <asp:Button ID="BT_AddStepDetail" runat="server" OnClick="BT_AddStepDetail_Click"
                                                                                        CssClass="inpu" Text="<%$ Resources:lang,XinJian %>" />&#160;<asp:Button ID="BT_UpdateStepDetail" runat="server"
                                                                                            Enabled="False" OnClick="BT_UpdateStepDetail_Click" CssClass="inpu" Text="<%$ Resources:lang,BaoCun %>" />&#160;<asp:Button
                                                                                                ID="BT_DeleteStepDetail" runat="server" Enabled="False" OnClick="BT_DeleteStepDetail_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())"
                                                                                                CssClass="inpu" Text="<%$ Resources:lang,ShanChu %>" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel3" runat="server" HeaderText="关联子流程" TabIndex="2">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label72" runat="server" Text="<%$ Resources:lang,GuanLianZiLiuCheng%>"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                                            <tr>
                                                                                <td width="7">
                                                                                    <img src="ImagesSkin/main_n_l.jpg" width="7" height="26" /></td>
                                                                                <td>
                                                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                                        <tr>
                                                                                            <td width="10%" align="center"><strong>
                                                                                                <asp:Label ID="Label39" runat="server" Text="<%$ Resources:lang,BianHao %>"></asp:Label></strong></td>
                                                                                            <td width="30%" align="center"><strong>
                                                                                                <asp:Label ID="Label40" runat="server" Text="<%$ Resources:lang,MoBanMingChen %>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label41" runat="server" Text="<%$ Resources:lang,ShiFouBiXu2 %>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label42" runat="server" Text="<%$ Resources:lang,JieShuGuiShuBuXu %>"></asp:Label></strong></td>
                                                                                            <td width="15%" align="center"><strong>
                                                                                                <asp:Label ID="Label43" runat="server" Text="<%$ Resources:lang,JieShuYaoQiuTongGuo %>"></asp:Label></strong></td>
                                                                                        </tr>
                                                                                    </table>
                                                                                </td>
                                                                                <td width="6" align="right">
                                                                                    <img src="ImagesSkin/main_n_r.jpg" width="6" alt="" height="26" /></td>
                                                                            </tr>
                                                                        </table>
                                                                        <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Height="1px"
                                                                            ShowHeader="False" OnItemCommand="DataGrid3_ItemCommand"
                                                                            PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
                                                                            <Columns>
                                                                                <asp:TemplateColumn>
                                                                                    <ItemTemplate>
                                                                                        <asp:Button ID="BT_ID" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                                                    </ItemTemplate>
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                                                </asp:TemplateColumn>
                                                                                <asp:HyperLinkColumn DataNavigateUrlField="RelatedWFTemName" DataNavigateUrlFormatString="TTWFChartViewJS.aspx?TemName={0}"
                                                                                    DataTextField="RelatedWFTemName" HeaderText="模板名称" Target="_blank">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                                                                </asp:HyperLinkColumn>
                                                                                <asp:BoundColumn DataField="Requisite" HeaderText="是否必须">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BelongStepSortNumber" HeaderText="结束归属步骤">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                                                </asp:BoundColumn>
                                                                                <asp:BoundColumn DataField="BelongIsMustPassed" HeaderText="结束要求通过">
                                                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
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
                                                            <table style="width: 100%;" cellpadding="3" cellspacing="0" class="formBgStyle">
                                                                <tr>
                                                                    <td align="right" class="formItemBgStyle">
                                                                        <asp:Label ID="LB_ChildTemID" runat="server" Visible="False"></asp:Label><asp:Label ID="Label44" runat="server" Text="<%$ Resources:lang,LiuChengMoBanLeiXing %>"></asp:Label>： </td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_RelatedWFType" runat="server" AutoPostBack="True"
                                                                            DataTextField="Type" DataValueField="Type"
                                                                            OnSelectedIndexChanged="DL_RelatedWFType_SelectedIndexChanged">
                                                                        </asp:DropDownList></td>
                                                                    <td align="right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label45" runat="server" Text="<%$ Resources:lang,MoBan %>"></asp:Label>： </td>
                                                                    <td align="left" class="formItemBgStyle">
                                                                        <table>
                                                                            <tr>
                                                                                <td>
                                                                                    <asp:DropDownList ID="DL_RelatedWFTemplate" runat="server" AutoPostBack="True"
                                                                                        DataTextField="TemName" DataValueField="TemName" OnSelectedIndexChanged="DL_RelatedWFTemplate_SelectedIndexChanged">
                                                                                    </asp:DropDownList></td>
                                                                                <td>
                                                                                    <asp:HyperLink ID="HL_WorkFlowDesigner" runat="server" Enabled="False" Text="<%$ Resources:lang,LiuChengTu %>" /></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ShiFouBiXu2 %>"></asp:Label>：</td>
                                                                    <td class="formItemBgStyle">
                                                                        <asp:DropDownList ID="DL_ChildTemRequisite" runat="server">
                                                                            <asp:ListItem Value="YES" />
                                                                            <asp:ListItem Selected="True" Value="NO" />
                                                                        </asp:DropDownList></td>
                                                                </tr>
                                                                <tr>
                                                                    <td align="right" class="formItemBgStyle">
                                                                        <asp:Label ID="Label47" runat="server" Text="<%$ Resources:lang,JieShuGuiShuBuXu %>"></asp:Label>： </td>
                                                                    <td align="left" class="formItemBgStyle" colspan="5">
                                                                        <table>
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <NickLee:NumberBox MaxAmount="1000000000000" MinAmount="-1000000000000" ID="NB_BelongStepSortNumber" runat="server"
                                                                                        OnBlur="" OnFocus=""
                                                                                        OnKeyPress="" PositiveColor="" Precision="0" Width="43px">0</NickLee:NumberBox></td>
                                                                                <td align="right">
                                                                                    <asp:Label ID="Label48" runat="server" Text="<%$ Resources:lang,JieShuYaoQiuTongGuo %>"></asp:Label>：</td>
                                                                                <td align="left">
                                                                                    <asp:DropDownList ID="DL_BelongIsPassed" runat="server">
                                                                                        <asp:ListItem Value="YES" />
                                                                                        <asp:ListItem Selected="True" Value="NO" />
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                </tr>
                                                                <tr>
                                                                    <td class="formItemBgStyle" align="left">&nbsp; </td>
                                                                    <td class="formItemBgStyle" colspan="5" align="left">
                                                                        <asp:Button ID="BT_AddChileTem" runat="server" CssClass="inpu"
                                                                            OnClick="BT_AddChileTem_Click" Text="<%$ Resources:lang,XinZeng %>" />&#160;<asp:Button ID="BT_UpdateChileTem" runat="server" CssClass="inpu"
                                                                                Enabled="False" OnClick="BT_UpdateChileTem_Click" Text="<%$ Resources:lang,BaoCun %>" />&#160;<asp:Button ID="BT_DeleteChileTem" runat="server" CssClass="inpu"
                                                                                    Enabled="False" OnClick="BT_DeleteChileTem_Click" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="<%$ Resources:lang,ShanChu %>" /></td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                    <cc1:TabPanel ID="TabPanel4" runat="server" HeaderText="关联模块" TabIndex="2">
                                                        <HeaderTemplate>
                                                            <asp:Label ID="Label38" runat="server" Text="关联模块"></asp:Label>
                                                        </HeaderTemplate>
                                                        <ContentTemplate>
                                                            <table cellpadding="0" cellspacing="0" width="100%">
                                                                <tr>
                                                                    <td align="left" style="width: 190px; padding: 0px 5px 0px 5px" valign="top">
                                                                        <table width="100%">
                                                                            <tr>
                                                                                <td align="left">
                                                                                    <asp:DropDownList ID="DL_ForUserType" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DL_ForUserType_SelectedIndexChanged">
                                                                                        <asp:ListItem Value="INNER" />
                                                                                        <asp:ListItem Value="OUTER" />
                                                                                    </asp:DropDownList></td>
                                                                            </tr>
                                                                            <tr>
                                                                                <td>
                                                                                    <div id="Div_TreeView" style="overflow: auto; height: 800px;">
                                                                                        <asp:TreeView ID="TreeView2" runat="server" NodeWrap="True" OnSelectedNodeChanged="TreeView2_SelectedNodeChanged"
                                                                                            ShowLines="True" Width="220px" Style="height: 183px">
                                                                                            <RootNodeStyle CssClass="rootNode" />
                                                                                            <NodeStyle CssClass="treeNode" />
                                                                                            <LeafNodeStyle CssClass="leafNode" />
                                                                                            <SelectedNodeStyle CssClass="selectNode" ForeColor="Red" />
                                                                                        </asp:TreeView>
                                                                                    </div>
                                                                                </td>
                                                                            </tr>
                                                                        </table>
                                                                    </td>
                                                                    <td align="left" class="formItemBgStyle" valign="top">
                                                                        <div id="GoodsListDivID" style="width: 100%; overflow: auto;">
                                                                            <asp:Repeater ID="RP_RelatedModule" runat="server" OnItemCommand="RP_RelatedModule_ItemCommand">
                                                                                <ItemTemplate>
                                                                                    <table width="110%">
                                                                                        <tr>
                                                                                            <td>
                                                                                                <asp:Button ID="BT_HomeModuleName" runat="server" CommandName="ClickName" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"HomeModuleName") %>' /><asp:Button ID="BT_ModuleName" runat="server" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ModuleName") %>' Visible="false" />
                                                                                            </td>
                                                                                            <td align="center">
                                                                                                <asp:LinkButton ID="LBT_SaveModule" runat="server" CommandName="Save" Text="&lt;div&gt;&lt;img src=ImagesSkin/Save.gif border=0 alt='保存' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label46" runat="server" Text="<%$ Resources:lang,ZhuBiaoKeZeng %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_MainTableCanAdd" AutoPostBack="true" runat="server" Checked="true" ToolTip="勾选这个，后面的主表可改和主表可删都要勾选！" />
                                                                                            </td>

                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhuBiaoKeGe %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_MainTableCanEdit" AutoPostBack="true" runat="server" />
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label75" runat="server" Text="<%$ Resources:lang,ZhuBiaoKeShan %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_MainTableCanDelete" AutoPostBack="true" runat="server" />
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label76" runat="server" Text="<%$ Resources:lang,XiBiaoKeZeng %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_DetailTableCanAdd" AutoPostBack="true" runat="server" Checked="true" ToolTip="勾选这个，后面的细表可改和细表可删都要勾选！" />
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label77" runat="server" Text="<%$ Resources:lang,XiBiaoKeGe %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_DetailTableCanEdit" AutoPostBack="true" runat="server" />
                                                                                            </td>
                                                                                            <td align="right">
                                                                                                <asp:Label ID="Label78" runat="server" Text="<%$ Resources:lang,XiBiaoKeShan %>"></asp:Label>
                                                                                            </td>
                                                                                            <td align="left">
                                                                                                <asp:CheckBox ID="CB_DetailTableCanDelete" AutoPostBack="true" runat="server" />
                                                                                            </td>

                                                                                            <td width="60px" align="center">
                                                                                                <asp:LinkButton ID="LBT_DeleteModule" runat="server" CommandName="Delete" OnClientClick="return confirm(getDeleteMsgByLangCode())" Text="&lt;div&gt;&lt;img src=ImagesSkin/Delete.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </table>
                                                                                    <br />
                                                                                </ItemTemplate>
                                                                            </asp:Repeater>
                                                                        </div>
                                                                    </td>
                                                                </tr>
                                                            </table>
                                                        </ContentTemplate>
                                                    </cc1:TabPanel>
                                                </cc1:TabContainer>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td style="text-align: left" valign="top">&nbsp;</td>
                                        </tr>
                                    </table>
                                    <br />
                                    <asp:TextBox ID="TB_WFXML" runat="server" Style="visibility: hidden"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </div>
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
