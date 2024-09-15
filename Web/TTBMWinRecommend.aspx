<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TTBMWinRecommend.aspx.cs" Inherits="TTBMWinRecommend" %>


<%@ Register Assembly="NickLee.Web.UI" Namespace="NickLee.Web.UI" TagPrefix="NickLee" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<%@ Register Assembly="Brettle.Web.NeatUpload" Namespace="Brettle.Web.NeatUpload" TagPrefix="Upload" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link id="mainCss" href="css/bluelightmain.css" rel="stylesheet" type="text/css" />
    <script src="js/jquery-1.7.2.min.js" type="text/javascript"></script>
    <script src="js/allAHandler.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        $(function () {
            if (top.location != self.location) { } else { CloseWebPage(); }

        });
    </script>
    <style type="text/css">
        .auto-style1 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 110px;
        }

        .auto-style2 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            height: 30px;
            width: 110px;
        }

        .auto-style3 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 122px;
        }

        .auto-style4 {
            background-color: #F6FAFD;
            background-repeat: no-repeat;
            width: 108px;
        }

        .auto-style5 {
            font-size: x-large;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <center>
        <form id="form1" runat="server">
            <asp:ScriptManager ID="ScriptManager1" runat="server" EnableScriptGlobalization="True" EnableScriptLocalization="True">
            </asp:ScriptManager>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div id="AboveDiv">
                        <table cellpadding="0" cellspacing="0" width="100%" align="center" class="bian">
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
                                                            <asp:Label ID="Label1" runat="server" Text="<%$ Resources:lang,ZhongBiaoRenTuiJianQueRen%>"></asp:Label></td>
                                                        <td width="5">
                                                            <%--<img src="ImagesSkin/main_top_r.jpg" width="5" height="31" alt="" />--%>
                                                        </td>
                                                    </tr>
                                                </table>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td align="center" style="padding-top: 5px;">
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="75%">
                                        <tr>
                                            <td align="center">
                                                <asp:Label ID="Label19" runat="server" Text="<%$ Resources:lang,ZhaoBiaoXinXi%>"></asp:Label>

                                                <asp:TextBox ID="TextBox1" runat="server" Width="120px"></asp:TextBox>

                                                <asp:Label ID="Label20" runat="server" Text="<%$ Resources:lang,ZhaoBiaoRiQi%>"></asp:Label>

                                                <asp:TextBox ID="TextBox3" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender5" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox3">
                                                </cc1:CalendarExtender>

                                                <asp:Label ID="Label21" runat="server" Text="<%$ Resources:lang,Zhi%>"></asp:Label>

                                                <asp:TextBox ID="TextBox4" runat="server" ReadOnly="false" Width="100px"></asp:TextBox>
                                                <cc1:CalendarExtender ID="CalendarExtender6" runat="server" Format="yyyy-MM-dd" TargetControlID="TextBox4">
                                                </cc1:CalendarExtender>

                                                <asp:Button ID="BT_Query" runat="server" CssClass="inpu" OnClick="BT_Query_Click" Text="<%$ Resources:lang,ChaXun%>" />
                                            </td>
                                        </tr>
                                    </table>
                                    <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                        <tr>
                                            <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;&nbsp;
                                            <asp:Label ID="Label22" runat="server" Text="<%$ Resources:lang,ZhaoBiaoYaoQingHanLieBiao%>"></asp:Label>：</td>
                                        </tr>
                                        <tr>
                                            <td align="center" class="formItemBgStyle">
                                                <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                    <tr>
                                                        <td>
                                                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                <tr>
                                                                    <td width="15%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label23" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong></strong>
                                                                    </td>
                                                                    <td width="10%" align="center">
                                                                        <strong>&nbsp;&nbsp;</strong></td>
                                                                    <td width="20%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label24" runat="server" Text="<%$ Resources:lang,YaoQingHanMingCheng%>"></asp:Label></strong>
                                                                    </td>
                                                                    <td width="35%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label25" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label></strong>
                                                                    </td>

                                                                    <td width="10%" align="center">
                                                                        <strong>
                                                                            <asp:Label ID="Label26" runat="server" Text="<%$ Resources:lang,BianZhiRen%>"></asp:Label></strong>
                                                                    </td>


                                                                </tr>
                                                            </table>
                                                        </td>
                                                    </tr>
                                                </table>
                                                <asp:DataGrid ID="DataGrid2" runat="server" AutoGenerateColumns="False" Height="1px"
                                                    OnItemCommand="DataGrid2_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                                    GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="25" OnPageIndexChanged="DataGrid2_PageIndexChanged">
                                                    <ItemStyle CssClass="itemStyle" />
                                                    <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                    <Columns>
                                                        <asp:TemplateColumn HeaderText="编号">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="15%" />
                                                            <ItemTemplate>
                                                                <asp:Button ID="BT_ID" runat="server" CommandName="Update" CssClass="inpu" Text='<%# DataBinder.Eval(Container.DataItem,"ID") %>' />
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:TemplateColumn HeaderText="Workflow">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="LBT_Workflow" CommandName="Workflow" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Assign.png border=0 alt='删除' /&gt;&lt;/div&gt;"></asp:LinkButton>
                                                            </ItemTemplate>
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                        </asp:TemplateColumn>

                                                        <asp:TemplateColumn HeaderText="发起流程">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <ItemTemplate>
                                                                <a href='TTBMBidPlanRelatedWorkflowList.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"BidPlanID") %>' target="_blank">定标
                                                                </a>
                                                            </ItemTemplate>
                                                            <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                                HorizontalAlign="Center" />
                                                        </asp:TemplateColumn>
                                                        <asp:BoundColumn DataField="Name" HeaderText="名称">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="Remark" HeaderText="计划内容">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="35%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>
                                                        <asp:BoundColumn DataField="EnterPer" HeaderText="编制人">
                                                            <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                            <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                HorizontalAlign="Center" />
                                                        </asp:BoundColumn>



                                                    </Columns>
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
                            <tr>
                                <td align="center" style="padding-top: 5px; width: 100%"></td>
                            </tr>
                        </table>
                    </div>
                    <asp:Panel ID="Panel1" runat="server" CssClass="modalPopup" Style="display: none;">
                        <div class="modalPopup-text" style="width: 400px; height: 400px; overflow: auto;">
                            <table>
                                <tr>
                                    <td style="width: 400px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                            <tr>
                                                <td align="left">
                                                    <asp:Label ID="Label33" runat="server" Text="<%$ Resources:lang,ZhuanJia%>"></asp:Label>：<asp:TextBox ID="txt_SupplierInfo" runat="server" Width="100px"></asp:TextBox>
                                                </td>
                                                <td>
                                                    <asp:Button ID="Button1" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ChaXun%>" OnClick="Button1_Click" />
                                                </td>
                                            </tr>
                                        </table>
                                        <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                            <tr>
                                                <td style="text-align: left" class="formItemBgStyle">
                                                    <asp:Button ID="btnConfirmUp" runat="server" CssClass="inpu" OnClick="btnConfirm_Click" Text="<%$ Resources:lang,QueRen%>" /></td>
                                            </tr>
                                            <tr>
                                                <td align="center" class="formItemBgStyle" colspan="3">
                                                    <table width="98%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                                        <tr>
                                                            <td>
                                                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                                    <tr>
                                                                        <td width="5%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label34" runat="server" Text="<%$ Resources:lang,XuanZe%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label35" runat="server" Text="<%$ Resources:lang,ZhuanJia%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td width="20%" align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label2" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label></strong>
                                                                        </td>
                                                                        <td align="center">
                                                                            <strong>
                                                                                <asp:Label ID="Label36" runat="server" Text="<%$ Resources:lang,ZhuanJiaXinXi%>"></asp:Label></strong>
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <asp:DataGrid ID="DataGrid3" runat="server" AutoGenerateColumns="False" Height="1px" Width="98%" CellPadding="4" ForeColor="#333333" GridLines="None" ShowHeader="false">
                                                        <ItemStyle CssClass="itemStyle" />
                                                        <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <Columns>
                                                            <asp:TemplateColumn HeaderText="选择">
                                                                <ItemTemplate>
                                                                    <asp:CheckBox runat="server" ID="cbSelect" />
                                                                    <asp:HiddenField runat="server" ID="hfID" Value='<%# Eval("ID")%>' />
                                                                    <asp:HiddenField runat="server" ID="hfName" Value='<%# Eval("Name")%>' />
                                                                    <asp:HiddenField runat="server" ID="hfExpertCode" Value='<%# Eval("ExpertCode")%>' />
                                                                </ItemTemplate>
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="5%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                    HorizontalAlign="Center" />
                                                            </asp:TemplateColumn>
                                                            <asp:BoundColumn DataField="Name" HeaderText="专家">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                    HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:BoundColumn DataField="Type" HeaderText="类型">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="20%" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                                    HorizontalAlign="Center" />
                                                            </asp:BoundColumn>
                                                            <asp:HyperLinkColumn DataNavigateUrlField="ID" DataNavigateUrlFormatString="TTBMExpertInfoView.aspx?ExpertID={0}" DataTextField="Name" HeaderText="专家" Target="_blank">
                                                                <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" />
                                                                <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                            </asp:HyperLinkColumn>
                                                        </Columns>
                                                        <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                                        <EditItemStyle BackColor="#2461BF" />
                                                        <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                                        <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                                    </asp:DataGrid>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                    <td style="width: 10px; padding: 5px 5px 5px 5px;" valign="top" align="center">
                                        <asp:ImageButton ID="IMBT_Close" ImageUrl="ImagesSkin/Close4.jpg" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="Panel2" runat="server" CssClass="modalPopup" Style="display: none;" Width="500px">
                        <div>
                            <table>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">
                                        <asp:Label ID="Label37" runat="server" Text="<%$ Resources:lang,LCSQSCHYLJDLCJHYMQJHM%>"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 420px; padding: 5px 5px 5px 5px;" valign="top" align="left">&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;<asp:Button ID="BT_ActiveYes" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Shi%>" OnClick="BT_ActiveYes_Click" />
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="BT_ActiveNo" runat="server" CssClass="inpu" Text="<%$ Resources:lang,Fou%>" OnClick="BT_ActiveNo_Click" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </asp:Panel>


                    <div class="layui-layer layui-layer-iframe" id="popwindow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label112" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">


                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="98%">
                                <tr>
                                    <td align="right" class="auto-style1">

                                        <asp:Label ID="Label3" runat="server" Text="<%$ Resources:lang,YaoQingHanMingCheng%>"></asp:Label>：
                                    </td>
                                    <td colspan="3" align="left" class="auto-style3">
                                        <asp:Label ID="lbl_ID" runat="server"></asp:Label>
                                        <asp:Label ID="lbl_Name" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="auto-style2">
                                        <asp:Label ID="Label4" runat="server" Text="<%$ Resources:lang,ZhaoBiaoFangAn%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style3" style="height: 30px" colspan="3">
                                        <asp:Label ID="lbl_BidRemark" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="auto-style2">
                                        <asp:Label ID="Label5" runat="server" Text="<%$ Resources:lang,YuanDingPingBiaoXiaoZu%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style3" colspan="3" style="height: 30px">
                                        <asp:TextBox ID="TextBox5" runat="server" Enabled="False" Width="90%"></asp:TextBox>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="auto-style2">
                                        <asp:Label ID="Label6" runat="server" Text="<%$ Resources:lang,XianChangCanPingRenYuan%>"></asp:Label>：</td>
                                    <td align="left" class="auto-style3" colspan="3" style="height: 30px">
                                        <asp:TextBox ID="TextBox6" runat="server" Width="80%"></asp:TextBox>
                                        <cc1:ModalPopupExtender ID="TB_DepartCode_ModalPopupExtender" runat="server" BackgroundCssClass="modalBackground" CancelControlID="IMBT_Close" Enabled="True" PopupControlID="Panel1" TargetControlID="TextBox6">
                                        </cc1:ModalPopupExtender>
                                        <asp:HyperLink ID="HL_BMBidFile" runat="server" Enabled="False" Target="_blank">
                                            <asp:Label ID="Label7" runat="server" Text="<%$ Resources:lang,YeJiPingDing%>"></asp:Label>
                                        </asp:HyperLink>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="auto-style2">
                                        <asp:Label ID="Label8" runat="server" Text="<%$ Resources:lang,YaoQingHanNeiRong%>"></asp:Label>： </td>
                                    <td align="left" class="auto-style3" colspan="3" style="height: 30px">
                                        <asp:Label ID="lbl_Remark" runat="server"></asp:Label>
                                    </td>
                                </tr>
                                <tr style="color: #000000">
                                    <td align="right" class="auto-style2">&nbsp;</td>
                                    <td align="left" class="auto-style3" colspan="3" style="height: 30px">
                                        <asp:Label ID="lbl_ExperCodeList" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_BidType" runat="server" Visible="False"></asp:Label>
                                        <asp:Button ID="Button2" runat="server" CssClass="inpu" Text="<%$ Resources:lang,ZhuiJiaCanPingRen%>" OnClick="Button2_Click" />
                                        <asp:Label ID="lbl_BidPlanID" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="auto-style1">
                                        <asp:Label ID="lbl_BidObjects" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" class="auto-style3"></td>
                                    <td align="left" class="auto-style4">
                                        <asp:Label ID="lbl_sql1" runat="server" Visible="False"></asp:Label>
                                    </td>
                                    <td align="left" class="auto-style3">
                                        <asp:Label ID="lbl_sql" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_EnterCode" runat="server" Visible="False"></asp:Label>
                                        <asp:Label ID="lbl_count" runat="server" Visible="False"></asp:Label>
                                    </td>
                                </tr>
                            </table>

                            <table cellpadding="2" cellspacing="0" class="formBgStyle" width="100%">
                                <tr>
                                    <td align="center" style="text-align: left" class="formItemBgStyle">&nbsp;&nbsp;<asp:Label ID="Label27" runat="server" Text="<%$ Resources:lang,TouBiaoRenLieBiao%>"></asp:Label>：</td>
                                </tr>
                                <tr>
                                    <td align="center" class="formItemBgStyle">
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label28" runat="server" Text="<%$ Resources:lang,CaoZuo%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label29" runat="server" Text="<%$ Resources:lang,ChengBaoShang%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="20%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label30" runat="server" Text="<%$ Resources:lang,TouBiaoNeiRong%>"></asp:Label></strong>
                                                            </td>
                                                            <td width="30%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label31" runat="server" Text="<%$ Resources:lang,ZhuanJiaPingBiaoJiLu%>"></asp:Label></strong>
                                                            </td>
                                                            <td align="center" width="10%">
                                                                <strong>&nbsp;&nbsp;</strong>
                                                            </td>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label32" runat="server" Text="<%$ Resources:lang,TouBiaoZhuangTai%>"></asp:Label>
                                                                </strong>

                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                        <asp:DataGrid ID="DataGrid1" runat="server" AutoGenerateColumns="False" Height="1px"
                                            OnItemCommand="DataGrid1_ItemCommand" Width="100%" CellPadding="4" ForeColor="#333333"
                                            GridLines="None" ShowHeader="false" AllowPaging="true" PageSize="10" OnPageIndexChanged="DataGrid1_PageIndexChanged" OnItemDataBound="DataGrid1_ItemDataBound">
                                            <ItemStyle CssClass="itemStyle" />
                                            <HeaderStyle HorizontalAlign="Center" BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <Columns>
                                                <asp:TemplateColumn HeaderText="操作">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <asp:Button ID="BT_Bidding" CommandName="中标" runat="server" CssClass="inpu" Text='中标' />
                                                        <asp:Button ID="BT_NoBidding" CommandName="未中标" runat="server" CssClass="inpu" Text='未中标' />
                                                        <asp:HiddenField runat="server" ID="hfStatus" Value='<%#Eval("BidStatus")%>' />
                                                    </ItemTemplate>
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="ID" HeaderText="编号" Visible="false">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="1%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="供应商">
                                                    <ItemTemplate>
                                                        <%# GetBMSupplierInfoName(Eval("SupplierCode").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="BiddingContent" HeaderText="投标内容">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="20%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="专家评标记录">
                                                    <ItemTemplate>
                                                        <%# GetBMSupBidByExpResult(Eval("ID").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="30%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true" HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <asp:BoundColumn DataField="BiddingDate" HeaderText="投标日期" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="10%" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:BoundColumn>
                                                <asp:TemplateColumn HeaderText="发起流程">
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                                    <ItemTemplate>
                                                        <a href='TTBMBidPlanRelatedWorkflowListView.aspx?RelatedID=<%# DataBinder.Eval(Container.DataItem,"AnnInvitationID") %>&SupplierID=<%# DataBinder.Eval(Container.DataItem,"SupplierCode") %>' target="_blank">报价列表
                                                        </a>
                                                    </ItemTemplate>
                                                    <HeaderStyle BorderColor="#394F66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="True"
                                                        HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                                <asp:TemplateColumn HeaderText="中标状态">
                                                    <ItemTemplate>
                                                        <%# GetBMSupplierBidStatus(Eval("BidStatus").ToString()) %>
                                                    </ItemTemplate>
                                                    <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" ForeColor="Blue" />
                                                    <HeaderStyle BorderColor="#394f66" BorderStyle="Solid" BorderWidth="1px" Font-Bold="true"
                                                        HorizontalAlign="Center" />
                                                </asp:TemplateColumn>
                                            </Columns>
                                            <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                            <EditItemStyle BackColor="#2461BF" />
                                            <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                            <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />
                                        </asp:DataGrid>
                                    </td>
                                </tr>
                            </table>


                            <asp:Label ID="LB_Sql" runat="server" Visible="False"></asp:Label>

                            <asp:TextBox ID="TB_DepartString" runat="server" Style="visibility: hidden"></asp:TextBox>

                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label148" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>


                    <div class="layui-layer layui-layer-iframe" id="popwindowWorkflow"
                        style="z-index: 9999; width: 900px; height: 530px; position: absolute; overflow: hidden; display: none; border-radius: 10px;">
                        <div class="layui-layer-title" style="background: #e7e7e8;" id="popwindow_title">
                            <asp:Label ID="Label9" runat="server" Text="&lt;div&gt;&lt;img src=ImagesSkin/Update.png border=0 width=30px height=30px alt='BusinessForm' /&gt;&lt;/div&gt;"></asp:Label>
                        </div>
                        <div id="popwindow_content" class="layui-layer-content" style="overflow: auto; padding: 0px 5px 0px 5px; text-align: left;">


                            <table width="98%" cellpadding="4" cellspacing="0">

                                <tr>
                                    <td align="right" style="width: 100px; height: 27px">
                                        <asp:Label ID="Label10" runat="server" Text="<%$ Resources:lang,LiuChengMuBan%>"></asp:Label>： </td>
                                    <td align="left" style="width: 650px; height: 27px">
                                        <asp:Label ID="Label11" runat="server" Text="<%$ Resources:lang,LeiXing%>"></asp:Label>：  
                                        <asp:DropDownList ID="DL_WFType" runat="server">
                                            <asp:ListItem Value="招标管理" Text="<%$ Resources:lang,ZhaoBiaoGuanLi%>" />
                                        </asp:DropDownList>
                                        &nbsp;<asp:DropDownList ID="DL_TemName" runat="server" DataTextField="TemName" DataValueField="TemName">
                                        </asp:DropDownList>
                                        <asp:HyperLink ID="HL_WLTem" runat="server" NavigateUrl="~/TTWorkFlowTemplate.aspx" Target="_blank">
                                            <asp:Label ID="Label12" runat="server" Text="<%$ Resources:lang,MuBanWeiHu%>"></asp:Label>
                                        </asp:HyperLink>
                                        <asp:Button ID="BT_Reflash" runat="server" CssClass="inpu" OnClick="BT_Reflash_Click" Text="<%$ Resources:lang,ShuaXin%>" />
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" style="width: 100px; height: 27px"></td>
                                    <td align="left" style="width: 650px; height: 27px">
                                        <span style="font-size: 10pt"></span>
                                        <asp:CheckBox ID="CB_SMS" runat="server" Text="<%$ Resources:lang,DuanXin%>" />
                                        <asp:CheckBox ID="CB_Mail" runat="server" Text="<%$ Resources:lang,YouJian%>" />
                                        <span style="font-size: 10pt">
                                            <asp:Label ID="Label13" runat="server" Text="<%$ Resources:lang,YaoQiuShouDaoXinXi%>"></asp:Label></span>
                                        <asp:Button ID="BT_SubmitApply" runat="server" Enabled="False" Text="<%$ Resources:lang,TiJiaoShenQing%>" CssClass="inpu" />
                                        <cc1:ModalPopupExtender ID="BT_SubmitApply_ModalPopupExtender" runat="server" Enabled="True"
                                            TargetControlID="BT_SubmitApply" PopupControlID="Panel2" CancelControlID="IMBT_Close"
                                            BackgroundCssClass="modalBackground" DynamicServicePath="">
                                        </cc1:ModalPopupExtender>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="center" colspan="2" style="height: 22px; text-align: left;">
                                </tr>

                            </table>

                            <asp:Label ID="Label14" runat="server" Text="<%$ Resources:lang,DuiYingGongZuoLiuLieBiao%>"></asp:Label>：
    
                                        <table width="100%" border="0" cellpadding="0" cellspacing="0" background="ImagesSkin/main_n_bj.jpg">
                                            <tr>
                                                <td>
                                                    <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                                        <tr>
                                                            <td width="10%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label15" runat="server" Text="<%$ Resources:lang,BianHao%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="40%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label16" runat="server" Text="<%$ Resources:lang,GongZuoLiu%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="30%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label17" runat="server" Text="<%$ Resources:lang,ShenQingShiJian%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="12%" align="center">
                                                                <strong>
                                                                    <asp:Label ID="Label18" runat="server" Text="<%$ Resources:lang,ZhuangTai%>"></asp:Label></strong> &nbsp;
                                                            </td>
                                                            <td width="8%" align="center">
                                                                <strong></strong>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                            <asp:DataGrid ID="DataGrid4" runat="server" AutoGenerateColumns="False" Height="1px"
                                ShowHeader="False" PageSize="5" Width="100%" CellPadding="4" ForeColor="#333333"
                                GridLines="None">
                                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                                <EditItemStyle BackColor="#2461BF" />
                                <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                                <PagerStyle HorizontalAlign="Center" Mode="NumericPages" NextPageText="" PrevPageText="" CssClass="notTab" />

                                <ItemStyle CssClass="itemStyle" />
                                <Columns>
                                    <asp:BoundColumn DataField="WLID" HeaderText="编号">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="10%" />
                                    </asp:BoundColumn>
                                    <asp:HyperLinkColumn DataNavigateUrlField="WLID" DataNavigateUrlFormatString="TTMyWorkDetailMain.aspx?WLID={0}"
                                        DataTextField="WLName" HeaderText="工作流" Target="_blank">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="40%" />
                                    </asp:HyperLinkColumn>
                                    <asp:BoundColumn DataField="CreateTime" HeaderText="申请时间">
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="30%" />
                                    </asp:BoundColumn>
                                    <asp:TemplateColumn HeaderText="状态">
                                        <ItemTemplate>
                                            <%# ShareClass. GetStatusHomeNameByOtherStatus(Eval("Status").ToString()) %>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Left" Width="12%" />
                                    </asp:TemplateColumn>
                                    <asp:TemplateColumn>
                                        <ItemTemplate>
                                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# DataBinder.Eval(Container, "DataItem.WLID", "TTWLRelatedDoc.aspx?DocType=WorkFlow&WLID={0}") %>'
                                                Target="_blank"><img src="ImagesSkin/Doc.gif" class="noBorder" alt="" /></asp:HyperLink>
                                        </ItemTemplate>
                                        <ItemStyle CssClass="itemBorder" HorizontalAlign="Center" Width="8%" />
                                    </asp:TemplateColumn>
                                </Columns>
                            </asp:DataGrid>



                        </div>
                        <div id="popwindow_footer0001" class="layui-layer-btn" style="border-top: 1px solid #ccc;">
                            <a class="layui-layer-btn notTab" onclick="return popClose();">
                                <asp:Label ID="Label38" runat="server" Text="<%$ Resources:lang,GuanBi%>" /></a>
                        </div>
                        <span class="layui-layer-setwin"><a onclick="return popClose();" class="layui-layer-ico layui-layer-close layui-layer-close1 notTab" href="javascript:;"></a></span>
                    </div>




                    <div class="layui-layer-shade" id="popwindow_shade" style="z-index: 9998; background-color: #000; opacity: 0.3; filter: alpha(opacity=30); display: none;"></div>



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
